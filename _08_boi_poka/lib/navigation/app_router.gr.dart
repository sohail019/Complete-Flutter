// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i23;

import 'package:_08_boi_poka/models/book_state.dart' as _i20;
import 'package:_08_boi_poka/models/get_all_books_model.dart' as _i22;
import 'package:_08_boi_poka/screens/analytics_screen/analytics_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i13;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i14;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_book_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_screen.dart'
    as _i4;
import 'package:_08_boi_poka/screens/home/filter_page/filter_page.dart' as _i5;
import 'package:_08_boi_poka/screens/home/home_screen.dart' as _i7;
import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart'
    as _i9;
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_book_screen.dart'
    as _i10;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i6;
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart'
    as _i8;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i11;
import 'package:_08_boi_poka/screens/set_pattern_screen/set_pattern_screen.dart'
    as _i12;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i15;
import 'package:_08_boi_poka/screens/stock_chart_screen/stock_chart_screen.dart'
    as _i16;
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i19;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as _i21;

/// generated route for
/// [_i1.AnalyticsScreen]
class AnalyticsRoute extends _i17.PageRouteInfo<void> {
  const AnalyticsRoute({List<_i17.PageRouteInfo>? children})
    : super(AnalyticsRoute.name, initialChildren: children);

  static const String name = 'AnalyticsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnalyticsScreen();
    },
  );
}

/// generated route for
/// [_i2.AudioBookScreen]
class AudioBookRoute extends _i17.PageRouteInfo<void> {
  const AudioBookRoute({List<_i17.PageRouteInfo>? children})
    : super(AudioBookRoute.name, initialChildren: children);

  static const String name = 'AudioBookRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.AudioBookScreen();
    },
  );
}

/// generated route for
/// [_i3.CarouselScreen]
class CarouselRoute extends _i17.PageRouteInfo<void> {
  const CarouselRoute({List<_i17.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i4.EbookScreen]
class EbookRoute extends _i17.PageRouteInfo<void> {
  const EbookRoute({List<_i17.PageRouteInfo>? children})
    : super(EbookRoute.name, initialChildren: children);

  static const String name = 'EbookRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i4.EbookScreen();
    },
  );
}

/// generated route for
/// [_i5.FilterPage]
class FilterRoute extends _i17.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i18.Key? key,
    required String libraryId,
    required _i19.StateNotifierProviderFamily<
      dynamic,
      _i20.BooksState,
      Map<String, dynamic>?
    >
    stateNotifierProvider,
    required _i19.StateProvider<bool> pageFilterToggleProvider,
    _i19.StateNotifierProvider<
      dynamic,
      _i21.PagingController<int, _i22.BookData>
    >?
    listGridControllerProvider,
    _i19.StateNotifierProvider<
      dynamic,
      _i21.PagingController<int, Map<String, dynamic>>
    >?
    shelfControllerProvider,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return _i5.FilterPage(
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

  final _i18.Key? key;

  final String libraryId;

  final _i19.StateNotifierProviderFamily<
    dynamic,
    _i20.BooksState,
    Map<String, dynamic>?
  >
  stateNotifierProvider;

  final _i19.StateProvider<bool> pageFilterToggleProvider;

  final _i19.StateNotifierProvider<
    dynamic,
    _i21.PagingController<int, _i22.BookData>
  >?
  listGridControllerProvider;

  final _i19.StateNotifierProvider<
    dynamic,
    _i21.PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, libraryId: $libraryId, stateNotifierProvider: $stateNotifierProvider, pageFilterToggleProvider: $pageFilterToggleProvider, listGridControllerProvider: $listGridControllerProvider, shelfControllerProvider: $shelfControllerProvider}';
  }
}

/// generated route for
/// [_i6.GenreScreen]
class GenreRoute extends _i17.PageRouteInfo<void> {
  const GenreRoute({List<_i17.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.GenreScreen();
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.LibScreen]
class LibRoute extends _i17.PageRouteInfo<LibRouteArgs> {
  LibRoute({
    _i18.Key? key,
    _i23.File? imageFile,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         LibRoute.name,
         args: LibRouteArgs(key: key, imageFile: imageFile),
         initialChildren: children,
       );

  static const String name = 'LibRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LibRouteArgs>(
        orElse: () => const LibRouteArgs(),
      );
      return _i8.LibScreen(key: args.key, imageFile: args.imageFile);
    },
  );
}

class LibRouteArgs {
  const LibRouteArgs({this.key, this.imageFile});

  final _i18.Key? key;

  final _i23.File? imageFile;

  @override
  String toString() {
    return 'LibRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [_i9.MainTabViewScreen]
class MainTabViewRoute extends _i17.PageRouteInfo<MainTabViewRouteArgs> {
  MainTabViewRoute({
    _i18.Key? key,
    bool? showAppBar,
    String? title,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         MainTabViewRoute.name,
         args: MainTabViewRouteArgs(
           key: key,
           showAppBar: showAppBar,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'MainTabViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainTabViewRouteArgs>(
        orElse: () => const MainTabViewRouteArgs(),
      );
      return _i9.MainTabViewScreen(
        key: args.key,
        showAppBar: args.showAppBar,
        title: args.title,
      );
    },
  );
}

class MainTabViewRouteArgs {
  const MainTabViewRouteArgs({this.key, this.showAppBar, this.title});

  final _i18.Key? key;

  final bool? showAppBar;

  final String? title;

  @override
  String toString() {
    return 'MainTabViewRouteArgs{key: $key, showAppBar: $showAppBar, title: $title}';
  }
}

/// generated route for
/// [_i10.PhysicalBookScreen]
class PhysicalBookRoute extends _i17.PageRouteInfo<void> {
  const PhysicalBookRoute({List<_i17.PageRouteInfo>? children})
    : super(PhysicalBookRoute.name, initialChildren: children);

  static const String name = 'PhysicalBookRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.PhysicalBookScreen();
    },
  );
}

/// generated route for
/// [_i11.ScaleScreen]
class ScaleRoute extends _i17.PageRouteInfo<void> {
  const ScaleRoute({List<_i17.PageRouteInfo>? children})
    : super(ScaleRoute.name, initialChildren: children);

  static const String name = 'ScaleRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.ScaleScreen();
    },
  );
}

/// generated route for
/// [_i12.SetPatternScreen]
class SetPatternRoute extends _i17.PageRouteInfo<void> {
  const SetPatternRoute({List<_i17.PageRouteInfo>? children})
    : super(SetPatternRoute.name, initialChildren: children);

  static const String name = 'SetPatternRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.SetPatternScreen();
    },
  );
}

/// generated route for
/// [_i13.SigninScreen]
class SigninRoute extends _i17.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i18.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i13.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i18.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i14.SignupScreen]
class SignupRoute extends _i17.PageRouteInfo<void> {
  const SignupRoute({List<_i17.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignupScreen();
    },
  );
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i15.SplashScreen();
    },
  );
}

/// generated route for
/// [_i16.StockChartScreen]
class StockChartRoute extends _i17.PageRouteInfo<void> {
  const StockChartRoute({List<_i17.PageRouteInfo>? children})
    : super(StockChartRoute.name, initialChildren: children);

  static const String name = 'StockChartRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i16.StockChartScreen();
    },
  );
}
