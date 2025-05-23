import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/services/desks_service.dart';

import '../../models/home_labels_icons.dart';
import '../../models/on_boarding.dart';

class DiscoverViewModel extends BaseViewModel {
  List<Home> listOfItems = [];
  String header = "";
  bool isLoading = false;

  void onLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getHomeData() async {
    onLoading(true);

    try {
      // Load from local storage first
      await loadLocalData();

      if (listOfItems.isEmpty) {
        print("Fetching from API...");
        final response =
            await ApiServices().fetchHomeData(screenName: "discoverscreens");

        listOfItems = response.data!.first.discover!;
        header = response.data!.first.header!;

        // Save data locally
        await saveDataLocally();
        notifyListeners();
      }
    } catch (e) {
      print("discoverscreens error: $e");
    }

    onLoading(false);
  }

  Future<void> saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("discover_data", jsonEncode(listOfItems));
    prefs.setString("discover_header", header);
  }

  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString("discover_data");
    String? savedHeader = prefs.getString("discover_header");

    if (savedData != null) {
      print("Loading from local storage...");
      listOfItems =
          List<Home>.from(jsonDecode(savedData).map((x) => Home.fromJson(x)));
      header = savedHeader ?? "";
      notifyListeners();
    }
  }

  var data = <OnBoardingDatum>[];

  Future<void> getOnBoardingData({required String label}) async {
    data = [];
    final response = await ApiServices().fetchOnBoardingData(label: label);
    data = response.data!;
    notifyListeners();
  }
}

// class DiscoverViewModel extends BaseViewModel {
//   List<Home> listOfItems = [];
//   String header = "";
//   DiscoverViewModel() {
//     getHomeData();
//   }
//   bool isLoading = false;
//
//   void onLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }
//
//   getHomeData() async {
//     onLoading(true);
//     try {
//       if (listOfItems.isEmpty) {
//         listOfItems = [];
//         final response =
//             await ApiServices().fetchHomeData(screenName: "discoverscreens");
//         listOfItems = response.data!.first.discover!;
//         header = response.data!.first.header!;
//         notifyListeners();
//       }
//       onLoading(false);
//     } catch (e) {
//       print("discoverscreens $e");
//     }
//   }
//
//   var data = <OnBoardingDatum>[];
//
//   Future<void> getOnBoardingData({required String label}) async {
//     data = [];
//     final response = await ApiServices().fetchOnBoardingData(label: label);
//     data = response.data!;
//     notifyListeners();
//   }
// }
