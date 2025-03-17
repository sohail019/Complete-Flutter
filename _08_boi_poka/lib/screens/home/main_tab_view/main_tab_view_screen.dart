import 'package:_08_boi_poka/components/common_back_bar.dart';
import 'package:_08_boi_poka/components/custom_tabbar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_book_screen.dart';
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_screen.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainTabViewScreen extends StatefulWidget {
  final bool? showAppBar;
  final String? title;
  const MainTabViewScreen({super.key, this.showAppBar, this.title});

  @override
  State<MainTabViewScreen> createState() => _MainTabViewScreenState();
}

class _MainTabViewScreenState extends State<MainTabViewScreen> {
  int selectTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  List<String> tabs = ["all", "physical", "e-books", "audio-books"];
  List<String> items = ["all", "physical", "e-books", "audio-books"];
  List<IconData> icons = [
    FontAwesomeIcons.bookOpen,
    FontAwesomeIcons.book,
    FontAwesomeIcons.bookAtlas,
    FontAwesomeIcons.bookBible,
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar:
            widget.showAppBar ?? false
                ? CommonBackBar(title: widget.title ?? "")
                : PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Container(),
                ),
        backgroundColor: AppColors.secondaryColor,
        body: CustomTabbar(
          tabs: tabs,
          indicatorColor: Colors.black,
          labelColor: Colors.white,
          screens: [
            AllScreen(),
            PhysicalBookScreen(),
            EbookScreen(),
            AudioBookScreen(),
          ],
        ),
      ),
    );
  }
}
