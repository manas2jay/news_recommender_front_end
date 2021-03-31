// To parse this JSON data, do
//
//     final scienceClass = scienceClassFromJson(jsonString);

import 'dart:convert';

List<ScienceClass> scienceClassFromJson(String str) => List<ScienceClass>.from(
    json.decode(str).map((x) => ScienceClass.fromJson(x)));

String scienceClassToJson(List<ScienceClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScienceClass {
  ScienceClass({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.category,
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
  Category category;

  factory ScienceClass.fromJson(Map<String, dynamic> json) => ScienceClass(
        id: json["id"],
        source: json["source"],
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["UrlToImage"] == null ? null : json["UrlToImage"],
        publishedAt: DateTime.parse(json["PublishedAt"]),
        content: json["content"],
        category: categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "source": source,
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "UrlToImage": urlToImage == null ? null : urlToImage,
        "PublishedAt":
            "${publishedAt.year.toString().padLeft(4, '0')}-${publishedAt.month.toString().padLeft(2, '0')}-${publishedAt.day.toString().padLeft(2, '0')}",
        "content": content,
        "category": categoryValues.reverse[category],
      };
}

enum Category { SCIENCE }

final categoryValues = EnumValues({"science": Category.SCIENCE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
