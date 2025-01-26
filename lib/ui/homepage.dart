import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.local_parking, 'label': 'Parking'},
    {'icon': Icons.directions_car, 'label': 'Valet Parking'},
    {'icon': Icons.ev_station, 'label': 'EV charging'},
    {'icon': Icons.fingerprint, 'label': 'Access Control'},
    {'icon': Icons.person_add, 'label': 'Visitors'},
    {'icon': Icons.lock, 'label': 'Lockers'},
    {'icon': Icons.home_repair_service, 'label': 'Facilities'},
    {'icon': Icons.help_outline, 'label': 'Requests'},
    {'icon': Icons.directions_car_filled, 'label': 'Carpools'},
    {'icon': Icons.local_offer, 'label': 'Deals'},
    {'icon': Icons.event, 'label': 'Events'},
    {'icon': Icons.more_horiz, 'label': 'More'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [const Icon(Icons.person)],
              leading: const Icon(Icons.home),
              toolbarHeight: 90,
              title: const Text(
                "SpaceMate",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "  Helpfull  services and delighful\n experinces in your office building",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
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
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              items[index]['icon'],
                              size: 40,
                              color: Colors.blue.shade900,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index]['label'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ]))));
  }
}
