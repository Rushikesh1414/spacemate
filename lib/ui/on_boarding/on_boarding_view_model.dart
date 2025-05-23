import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../models/on_boarding.dart';
import '../../services/desks_service.dart';

class OnBoardingViewModel extends BaseViewModel {
  var onBoardingData = <OnboardingCarousel>[];

  bool isLoading = false;

  void updateLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getOnBoardingData({required String label}) async {
    updateLoader(true);
    onBoardingData = [];
    final response =
        await ApiServices().fetchOnBoardingData(label: label).whenComplete(() {
      updateLoader(false);
    });
    onBoardingData = response.data!.first.onboardingCarousel!;
    notifyListeners();
  }

  final PageController pageController = PageController();
  int currentPage = 0;
  onCurrentPageChange(int index) {
    currentPage = index;
    notifyListeners();
  }
}
