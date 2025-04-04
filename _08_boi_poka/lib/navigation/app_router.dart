import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: TransitionsBuilders.slideRightWithFade,
  );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: CarouselRoute.page, initial: false),
    AutoRoute(page: SignupRoute.page, initial: false),
    AutoRoute(page: SigninRoute.page, initial: false),
    AutoRoute(page: FilterRoute.page, initial: false),
    AutoRoute(page: SetPatternRoute.page, initial: false),
    AutoRoute(page: GenreRoute.page, initial: false),
    AutoRoute(page: ScaleRoute.page, initial: false),
    AutoRoute(page: HomeRoute.page, initial: false),
    AutoRoute(page: AnalyticsRoute.page, initial: false),
    AutoRoute(page: LibRoute.page, initial: false),
    AutoRoute(page: StockChartRoute.page, initial: false),
    AutoRoute(page: ProfileRoute.page, initial: false),
    AutoRoute(page: BookDetailsRoute.page, initial: false),
    AutoRoute(page: AuthConsentRoute.page, initial: false),
    AutoRoute(page: ReferralCodeRoute.page, initial: false),
    AutoRoute(page: OtpRoute.page, initial: false),
    AutoRoute(page: ForgetPasswordRoute.page, initial: false),
    AutoRoute(page: SelectFetchedBooksRoute.page, initial: false),
  ];

  // // Method to asynchronously fetch the initial route
  // Future<String> getInitialRoute() async {
  //   return await SessionManager.getLastScreen() ??
  //       '/splash'; // Default to splash if not available
  // }
}
