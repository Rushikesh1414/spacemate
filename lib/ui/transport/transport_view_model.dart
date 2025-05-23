import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/services/desks_service.dart';

import '../../models/home_labels_icons.dart';
import '../../models/on_boarding.dart';

class TransportViewModel extends BaseViewModel {
  List<Home> listOfItems = [];
  String header = "";

  bool isLoading = false;

  void onLoading(bool value) async {
    isLoading = value;
    notifyListeners();
  }

  Future<void> saveDataLocally(List<Home> items, String headerText) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'transport_data', jsonEncode(items.map((e) => e.toJson()).toList()));
    prefs.setString('transport_header', headerText);
  }

  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('transport_data');
    String? storedHeader = prefs.getString('transport_header');
    if (storedData != null && storedData.isNotEmpty) {
      print("Loading from local storage...");
      List<dynamic> jsonData = jsonDecode(storedData);
      listOfItems = jsonData.map((x) => Home.fromJson(x)).toList();
      header = storedHeader ?? "";
      notifyListeners();
    } else {
      print("Fetching from API...");
      getTransportData();
    }
  }

  Future<void> getTransportData() async {
    onLoading(true);
    try {
      final response =
          await ApiServices().fetchHomeData(screenName: "transportscreens");
      if (response.data!.isNotEmpty) {
        listOfItems = response.data!.first.transport ?? [];
        header = response.data!.first.header ?? "";
        // Save data locally
        await saveDataLocally(listOfItems, header);
      }
      notifyListeners();
    } catch (e) {
      print("transportscreens $e");
    }
    onLoading(false);
  }

  var data = <OnBoardingDatum>[];

  Future<void> getOnBoardingData({required String label}) async {
    data = [];
    final response = await ApiServices().fetchOnBoardingData(label: label);
    data = response.data!;
    notifyListeners();
  }
}

// class TransportViewModel extends BaseViewModel {
//   List<Home> listOfItems = [];
//   String header = "";
//   TransportViewModel() {
//     getTransportData();
//   }
//   bool isLoading = false;
//
//   void onLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }
//
//   getTransportData() async {
//     onLoading(true);
//     try {
//       if (listOfItems.isEmpty) {
//         listOfItems = [];
//         final response =
//             await ApiServices().fetchHomeData(screenName: "transportscreens");
//         listOfItems = response.data!.first.transport!;
//         header = response.data!.first.header!;
//         notifyListeners();
//       }
//       onLoading(false);
//     } catch (e) {
//       print("transportscreens $e");
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
