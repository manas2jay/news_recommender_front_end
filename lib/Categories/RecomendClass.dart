// To parse this JSON data, do
//
//     final recommendClass = recommendClassFromJson(jsonString);

import 'dart:convert';

List<RecommendClass> recommendClassFromJson(String str) =>
    List<RecommendClass>.from(
        json.decode(str).map((x) => RecommendClass.fromJson(x)));

String recommendClassToJson(List<RecommendClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendClass {
  RecommendClass({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  int id;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory RecommendClass.fromJson(Map<String, dynamic> json) => RecommendClass(
        id: json["id"],
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
