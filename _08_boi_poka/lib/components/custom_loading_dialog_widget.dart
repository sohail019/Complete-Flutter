import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:flutter/material.dart';

void customLoadingDialogWidget(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false, // Prevent closing the dialog by tapping outside
    transitionDuration: const Duration(milliseconds: 650),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.slowMiddle),
          ),
          child: Dialog(
            shape: BeveledRectangleBorder(),
            clipBehavior: Clip.none,
            insetPadding: EdgeInsets.all(0),
            backgroundColor:
                AppColors.loaderBackgroundColor, // Transparent background
            elevation: 0,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
