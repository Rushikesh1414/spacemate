// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stumato_assignment/providers/bottomnavigationbarprovider.dart';

// class TransportScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      final provider = Provider.of<BottomNavigationProvider>(context);
//     return Scaffold(
//        bottomNavigationBar: BottomNavigationBar(
//             onTap: (index) => provider.onItemTapped(index,context),
            
            
//             currentIndex: provider.currentIndex,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: Colors.black12,
//           unselectedItemColor:  Colors.black12,
          
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: const Icon(
//                 Icons.home,
//               ),
//               label: ("Home"),
//             ),
//              BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.groups,
//               ),
//               label: ("Transport"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.alarm),
              
             
//               label: ("Access"),
//             ),
//              BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.calendar_month,
//               ),
//               label: ("facilities"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person,
//               ),
//               label: ("Discover"),
//             ),
            
//           ],
         
//         ),
//     );
//   }
// }
import 'package:flutter/material.dart';


class TransportScreen extends StatelessWidget {
  
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Transport Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}