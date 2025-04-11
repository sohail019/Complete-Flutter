import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:_12_animated_app/widgets/scaffold_with_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _riveSlideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _actionsSlideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _profileCardSlideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Staggered animations with combined effects
    _riveSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Slide in from top
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _profileCardSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Slide in slightly from below
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
      ),
    );

    _actionsSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Slide in slightly from below
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0, // Start fully transparent
      end: 1.0, // Fully visible
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8, // Start slightly smaller
      end: 1.0, // Scale to normal size
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.6, curve: Curves.elasticOut),
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: -0.1, // Slight rotation
      end: 0.0, // Rotate back to normal
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
      ),
    );

    // Start the animations
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithMenu(
      title: 'Profile',
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Top Rive Animation
            SlideTransition(
              position: _riveSlideAnimation,
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    const rive.RiveAnimation.asset(
                      "assets/RiveAssets/shapes.riv",
                      fit: BoxFit.cover,
                    ),
                    Container(color: Colors.black.withOpacity(0.3)),
                    const Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        "Your Profile",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Profile Info Card with Scale and Rotation
            ScaleTransition(
              scale: _scaleAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage(
                            'assets/images/scookiehail.jpg',
                          ), // Add your own asset
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Sohail Shaikh",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "shaikhhsohail0193@email.com",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Actions with Slide and Fade
            SlideTransition(
              position: _actionsSlideAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text("Edit Profile"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
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
