import 'package:auto_route/auto_route.dart';

import '../ui/mainview.dart';

class AuthBasedNav {
  Future<bool> onStartup() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? expiry = prefs.getString(AppSharedPref.expiryToken);
    // if (expiry != null && expiry != "") {
    //   DateTime expiryDate = DateTime.parse(expiry);
    //   DateTime currentTime = DateTime.now();
    //   // int difference = currentTime.difference(expiryDate).inDays;
    //   if (expiryDate.isBefore(currentTime)) {
    //     return false;
    //   } else {
    //     return true;
    //   }
    // }
    return false;
  }
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      // the navigation is paused until resolver.next() is called with either
      // true to resume/continue navigation or false to abort navigation
      bool isAuthenticated =
          await AuthBasedNav().onStartup(); //.then((isAuthenticated) {
      if (!isAuthenticated) {
        // if user is authenticated we continue
        resolver.next(true);
      } else {
        router.pushWidget(MainView());
        // router.push(MainView(onResult: (success) {
        //   // if success == true the navigation will be resumed
        //   // else it will be aborted
        //   resolver.next(success);
        // }));
      }
    } catch (err) {
      print("Error in AuthGuard");
      print(err);
    }
  }
}
