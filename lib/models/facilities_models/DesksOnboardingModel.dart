import 'dart:convert';

DesksOnboardingModel desksOnboardingModelFromJson(String str) =>
    DesksOnboardingModel.fromJson(json.decode(str));

class DesksOnboardingModel {
  List<Datum> data;

  DesksOnboardingModel({required this.data});

  factory DesksOnboardingModel.fromJson(Map<String, dynamic> json) =>
      DesksOnboardingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  String title;
  String description;
  CarouselImage carouselImage;

  Datum({
    required this.title,
    required this.description,
    required this.carouselImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        description: json["description"],
        carouselImage: CarouselImage.fromJson(json["carousel_image"]),
      );
}

class CarouselImage {
  String url;
 

  CarouselImage({required this.url});

  factory CarouselImage.fromJson(Map<String, dynamic> json) => CarouselImage(
        url: json["url"],
       
      );
}
