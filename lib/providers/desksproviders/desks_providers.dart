import 'package:flutter/material.dart';
import 'package:stumato_assignment/models/facilities_models/DesksOnboardingModel.dart';
import 'package:stumato_assignment/services/desks_service.dart';
 // Import the DeskService


class DeskProvider with ChangeNotifier {
  final DeskService _deskService = DeskService();  // Create an instance of DeskService
  late Future<DesksOnboardingModel> _desks;

  DeskProvider() {
    _desks = fetchDesks();
  }

  Future<DesksOnboardingModel> get desks => _desks;

  Future<DesksOnboardingModel> fetchDesks() async {
    try {
      final desks = await _deskService.fetchDesks();  // Use DeskService to fetch data
      notifyListeners();
      return desks;
    } catch (e) {
      throw Exception('Failed to load desks');
    }
  }
}
