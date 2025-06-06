import 'package:_08_boi_poka/components/common_appbar.dart';
import 'package:_08_boi_poka/components/custom_bottom_nav.dart';
import 'package:_08_boi_poka/components/custom_drawer.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/providers/home_screen_provider/home_screen_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    final screenHeight = MediaQuery.of(context).size.height;

    int selectedIndex = ref.watch(selectedIndexHomeProvider);
    List<Widget> screens = ref.watch(homeScreenTabsProvider);

    return Scaffold(
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
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: screens[selectedIndex], // This shows the selected tab
      ),
      bottomNavigationBar: CustomBottomNav(
        items: [
          {'iconimg': AppImages.libraryBottom, 'label': 'Library'},
          {'iconimg': AppImages.analyticsBottom, 'label': 'Analytics'},
          {'iconimg': AppImages.shareBooks, 'label': 'Stock Chart'},
          {'iconimg': AppImages.booksWorms, 'label': 'BooksWorms'},
        ],
        selectedIndex: selectedIndex,
        onTabSelected: (int index) {
          ref.read(selectedIndexHomeProvider.notifier).state = index;
        },
      ),
    );
  }
}
