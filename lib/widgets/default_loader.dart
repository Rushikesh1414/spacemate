import 'package:flutter/material.dart';

import '../core/constants.dart';

Widget defaultLoader() {
  return const Center(
      child: CircularProgressIndicator(
    color: AppColors.primary,
  ));
}
