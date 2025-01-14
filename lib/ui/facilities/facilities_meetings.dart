import 'package:flutter/material.dart';
import 'package:stumato_assignment/core/constants.dart';

class FacilitiesMeetings extends StatelessWidget {
  final PageController _pageController = PageController();

  FacilitiesMeetings({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return OnboardingPageFacilities(index: index);
        },
      ),
    ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:stumato_assignment/core/constants.dart';

class OnboardingPageFacilities extends StatelessWidget {
  final int index;

  const OnboardingPageFacilities({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page
            },
          ),
          title: Text(
            "Meeting mate",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.accent1),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getImage(),
          SizedBox(height: 10),
          Text(
            _getTitle(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 10),
          Text(
            _getDescription(),
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 16, color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (index) {
      case 0:
        return 'Book a desk';
      case 1:
        return 'Plan your office work';
      case 2:
        return 'Book scan work';
      case 3:
        return 'Do your best work';
      default:
        return '';
    }
  }

  String _getDescription() {
    switch (index) {
      case 0:
        return 'you can book desks i';
      case 1:
        return 'Discover the amazing features we offer.';
      case 2:
        return 'Connect with people and stay updated.';
      case 3:
        return 'Let’s get started and enjoy the app!';
      default:
        return '';
    }
  }

  Widget _getImage() {
    switch (index) {
      case 0:
        return Image.asset(
          'assets/images/facilities_meetings_onboarding_1[1].jpg',
          fit: BoxFit.cover,
          height: 440,
        );
      case 1:
        return Image.asset(
          'assets/images/facilities__2.jpg',
          // fit: BoxFit.cover,
          // height: 440,
          // width: 450,
        );
      case 2:
        return Image.asset('assets/images/facilities_meetings_onboarding_3.jpg',
            height: 100);
      case 3:
        return Image.asset('assets/images/do_best_work.png', height: 100);
      default:
        return Image.asset('assets/images/default_image.png', height: 100);
    }
  }
}
//   Color _getBackgroundColor() {
//     switch (index) {
//       case 0:
//         return Colors.blue;
//       case 1:
//         return Colors.green;
//       case 2:
//         return Colors.orange;
//       case 3:
//         return Colors.purple;
//       default:
//         return Colors.black;
//     }
//   }
// }


