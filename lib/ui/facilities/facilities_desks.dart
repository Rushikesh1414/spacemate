import 'package:flutter/material.dart';
import 'package:stumato_assignment/ui/facilities/onboardingscreens.dart';


class DesksScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return OnboardingPage(index: index);
        },
      ),
    ));
  }
}

