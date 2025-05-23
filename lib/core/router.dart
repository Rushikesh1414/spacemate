import 'package:auto_route/auto_route.dart';
import 'package:stumato_assignment/ui/mainview.dart';
import 'package:stumato_assignment/ui/on_boarding/on_boarding_view.dart';

import '../ui/access/access_view.dart';
import '../ui/discover/discover_view.dart';
import '../ui/facilities/facilities_view.dart';
import '../ui/home/homeview.dart';
import '../ui/transport/transport_view.dart';

// Generate Routes
// dart run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainView, initial: true),
    AutoRoute(
      page: Homeview,
    ),
    AutoRoute(
      page: FacilitiesView,
    ),
    AutoRoute(
      page: TransportView,
    ),
    AutoRoute(
      page: AccessView,
    ),
    AutoRoute(
      page: DiscoverView,
    ),
    AutoRoute(
      page: OnBoardingView,
    )
  ],
)
class $AppRouter {}
