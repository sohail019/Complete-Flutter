// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i30;

import 'package:_08_boi_poka/models/book_state.dart' as _i27;
import 'package:_08_boi_poka/models/get_all_books_model.dart' as _i29;
import 'package:_08_boi_poka/models/ocr_book_model.dart' as _i31;
import 'package:_08_boi_poka/screens/analytics_screen/analytics_screen.dart'
    as _i1;
import 'package:_08_boi_poka/screens/auth/auth_consent_screen/auth_consent_screen.dart'
    as _i3;
import 'package:_08_boi_poka/screens/auth/otp_screen/otp_screen.dart' as _i13;
import 'package:_08_boi_poka/screens/auth/referral_code/referral_code_screen.dart'
    as _i16;
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart'
    as _i20;
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart'
    as _i21;
import 'package:_08_boi_poka/screens/book_details/book_details_screen.dart'
    as _i4;
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart'
    as _i5;
import 'package:_08_boi_poka/screens/forget_password_screen/forget_password_screen.dart'
    as _i8;
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_book_screen.dart'
    as _i2;
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_screen.dart'
    as _i6;
import 'package:_08_boi_poka/screens/home/filter_page/filter_page.dart' as _i7;
import 'package:_08_boi_poka/screens/home/home_screen.dart' as _i10;
import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart'
    as _i12;
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_book_screen.dart'
    as _i14;
import 'package:_08_boi_poka/screens/onboarding/genre_screen/genre_screen.dart'
    as _i9;
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart'
    as _i11;
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart'
    as _i17;
import 'package:_08_boi_poka/screens/onboarding/select_fetched_books/select_fetched_books_screen.dart'
    as _i18;
import 'package:_08_boi_poka/screens/profile_screen/profile_screen.dart'
    as _i15;
import 'package:_08_boi_poka/screens/set_pattern_screen/set_pattern_screen.dart'
    as _i19;
import 'package:_08_boi_poka/screens/splash_screen/splash_screen.dart' as _i22;
import 'package:_08_boi_poka/screens/stock_chart_screen/stock_chart_screen.dart'
    as _i23;
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i26;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as _i28;

/// generated route for
/// [_i1.AnalyticsScreen]
class AnalyticsRoute extends _i24.PageRouteInfo<void> {
  const AnalyticsRoute({List<_i24.PageRouteInfo>? children})
    : super(AnalyticsRoute.name, initialChildren: children);

  static const String name = 'AnalyticsRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnalyticsScreen();
    },
  );
}

/// generated route for
/// [_i2.AudioBookScreen]
class AudioBookRoute extends _i24.PageRouteInfo<void> {
  const AudioBookRoute({List<_i24.PageRouteInfo>? children})
    : super(AudioBookRoute.name, initialChildren: children);

  static const String name = 'AudioBookRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.AudioBookScreen();
    },
  );
}

/// generated route for
/// [_i3.AuthConsentScreen]
class AuthConsentRoute extends _i24.PageRouteInfo<void> {
  const AuthConsentRoute({List<_i24.PageRouteInfo>? children})
    : super(AuthConsentRoute.name, initialChildren: children);

  static const String name = 'AuthConsentRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i3.AuthConsentScreen();
    },
  );
}

/// generated route for
/// [_i4.BookDetailsScreen]
class BookDetailsRoute extends _i24.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i25.Key? key,
    Map<String, dynamic>? bookDetails,
    String? tag,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailsRouteArgs>(
        orElse: () => const BookDetailsRouteArgs(),
      );
      return _i4.BookDetailsScreen(
        key: args.key,
        bookDetails: args.bookDetails,
        tag: args.tag,
      );
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({this.key, this.bookDetails, this.tag});

  final _i25.Key? key;

  final Map<String, dynamic>? bookDetails;

  final String? tag;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, bookDetails: $bookDetails, tag: $tag}';
  }
}

/// generated route for
/// [_i5.CarouselScreen]
class CarouselRoute extends _i24.PageRouteInfo<void> {
  const CarouselRoute({List<_i24.PageRouteInfo>? children})
    : super(CarouselRoute.name, initialChildren: children);

  static const String name = 'CarouselRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i5.CarouselScreen();
    },
  );
}

/// generated route for
/// [_i6.EbookScreen]
class EbookRoute extends _i24.PageRouteInfo<void> {
  const EbookRoute({List<_i24.PageRouteInfo>? children})
    : super(EbookRoute.name, initialChildren: children);

  static const String name = 'EbookRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i6.EbookScreen();
    },
  );
}

