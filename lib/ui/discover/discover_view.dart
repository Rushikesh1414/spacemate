import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../services/onBoarding_nav.dart';
import '../../widgets/custom_gridview.dart';
import '../../widgets/default_loader.dart';
import '../../widgets/header_text.dart';
import 'discover_view_model.dart';

class DiscoverView extends StackedView<DiscoverViewModel> {
  const DiscoverView({super.key});

  @override
  Widget builder(
      BuildContext context, DiscoverViewModel viewModel, Widget? child) {
    // TODO: implement builder
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
                            navigateToOnBoarding(
                                viewModel.listOfItems[index].iconName!);
                          });
                        },
                      ),
                    ]))
                : const Center(child: Text("No home data found.")));
  }

  @override
  DiscoverViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return DiscoverViewModel();
  }

  @override
  void onViewModelReady(DiscoverViewModel viewModel) {
    // Pass the feature label here
    viewModel.getHomeData();
  }
}
