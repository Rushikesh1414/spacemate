import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../services/onBoarding_nav.dart';
import '../../widgets/custom_gridview.dart';
import '../../widgets/default_loader.dart';
import '../../widgets/header_text.dart';
import 'facilities_view_model.dart';

class FacilitiesView extends StackedView<FacilitiesViewModel> {
  const FacilitiesView({super.key});

  @override
  Widget builder(
      BuildContext context, FacilitiesViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Scaffold(
      body: viewModel.isLoading
          ? defaultLoader()
          : viewModel.listOfItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      headerText(text: viewModel.header),
                      // Wrap(
                      //   children: List.generate(viewModel.listOfItems.length, (index) {
                      //     return InkWell(
                      //       onTap: () {
                      //         print("index $index");
                      //       },
                      //       child: SizedBox(
                      //         height: 125,
                      //         width: 125,
                      //         child: Card(
                      //           elevation: 4,
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(12),
                      //           ),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               Icon(
                      //                 viewModel.getIconFromString(
                      //                     viewModel.listOfItems[index].iconName!),
                      //                 size: 50,
                      //                 color: Colors.blue.shade900,
                      //               ),
                      //               const SizedBox(height: 8),
                      //               Text(
                      //                 viewModel.listOfItems[index].labelName!,
                      //                 textAlign: TextAlign.center,
                      //                 style: const TextStyle(
                      //                   fontSize: 14,
                      //                   fontWeight: FontWeight.w500,
                      //                   color: Colors.black87,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }),
                      // ),

                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns
                          mainAxisSpacing: 8.0, // Vertical spacing
                          crossAxisSpacing: 8.0, // Horizontal spacing
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
                    ],
                  ),
                )
              : Center(child: Text("No facility data found.")),
    );
  }

  @override
  FacilitiesViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return FacilitiesViewModel();
  }

  @override
  void onViewModelReady(FacilitiesViewModel viewModel) {
    // Pass the feature label here
    viewModel.getFacilitiesData();
  }
}
