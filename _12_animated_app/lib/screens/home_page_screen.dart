// home_screen.dart
import 'dart:ui';

import 'package:_12_animated_app/widgets/animated_btn.dart';
import 'package:_12_animated_app/widgets/scaffold_with_menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSignInDialogShown = false;
  late rive.RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _btnAnimationController = rive.OneShotAnimation("active", autoplay: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithMenu(
      title: 'Home',
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 200,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),
          const rive.RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          // Add blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),

          //? Add the text
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // curve: Curves.easeInOut,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 60,

                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with real tools.",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              height: 1.5,
                              color: Color.fromARGB(255, 86, 85, 85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Purchase includes access to 30+ courses, 100+ hours of content, and 20+ projects.",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          height: 1.5,
                          color: const Color.fromARGB(255, 86, 85, 85),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
