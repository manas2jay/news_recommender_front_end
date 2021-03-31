// To parse this JSON data, do
//
//     final topheadlineClass = topheadlineClassFromJson(jsonString);

import 'dart:convert';

List<TopheadlineClass> topheadlineClassFromJson(String str) =>
    List<TopheadlineClass>.from(
        json.decode(str).map((x) => TopheadlineClass.fromJson(x)));

String topheadlineClassToJson(List<TopheadlineClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopheadlineClass {
  TopheadlineClass({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  int id;
  String source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory TopheadlineClass.fromJson(Map<String, dynamic> json) =>
      TopheadlineClass(
        id: json["id"],
        source: json["source"],
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["UrlToImage"],
        publishedAt: DateTime.parse(json["PublishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "source": source,
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "UrlToImage": urlToImage,
        "PublishedAt":
            "${publishedAt.year.toString().padLeft(4, '0')}-${publishedAt.month.toString().padLeft(2, '0')}-${publishedAt.day.toString().padLeft(2, '0')}",
        "content": content,
      };
}
