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
  var totalScore = 0;
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
    QuestionModel(
      question: 'What is the square root of 16?',
      ansOpt: ['4', '6', '8', '10'],
      ans: '4',
    ),
    QuestionModel(
      question: 'What is the result of 5 squared?',
      ansOpt: ['20', '25', '30', '35'],
      ans: '25',
    ),
  ];

// creating function to check answer

  void checkAnswer(String selectedAnswer) {
    // storing currect answer int the correctAns variable
    if (currentQesIndex < mathQuestions.length) {
      if (selectedAnswer == mathQuestions[currentQesIndex].ans) {
        totalScore++;
        setState(() {
          currentQesIndex++;

          print('set call and score ${totalScore}');
        });
      } else {
        setState(() {
          currentQesIndex++;
        });
      }
    } else {
      print('Nothing');
    }
  }

// reset function

  dynamic resetQuiz() {
    setState(() {
      totalScore = 0;
      currentQesIndex = 0;
    });

    return currentQesIndex;
  }

  @override
  Widget build(BuildContext context) {
    // list for current answer

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QuestionModel No: ${currentQesIndex + 1}'),
      ),
      body: (currentQesIndex <= mathQuestions.length - 1)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mathQuestions[currentQesIndex].question,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children:
                        mathQuestions[currentQesIndex].ansOpt.map((answer) {
                      return ElevatedButton(
                        onPressed: () {
                          print(answer);
                          checkAnswer(answer);
                        },
                        child: Text(answer),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          : Center(
              child: ScorePage(
                score: totalScore,
                resetQuiz: resetQuiz(),
              ),
            ),
    );
  }
}

class ScorePage extends StatelessWidget {
  var score;
  Function resetQuiz;
  ScorePage({
    Key? key,
    required this.score,
    required this.resetQuiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score is ${score}'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                resetQuiz();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }),
                );
              },
              child: const Text("Try Again "),
            ),
          ],
        ),
      ),
    );
  }
}
