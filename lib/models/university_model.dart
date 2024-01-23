// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  final String name;
  final String alphaTwoCode;
  final String stateProvince;
  final List<String> domains;
  final String country;
  final List<String> webPages;

  UniversityModel({
    required this.name,
    required this.alphaTwoCode,
    required this.stateProvince,
    required this.domains,
    required this.country,
    required this.webPages,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        name: json["name"] ?? '',
        alphaTwoCode: json["alpha_two_code"] ?? '',
        stateProvince: json["state-province"] ?? '',
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"].map((x) => x)),
        country: json["country"],
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alpha_two_code": alphaTwoCode,
        "state-province": stateProvince,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": country,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
      };
}
