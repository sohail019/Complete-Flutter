import 'package:_08_boi_poka/components/common_appbar.dart';
import 'package:_08_boi_poka/components/custom_bottom_nav.dart';
import 'package:_08_boi_poka/components/custom_drawer.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart';
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenHeight = MediaQuery.of(context).size.height;
    // int selectedIndex = ref.watch(selectedIndexHomeProvider);
    // List<Widget> screens = ref.watch(homeScreenTabsProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {},
      child: Scaffold(
        key: scaffoldKey,
        appBar:
            isTablet
                ? PreferredSize(
                  preferredSize: Size.fromHeight(screenHeight * 0.1),
                  child: CommonAppbar(
                    drawerFunction: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                )
                : CommonAppbar(
                  drawerFunction: () => scaffoldKey.currentState?.openDrawer(),
                ),
        drawer: CustomDrawer(),
        backgroundColor: AppColors.secondaryColor,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Center(child: Text("Home Screen")),
        ),
        bottomNavigationBar: CustomBottomNav(
          items: [
            {'iconimg': AppImages.libraryBottom, 'label': 'Library'},
            {'iconimg': AppImages.analyticsBottom, 'label': 'Analytics'},
            {'iconimg': AppImages.shareBooks, 'label': 'Share books'},
            {'iconimg': AppImages.booksWorms, 'label': 'BooksWorms'},
          ],
          selectedIndex: 0,
          onTabSelected: (int index) {},
        ),
      ),
    );
  }
}
