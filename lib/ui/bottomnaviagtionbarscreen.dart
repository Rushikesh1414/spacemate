import 'package:flutter/material.dart';
import 'package:stumato_assignment/ui/acesss/access.dart';
import 'package:stumato_assignment/ui/discover/discover.dart';
import 'package:stumato_assignment/ui/facilities/facilities.dart';
import 'package:stumato_assignment/ui/homepage.dart';
import 'package:stumato_assignment/ui/transport/transport.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int _currentIndex = 0;

  // List of screens to display based on the selected index
  final List<Widget> _screens = [
    HomeScreen(),
    TransportScreen(),
    AccessScreen(),
    FacilitiesScreen(),
    DiscoverScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Transport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Access',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Facilities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
        ],
      ),
    );
  }
}
