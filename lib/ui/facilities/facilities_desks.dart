import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stumato_assignment/core/constants.dart';
import 'package:stumato_assignment/models/facilities_models/DesksOnboardingModel.dart';
import 'package:stumato_assignment/providers/desksproviders/desks_providers.dart';

class FacilitiesDeskScreen extends StatefulWidget {
  const FacilitiesDeskScreen({super.key});

  @override
  State<FacilitiesDeskScreen> createState() => _FacilitiesDeskScreenState();
}

class _FacilitiesDeskScreenState extends State<FacilitiesDeskScreen> {
  final PageController _pageController = PageController(initialPage: 3);
  int _currentPage = 4;

  final String baseurlofimage = 'https://strapi.apps.rredu.in';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white, // Change the color of the back button
          onPressed: () {
            Navigator.pop(context); // Or any other action
          },
        ),
        backgroundColor: AppColors.accent1,
        title: Text(
          'DeskMate',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<DeskProvider>(
        builder: (context, deskProvider, child) {
          return FutureBuilder<DesksOnboardingModel>(
            future: deskProvider.desks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                return Center(child: Text('No data available'));
              }

              final desks = snapshot.data!.data;

              return PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: desks.length,
                itemBuilder: (context, index) {
                  debugPrint('index: $index');
                  final desk = desks[index];
                  return Column(
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.5,
                        width: screenWidth * 1.9,
                        child: Image.network(
                          baseurlofimage + desk.carouselImage.url,
                          // deskProvider._deskService.baseUrl + desk.carouselImage.url,

                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            desk.title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          desk.description,
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 18,
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(desks.length, (index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              height: 4,
                              width: _currentPage == index ? 24 : 16,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Colors.grey
                                    : AppColors.accent1,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
