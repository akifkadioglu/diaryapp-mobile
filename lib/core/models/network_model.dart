// To parse this JSON data, do
//
//     final networkModel = networkModelFromJson(jsonString);

import 'dart:convert';

NetworkModel networkModelFromJson(String str) => NetworkModel.fromJson(json.decode(str));

String networkModelToJson(NetworkModel data) => json.encode(data.toJson());

class NetworkModel {
  NetworkModel({
    required this.result,
    required this.statusCode,
  });

  String result;
  num statusCode;

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };
}
