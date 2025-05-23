import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/services/desks_service.dart';

import '../../models/home_labels_icons.dart';
import '../../models/on_boarding.dart';

class AccessViewModel extends BaseViewModel {
  List<Home> listOfItems = [];
  String header = "";
  bool isLoading = false;

  void onLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAccessData() async {
    onLoading(true);

    try {
      // Load local data first
      await loadLocalData();
      if (listOfItems.isEmpty) {
        print("Fetching from API...");
        final response =
            await ApiServices().fetchHomeData(screenName: "accessscreens");

        listOfItems = response.data!.first.access!;
        header = response.data!.first.header!;

        // Save data locally
        await saveDataLocally();
        notifyListeners();
      }
    } catch (e) {
      print("accessscreens error: $e");
    }

    onLoading(false);
  }

  Future<void> saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("access_data", jsonEncode(listOfItems));
    prefs.setString("access_header", header);
  }

  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString("access_data");
    String? savedHeader = prefs.getString("access_header");

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

// class AccessViewModel extends BaseViewModel {
//   List<Home> listOfItems = [];
//   String header = "";
//   AccessViewModel() {
//     getAccessData();
//   }
//   bool isLoading = false;
//
//   void onLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }
//
//   getAccessData() async {
//     onLoading(true);
//     try {
//       if (listOfItems.isEmpty) {
//         listOfItems = [];
//         final response =
//             await ApiServices().fetchHomeData(screenName: "accessscreens");
//         listOfItems = response.data!.first.access!;
//         header = response.data!.first.header!;
//         notifyListeners();
//       }
//       onLoading(false);
//     } catch (e) {
//       print("accessscreens $e");
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
