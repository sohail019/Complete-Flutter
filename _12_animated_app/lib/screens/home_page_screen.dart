// home_screen.dart
import 'dart:ui';

import 'package:_12_animated_app/components/custom_button.dart';
import 'package:_12_animated_app/widgets/animated_btn.dart';
import 'package:_12_animated_app/widgets/scaffold_with_menu.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
            top: isSignInDialogShown ? -100 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // curve: Curves.easeInOut,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          AnimatedTextKit(
                            repeatForever: true,

                            animatedTexts: [
                              TyperAnimatedText(
                                "Learn Flutter Animations",
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontFamily: "LuckiestGuy",
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 86, 85, 85),
                                ),

                                speed: Duration(milliseconds: 300),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              "Don’t skip design. Learn design and code, by building real apps with real tools.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.5,
                                color: Color.fromARGB(255, 86, 85, 85),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Thank You!",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                255,
                                                86,
                                                85,
                                                85,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          const Text(
                                            "Thanks for clicking the button. Have a great day!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                255,
                                                86,
                                                85,
                                                85,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: const Text("Close"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            text: "Click Me",
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
