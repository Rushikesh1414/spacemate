import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stumato_assignment/ui/transport/transport_view_model.dart';

import '../../services/onBoarding_nav.dart';
import '../../widgets/custom_gridview.dart';
import '../../widgets/default_loader.dart';
import '../../widgets/header_text.dart';

class TransportView extends StackedView<TransportViewModel> {
  const TransportView({super.key});

  @override
  Widget builder(
      BuildContext context, TransportViewModel viewModel, Widget? child) {
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
  TransportViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return TransportViewModel();
  }

  @override
  void onViewModelReady(TransportViewModel viewModel) {
    // Pass the feature label here
    viewModel.loadLocalData();
  }
}
