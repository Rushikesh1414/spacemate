import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customNetworkImage(imageURL, {double? height}) {
  return CachedNetworkImage(
    imageUrl: imageURL,
    height: height,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(), // Shows a loading indicator
    ),
    errorWidget: (context, url, error) => GestureDetector(
      onTap: () {
        // Force reload on tap
        CachedNetworkImage.evictFromCache(url);
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 40),
          SizedBox(height: 8),
          Text("Failed to load image.", textAlign: TextAlign.center),
        ],
      ),
    ),
    fit: BoxFit.cover,
  );
}
