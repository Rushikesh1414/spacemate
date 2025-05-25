import 'package:flutter/material.dart';
// class Homeview extends StackedView<HomeviewModel> {
//   const Homeview({super.key});
//
//   @override
//   Widget builder(BuildContext context, HomeviewModel viewModel, Widget? child) {
//     return Scaffold(
//         body: viewModel.isLoading
//             ? defaultLoader()
//             : viewModel.listOfItems != null && viewModel.listOfItems.isNotEmpty
//                 ? Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(children: [
//                       headerText(text: viewModel.header),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3, // 3 columns
//                           mainAxisSpacing: 16.0, // Vertical spacing
//                           crossAxisSpacing: 16.0, // Horizontal spacing
//                         ),
//                         itemCount: viewModel.listOfItems.length,
//                         itemBuilder: (context, index) {
//                           return gridviewWidget(index,
//                               listOfItems: viewModel.listOfItems, onTap: () {
//                             navigateToOnBoarding(
//                                 viewModel.listOfItems[index].iconName!);
//                           });
//                         },
//                       ),
//                     ]))
//                 : const Center(child: Text("No home data found.")));
//   }
//
//   @override
//   HomeviewModel viewModelBuilder(BuildContext context) {
//     // TODO: implement viewModelBuilder
//     return HomeviewModel();
//   }
//
//   @override
//   void onViewModelReady(HomeviewModel viewModel) {
//     // Pass the feature label here
//     viewModel.loadLocalData();
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stumato_assignment/widgets/header_text.dart';

import '../../services/onBoarding_nav.dart';
import '../../widgets/custom_gridview.dart';
import '../../widgets/default_loader.dart';
import 'home_cubit/home_cubit.dart';
import 'home_cubit/home_state.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return defaultLoader();
          }

          if (state.items.isEmpty) {
            return const Center(child: Text("No home data found."));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                headerText(text: state.header),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    return gridviewWidget(
                      index,
                      listOfItems: state.items,
                      onTap: () {
                        navigateToOnBoarding(state.items[index].iconName!);
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
