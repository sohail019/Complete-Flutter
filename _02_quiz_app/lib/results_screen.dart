import 'package:_02_quiz_app/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswer[i],
      });
    }
    return summary;
  }
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("You answered X out of Y questions correctly!"),
          const SizedBox(height: 30),
          const Text("List of questions and answers"),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {}, child: Text("Restart Quiz")),
        ],),
      ),
    );
  }
}