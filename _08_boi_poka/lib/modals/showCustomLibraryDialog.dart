import 'package:_08_boi_poka/components/custom_library_dailog_widget.dart';
import 'package:flutter/material.dart';

void showCustomLibraryDialog(
  BuildContext context,
  String type,
  Function(BuildContext context, String libraryName, String libraryId) onSubmit,
  bool isCreatingNew,
) {
  showGeneralDialog(
    barrierDismissible: false, // Prevent closing the dialog by tapping outside
    context: context,
    transitionDuration: const Duration(milliseconds: 650),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.slowMiddle),
          ),
          child: CustomLibraryDialogWidget(
            isCreatingNew: isCreatingNew,
            type: type,
            onSubmit:
                (libraryName, libraryId) => onSubmit(
                  context = context,
                  libraryName = libraryName,
                  libraryId = libraryId,
                ),
          ),
        ),
      );
    },
  );
}
