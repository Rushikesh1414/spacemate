import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/home_labels_icons.dart';
import '../../../services/desks_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> loadLocalData() async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('home_data');
    String? storedHeader = prefs.getString('home_header');

    if (storedData != null && storedData.isNotEmpty) {
      print("Loading from local storage...");
      List<dynamic> jsonData = jsonDecode(storedData);
      List<Home> items = jsonData.map((x) => Home.fromJson(x)).toList();
      emit(state.copyWith(
          items: items, header: storedHeader ?? '', isLoading: false));
    } else {
      print("Fetching from API...");
      await fetchAndStoreHomeData();
    }
  }

  Future<void> fetchAndStoreHomeData() async {
    try {
      final response =
          await ApiServices().fetchHomeData(screenName: "homescreens");
      if (response.data != null && response.data!.isNotEmpty) {
        List<Home> items = response.data!.first.homeScreen ?? [];
        String headerText = response.data!.first.header ?? "";
        await saveDataLocally(items, headerText);
        emit(
            state.copyWith(items: items, header: headerText, isLoading: false));
      }
    } catch (e) {
      print("Error fetching home data: $e");
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> saveDataLocally(List<Home> items, String headerText) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'home_data', jsonEncode(items.map((e) => e.toJson()).toList()));
    prefs.setString('home_header', headerText);
  }

  Future<void> clearStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('home_data');
    print("Local data cleared!");
  }
}
