import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/core/constants.dart';

import 'on_boarding_view_model.dart';
import 'on_boarding_widgets/last_view.dart';
import 'on_boarding_widgets/view_one.dart';

class OnBoardingView extends StackedView<OnBoardingViewModel> {
  // List<OnboardingCarousel> onBoardingData;
  String? featureLabel;
  OnBoardingView(
      {super.key,
      // required this.onBoardingData,
      this.featureLabel});

  String defaultImage =
      "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg";

  @override
  Widget builder(
      BuildContext context, OnBoardingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white, // Change the color of the back button
          onPressed: () {
            Navigator.pop(context); // Or any other action
          },
        ),
        backgroundColor: AppColors.accent1,
        title: Text(
          viewModel.isLoading ||
                  viewModel.onBoardingData[viewModel.currentPage].title == null
              ? "Loading"
              : viewModel.onBoardingData[viewModel.currentPage].title!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PageView(
                  onPageChanged: (index) {
                    viewModel.onCurrentPageChange(index);
                  },
                  controller: viewModel.pageController,
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(viewModel.onBoardingData.length, (index) {
                    return index == 3
                        ? OnBoardingLastview(
                            title: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .header ??
                                "",
                            description: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .body ??
                                "",
                            buttonText: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .buttonLabel ??
                                "Book Now",
                            imageUrl: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .imageUrl ??
                                defaultImage,
                          )
                        : OnBoardingScreenOne(
                            title: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .header ??
                                "",
                            imageURL: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .imageUrl ??
                                defaultImage,
                            description: viewModel
                                    .onBoardingData[viewModel.currentPage]
                                    .body ??
                                "",
                          );
                  }),
                  // children: [

                  //   OnBoardingScreenOne(
                  //     imageURL: onBoardingData[viewModel.currentPage].imageUrl ??
                  //         "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
                  //     title: onBoardingData[viewModel.currentPage].header ?? "",
                  //     description: onBoardingData[viewModel.currentPage].body ?? "",
                  //   ),
                  //   OnBoardingScreenOne(
                  //     imageURL: onBoardingData[viewModel.currentPage].imageUrl ??
                  //         "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
                  //     title: onBoardingData[viewModel.currentPage].header ?? "",
                  //     description: onBoardingData[viewModel.currentPage].body ?? "",
                  //   ),

                  // ],
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        List.generate(viewModel.onBoardingData.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 4,
                        width: viewModel.currentPage == index ? 28 : 18,
                        decoration: BoxDecoration(
                          color: viewModel.currentPage == index
                              ? AppColors.accent1
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                    bottom: 50,
                    right: 20,
                    child: IconButton(
                        onPressed: () {
                          viewModel.pageController.nextPage(
                            // index + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Symbols.arrow_forward_ios)))
              ],
            ),
    );
  }

  @override
  OnBoardingViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return OnBoardingViewModel();
  }

  @override
  void onViewModelReady(OnBoardingViewModel viewModel) {
    // Pass the feature label here
    if (featureLabel != null) {
      viewModel.getOnBoardingData(label: featureLabel!);
    }
  }
}
