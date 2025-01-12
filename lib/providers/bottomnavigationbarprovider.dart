// import 'package:flutter/material.dart';
// import 'package:stumato_assignment/ui/acesss/access.dart';
// import 'package:stumato_assignment/ui/discover/discover.dart';
// import 'package:stumato_assignment/ui/facilities/facilities.dart';
// import 'package:stumato_assignment/ui/homepage.dart';
// import 'package:stumato_assignment/ui/transport/transport.dart';

// class BottomNavigationProvider with ChangeNotifier {
//   int currentIndex = 0;
//   void onItemTapped(int index,  context) {
//     debugPrint('Tab Index:$index');

//     currentIndex = index;
//     notifyListeners();
//     switch (index) {
//       case 0:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (_) => Homepage()));

//         currentIndex = 0;
//         notifyListeners();
//         break;
//       case 1:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (_) => TransportScreen()));

//         currentIndex = 1;
//         notifyListeners();
//         break;
//       case 2:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (_) => AccessScreen()));

//         currentIndex = 2;
//         notifyListeners();
//         break;
//       case 3:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (_) => FacilitiesScreen()));
//         currentIndex = 3;
//         notifyListeners();

//         break;
//       case 4:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (_) => DiscoverScreen()));

//         currentIndex = 4;
//         notifyListeners();
//         break;
//     }
//   }
// }
