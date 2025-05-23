import 'package:get/get.dart';
import 'package:stumato_assignment/ui/on_boarding/on_boarding_view.dart';

navigateToOnBoarding(String labelName) {
  Get.to(() => OnBoardingView(
        featureLabel: labelName.toLowerCase().replaceAll(RegExp(r"\s+"), ""),
      ));
}
