// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
    Offer({
        this.id,
        this.image,
        this.link,
        this.status,
        this.createdAt,
        this.details,
        this.title,
    });

    int id;
    String image;
    dynamic link;
    String status;
    DateTime createdAt;
    String details;
    String title;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        image: json["image"],
        link: json["link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        details: json["details"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "details": details,
        "title": title,
    };
}
