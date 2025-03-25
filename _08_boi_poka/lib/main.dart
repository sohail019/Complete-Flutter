import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  await SessionManager.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // If initial route is not loaded yet, show a loading indicator
        // if (_initialRoute == null) {
        //   return const MaterialApp(
        //     home: Scaffold(body: Center(child: CircularProgressIndicator())),
        //   );
        // }

        return PlatformApp.router(
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          routerConfig: _appRouter.config(),
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
