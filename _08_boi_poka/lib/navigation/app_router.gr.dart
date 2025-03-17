// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i16;

import 'package:_08_boi_poka/models/book_state.dart' as _i13;
import 'package:_08_boi_poka/models/get_all_books_model.dart' as _i15;
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i7;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i8;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/home/filter_page/filter_page.dart' as _i2;
import 'package:_08_boi_poka/screens/home/home_screen.dart' as _i4;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart'
    as _i5;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i6;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i9;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i12;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as _i14;

/// generated route for
/// [_i1.CarouselScreen]
class CarouselRoute extends _i10.PageRouteInfo<void> {
  const CarouselRoute({List<_i10.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i2.FilterPage]
class FilterRoute extends _i10.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i11.Key? key,
    required String libraryId,
    required _i12.StateNotifierProviderFamily<
      dynamic,
      _i13.BooksState,
      Map<String, dynamic>?
    >
    stateNotifierProvider,
    required _i12.StateProvider<bool> pageFilterToggleProvider,
    _i12.StateNotifierProvider<
      dynamic,
      _i14.PagingController<int, _i15.BookData>
    >?
    listGridControllerProvider,
    _i12.StateNotifierProvider<
      dynamic,
      _i14.PagingController<int, Map<String, dynamic>>
    >?
    shelfControllerProvider,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         FilterRoute.name,
         args: FilterRouteArgs(
           key: key,
           libraryId: libraryId,
           stateNotifierProvider: stateNotifierProvider,
           pageFilterToggleProvider: pageFilterToggleProvider,
           listGridControllerProvider: listGridControllerProvider,
           shelfControllerProvider: shelfControllerProvider,
         ),
         initialChildren: children,
       );

  static const String name = 'FilterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return _i2.FilterPage(
        key: args.key,
        libraryId: args.libraryId,
        stateNotifierProvider: args.stateNotifierProvider,
        pageFilterToggleProvider: args.pageFilterToggleProvider,
        listGridControllerProvider: args.listGridControllerProvider,
        shelfControllerProvider: args.shelfControllerProvider,
      );
    },
  );
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.libraryId,
    required this.stateNotifierProvider,
    required this.pageFilterToggleProvider,
    this.listGridControllerProvider,
    this.shelfControllerProvider,
  });

  final _i11.Key? key;

  final String libraryId;

  final _i12.StateNotifierProviderFamily<
    dynamic,
    _i13.BooksState,
    Map<String, dynamic>?
  >
  stateNotifierProvider;

  final _i12.StateProvider<bool> pageFilterToggleProvider;

  final _i12.StateNotifierProvider<
    dynamic,
    _i14.PagingController<int, _i15.BookData>
  >?
  listGridControllerProvider;

  final _i12.StateNotifierProvider<
    dynamic,
    _i14.PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, libraryId: $libraryId, stateNotifierProvider: $stateNotifierProvider, pageFilterToggleProvider: $pageFilterToggleProvider, listGridControllerProvider: $listGridControllerProvider, shelfControllerProvider: $shelfControllerProvider}';
  }
}

/// generated route for
/// [_i3.GenreScreen]
class GenreRoute extends _i10.PageRouteInfo<void> {
  const GenreRoute({List<_i10.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.GenreScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LibScreen]
class LibRoute extends _i10.PageRouteInfo<LibRouteArgs> {
  LibRoute({
    _i11.Key? key,
    _i16.File? imageFile,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         LibRoute.name,
         args: LibRouteArgs(key: key, imageFile: imageFile),
         initialChildren: children,
       );

  static const String name = 'LibRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LibRouteArgs>(
        orElse: () => const LibRouteArgs(),
      );
      return _i5.LibScreen(key: args.key, imageFile: args.imageFile);
    },
  );
}

class LibRouteArgs {
  const LibRouteArgs({this.key, this.imageFile});

  final _i11.Key? key;

  final _i16.File? imageFile;

  @override
  String toString() {
    return 'LibRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [_i6.ScaleScreen]
class ScaleRoute extends _i10.PageRouteInfo<void> {
  const ScaleRoute({List<_i10.PageRouteInfo>? children})
    : super(ScaleRoute.name, initialChildren: children);

  static const String name = 'ScaleRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.ScaleScreen();
    },
  );
}

/// generated route for
/// [_i7.SigninScreen]
class SigninRoute extends _i10.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i11.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i7.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i11.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i8.SignupScreen]
class SignupRoute extends _i10.PageRouteInfo<void> {
  const SignupRoute({List<_i10.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignupScreen();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}
