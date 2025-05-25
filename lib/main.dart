import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:stumato_assignment/ui/home/home_cubit/home_cubit.dart';
import 'package:stumato_assignment/ui/mainview.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => HomeCubit()..loadLocalData()),
    // add more if needed
  ], child: ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final AppRouter _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
      // routerDelegate: AutoRouterDelegate(
      //   _appRouter,
      //   navigatorObservers: () => [AutoRouteObserver()],
      // ),
      // routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
