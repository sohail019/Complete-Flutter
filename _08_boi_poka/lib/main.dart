import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  // await dotenv.load();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final appRoute = AppRouter();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return PlatformApp.router(
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          routerConfig: appRoute.config(),
          color: AppColors.secondaryColor,
          material: (context, platform) {
            return MaterialAppRouterData(
              color: AppColors.secondaryColor,
              scaffoldMessengerKey: scaffoldMessengerKey,
              theme: ThemeData(
                canvasColor: AppColors.secondaryColor,
                scaffoldBackgroundColor: AppColors.secondaryColor,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AppColors.primaryColor,
                  selectionColor: Colors.black12,
                  selectionHandleColor: AppColors.primaryColor,
                ),
              ),
            );
          },
          builder: (context, widget) {
            return LoaderOverlay(
              overlayWidgetBuilder: (_) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                );
              },
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: MediaQuery.of(
                    context,
                  ).textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2),
                ),
                child: widget!,
              ),
            );
          },
        );
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: SplashScreen(),
//     );
//   }
// }
