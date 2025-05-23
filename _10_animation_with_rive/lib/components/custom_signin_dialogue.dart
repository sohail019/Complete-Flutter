import 'package:_10_animation_with_rive/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Object?> customSignInDialog(
  BuildContext context, {
  required ValueChanged onClosed,
}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      final tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder:
        (context, _, __) => Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.9,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: LayoutBuilder(
                        builder:
                            (context, constraints) => SingleChildScrollView(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: IntrinsicHeight(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 5,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          onClosed.call(null);
                                        },
                                        child: const CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 16),
                                        const Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontSize: 34,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 16,
                                          ),
                                          child: Text(
                                            "Access to 30+ courses and 100+ hours of content",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Poppins",
                                              height: 1.5,
                                              color: Color.fromARGB(
                                                255,
                                                86,
                                                85,
                                                85,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SignInForm(),
                                        Row(
                                          children: const [
                                            Expanded(child: Divider()),
                                            Text(
                                              "OR",
                                              style: TextStyle(
                                                color: Colors.black26,
                                              ),
                                            ),
                                            Expanded(child: Divider()),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 20,
                                          ),
                                          child: Text(
                                            "Sign up with Email, Apple or Google",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              height: 1.5,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                "assets/icons/email_box.svg",
                                                height: 64,
                                                width: 64,
                                              ),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                "assets/icons/apple_box.svg",
                                                height: 64,
                                                width: 64,
                                              ),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                "assets/icons/google_box.svg",
                                                height: 64,
                                                width: 64,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
  );
}
