// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.CarouselScreen]
class CarouselRoute extends _i3.PageRouteInfo<void> {
  const CarouselRoute({List<_i3.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashScreen();
    },
  );
}
