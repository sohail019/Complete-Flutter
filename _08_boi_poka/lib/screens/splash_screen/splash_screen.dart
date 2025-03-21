import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/screens/analytics_screen/analytics_screen.dart';
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart';
import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarouselScreen(),
                                // builder: (context) => AnalyticsScreen(),
                              ),
                            );
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
