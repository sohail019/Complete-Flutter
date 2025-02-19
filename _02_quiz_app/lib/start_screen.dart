import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   'assets/images/quiz-logo.png',
          //   width: 200,
          //   color: Colors.red,
          // ),
          // Image.asset(
          //   'assets/images/quiz-logo.png',
          //   width: 200,
          //   color: Colors.white.withAlpha(100),
          // ),
          // Image.asset(
          //   'assets/images/quiz-logo.png',
          //   width: 200,
          //   color: Colors.white.withValues(alpha: 0.2),
          // ),
          Opacity(
            opacity: 0.9,
            child: Image.asset('assets/images/quiz-logo.png', width: 200),
          ),
          const SizedBox(height: 80),
          const Text(
            'Welcome to the Quiz!',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 20, color:  Colors.white),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt, size: 28),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              textStyle: const TextStyle(fontSize: 20),
            ),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
