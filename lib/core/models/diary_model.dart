// To parse this JSON data, do
//
//     final diaryModel = diaryModelFromJson(jsonString);

import 'dart:convert';

DiaryModel diaryModelFromJson(String str) => DiaryModel.fromJson(json.decode(str));

String diaryModelToJson(DiaryModel data) => json.encode(data.toJson());

class DiaryModel {
    DiaryModel({
        required this.data,
    });

    List<Datum> data;

    factory DiaryModel.fromJson(Map<String, dynamic> json) => DiaryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.header,
        required this.body,
        required this.rate,
        required this.userId,
        required this.createdAt,
        required this.edges,
    });

    String id;
    String header;
    String body;
    double rate;
    String userId;
    DateTime createdAt;
    Edges edges;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        header: json["header"],
        body: json["body"],
        rate: json["rate"]?.toDouble(),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        edges: Edges.fromJson(json["edges"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "body": body,
        "rate": rate,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "edges": edges.toJson(),
    };
}

class Edges {
    Edges();

    factory Edges.fromJson(Map<String, dynamic> json) => Edges(
    );

    Map<String, dynamic> toJson() => {
    };
}
