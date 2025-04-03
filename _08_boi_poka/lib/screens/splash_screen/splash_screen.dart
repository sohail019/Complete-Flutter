import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart';
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget selectedScreen = Container();

  String? _initialRoute;

  @override
  void initState() {
    super.initState();
    _loadInitialRoute();
    // _navigateToNextScreen();
  }

  Future<void> _loadInitialRoute() async {
    String? lastScreen = await SessionManager.getLastScreen();
    setState(() {
      _initialRoute = lastScreen;
      switch (lastScreen) {
        case "/carousel":
          selectedScreen = CarouselScreen();
          break;
        case "/signup":
          selectedScreen = SignupScreen();
          break;
      }
    });
  }

  // // Function to handle navigation directly based on session
  // void _navigateToNextScreen() async {
  //   // Save the current screen to session before navigating
  //   await SessionManager.saveLastScreen('/splash');

  //   // Navigate to the next screen
  //   context.pushRoute(CarouselRoute()); // Or another route as needed
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 60,
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.boiPokaTitle,
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            context.pushRoute(CarouselRoute());
                            // context.pushRoute(StockChartRoute());
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Go to Carousel Screen'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.pokaGif, height: 250, width: 349),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
