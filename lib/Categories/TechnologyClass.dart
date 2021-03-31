// To parse this JSON data, do
//
//     final technologyClass = technologyClassFromJson(jsonString);

import 'dart:convert';

List<TechnologyClass> technologyClassFromJson(String str) =>
    List<TechnologyClass>.from(
        json.decode(str).map((x) => TechnologyClass.fromJson(x)));

String technologyClassToJson(List<TechnologyClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TechnologyClass {
  TechnologyClass({
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

  factory TechnologyClass.fromJson(Map<String, dynamic> json) =>
      TechnologyClass(
        id: json["id"],
        source: json["source"],
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["UrlToImage"],
        publishedAt: DateTime.parse(json["PublishedAt"]),
        content: json["content"],
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
        "content": content,
        "category": categoryValues.reverse[category],
      };
}

enum Category { TECHNOLOGY }

final categoryValues = EnumValues({"technology": Category.TECHNOLOGY});

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
