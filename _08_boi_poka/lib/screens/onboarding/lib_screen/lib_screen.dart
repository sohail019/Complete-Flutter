import 'dart:io';

import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/common_appbar.dart';
import 'package:_08_boi_poka/components/custom_drawer.dart';
import 'package:_08_boi_poka/components/custom_image_preview_dailog_widget.dart';
import 'package:_08_boi_poka/components/custom_snackbar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/ocr_controller.dart';
import 'package:_08_boi_poka/core/utils/camera_utils.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/models/ocr_book_model.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/onboarding/lib_screen/data/lib_images.dart';
import 'package:_08_boi_poka/screens/onboarding/lib_screen/widget/library_card_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class LibScreen extends ConsumerStatefulWidget {
  final File? imageFile;
  const LibScreen({super.key, this.imageFile});

  @override
  ConsumerState<LibScreen> createState() => _LibScreenState();
}

class _LibScreenState extends ConsumerState<LibScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final CameraUtils cameraUtils = CameraUtils();
  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child:
            isTablet
                ? PreferredSize(
                  preferredSize: Size.fromHeight(50.h),
                  child: CommonAppbar(
                    drawerFunction:
                        () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                )
                : CommonAppbar(
                  drawerFunction: () => _scaffoldKey.currentState?.openDrawer(),
                ),
      ),
      drawer: CustomDrawer(),
      body: SizedBox(
        height: 1.0.sh,
        child: Stack(
          children: [
            Positioned(
              width: 80.w,
              height: 100.h,
              right: 0,
              bottom: 0,
              child: Image.asset(
                AppImages.pokaLeftFacing,
                width: 0.3.sw,
                height: 0.3.sh,
                fit: BoxFit.contain,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "create your library",
                            style: AppTypography.title40PrimaryTextBold,
                          ),
                          SizedBox(height: 35.h),
                          Text(
                            "photos of your library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () async {
                                  File? selectedFile;
                                  selectedFile = await cameraUtils.pickFile();

                                  if (selectedFile != null) {
                                    showGeneralDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      transitionDuration: const Duration(
                                        microseconds: 650,
                                      ),
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => FadeTransition(
                                            opacity: CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            ),
                                            child: ScaleTransition(
                                              scale: Tween<double>(
                                                begin: 0.8,
                                                end: 1.0,
                                              ).animate(
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.slowMiddle,
                                                ),
                                              ),
                                              child: CustomImagePreviewDailogWidget(
                                                imageUrl: null,
                                                uploadedFilePath: selectedFile!,
                                                onPress: () async {
                                                  try {
                                                    String loadingText =
                                                        "Loading..";
                                                    Future.delayed(
                                                      Duration(
                                                        milliseconds: 5000,
                                                      ),
                                                      () {
                                                        loadingText =
                                                            "Analyzing Image...";
                                                        context.loaderOverlay
                                                            .hide();
                                                        context.loaderOverlay.show(
                                                          widgetBuilder:
                                                              (
                                                                progress,
                                                              ) => Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        3,
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                          Color
                                                                        >(
                                                                          AppColors
                                                                              .primaryColor,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    loadingText,
                                                                    style:
                                                                        AppTypography
                                                                            .typo12PrimaryTextBold,
                                                                  ),
                                                                ],
                                                              ),
                                                        );
                                                        setState(() {});
                                                      },
                                                    );
                                                    final ocrController =
                                                        OcrController();
                                                    OcrBookModel ocrModal =
                                                        await ocrController
                                                            .getImageData(
                                                              selectedFile!,
                                                              context,
                                                            );

                                                    if (ocrModal
                                                        .data!
                                                        .isNotEmpty) {
                                                      context.loaderOverlay
                                                          .hide();
                                                      customSnackbarMsg(
                                                        textToShow:
                                                            "Image Scanning Success",
                                                        durationInMilliseconds:
                                                            2000,
                                                        backgroundColor:
                                                            Colors.green,
                                                        context: context,
                                                      );
                                                      context.pushRoute(
                                                        PageRouteInfo(
                                                          AppRoutes
                                                              .selectFetchedBooksScreen,
                                                          args: SelectFetchedBooksRouteArgs(
                                                            isCreatingLibrary:
                                                                true,
                                                            imageFile:
                                                                selectedFile,
                                                            ref: ref,
                                                            libraryName: "",
                                                            bookOcrModel:
                                                                ocrModal,
                                                            isOnboarded: true,
                                                          ),
                                                        ),
                                                      );
                                                      Navigator.pop(context);
                                                    } else {
                                                      customSnackbarMsg(
                                                        textToShow:
                                                            "Image upload failed please try again",
                                                        durationInMilliseconds:
                                                            2000,
                                                        backgroundColor:
                                                            Colors.red,
                                                        context: context,
                                                      );
                                                    }
                                                  } catch (e) {
                                                    customSnackbarMsg(
                                                      textToShow:
                                                          "Image upload failed please try again",
                                                      durationInMilliseconds:
                                                          2000,
                                                      backgroundColor:
                                                          Colors.red,
                                                      context: context,
                                                    );
                                                    Navigator.pop(context);
                                                    context.loaderOverlay
                                                        .hide();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                    );
                                  }
                                },
                                libicon: LibImages.uploadFromPhone,
                                text: "upload from phone",
                              ),

                              SizedBox(width: 4.w),
                              LibraryCardWidget(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  final XFile? xSelectedFile = await picker
                                      .pickImage(source: ImageSource.camera);
                                  if (xSelectedFile != null) {
                                    File selectedFile = File(
                                      xSelectedFile.path,
                                    );
                                    showGeneralDialog(
                                      context: context,
                                      transitionDuration: const Duration(
                                        milliseconds: 650,
                                      ),
                                      barrierDismissible: false,
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => FadeTransition(
                                            opacity: CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            ),
                                            child: ScaleTransition(
                                              scale: Tween<double>(
                                                begin: 0.8,
                                                end: 1.0,
                                              ).animate(
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.slowMiddle,
                                                ),
                                              ),
                                              child: CustomImagePreviewDailogWidget(
                                                imageUrl: null,
                                                uploadedFilePath: selectedFile,
                                                onPress: () async {
                                                  try {
                                                    context.loaderOverlay
                                                        .show();
                                                    final ocrController =
                                                        OcrController();
                                                    OcrBookModel ocrModal =
                                                        await ocrController
                                                            .getImageData(
                                                              selectedFile,
                                                              context,
                                                            );

                                                    if (ocrModal
                                                        .data!
                                                        .isNotEmpty) {
                                                      context.loaderOverlay
                                                          .hide();
                                                      customSnackbarMsg(
                                                        textToShow:
                                                            "Image Scanning Success",
                                                        durationInMilliseconds:
                                                            2000,
                                                        backgroundColor:
                                                            Colors.green,
                                                        context: context,
                                                      );
                                                      context.pushRoute(
                                                        PageRouteInfo(
                                                          AppRoutes
                                                              .selectFetchedBooksScreen,
                                                          args: SelectFetchedBooksRouteArgs(
                                                            ref: ref,
                                                            isCreatingLibrary:
                                                                true,
                                                            imageFile:
                                                                selectedFile,
                                                            libraryName: "",
                                                            bookOcrModel:
                                                                ocrModal,
                                                            isOnboarded: true,
                                                          ),
                                                        ),
                                                      );
                                                      Navigator.pop(context);
                                                    } else {
                                                      customSnackbarMsg(
                                                        textToShow:
                                                            "Image upload failed please try again",
                                                        durationInMilliseconds:
                                                            2000,
                                                        backgroundColor:
                                                            Colors.red,
                                                        context: context,
                                                      );
                                                    }
                                                  } catch (e) {
                                                    customSnackbarMsg(
                                                      textToShow:
                                                          "Image upload failed please try again",
                                                      durationInMilliseconds:
                                                          2000,
                                                      backgroundColor:
                                                          Colors.red,
                                                      context: context,
                                                    );
                                                    print('ApiResponse-Error');
                                                    Navigator.pop(context);
                                                    context.loaderOverlay
                                                        .hide();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                    );
                                  }
                                },
                                libicon: LibImages.openPhoneCamera,
                                text: "open phone camera",
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            "your book library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.amazonKindle,
                                text: "connect with kindle",
                              ),
                              SizedBox(width: 8.w),
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.eBookLibrary,
                                text: "any other e-book library",
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            "your audio book library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.audible,
                                text: "connect with audible",
                              ),
                              SizedBox(width: 8.w),
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.audioLibrary,
                                text: "any other audio library",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 34.w,
                        vertical: 20.h,
                      ),
                      child: AdaptiveButtonWidget(
                        disabled: false,
                        onTap: () async {
                          //? select genre logic will come here
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HomeScreen(),
                          //   ),
                          // );
                          await SessionManager.saveLastScreen('/home');
                          context.pushRoute(HomeRoute());
                        },
                        title: "next",
                        iconImg: AppImages.nextIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
