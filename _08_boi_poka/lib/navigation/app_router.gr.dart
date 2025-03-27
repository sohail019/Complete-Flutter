// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i25;

import 'package:_08_boi_poka/models/book_state.dart' as _i22;
import 'package:_08_boi_poka/models/get_all_books_model.dart' as _i24;
import 'package:_08_boi_poka/screens/analytics_screen/analytics_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i15;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i16;
import 'package:_08_boi_poka/screens/book_details/book_details_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i4;
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_book_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_screen.dart'
    as _i5;
import 'package:_08_boi_poka/screens/home/filter_page/filter_page.dart' as _i6;
import 'package:_08_boi_poka/screens/home/home_screen.dart' as _i8;
import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart'
    as _i10;
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_book_screen.dart'
    as _i11;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i7;
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart'
    as _i9;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i13;
import 'package:_08_boi_poka/screens/profile_screen/profile_screen.dart'
    as _i12;
import 'package:_08_boi_poka/screens/set_pattern_screen/set_pattern_screen.dart'
    as _i14;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i17;
import 'package:_08_boi_poka/screens/stock_chart_screen/stock_chart_screen.dart'
    as _i18;
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i21;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as _i23;

/// generated route for
/// [_i1.AnalyticsScreen]
class AnalyticsRoute extends _i19.PageRouteInfo<void> {
  const AnalyticsRoute({List<_i19.PageRouteInfo>? children})
    : super(AnalyticsRoute.name, initialChildren: children);

  static const String name = 'AnalyticsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnalyticsScreen();
    },
  );
}

/// generated route for
/// [_i2.AudioBookScreen]
class AudioBookRoute extends _i19.PageRouteInfo<void> {
  const AudioBookRoute({List<_i19.PageRouteInfo>? children})
    : super(AudioBookRoute.name, initialChildren: children);

  static const String name = 'AudioBookRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.AudioBookScreen();
    },
  );
}

/// generated route for
/// [_i3.BookDetailsScreen]
class BookDetailsRoute extends _i19.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i20.Key? key,
    Map<String, dynamic>? bookDetails,
    String? tag,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         BookDetailsRoute.name,
         args: BookDetailsRouteArgs(
           key: key,
           bookDetails: bookDetails,
           tag: tag,
         ),
         initialChildren: children,
       );

  static const String name = 'BookDetailsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailsRouteArgs>(
        orElse: () => const BookDetailsRouteArgs(),
      );
      return _i3.BookDetailsScreen(
        key: args.key,
        bookDetails: args.bookDetails,
        tag: args.tag,
      );
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({this.key, this.bookDetails, this.tag});

  final _i20.Key? key;

  final Map<String, dynamic>? bookDetails;

  final String? tag;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, bookDetails: $bookDetails, tag: $tag}';
  }
}

/// generated route for
/// [_i4.CarouselScreen]
class CarouselRoute extends _i19.PageRouteInfo<void> {
  const CarouselRoute({List<_i19.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i5.EbookScreen]
class EbookRoute extends _i19.PageRouteInfo<void> {
  const EbookRoute({List<_i19.PageRouteInfo>? children})
    : super(EbookRoute.name, initialChildren: children);

  static const String name = 'EbookRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.EbookScreen();
    },
  );
}

/// generated route for
/// [_i6.FilterPage]
class FilterRoute extends _i19.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i20.Key? key,
    required String libraryId,
    required _i21.StateNotifierProviderFamily<
      dynamic,
      _i22.BooksState,
      Map<String, dynamic>?
    >
    stateNotifierProvider,
    required _i21.StateProvider<bool> pageFilterToggleProvider,
    _i21.StateNotifierProvider<
      dynamic,
      _i23.PagingController<int, _i24.BookData>
    >?
    listGridControllerProvider,
    _i21.StateNotifierProvider<
      dynamic,
      _i23.PagingController<int, Map<String, dynamic>>
    >?
    shelfControllerProvider,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return _i6.FilterPage(
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

  final _i20.Key? key;

  final String libraryId;

  final _i21.StateNotifierProviderFamily<
    dynamic,
    _i22.BooksState,
    Map<String, dynamic>?
  >
  stateNotifierProvider;

  final _i21.StateProvider<bool> pageFilterToggleProvider;

  final _i21.StateNotifierProvider<
    dynamic,
    _i23.PagingController<int, _i24.BookData>
  >?
  listGridControllerProvider;

  final _i21.StateNotifierProvider<
    dynamic,
    _i23.PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, libraryId: $libraryId, stateNotifierProvider: $stateNotifierProvider, pageFilterToggleProvider: $pageFilterToggleProvider, listGridControllerProvider: $listGridControllerProvider, shelfControllerProvider: $shelfControllerProvider}';
  }
}

