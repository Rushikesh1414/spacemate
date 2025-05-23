import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/services/desks_service.dart';

import '../../models/home_labels_icons.dart';

class HomeviewModel extends BaseViewModel {
  List<Home> listOfItems = [];
  String header = "";
  bool isLoading = false;

  void onLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> saveDataLocally(List<Home> items, String headerText) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'home_data', jsonEncode(items.map((e) => e.toJson()).toList()));
    prefs.setString('home_header', headerText);
  }

  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    String? storedData = prefs.getString('home_data');
    String? storedHeader = prefs.getString('home_header');
    if (storedData != null && storedData.isNotEmpty) {
      print("Loading from local storage...");
      List<dynamic> jsonData = jsonDecode(storedData);
      listOfItems = jsonData.map((x) => Home.fromJson(x)).toList();
      header = storedHeader ?? "";
      notifyListeners();
    } else {
      print("Fetching from API...");
      fetchAndStoreHomeData();
    }
  }

  Future<void> fetchAndStoreHomeData() async {
    try {
      final response =
          await ApiServices().fetchHomeData(screenName: "homescreens");
      if (response.data != null && response.data!.isNotEmpty) {
        listOfItems = response.data!.first.homeScreen ?? [];
        header = response.data!.first.header ?? "";
        // Save API response to SharedPreferences
        await saveDataLocally(listOfItems, header);
        notifyListeners();
      }
    } catch (e) {
      print("Error fetching home data: $e");
    }
  }

  void clearStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('home_data');
    print("Local data cleared!");
  }

  // var data = <OnBoardingDatum>[];
  // Future<void> getOnBoardingData({required String label}) async {
  //   data = [];
  //   final response = await ApiServices().fetchOnBoardingData(label: label);
  //   data = response.data!;
  //   notifyListeners();
  // }
}

// class HomeviewModel extends BaseViewModel {
//   List<Home> listOfItems = [];
//   String header = "";
//   HomeviewModel() {
//     getHomeData();
//   }
//
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
//             await ApiServices().fetchHomeData(screenName: "homescreens");
//         listOfItems = response.data!.first.home!;
//         header = response.data!.first.header!;
//         notifyListeners();
//       }
//       onLoading(false);
//     } catch (e) {
//       print("getHomeData $e");
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
