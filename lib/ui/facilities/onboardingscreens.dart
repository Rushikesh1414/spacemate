import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final int index;

  OnboardingPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deskmate"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getImage(),
          SizedBox(height: 20),
          Text(
            _getTitle(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            _getDescription(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
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
        return 'We are excited to have you with us.';
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
        return Image.asset('assets/images/person.jpg', height: 100);
      case 1:
        return Image.asset('assets/images/facilities_desks_onboarding_2.jpg', height: 100);
      case 2:
        return Image.asset('assets\images\person.jpg', height: 100);
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
