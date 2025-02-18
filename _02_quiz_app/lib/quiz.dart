import 'package:_02_quiz_app/questions_screen.dart';
import 'package:_02_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // // @override
  // // void initState() {
  // //   activeScreen = StartScreen(switchScreen);
  // //   super.initState();
  // // }

  // // switchScreen() {
  // //   setState(() {
  // //     activeScreen = const QuestionsScreen();
  // //   });
  // // }

  var activeScreen = "start-screen";

  void swithScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    // final screenWidget =
    //     activeScreen == "start-screen"
    //         ? StartScreen(swithScreen)
    //         : const QuestionsScreen();

    Widget screenWidget =  StartScreen(swithScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = const QuestionsScreen();
    }
    return MaterialApp(
      title: "Quiz App",
      initialRoute: '/',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          // child:
          //     activeScreen == "start-screen"
          //         ? StartScreen(swithScreen)
          //         : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
