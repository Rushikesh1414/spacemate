// To parse this JSON data, do
//
//     final homescreenModel = homescreenModelFromJson(jsonString);

// import 'dart:convert';
//
// List<HomescreenModel> homescreenModelFromJson(String str) =>
//     List<HomescreenModel>.from(
//         json.decode(str).map((x) => HomescreenModel.fromJson(x)));
//
// String homescreenModelToJson(List<HomescreenModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class HomescreenModel {
//   int? id;
//   String? header;
//   DateTime? publishedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<Home>? homeScreen;
//   List<Home>? transport;
//   List<Home>? access;
//   List<Home>? discover;
//   List<Home>? facility;
//
//   HomescreenModel(
//       {this.id,
//       this.header,
//       this.publishedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.homeScreen,
//       this.transport,
//       this.access,
//       this.discover,
//       this.facility});
//
//   factory HomescreenModel.fromJson(Map<String, dynamic> json) =>
//       HomescreenModel(
//         id: json["id"],
//         header: json["Header"],
//         publishedAt: json["published_at"] == null
//             ? null
//             : DateTime.parse(json["published_at"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         transport: json["Transport_screen"] == null
//             ? []
//             : List<Home>.from(
//                 json["Transport_screen"]!.map((x) => Home.fromJson(x))),
//         discover: json["Discover_screen"] == null
//             ? []
//             : List<Home>.from(
//                 json["Discover_screen"]!.map((x) => Home.fromJson(x))),
//         facility: json["Facilties_screen"] == null
//             ? []
//             : List<Home>.from(
//                 json["Facilties_screen"]!.map((x) => Home.fromJson(x))),
//         access: json["Access_screen"] == null
//             ? []
//             : List<Home>.from(
//                 json["Access_screen"]!.map((x) => Home.fromJson(x))),
//         homeScreen: json["Home_screen"] == null
//             ? []
//             : List<Home>.from(
//                 json["Home_screen"]!.map((x) => Home.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "Header": header,
//         "published_at": publishedAt?.toIso8601String(),
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "Transport_screen": transport == null
//             ? []
//             : List<dynamic>.from(transport!.map((x) => x.toJson())),
//         "Facilties_screen": facility == null
//             ? []
//             : List<dynamic>.from(facility!.map((x) => x.toJson())),
//         "Access_screen": access == null
//             ? []
//             : List<dynamic>.from(access!.map((x) => x.toJson())),
//         "Discover_screen": discover == null
//             ? []
//             : List<dynamic>.from(discover!.map((x) => x.toJson())),
//         "Home_screen": homeScreen == null
//             ? []
//             : List<dynamic>.from(homeScreen!.map((x) => x.toJson())),
//       };
// }
//
// class Home {
//   int? id;
//   String? iconName;
//   String? labelName;
//
//   Home({
//     this.id,
//     this.iconName,
//     this.labelName,
//   });
//
//   factory Home.fromJson(Map<String, dynamic> json) => Home(
//         id: json["id"],
//         iconName: json["icon_name"],
//         labelName: json["label_name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "icon_name": iconName,
//         "label_name": labelName,
//       };
// }

// To parse this JSON data, do
//
//     final homescreenModel = homescreenModelFromJson(jsonString);

import 'dart:convert';

HomescreenModel homescreenModelFromJson(String str) =>
    HomescreenModel.fromJson(json.decode(str));

String homescreenModelToJson(HomescreenModel data) =>
    json.encode(data.toJson());

class HomescreenModel {
  List<Datum>? data;
  Meta? meta;

  HomescreenModel({
    this.data,
    this.meta,
  });

  factory HomescreenModel.fromJson(Map<String, dynamic> json) =>
      HomescreenModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  int? id;
  String? documentId;
  String? header;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<Home>? homeScreen;
  List<Home>? access;
  List<Home>? discover;
  List<Home>? facility;
  List<Home>? transport;

  Datum({
    this.id,
    this.documentId,
    this.header,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.homeScreen,
    this.access,
    this.discover,
    this.transport,
    this.facility,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        documentId: json["documentId"],
        header: json["Header"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        homeScreen: json["Home"] == null
            ? []
            : List<Home>.from(json["Home"]!.map((x) => Home.fromJson(x))),
        access: json["Access"] == null
            ? []
            : List<Home>.from(json["Access"]!.map((x) => Home.fromJson(x))),
        discover: json["Discover"] == null
            ? []
            : List<Home>.from(json["Discover"]!.map((x) => Home.fromJson(x))),
        facility: json["Facilities"] == null
            ? []
            : List<Home>.from(json["Facilities"]!.map((x) => Home.fromJson(x))),
        transport: json["Transport"] == null
            ? []
            : List<Home>.from(json["Transport"]!.map((x) => Home.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "Header": header,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "Home": homeScreen == null
            ? []
            : List<dynamic>.from(homeScreen!.map((x) => x.toJson())),
        "Discover": discover == null
            ? []
            : List<dynamic>.from(discover!.map((x) => x.toJson())),
        "Access": access == null
            ? []
            : List<dynamic>.from(access!.map((x) => x.toJson())),
        "Facilities": facility == null
            ? []
            : List<dynamic>.from(facility!.map((x) => x.toJson())),
        "Transport": transport == null
            ? []
            : List<dynamic>.from(transport!.map((x) => x.toJson())),
      };
}

class Home {
  int? id;
  String? labelName;
  String? iconName;

  Home({
    this.id,
    this.labelName,
    this.iconName,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        id: json["id"],
        labelName: json["icon_name"],
        iconName: json["label_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon_name": labelName,
        "label_name": iconName,
      };
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
