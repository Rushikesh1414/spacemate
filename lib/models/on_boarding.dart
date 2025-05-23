// To parse this JSON data, do
//
//     final onBoardingModel = onBoardingModelFromJson(jsonString);

import 'dart:convert';

OnBoardingModel onBoardingModelFromJson(String str) =>
    OnBoardingModel.fromJson(json.decode(str));

String onBoardingModelToJson(OnBoardingModel data) =>
    json.encode(data.toJson());

class OnBoardingModel {
  List<OnBoardingDatum>? data;
  Meta? meta;

  OnBoardingModel({
    this.data,
    this.meta,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingModel(
        data: json["data"] == null
            ? []
            : List<OnBoardingDatum>.from(
                json["data"]!.map((x) => OnBoardingDatum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class OnBoardingDatum {
  int? id;
  String? documentId;
  String? featureName;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? locale;
  List<OnboardingCarousel>? onboardingCarousel;
  List<dynamic>? localizations;

  OnBoardingDatum({
    this.id,
    this.documentId,
    this.featureName,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    this.onboardingCarousel,
    this.localizations,
  });

  factory OnBoardingDatum.fromJson(Map<String, dynamic> json) =>
      OnBoardingDatum(
        id: json["id"],
        documentId: json["documentId"],
        featureName: json["feature_name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        onboardingCarousel: json["onboarding_carousel"] == null
            ? []
            : List<OnboardingCarousel>.from(json["onboarding_carousel"]!
                .map((x) => OnboardingCarousel.fromJson(x))),
        localizations: json["localizations"] == null
            ? []
            : List<dynamic>.from(json["localizations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "feature_name": featureName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
        "onboarding_carousel": onboardingCarousel == null
            ? []
            : List<dynamic>.from(onboardingCarousel!.map((x) => x.toJson())),
        "localizations": localizations == null
            ? []
            : List<dynamic>.from(localizations!.map((x) => x)),
      };
}

class OnboardingCarousel {
  int? id;
  String? title;
  String? header;
  String? body;
  String? screen;
  String? buttonLabel;
  String? feature;
  String? imageUrl;

  OnboardingCarousel(
      {this.id,
      this.title,
      this.header,
      this.body,
      this.screen,
      this.feature,
      this.imageUrl,
      this.buttonLabel});

  factory OnboardingCarousel.fromJson(Map<String, dynamic> json) =>
      OnboardingCarousel(
        id: json["id"],
        title: json["title"],
        header: json["header"],
        body: json["body"],
        screen: json["screen"],
        feature: json["feature"],
        imageUrl: json["imageURL"],
        buttonLabel: json["button_label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "header": header,
        "body": body,
        "screen": screen,
        "feature": feature,
        "imageURL": imageUrl,
        "button_label": buttonLabel,
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
