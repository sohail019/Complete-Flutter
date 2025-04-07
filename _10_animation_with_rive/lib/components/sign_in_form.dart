import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;
  bool _obscureText = true;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  String _email = '';
  String _password = '';

  StateMachineController getRiveController(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
    );
    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) async {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });

    if (!_formKey.currentState!.validate()) {
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isShowLoading = false;
        });
      });
      return;
    }

    _formKey.currentState!.save();

    final payload = jsonEncode({"email": _email, "password": _password});

    try {
      final response = await http.post(
        Uri.parse(
          "https://flutter-animation-sever.onrender.com/register",
        ), // Changed endpoint
        headers: {"Content-Type": "application/json"},
        body: payload,
      );

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
            isShowConfetti = false;
          });

          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              isShowConfetti = true;
            });
            confetti.fire();

            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: "Success Dialog",
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green),
                        const SizedBox(width: 8),
                        const Text("Success"),
                      ],
                    ),
                    content: const Text(
                      "Thanks for signing in. I am developing further screens, stay tuned!",
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // success dialog
                          Navigator.of(context).pop(); // sign in dialog
                          setState(() {
                            isShowConfetti = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFF77D8E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              transitionBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          });
        });
      } else {
        // Show error if credentials are wrong or user not found
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    } catch (e) {
      // Exception like network error
      debugPrint("Exception: $e");
      error.fire();
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isShowLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  onSaved: (email) {
                    _email = email ?? '';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text("Password", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onSaved: (password) {
                    _password = password ?? '';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isShowLoading)
          CustomPositioned(
            child: RiveAnimation.asset(
              "assets/RiveAssets/check.riv",
              onInit: (artboard) {
                final controller = getRiveController(artboard);
                check = controller.findSMI("Check") as SMITrigger;
                error = controller.findSMI("Error") as SMITrigger;
                reset = controller.findSMI("Reset") as SMITrigger;
              },
            ),
          ),
        if (isShowConfetti)
          CustomPositioned(
            child: Transform.scale(
              scale: 7,
              child: RiveAnimation.asset(
                "assets/RiveAssets/confetti.riv",
                onInit: (artboard) {
                  final controller = getRiveController(artboard);
                  confetti =
                      controller.findSMI("Trigger explosion") as SMITrigger;
                },
              ),
            ),
          ),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(height: size, width: size, child: child),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
