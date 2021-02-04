import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  String category;
  int datetime;
  String headline;
  int id;
  String image;
  String related;
  String source;
  String summary;
  String url;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        category: json["category"],
        datetime: json["datetime"],
        headline: json["headline"],
        id: json["id"],
        image: json["image"],
        related: json["related"],
        source: json["source"],
        summary: json["summary"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "datetime": datetime,
        "headline": headline,
        "id": id,
        "image": image,
        "related": related,
        "source": source,
        "summary": summary,
        "url": url,
      };
}