/// generated route for
/// [_i7.FilterPage]
class FilterRoute extends _i24.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i25.Key? key,
    required String libraryId,
    required _i26.StateNotifierProviderFamily<
      dynamic,
      _i27.BooksState,
      Map<String, dynamic>?
    >
    stateNotifierProvider,
    required _i26.StateProvider<bool> pageFilterToggleProvider,
    _i26.StateNotifierProvider<
      dynamic,
      _i28.PagingController<int, _i29.BookData>
    >?
    listGridControllerProvider,
    _i26.StateNotifierProvider<
      dynamic,
      _i28.PagingController<int, Map<String, dynamic>>
    >?
    shelfControllerProvider,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return _i7.FilterPage(
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

  final _i25.Key? key;

  final String libraryId;

  final _i26.StateNotifierProviderFamily<
    dynamic,
    _i27.BooksState,
    Map<String, dynamic>?
  >
  stateNotifierProvider;

  final _i26.StateProvider<bool> pageFilterToggleProvider;

  final _i26.StateNotifierProvider<
    dynamic,
    _i28.PagingController<int, _i29.BookData>
  >?
  listGridControllerProvider;

  final _i26.StateNotifierProvider<
    dynamic,
    _i28.PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, libraryId: $libraryId, stateNotifierProvider: $stateNotifierProvider, pageFilterToggleProvider: $pageFilterToggleProvider, listGridControllerProvider: $listGridControllerProvider, shelfControllerProvider: $shelfControllerProvider}';
  }
}

/// generated route for
/// [_i8.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i24.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i24.PageRouteInfo>? children})
    : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i8.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i9.GenreScreen]
class GenreRoute extends _i24.PageRouteInfo<void> {
  const GenreRoute({List<_i24.PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i9.GenreScreen();
    },
  );
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i10.HomeScreen();
    },
  );
}

/// generated route for
/// [_i11.LibScreen]
class LibRoute extends _i24.PageRouteInfo<LibRouteArgs> {
  LibRoute({
    _i25.Key? key,
    _i30.File? imageFile,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         LibRoute.name,
         args: LibRouteArgs(key: key, imageFile: imageFile),
         initialChildren: children,
       );

  static const String name = 'LibRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LibRouteArgs>(
        orElse: () => const LibRouteArgs(),
      );
      return _i11.LibScreen(key: args.key, imageFile: args.imageFile);
    },
  );
}

class LibRouteArgs {
  const LibRouteArgs({this.key, this.imageFile});

  final _i25.Key? key;

  final _i30.File? imageFile;

  @override
  String toString() {
    return 'LibRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [_i12.MainTabViewScreen]
class MainTabViewRoute extends _i24.PageRouteInfo<MainTabViewRouteArgs> {
  MainTabViewRoute({
    _i25.Key? key,
    bool? showAppBar,
    String? title,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainTabViewRouteArgs>(
        orElse: () => const MainTabViewRouteArgs(),
      );
      return _i12.MainTabViewScreen(
        key: args.key,
        showAppBar: args.showAppBar,
        title: args.title,
      );
    },
  );
}

class MainTabViewRouteArgs {
  const MainTabViewRouteArgs({this.key, this.showAppBar, this.title});

  final _i25.Key? key;

  final bool? showAppBar;

  final String? title;

  @override
  String toString() {
    return 'MainTabViewRouteArgs{key: $key, showAppBar: $showAppBar, title: $title}';
  }
}

/// generated route for
/// [_i13.OtpScreen]
class OtpRoute extends _i24.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i25.Key? key,
    required String phoneNum,
    bool isPhoneNumAuthentication = false,
    required String otpType,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(
           key: key,
           phoneNum: phoneNum,
           isPhoneNumAuthentication: isPhoneNumAuthentication,
           otpType: otpType,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i13.OtpScreen(
        key: args.key,
        phoneNum: args.phoneNum,
        isPhoneNumAuthentication: args.isPhoneNumAuthentication,
        otpType: args.otpType,
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNum,
    this.isPhoneNumAuthentication = false,
    required this.otpType,
  });

  final _i25.Key? key;

  final String phoneNum;

  final bool isPhoneNumAuthentication;

  final String otpType;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNum: $phoneNum, isPhoneNumAuthentication: $isPhoneNumAuthentication, otpType: $otpType}';
  }
}

/// generated route for
/// [_i14.PhysicalBookScreen]
class PhysicalBookRoute extends _i24.PageRouteInfo<void> {
  const PhysicalBookRoute({List<_i24.PageRouteInfo>? children})
    : super(PhysicalBookRoute.name, initialChildren: children);

  static const String name = 'PhysicalBookRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.PhysicalBookScreen();
    },
  );
}

/// generated route for
/// [_i15.ProfileScreen]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i16.ReferralCodeScreen]
class ReferralCodeRoute extends _i24.PageRouteInfo<void> {
  const ReferralCodeRoute({List<_i24.PageRouteInfo>? children})
    : super(ReferralCodeRoute.name, initialChildren: children);

