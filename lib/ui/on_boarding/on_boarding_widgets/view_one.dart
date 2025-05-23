import 'package:flutter/material.dart';

import '../../../services/url_converter.dart';
import '../../../widgets/network_image.dart';

class OnBoardingScreenOne extends StatelessWidget {
  String title;
  String description;
  String imageURL;
  OnBoardingScreenOne({
    super.key,
    required this.title,
    required this.imageURL,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: customNetworkImage(
            convertImageUrl(imageURL),
            height: screenHeight * 0.55,
          ),
        ),
        // SizedBox(
        //   height: screenHeight * 0.55,
        //   width: screenWidth,
        //   child: Image.network(
        //     imageURL
        //     // "https://strapi.apps.rredu.in" + desk.carouselImage.url,
        //     // deskProvider._deskService.baseUrl + desk.carouselImage.url,
        //     ,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
