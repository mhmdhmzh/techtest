// To parse this JSON data, do
//
//     final TileDataModel = TileDataModelFromJson(jsonString);

import 'dart:convert';

TileDataModel tileDataModelFromJson(String str) =>
    TileDataModel.fromJson(json.decode(str));

String tileDataModelToJson(TileDataModel data) => json.encode(data.toJson());

class TileDataModel {
  TileDataModel({
    this.data,
  });

  List<Datum>? data;

  factory TileDataModel.fromJson(Map<String, dynamic> json) => TileDataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.title,
    this.urlImage,
    this.urlWebview,
  });

  String? title;
  String? urlImage;
  String? urlWebview;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        urlImage: json["url_image"],
        urlWebview: json["url_webview"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url_image": urlImage,
        "url_webview": urlWebview,
      };
}