/// generated route for
/// [_i7.GenreScreen]
class GenreRoute extends _i19.PageRouteInfo<void> {
  const GenreRoute({List<_i19.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.GenreScreen();
    },
  );
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeScreen();
    },
  );
}

/// generated route for
/// [_i9.LibScreen]
class LibRoute extends _i19.PageRouteInfo<LibRouteArgs> {
  LibRoute({
    _i20.Key? key,
    _i25.File? imageFile,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         LibRoute.name,
         args: LibRouteArgs(key: key, imageFile: imageFile),
         initialChildren: children,
       );

  static const String name = 'LibRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LibRouteArgs>(
        orElse: () => const LibRouteArgs(),
      );
      return _i9.LibScreen(key: args.key, imageFile: args.imageFile);
    },
  );
}

class LibRouteArgs {
  const LibRouteArgs({this.key, this.imageFile});

  final _i20.Key? key;

  final _i25.File? imageFile;

  @override
  String toString() {
    return 'LibRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [_i10.MainTabViewScreen]
class MainTabViewRoute extends _i19.PageRouteInfo<MainTabViewRouteArgs> {
  MainTabViewRoute({
    _i20.Key? key,
    bool? showAppBar,
    String? title,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainTabViewRouteArgs>(
        orElse: () => const MainTabViewRouteArgs(),
      );
      return _i10.MainTabViewScreen(
        key: args.key,
        showAppBar: args.showAppBar,
        title: args.title,
      );
    },
  );
}

class MainTabViewRouteArgs {
  const MainTabViewRouteArgs({this.key, this.showAppBar, this.title});

  final _i20.Key? key;

  final bool? showAppBar;

  final String? title;

  @override
  String toString() {
    return 'MainTabViewRouteArgs{key: $key, showAppBar: $showAppBar, title: $title}';
  }
}

/// generated route for
/// [_i11.PhysicalBookScreen]
class PhysicalBookRoute extends _i19.PageRouteInfo<void> {
  const PhysicalBookRoute({List<_i19.PageRouteInfo>? children})
    : super(PhysicalBookRoute.name, initialChildren: children);

  static const String name = 'PhysicalBookRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.PhysicalBookScreen();
    },
  );
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i13.ScaleScreen]
class ScaleRoute extends _i19.PageRouteInfo<void> {
  const ScaleRoute({List<_i19.PageRouteInfo>? children})
    : super(ScaleRoute.name, initialChildren: children);

  static const String name = 'ScaleRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.ScaleScreen();
    },
  );
}

/// generated route for
/// [_i14.SetPatternScreen]
class SetPatternRoute extends _i19.PageRouteInfo<void> {
  const SetPatternRoute({List<_i19.PageRouteInfo>? children})
    : super(SetPatternRoute.name, initialChildren: children);

  static const String name = 'SetPatternRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.SetPatternScreen();
    },
  );
}

/// generated route for
/// [_i15.SigninScreen]
class SigninRoute extends _i19.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i20.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i15.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i20.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i16.SignupScreen]
class SignupRoute extends _i19.PageRouteInfo<void> {
  const SignupRoute({List<_i19.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.SignupScreen();
    },
  );
}

/// generated route for
/// [_i17.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.SplashScreen();
    },
  );
}

/// generated route for
/// [_i18.StockChartScreen]
class StockChartRoute extends _i19.PageRouteInfo<void> {
  const StockChartRoute({List<_i19.PageRouteInfo>? children})
    : super(StockChartRoute.name, initialChildren: children);

  static const String name = 'StockChartRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.StockChartScreen();
    },
  );
}
