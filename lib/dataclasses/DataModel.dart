// To parse this JSON data, do
//
//     final furniture = furnitureFromJson(jsonString);

import 'dart:convert';

List<Furniture> furnitureFromJson(String str) => List<Furniture>.from(json.decode(str).map((x) => Furniture.fromJson(x)));

String furnitureToJson(List<Furniture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Furniture {
  Furniture({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imgUrl,
    required this.cat,
  });

  String id;
  String name;
  String desc;
  String price;
  String imgUrl;
  String cat;

  factory Furniture.fromJson(Map<String, dynamic> json) => Furniture(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    desc: json["desc"] == null ? null : json["desc"],
    price: json["price"] == null ? null : json["price"],
    imgUrl: json["img_url"] == null ? null : json["img_url"],
    cat: json["cat"] == null ? null : json["cat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "desc": desc == null ? null : desc,
    "price": price == null ? null : price,
    "img_url": imgUrl == null ? null : imgUrl,
    "cat": cat == null ? null : cat,
  };
}
