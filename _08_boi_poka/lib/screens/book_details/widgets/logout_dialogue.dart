import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_snackbar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/pagination_controller_service.dart';
import 'package:_08_boi_poka/controller/secure_storage_controller.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/providers/drawer_selected_index_provider/drawer_selected_index_provider.dart';
import 'package:_08_boi_poka/providers/home_screen_provider/home_screen_notifier.dart';
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

void logoutDialogue(BuildContext context) {
  final paginationControllerService = PaginationControllerService();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          return AlertDialog(
            backgroundColor: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Logout",
                        style: AppTypography.title20PrimaryTextBold,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Are you sure you want to log out?',
                        style: AppTypography.typo12PrimaryTextRegular,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdaptiveButtonWidget(
                      iconImg: AppImages.moreIconHorizontal,
                      disabled: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: "Cancel",
                    ),
                    AdaptiveButtonWidget(
                      iconImg: AppImages.nextIcon,
                      disabled: false,
                      onTap: () async {
                        // final googleController = GoogleLoginController();
                        final googleSignIn = GoogleSignIn();
                        await googleSignIn.signOut();
                        final sharedPref = SharedPrefController();
                        final secureController = SecureStorageController();

                        //* Sign out Google
                        // googleController.googleSignOut();
                        ref.read(selectedIndexHomeProvider.notifier).state = 0;
                        ref.read(drawerSelectedIndexProvider.notifier).state =
                            null;
                        // ref.read(friendUserIdProvider.notifier).state = null;

                        //* Clear storage
                        await secureController.deleteAll();
                        await sharedPref.deleteAll();

                        //Refresh All Controllers
                        paginationControllerService.resetPagingController(ref);

                        print("logout done");
                        //? Show success message
                        customSnackbarMsg(
                          textToShow: "Logout Successful!",
                          durationInMilliseconds: 4000,
                          context: context,
                        );

                        // Navigate to SignIn Screen

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ),
                        );
                      },
                      title: "logout",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
