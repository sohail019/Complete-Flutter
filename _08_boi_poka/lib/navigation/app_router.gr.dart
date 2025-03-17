// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i19;

import 'package:_08_boi_poka/models/book_state.dart' as _i16;
import 'package:_08_boi_poka/models/get_all_books_model.dart' as _i18;
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i10;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i11;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_book_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/home/filter_page/filter_page.dart' as _i4;
import 'package:_08_boi_poka/screens/home/home_screen.dart' as _i6;
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_book_screen.dart'
    as _i8;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i5;
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart'
    as _i7;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i9;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i12;
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i15;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as _i17;

/// generated route for
/// [_i1.AudioBookScreen]
class AudioBookRoute extends _i13.PageRouteInfo<void> {
  const AudioBookRoute({List<_i13.PageRouteInfo>? children})
    : super(AudioBookRoute.name, initialChildren: children);

  static const String name = 'AudioBookRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AudioBookScreen();
    },
  );
}

/// generated route for
/// [_i2.CarouselScreen]
class CarouselRoute extends _i13.PageRouteInfo<void> {
  const CarouselRoute({List<_i13.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i3.EbookScreen]
class EbookRoute extends _i13.PageRouteInfo<void> {
  const EbookRoute({List<_i13.PageRouteInfo>? children})
    : super(EbookRoute.name, initialChildren: children);

  static const String name = 'EbookRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.EbookScreen();
    },
  );
}

/// generated route for
/// [_i4.FilterPage]
class FilterRoute extends _i13.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i14.Key? key,
    required String libraryId,
    required _i15.StateNotifierProviderFamily<
      dynamic,
      _i16.BooksState,
      Map<String, dynamic>?
    >
    stateNotifierProvider,
    required _i15.StateProvider<bool> pageFilterToggleProvider,
    _i15.StateNotifierProvider<
      dynamic,
      _i17.PagingController<int, _i18.BookData>
    >?
    listGridControllerProvider,
    _i15.StateNotifierProvider<
      dynamic,
      _i17.PagingController<int, Map<String, dynamic>>
    >?
    shelfControllerProvider,
    List<_i13.PageRouteInfo>? children,
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

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return _i4.FilterPage(
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

  final _i14.Key? key;

  final String libraryId;

  final _i15.StateNotifierProviderFamily<
    dynamic,
    _i16.BooksState,
    Map<String, dynamic>?
  >
  stateNotifierProvider;

  final _i15.StateProvider<bool> pageFilterToggleProvider;

  final _i15.StateNotifierProvider<
    dynamic,
    _i17.PagingController<int, _i18.BookData>
  >?
  listGridControllerProvider;

  final _i15.StateNotifierProvider<
    dynamic,
    _i17.PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, libraryId: $libraryId, stateNotifierProvider: $stateNotifierProvider, pageFilterToggleProvider: $pageFilterToggleProvider, listGridControllerProvider: $listGridControllerProvider, shelfControllerProvider: $shelfControllerProvider}';
  }
}

/// generated route for
/// [_i5.GenreScreen]
class GenreRoute extends _i13.PageRouteInfo<void> {
  const GenreRoute({List<_i13.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.GenreScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.LibScreen]
class LibRoute extends _i13.PageRouteInfo<LibRouteArgs> {
  LibRoute({
    _i14.Key? key,
    _i19.File? imageFile,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         LibRoute.name,
         args: LibRouteArgs(key: key, imageFile: imageFile),
         initialChildren: children,
       );

  static const String name = 'LibRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LibRouteArgs>(
        orElse: () => const LibRouteArgs(),
      );
      return _i7.LibScreen(key: args.key, imageFile: args.imageFile);
    },
  );
}

class LibRouteArgs {
  const LibRouteArgs({this.key, this.imageFile});

  final _i14.Key? key;

  final _i19.File? imageFile;

  @override
  String toString() {
    return 'LibRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [_i8.PhysicalBookScreen]
class PhysicalBookRoute extends _i13.PageRouteInfo<void> {
  const PhysicalBookRoute({List<_i13.PageRouteInfo>? children})
    : super(PhysicalBookRoute.name, initialChildren: children);

  static const String name = 'PhysicalBookRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.PhysicalBookScreen();
    },
  );
}

/// generated route for
/// [_i9.ScaleScreen]
class ScaleRoute extends _i13.PageRouteInfo<void> {
  const ScaleRoute({List<_i13.PageRouteInfo>? children})
    : super(ScaleRoute.name, initialChildren: children);

  static const String name = 'ScaleRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.ScaleScreen();
    },
  );
}

/// generated route for
/// [_i10.SigninScreen]
class SigninRoute extends _i13.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i14.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i13.PageRouteInfo>? children,
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

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i10.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i14.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i11.SignupScreen]
class SignupRoute extends _i13.PageRouteInfo<void> {
  const SignupRoute({List<_i13.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SignupScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}
