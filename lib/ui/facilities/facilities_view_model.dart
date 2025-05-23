import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../models/home_labels_icons.dart';
import '../../models/on_boarding.dart';
import '../../services/desks_service.dart';

class FacilitiesViewModel extends BaseViewModel {
  bool isLoading = false;
  String header = "";
  List<Home> listOfItems = [];

  void onLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getFacilitiesData() async {
    onLoading(true);

    try {
      // Load local data first
      await loadLocalData();
      if (listOfItems.isEmpty) {
        print("Fetching from API...");
        final response =
            await ApiServices().fetchHomeData(screenName: "facilitiesscreens");

        listOfItems = response.data!.first.facility!;
        header = response.data!.first.header!;
        // Save to local storage
        await saveDataLocally();
        notifyListeners();
      }
    } catch (e) {
      print("facilitiesscreens error: $e");
    }

    onLoading(false);
  }

  Future<void> saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("facilities_data", jsonEncode(listOfItems));
    prefs.setString("facilities_header", header);
  }

  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString("facilities_data");
    String? savedHeader = prefs.getString("facilities_header");

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

// class FacilitiesViewModel extends BaseViewModel {
//   FacilitiesViewModel() {
//     getFacilitiesData();
//   }
//   bool isLoading = false;
//
//   void onLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }
//
//   String header = "";
//   List<Home> listOfItems = [];
//   getFacilitiesData() async {
//     onLoading(true);
//     try {
//       if (listOfItems.isEmpty) {
//         listOfItems = [];
//         final response =
//             await ApiServices().fetchHomeData(screenName: "facilitiesscreens");
//         listOfItems = response.data!.first.facility!;
//         header = response.data!.first.header!;
//         notifyListeners();
//       }
//       onLoading(false);
//     } catch (e) {
//       print("facilitiesscreens $e");
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
