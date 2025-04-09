import 'package:_12_animated_app/widgets/animated_menu_overlay.dart';
import 'package:flutter/material.dart';

class ScaffoldWithMenu extends StatefulWidget {
  final Widget body;
  final String title;

  const ScaffoldWithMenu({super.key, required this.body, required this.title});

  @override
  State<ScaffoldWithMenu> createState() => _ScaffoldWithMenuState();
}

class _ScaffoldWithMenuState extends State<ScaffoldWithMenu> {
  bool _menuOpen = false;

  void toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              if (!_menuOpen)
                IconButton(icon: const Icon(Icons.menu), onPressed: toggleMenu),
            ],
          ),
          body: widget.body,
        ),

        // Menu overlay
        MenuOverlay(
          isOpen: _menuOpen,
          onClose: toggleMenu,
          items: const [
            {'icon': Icons.home, 'label': 'Home', 'route': '/'},
            {'icon': Icons.ballot, 'label': 'Tile', 'route': '/tile'},
            {'icon': Icons.person, 'label': 'Profile', 'route': '/profile'},
            {'icon': Icons.flag, 'label': 'Goals', 'route': '/goals'},
          ],
        ),

        // Floating X icon when menu is open
        if (_menuOpen)
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, size: 28),
              onPressed: toggleMenu,
            ),
          ),
      ],
    );
  }
}
