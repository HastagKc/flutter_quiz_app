import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // making question count

  int currentQuestionIndex = 0;
  List<Question> questions = [
    Question(
      'What is the capital of France?',
      ['Paris', 'Madrid', 'Berlin', 'London'],
      'Paris',
    ),
    Question(
      'Who painted the Mona Lisa?',
      [
        'Leonardo da Vinci',
        'Pablo Picasso',
        'Vincent van Gogh',
        'Michelangelo'
      ],
      'Leonardo da Vinci',
    ),
    // Add more questions here
  ];

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex].correctAnswer;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Answer'),
          content:
              Text(selectedAnswer == correctAnswer ? 'Correct!' : 'Wrong!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Next'),
              onPressed: () {
                setState(() {
                  if (currentQuestionIndex < questions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    // Quiz ended, show a dialog or navigate to a new screen
                    // to display the final score
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Quiz Ended'),
                          content: Text(
                              'Congratulations! You have completed the quiz.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Reset the quiz if you want to allow the user to retake it
                                // currentQuestionIndex = 0;
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];
    List<String> answerOptions = currentQuestion.answerOptions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Column(
              children: answerOptions.map((answer) {
                return ElevatedButton(
                  onPressed: () => checkAnswer(answer),
                  child: Text(answer),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
