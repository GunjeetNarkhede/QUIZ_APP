import 'package:flutter/material.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions_and_answers.dart';
import 'package:quiz_app/result_screen.dart';

// we created this class to contain all the content of our app separately so that
// the main function looks consise and we can make changes to the app by using
// this class rather than main function

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'first_screen';
  // void initState() {
  //  currentScreen = StartScreen(switchScreen);
  //  super.initState();
  // Passing switchscreen function as an arguement in startscreen is necessary because
  // the button that is supposed to be pressed to display questions is in StartScreen
  // and they both are different widgets so we need to connect startscreen with
  // switchscreen function so as to indirectly connect startScreen and QuestionsScreen.
  // using initstate function to execute this above condition only after all the defined
  // objects were created so that switchscreen and currentScreen are created before.
  void switchScreen() {
    setState(
      () {
        if (currentScreen == 'first_screen') {
          currentScreen = 'questions_screen';
        } else if (currentScreen == 'result_screen') {
          currentScreen = 'first_screen';
          chosenAns = [];
        }
      },
    );
  }

  List<String> chosenAns = [];
  void onAnswered(String answer) {
    chosenAns.add(answer);
    // creating a void function to add chosen answers in a list of strings
    setState(
      () {
        if (chosenAns.length == content.length) {
          currentScreen = 'result_screen';
          // setting up the condition for displaying result screen by checking the
          // length of 'chosenAns' list and when it's length is equal to total
          // questions that we have, 'currentScreen' will be set for result_screen and
          // the chosenAns list would be reset to avoid any indexing errors due to
          // extra answers being filled in the same 'chosenAns'.
        }
      },
    );
  }

  @override
  Widget build(context) {
    Widget currentWidget = StartScreen(switchScreen);
    if (currentScreen == 'questions_screen') {
      currentWidget = QuestionsScreen(onAnswered);
    } else if (currentScreen == 'result_screen') {
      currentWidget = ResultScreen(switchScreen, chosenAns);
    }
    // using an if condition to change screens when button is pressed by defining a
    // widget that first represents the StartScreen widget and when answer is chosen
    // changing its value to QuestionScreen widget.
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // we use refractory option in the side menu to wrap customwidget with a
          // container so that we can add gradient to the screen. the reason
          // we don't add gradient in the widget is because we want the same
          // one on all screens
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 137, 15, 178),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentWidget,
        ),
      ),
    );
  }
}
