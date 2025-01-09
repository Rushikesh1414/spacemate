import 'package:flutter/material.dart';
import 'package:stumato_assignment/ui/homepage.dart';
import 'package:provider/provider.dart';
import 'package:stumato_assignment/providers/bottomnavigationbarprovider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
      ],
      child: Homepage(),
      
    ));
  }
}
