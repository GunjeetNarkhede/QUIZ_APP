import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_and_answers.dart';
import 'package:quiz_app/models/summary_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.switchScreen, this.chosenAns, {super.key});
  final List<String> chosenAns;
  // adding a variable list to our class to pass the chosen answers to our 'ResultScreen'
  // widget.
  final void Function() switchScreen;
  List<Map<String, Object>> buildSummary() {
    final List<Map<String, Object>> summary = [];
    // note that the reason we use strings to categorise this data because strings can
    // be assigned direct names like 'Question No.' and later it will be easy to access
    // these keys
    for (int i = 0; i < chosenAns.length; i++) {
      summary.add(
        {
          'Question No.': i,
          'Question: ': content[i].question,
          'Correct Answer: ': content[i].answers[0],
          'Chosen Answer: ': chosenAns[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final index=0;
    final summaryData = buildSummary();
    // storing the summary list in a variable to use it later and avoid recalling
    // buildSummary unnecessarily later.
    int correctAns = summaryData.where(
      // 'where' method in lists is used to filter out the contents of a list on the
      // basis of some condition that we've written below. It will create another list
      // and the current element in that list if the condition is fulfilled.
      (data) {
        return data['Chosen Answer: '] == data['Correct Answer: '];
      },
    ).length;
    // accessing the length because 'where' method returns a list and we just need the
    // number of strings that are pushed in that list.
    final int totalQues = content.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have correctly answered $correctAns out of $totalQues questions!',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 247, 180, 238),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryBlock(
              summaryData,
              index,
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.loop_outlined),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Color.fromARGB(255, 238, 213, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                // copying the same button format from 'first_screen'.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
