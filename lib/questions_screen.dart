import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_button.dart';
import 'package:quiz_app/data/questions_and_answers.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onAnswered, {super.key});
  final void Function(String answer) onAnswered;
  // passing the function as an arguement to QuestionScreen constructor
  // that will store all the chosen answer in a seperate list of strings
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var quesIndex = 0;
  void changeQues(String answer) {
    // this function gets executed when the answer button is pressed
    widget.onAnswered(answer);
    // using this above command to access the 'onAnswered' function which is in widget 
    // class and not in this state class. 'widget.' property allows us to access all the 
    // elements of a widget class in its state class.giving answer string as an 
    // arguement to 'onAnswered' function.
    setState(
      () {
        quesIndex++;
      },
    );
  }

  @override
  Widget build(context) {
    final current = content[quesIndex];
    return SizedBox(
      // wrapping the column with a sizedbox with width set to full screen.This is an
      // alternative to using center property of column.
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        // wrapping column with container widget as it allows us to use the margin
        // function to adjust the size of buttons.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // makes the column to occupy the maximum horizontal space
          children: [
            Text(
              textAlign: TextAlign.center,
              current.question,
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color.fromARGB(255, 184, 126, 250),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...current.getShuffledAns().map(
              // using getShuffledAns function that we created in quiz_quesions.dart
              // file to shuffle the answers list everytime.
              // to dynamically define the answer buttons on the basis of number of answers
            // stored in our 'current' list for that question, we use map function on
            // 'current.answers' which contains list of answers and it executes an
            // anonymous function on each element of that list i.e. the available answers,
            // and returns a list of AnswerButton widgets corresponding to available answers.
            // but the children container only accepts list of widgets but not a nested
            // list of widgets which we get in this case. So we add those 3 dots in front
            // of current.answers to make the returned AnswerButtons pass like individual
            // childs in this container.
              (answers) {
                return AnswerButton(answers, () {
                  changeQues(answers);
                  // using an anonymous function here as it allows the void changeQues 
                  // function to accept an arguement when and execute when the button 
                  // is pressed.
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
