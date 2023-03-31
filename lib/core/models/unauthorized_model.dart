// To parse this JSON data, do
//
//     final unauthorizedModel = unauthorizedModelFromJson(jsonString);

import 'dart:convert';

UnauthorizedModel unauthorizedModelFromJson(String str) => UnauthorizedModel.fromJson(json.decode(str));

String unauthorizedModelToJson(UnauthorizedModel data) => json.encode(data.toJson());

class UnauthorizedModel {
    UnauthorizedModel({
        required this.error,
    });

    String error;

    factory UnauthorizedModel.fromJson(Map<String, dynamic> json) => UnauthorizedModel(
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
    };
}