  static const String name = 'ReferralCodeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i16.ReferralCodeScreen();
    },
  );
}

/// generated route for
/// [_i17.ScaleScreen]
class ScaleRoute extends _i24.PageRouteInfo<ScaleRouteArgs> {
  ScaleRoute({
    _i25.Key? key,
    required List<String> selectedGenre,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ScaleRoute.name,
         args: ScaleRouteArgs(key: key, selectedGenre: selectedGenre),
         initialChildren: children,
       );

  static const String name = 'ScaleRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScaleRouteArgs>();
      return _i17.ScaleScreen(key: args.key, selectedGenre: args.selectedGenre);
    },
  );
}

class ScaleRouteArgs {
  const ScaleRouteArgs({this.key, required this.selectedGenre});

  final _i25.Key? key;

  final List<String> selectedGenre;

  @override
  String toString() {
    return 'ScaleRouteArgs{key: $key, selectedGenre: $selectedGenre}';
  }
}

/// generated route for
/// [_i18.SelectFetchedBooksScreen]
class SelectFetchedBooksRoute
    extends _i24.PageRouteInfo<SelectFetchedBooksRouteArgs> {
  SelectFetchedBooksRoute({
    _i26.WidgetRef? ref,
    required bool isCreatingLibrary,
    _i30.File? imageFile,
    required String libraryName,
    required bool isOnboarded,
    required _i31.OcrBookModel bookOcrModel,
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         SelectFetchedBooksRoute.name,
         args: SelectFetchedBooksRouteArgs(
           ref: ref,
           isCreatingLibrary: isCreatingLibrary,
           imageFile: imageFile,
           libraryName: libraryName,
           isOnboarded: isOnboarded,
           bookOcrModel: bookOcrModel,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectFetchedBooksRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectFetchedBooksRouteArgs>();
      return _i18.SelectFetchedBooksScreen(
        ref: args.ref,
        isCreatingLibrary: args.isCreatingLibrary,
        imageFile: args.imageFile,
        libraryName: args.libraryName,
        isOnboarded: args.isOnboarded,
        bookOcrModel: args.bookOcrModel,
        key: args.key,
      );
    },
  );
}

class SelectFetchedBooksRouteArgs {
  const SelectFetchedBooksRouteArgs({
    this.ref,
    required this.isCreatingLibrary,
    this.imageFile,
    required this.libraryName,
    required this.isOnboarded,
    required this.bookOcrModel,
    this.key,
  });

  final _i26.WidgetRef? ref;

  final bool isCreatingLibrary;

  final _i30.File? imageFile;

  final String libraryName;

  final bool isOnboarded;

  final _i31.OcrBookModel bookOcrModel;

  final _i25.Key? key;

  @override
  String toString() {
    return 'SelectFetchedBooksRouteArgs{ref: $ref, isCreatingLibrary: $isCreatingLibrary, imageFile: $imageFile, libraryName: $libraryName, isOnboarded: $isOnboarded, bookOcrModel: $bookOcrModel, key: $key}';
  }
}

/// generated route for
/// [_i19.SetPatternScreen]
class SetPatternRoute extends _i24.PageRouteInfo<void> {
  const SetPatternRoute({List<_i24.PageRouteInfo>? children})
    : super(SetPatternRoute.name, initialChildren: children);

  static const String name = 'SetPatternRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i19.SetPatternScreen();
    },
  );
}

/// generated route for
/// [_i20.SigninScreen]
class SigninRoute extends _i24.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i25.Key? key,
    String? errorMessage,
    bool isLogout = false,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SigninRouteArgs>(
        orElse: () => const SigninRouteArgs(),
      );
      return _i20.SigninScreen(
        key: args.key,
        errorMessage: args.errorMessage,
        isLogout: args.isLogout,
      );
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key, this.errorMessage, this.isLogout = false});

  final _i25.Key? key;

  final String? errorMessage;

  final bool isLogout;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key, errorMessage: $errorMessage, isLogout: $isLogout}';
  }
}

/// generated route for
/// [_i21.SignupScreen]
class SignupRoute extends _i24.PageRouteInfo<void> {
  const SignupRoute({List<_i24.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i21.SignupScreen();
    },
  );
}

/// generated route for
/// [_i22.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.SplashScreen();
    },
  );
}

/// generated route for
/// [_i23.StockChartScreen]
class StockChartRoute extends _i24.PageRouteInfo<void> {
  const StockChartRoute({List<_i24.PageRouteInfo>? children})
    : super(StockChartRoute.name, initialChildren: children);

  static const String name = 'StockChartRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i23.StockChartScreen();
    },
  );
}
