// To parse this JSON data, do
//
//     final entertainmentClass = entertainmentClassFromJson(jsonString);

import 'dart:convert';

List<EntertainmentClass> entertainmentClassFromJson(String str) =>
    List<EntertainmentClass>.from(
        json.decode(str).map((x) => EntertainmentClass.fromJson(x)));

String entertainmentClassToJson(List<EntertainmentClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EntertainmentClass {
  EntertainmentClass({
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

  factory EntertainmentClass.fromJson(Map<String, dynamic> json) =>
      EntertainmentClass(
        id: json["id"],
        source: json["source"],
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["UrlToImage"],
        publishedAt: DateTime.parse(json["PublishedAt"]),
        content: json["content"] == null ? null : json["content"],
        category: categoryValues.map[json["category"]],
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
        "content": content == null ? null : content,
        "category": categoryValues.reverse[category],
      };
}

enum Category { ENTERTAINMENT }

final categoryValues = EnumValues({"entertainment": Category.ENTERTAINMENT});

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
