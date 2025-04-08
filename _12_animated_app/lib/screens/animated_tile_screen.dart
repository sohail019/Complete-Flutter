import 'package:_12_animated_app/widgets/scaffold_with_menu.dart';
import 'package:flutter/material.dart';
import 'package:_12_animated_app/widgets/animated_card_tile.dart';

class AnimatedTileScreen extends StatefulWidget {
  const AnimatedTileScreen({super.key});

  @override
  State<AnimatedTileScreen> createState() => _AnimatedTileScreenState();
}

class _AnimatedTileScreenState extends State<AnimatedTileScreen> {
  final ScrollController _scrollController = ScrollController();
  final int itemCount = 10;
  final List<bool> _visibleStates = List.generate(10, (_) => false);
  final double itemHeightFactor = 0.4;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    // Show first 2 cards after first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _visibleStates[0] = true;
        _visibleStates[1] = true;
        _visibleStates[2] = true;
      });

      Future.delayed(const Duration(milliseconds: 50), () {
        _scrollController.jumpTo(0.1);
        _scrollController.jumpTo(0.0);
      });
    });
  }

  void _onScroll() {
    final screenHeight = MediaQuery.of(context).size.height;
    final itemHeight = screenHeight * itemHeightFactor;
    final scrollOffset = _scrollController.offset;
    final currentIndex = (scrollOffset / (itemHeight / 2)).floor();

    setState(() {
      // Always keep first 2 cards visible
      _visibleStates[0] = true;
      _visibleStates[1] = true;
      _visibleStates[2] = true;

      // Show cards that have scrolled into view
      for (int i = 3; i <= currentIndex && i < itemCount; i++) {
        _visibleStates[i] = true;
      }

      // Hide cards when scrolling back up — only from bottom
      for (int i = itemCount - 1; i > currentIndex + 1; i--) {
        if (i > 1 && _visibleStates[i]) {
          _visibleStates[i] = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithMenu(
      title: 'Animated Cards',
      body: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * itemHeightFactor,
            child: AnimatedCardTile(
              title: 'Item ${index + 1}',
              subtitle: 'Subtitle or description here ${index + 1}',
              isVisible: _visibleStates[index],
              color: Colors.primaries[index % Colors.primaries.length].shade300,
              animationDelay:
                  index < 2
                      ? Duration.zero
                      : Duration(milliseconds: index * 200),
              index: index,
            ),
          );
        },
      ),
    );
  }
}
