import 'package:flutter/material.dart';

import 'package:newsapiv2/rest_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: EmployeePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter REST API'),
      ),
      body: FutureBuilder(
        future: ApiService.getarticle(),
        builder: (context, snapshot) {
          final article = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(article[index][
                  //       'UrlToImage']), // no matter how big it is, it won't overflow
                  // ),
                  title: Text(article[index]['title']),
                  subtitle:
                      Text('description: ${article[index]['description']}'),
                );
              },
              itemCount: article.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
