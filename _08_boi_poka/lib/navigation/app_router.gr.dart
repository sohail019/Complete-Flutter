// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i4;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i5;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.CarouselScreen]
class CarouselRoute extends _i7.PageRouteInfo<void> {
  const CarouselRoute({List<_i7.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i2.GenreScreen]
class GenreRoute extends _i7.PageRouteInfo<void> {
  const GenreRoute({List<_i7.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.GenreScreen();
    },
  );
}

/// generated route for
/// [_i3.ScaleScreen]
class ScaleRoute extends _i7.PageRouteInfo<void> {
  const ScaleRoute({List<_i7.PageRouteInfo>? children})
    : super(ScaleRoute.name, initialChildren: children);

  static const String name = 'ScaleRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.ScaleScreen();
    },
  );
}

/// generated route for
/// [_i4.SigninScreen]
class SigninRoute extends _i7.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i8.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         SigninRoute.name,
         args: SigninRouteArgs(
           key: key,
           errorMessage: errorMessage,
           isLogout: isLogout,
         ),
         initialChildren: children,
       );

  static const String name = 'SigninRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i4.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i8.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i5.SignupScreen]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute({List<_i7.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignupScreen();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}
