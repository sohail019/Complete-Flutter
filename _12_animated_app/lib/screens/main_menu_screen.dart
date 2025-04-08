import 'package:_12_animated_app/widgets/animated_menu_overlay.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
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
        // Main content scaffold
        Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              if (!_menuOpen)
                IconButton(icon: const Icon(Icons.menu), onPressed: toggleMenu),
            ],
          ),
          body: const Center(
            child: Text("Main Content", style: TextStyle(fontSize: 22)),
          ),
        ),

        // Menu overlay
        MenuOverlay(
          isOpen: _menuOpen,
          onClose: toggleMenu,
          items: const [
            {'icon': Icons.home, 'label': 'Home'},
            {'icon': Icons.ballot, 'label': 'Tile'},
            {'icon': Icons.person, 'label': 'Profile'},
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
