import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/ui/access/access_view.dart';
import 'package:stumato_assignment/ui/transport/transport_view.dart';

import 'discover/discover_view.dart';
import 'facilities/facilities_view.dart';
import 'home/homeview.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel() {
    screens = [
      const Homeview(),
      const TransportView(),
      const AccessView(),
      const FacilitiesView(),
      const DiscoverView(),
    ];
  }
  PageController pageController = PageController();
  int currentIndex = 0;

  updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void jumpToPage(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // List of screens to display based on the selected index
  List<Widget> screens = [];
}
