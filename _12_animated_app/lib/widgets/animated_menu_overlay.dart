import 'package:_12_animated_app/screens/goals_screen.dart';
import 'package:flutter/material.dart';
import '../screens/animated_tile_screen.dart';
import '../screens/home_page_screen.dart';
import '../screens/profile_screen.dart';
import 'menu_item_tile.dart';

class MenuOverlay extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onClose;
  final List<Map<String, dynamic>> items;

  const MenuOverlay({
    super.key,
    required this.isOpen,
    required this.onClose,
    required this.items,
  });

  @override
  State<MenuOverlay> createState() => _MenuOverlayState();
}

class _MenuOverlayState extends State<MenuOverlay>
    with TickerProviderStateMixin {
  late AnimationController _topController;
  late AnimationController _bottomController;
  bool _showItems = false;

  @override
  void initState() {
    super.initState();

    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(covariant MenuOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen) {
      _topController.forward();
      _bottomController.forward().then((_) {
        if (mounted) {
          setState(() {
            _showItems = true;
          });
        }
      });
    } else {
      if (mounted) {
        setState(() {
          _showItems = false;
        });
      }

      Future.wait([_topController.reverse(), _bottomController.reverse()]).then(
        (_) {
          if (mounted) {
            setState(() {});
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _topController.dispose();
    _bottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isOpen && _topController.value == 0) return const SizedBox();

    final size = MediaQuery.of(context).size;

    return IgnorePointer(
      ignoring: !widget.isOpen,
      child: AnimatedBuilder(
        animation: Listenable.merge([_topController, _bottomController]),
        builder: (context, child) {
          final topHeight = size.height / 2 * _topController.value;
          final bottomHeight = size.height / 2 * _bottomController.value;

          return Stack(
            children: [
              // Top shutter
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: topHeight,
                child: Container(color: Colors.lightBlueAccent.shade100),
              ),

              // Bottom shutter
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: bottomHeight,
                child: Container(color: Colors.lightBlueAccent.shade100),
              ),

              // Menu items (appear after shutters meet)
              if (_showItems)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          widget.items.asMap().entries.map((entry) {
                            return MenuItemTile(
                              icon: entry.value['icon'],
                              label: entry.value['label'],
                              delay: Duration(milliseconds: 200 * entry.key),
                              onTap: () async {
                                widget.onClose(); // Start closing shutters

                                // Wait for shutters to fully close
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
                                );

                                if (!mounted) return;

                                // Smooth navigation with custom transition
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                    ) {
                                      switch (entry.value['route']) {
                                        case '/':
                                          return const HomeScreen();
                                        case '/tile':
                                          return const AnimatedTileScreen();
                                        case '/profile':
                                          return const ProfileScreen();
                                        case '/goals':
                                          return GoalScreen();
                                        default:
                                          return const HomeScreen();
                                      }
                                    },
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, 0.1),
                                            end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        ),
                                      );
                                    },
                                    transitionDuration: const Duration(
                                      milliseconds: 400,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
