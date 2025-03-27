import 'package:_08_boi_poka/components/common_back_bar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/providers/drawer_selected_index_provider/drawer_selected_index_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  String? fullName, profileUrl, email, mobileNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var profileImageSizeWidth = 96.w;
    final profileImageBorderRadius = 10.r;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(drawerSelectedIndexProvider.notifier).state = null;
      },
      child: Scaffold(
        appBar:
            isTablet
                ? PreferredSize(
                  preferredSize: Size.fromHeight(0.1.sh),
                  child: CommonBackBar(title: '$fullName'),
                )
                : CommonBackBar(title: '$fullName'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw, vertical: 0.03.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(profileImageBorderRadius),
                child:
                    (profileUrl != null && profileUrl!.isNotEmpty)
                        ? Image.network(
                          profileUrl!,
                          width: profileImageSizeWidth,
                          height: profileImageSizeWidth,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Text("No Image"));
                          },
                        )
                        : Container(
                          width: profileImageSizeWidth,
                          height: profileImageSizeWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Icon(Icons.person_2, size: 50.w),
                        ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text('name :', style: AppTypography.typo12PrimaryTextRegular),
                  SizedBox(width: 5.w),
                  Text(
                    '$fullName',
                    style: AppTypography.title12Height15PrimaryTextBold,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    'email :',
                    style: AppTypography.typo12PrimaryTextRegular,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '$email',
                    style: AppTypography.title12Height15PrimaryTextBold,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(
                    'mobile number :',
                    style: AppTypography.typo12PrimaryTextRegular,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '$mobileNumber',
                    style: AppTypography.title12Height15PrimaryTextBold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeProfileData() async {
    final sharedPref = SharedPrefController();
    fullName = await sharedPref.getData("name");
    email = await sharedPref.getData("email");
    profileUrl = await sharedPref.getData("profileUrl");
    mobileNumber = await sharedPref.getData("mobile");
    setState(() {});
  }
}
