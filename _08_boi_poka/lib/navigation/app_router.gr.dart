// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.CarouselScreen]
class CarouselRoute extends _i5.PageRouteInfo<void> {
  const CarouselRoute({List<_i5.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i2.SigninScreen]
class SigninRoute extends _i5.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i6.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i5.PageRouteInfo>? children,
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

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i2.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i6.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i3.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute({List<_i5.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignupScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
