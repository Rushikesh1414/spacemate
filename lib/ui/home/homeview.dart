import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/ui/home/homeview_model.dart';
import 'package:stumato_assignment/widgets/header_text.dart';

import '../../services/onBoarding_nav.dart';
import '../../widgets/custom_gridview.dart';
import '../../widgets/default_loader.dart';

class Homeview extends StackedView<HomeviewModel> {
  const Homeview({super.key});

  @override
  Widget builder(BuildContext context, HomeviewModel viewModel, Widget? child) {
    return Scaffold(
        body: viewModel.isLoading
            ? defaultLoader()
            : viewModel.listOfItems != null && viewModel.listOfItems.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      headerText(text: viewModel.header),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns
                          mainAxisSpacing: 16.0, // Vertical spacing
                          crossAxisSpacing: 16.0, // Horizontal spacing
                        ),
                        itemCount: viewModel.listOfItems.length,
                        itemBuilder: (context, index) {
                          return gridviewWidget(index,
                              listOfItems: viewModel.listOfItems, onTap: () {
                            // viewModel.getOnBoardingData(
                            //     label: viewModel.listOfItems[index].iconName!
                            //         .toLowerCase()
                            //         .replaceAll(RegExp(r"\s+"), ""));
                            //     .whenComplete(() {
                            //
                            //
                            //   //
                            //   // AutoRouter.of(context).push(OnBoardingView(
                            //   //     featureLabel:
                            //   //         viewModel.data.first.featureName!,
                            //   //     onBoardingData: viewModel
                            //   //         .data.first.onboardingCarousel!));
                            // });
                            navigateToOnBoarding(
                                viewModel.listOfItems[index].iconName!);
                            // Get.to(() => OnBoardingView(
                            //       featureLabel: viewModel
                            //           .listOfItems[index].iconName!
                            //           .toLowerCase()
                            //           .replaceAll(RegExp(r"\s+"), ""),
                            //     ));
                          });
                        },
                      ),
                    ]))
                : const Center(child: Text("No home data found.")));
  }

  @override
  HomeviewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return HomeviewModel();
  }

  @override
  void onViewModelReady(HomeviewModel viewModel) {
    // Pass the feature label here
    viewModel.loadLocalData();
  }
}
