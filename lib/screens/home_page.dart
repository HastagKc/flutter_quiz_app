import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// tracking current position of index

  int currentQesIndex = 0;
  List<QuestionModel> mathQuestions = [
    QuestionModel(
      question: 'What is the value of 2 + 2?',
      ansOpt: ['9', '4', '10', '12'],
      ans: '4',
    ),
    QuestionModel(
      question: 'Simplify: 3 + 4 * 2 - 6',
      ansOpt: ['9', '7', '10', '12'],
      ans: '9',
    ),
    // QuestionModel(
    //   question: 'What is the square root of 16?',
    //   ansOpt: ['4', '6', '8', '10'],
    //   ans: '4',
    // ),
    // QuestionModel(
    //   question: 'What is the result of 5 squared?',
    //   ansOpt: ['20', '25', '30', '35'],
    //   ans: '25',
    // ),
    // QuestionModel(
    //   question: 'Simplify: 2 * (4 + 3)',
    //   ansOpt: ['7', '14', '16', '21'],
    //   ans: '14',
    // ),
    // QuestionModel(
    //   question: 'What is the value of 9 divided by 3?',
    //   ansOpt: ['2', '3', '4', '5'],
    //   ans: '3',
    // ),
    // QuestionModel(
    //   question: 'Find the next number in the sequence: 2, 4, 6, 8, ...',
    //   ansOpt: ['10', '9', '12', '14'],
    //   ans: '10',
    // ),
    // QuestionModel(
    //   question: 'What is the result of 3 to the power of 4?',
    //   ansOpt: ['12', '27', '64', '81'],
    //   ans: '81',
    // ),
    // QuestionModel(
    //   question: 'Simplify: 12 / (4 + 2)',
    //   ansOpt: ['1', '2', '3', '4'],
    //   ans: '2',
    // ),
    // QuestionModel(
    //   question: 'What is the value of 5 - 2 * 3?',
    //   ansOpt: ['-1', '1', '3', '5'],
    //   ans: '-1',
    // ),
  ];

// creating function to check answer

  void checkAnswer(String selectedAnswer) {
    // storing currect answer int the correctAns variable
    String correctAns = mathQuestions[currentQesIndex].ans;

    int score = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Answer'),
          content: Text(selectedAnswer == correctAns ? 'Correct!' : 'Wrong!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (currentQesIndex < mathQuestions.length - 1) {
                    if (selectedAnswer == correctAns) {
                      score++;
                    }
                    currentQesIndex++;
                  } else {
                    //  going to end quiz and show next show alert
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Quiz End"),
                          content: Text(
                            'Congratulations! I have complete quize sucessfully Your score is $score',
                          ),
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    currentQesIndex = 0;
                                  },
                                  child: const Text('Try again'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel currentQuestion = mathQuestions[currentQesIndex];
    // list for current answer

    List<String> answerOption = mathQuestions[currentQesIndex].ansOpt;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QuestionModel No: 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: answerOption.map((answer) {
                return ElevatedButton(
                  onPressed: () {
                    checkAnswer(answer);
                  },
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
