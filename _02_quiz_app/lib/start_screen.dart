import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';  // Import the package

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();


    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

   
    _rotationAnimation = Tween<double>(begin: 0, end: 3.14) 
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

 
    _playIntroMusic();

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  // Method to play the intro music
  void _playIntroMusic() async {
    await _audioPlayer.play(AssetSource('audio/kbc-intro.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Animated logo flipping like a coin
          AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(_rotationAnimation.value),
                child: child,
              );
            },
            child: Opacity(
              opacity: 0.9,
              child: Image.asset('assets/images/logo.png', width: 200),
            ),
          ),
          const SizedBox(height: 60),
          const Text(
            'Welcome to the KBC!',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 201, 153, 251),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Get ready for the ultimate journey to become Crorepati!',
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              widget.startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt, size: 28),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              textStyle: const TextStyle(fontSize: 20),
            ),
            label: const Text('Start the Game'),
          ),
        ],
      ),
    );
  }
}
