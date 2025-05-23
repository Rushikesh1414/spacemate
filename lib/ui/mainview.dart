import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/core/constants.dart';
import 'package:stumato_assignment/widgets/icon.dart';

import '../core/router.gr.dart';
import 'mainview_model.dart';

class MainView extends StackedView<MainViewModel> {
  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    final labels = [
      "Home",
      "Transport",
      "Access",
      "Facilities",
      "Discover",
    ];
    final icons = [
      Symbols.home,
      Symbols.directions_car,
      Symbols.fingerprint,
      Symbols.apartment,
      Symbols.explore,
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AutoRouter.of(context).push(RiverpodExample());
              },
              splashColor: Colors.grey,
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 35,
              ))
        ],
        // leading: const Icon(Icons.home),
        toolbarHeight: 75,
        title: const Text(
          "SpaceMate",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: (index) {
          viewModel.updateIndex(index);
        },
        children: viewModel.screens,
      ), // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: (index) {
          viewModel.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        items: List.generate(labels.length, (index) {
          return BottomNavigationBarItem(
            icon: customIcons(
                iconData: icons[index],
                color: viewModel.currentIndex == index
                    ? Colors.blue.shade900
                    : Colors.grey),
            label: labels[index],
          );
        }),
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();
}
