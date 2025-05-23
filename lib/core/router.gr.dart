// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../models/on_boarding.dart' as _i11;
import '../ui/access/access_view.dart' as _i5;
import '../ui/discover/discover_view.dart' as _i6;
import '../ui/facilities/facilities_view.dart' as _i3;
import '../ui/home/homeview.dart' as _i2;
import '../ui/mainview.dart' as _i1;
import '../ui/on_boarding/on_boarding_view.dart' as _i7;
import '../ui/transport/transport_view.dart' as _i4;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainView(),
      );
    },
    Homeview.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Homeview(),
      );
    },
    FacilitiesView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FacilitiesView(),
      );
    },
    TransportView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TransportView(),
      );
    },
    AccessView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AccessView(),
      );
    },
    DiscoverView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.DiscoverView(),
      );
    },
    OnBoardingView.name: (routeData) {
      final args = routeData.argsAs<OnBoardingViewArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.OnBoardingView(
          key: args.key,
          // onBoardingData: args.onBoardingData,
          featureLabel: args.featureLabel,
        ),
      );
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          MainView.name,
          path: '/',
        ),
        _i9.RouteConfig(
          Homeview.name,
          path: '/Homeview',
        ),
        _i9.RouteConfig(
          FacilitiesView.name,
          path: '/facilities-view',
        ),
        _i9.RouteConfig(
          TransportView.name,
          path: '/transport-view',
        ),
        _i9.RouteConfig(
          AccessView.name,
          path: '/access-view',
        ),
        _i9.RouteConfig(
          DiscoverView.name,
          path: '/discover-view',
        ),
        _i9.RouteConfig(
          OnBoardingView.name,
          path: '/on-boarding-view',
        ),
        _i9.RouteConfig(
          RiverpodExample.name,
          path: '/riverpod-example',
        ),
      ];
}

/// generated route for
/// [_i1.MainView]
class MainView extends _i9.PageRouteInfo<void> {
  const MainView()
      : super(
          MainView.name,
          path: '/',
        );

  static const String name = 'MainView';
}

/// generated route for
/// [_i2.Homeview]
class Homeview extends _i9.PageRouteInfo<void> {
  const Homeview()
      : super(
          Homeview.name,
          path: '/Homeview',
        );

  static const String name = 'Homeview';
}

/// generated route for
/// [_i3.FacilitiesView]
class FacilitiesView extends _i9.PageRouteInfo<void> {
  const FacilitiesView()
      : super(
          FacilitiesView.name,
          path: '/facilities-view',
        );

  static const String name = 'FacilitiesView';
}

/// generated route for
/// [_i4.TransportView]
class TransportView extends _i9.PageRouteInfo<void> {
  const TransportView()
      : super(
          TransportView.name,
          path: '/transport-view',
        );

  static const String name = 'TransportView';
}

/// generated route for
/// [_i5.AccessView]
class AccessView extends _i9.PageRouteInfo<void> {
  const AccessView()
      : super(
          AccessView.name,
          path: '/access-view',
        );

  static const String name = 'AccessView';
}

/// generated route for
/// [_i6.DiscoverView]
class DiscoverView extends _i9.PageRouteInfo<void> {
  const DiscoverView()
      : super(
          DiscoverView.name,
          path: '/discover-view',
        );

  static const String name = 'DiscoverView';
}

/// generated route for
/// [_i7.OnBoardingView]
class OnBoardingView extends _i9.PageRouteInfo<OnBoardingViewArgs> {
  OnBoardingView({
    _i10.Key? key,
    required List<_i11.OnboardingCarousel> onBoardingData,
    String? featureLabel,
  }) : super(
          OnBoardingView.name,
          path: '/on-boarding-view',
          args: OnBoardingViewArgs(
            key: key,
            onBoardingData: onBoardingData,
            featureLabel: featureLabel,
          ),
        );

  static const String name = 'OnBoardingView';
}

class OnBoardingViewArgs {
  const OnBoardingViewArgs({
    this.key,
    required this.onBoardingData,
    this.featureLabel,
  });

  final _i10.Key? key;

  final List<_i11.OnboardingCarousel> onBoardingData;

  final String? featureLabel;

  @override
  String toString() {
    return 'OnBoardingViewArgs{key: $key, onBoardingData: $onBoardingData, featureLabel: $featureLabel}';
  }
}

/// generated route for
/// [_i8.RiverpodExample]
class RiverpodExample extends _i9.PageRouteInfo<RiverpodExampleArgs> {
  RiverpodExample({_i10.Key? key})
      : super(
          RiverpodExample.name,
          path: '/riverpod-example',
          args: RiverpodExampleArgs(key: key),
        );

  static const String name = 'RiverpodExample';
}

class RiverpodExampleArgs {
  const RiverpodExampleArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'RiverpodExampleArgs{key: $key}';
  }
}
