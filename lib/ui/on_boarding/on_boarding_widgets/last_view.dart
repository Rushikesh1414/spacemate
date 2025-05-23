import 'package:flutter/material.dart';
import 'package:stumato_assignment/core/constants.dart';

import '../../../services/url_converter.dart';

class OnBoardingLastview extends StatelessWidget {
  String imageUrl;
  String title;
  String description;
  String buttonText;
  OnBoardingLastview(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(convertImageUrl(imageUrl)),
              fit: BoxFit.cover,
              opacity: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset("assets/images/application_approved.png"),
          SizedBox(
            height: 10,
          ),
          // Image.network(
          //     "https://img.freepik.com/free-psd/stunning-dark-butterfly-wings-nature-insect-macro-photography_632498-52173.jpg?t=st=1739529345~exp=1739532945~hmac=150ad9c77ec790054463c384505651f4a639ed14525e79f4483cbb6e42a831be&w=740"),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: AppColors.primary),
          ),
          Text(
            description,
            // "Make your cafes & meals better",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  backgroundColor: AppColors.primary),
              child: Text(
                buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.secondaryBackground),
              ))
        ],
      ),
    );
  }
}
