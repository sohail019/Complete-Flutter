import 'package:_08_boi_poka/screens/home/physical_book_screen/toggle_physical_view_provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AudioBookScreen extends ConsumerWidget {
  const AudioBookScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final selectedTab = ref.watch(togglePhysicalViewProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Text('Audio Book Screen'),
    );
  }
}
