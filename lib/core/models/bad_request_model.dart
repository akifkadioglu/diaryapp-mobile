// To parse this JSON data, do
//
//     final badRequestModel = badRequestModelFromJson(jsonString);

import 'dart:convert';

BadRequestModel badRequestModelFromJson(String str) => BadRequestModel.fromJson(json.decode(str));

String badRequestModelToJson(BadRequestModel data) => json.encode(data.toJson());

class BadRequestModel {
    BadRequestModel({
        required this.data,
    });

    List<String> data;

    factory BadRequestModel.fromJson(Map<String, dynamic> json) => BadRequestModel(
        data: List<String>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
