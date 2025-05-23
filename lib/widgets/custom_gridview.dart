import 'package:flutter/material.dart';

import '../models/home_labels_icons.dart';
import '../services/icons.dart';
import 'icon.dart';

Widget gridviewWidget(index, {required List<Home> listOfItems, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customIcons(
              iconData: getIconFromString(listOfItems[index].labelName!)),
          const SizedBox(height: 8),
          Text(
            listOfItems[index].iconName!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}
