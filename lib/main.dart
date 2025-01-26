import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stumato_assignment/providers/desksproviders/desks_providers.dart';
import 'package:stumato_assignment/ui/bottomnaviagtionbarscreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DeskProvider(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ));
  }
}
