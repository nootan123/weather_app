import 'dart:convert';

List<CityListModel> cityListModelFromJson(String str) =>
    List<CityListModel>.from(
        json.decode(str).map((x) => CityListModel.fromJson(x)));

String cityListModelToJson(List<CityListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityListModel {
  CityListModel({
    required this.version,
    required this.key,
    required this.type,
    required this.rank,
    required this.localizedName,
    required this.country,
    required this.administrativeArea,
  });

  int version;
  String key;
  String type;
  int rank;
  String localizedName;
  AdministrativeArea country;
  AdministrativeArea administrativeArea;

  factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        country: AdministrativeArea.fromJson(json["Country"]),
        administrativeArea:
            AdministrativeArea.fromJson(json["AdministrativeArea"]),
      );

  Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "Country": country.toJson(),
        "AdministrativeArea": administrativeArea.toJson(),
      };
}

class AdministrativeArea {
  AdministrativeArea({
    required this.id,
    required this.localizedName,
  });

  String id;
  String localizedName;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      AdministrativeArea(
        id: json["ID"],
        localizedName: json["LocalizedName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
      };
}
