import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_indexes.dart';

// ignore: must_be_immutable
class SummaryBlock extends StatelessWidget {
  SummaryBlock(this.summaryData, this.index, {super.key});
  final List<Map<String, Object>> summaryData;
  int index;
  @override
  Widget build(context) {
    return SizedBox(
      // we want this summary to be in a scrollable box of fix size so obviously we wrap it
      // with SizedBox.
      height: 300,
      child: SingleChildScrollView(
        // enabling scrolling for viewing the full summary no matter how long it may
        // be because we've set the summary's box to fixed size.
        child: Column(
          children: summaryData.map((data) {
            // using map to convert list of strings and objects to list of widgets for passing
            // them as arguements in children
            index++;
            // doing index++ here and not under build method as map would execute this 
            // command for every question of the quiz
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // making sure that the DecoratedIndex stays aligned with the question
              children: [
                DecoratedIndex(summaryData, index),
                Expanded(
                  // expanded widget makes sure that the column occupied maximum space that is
                  // available on the screen but not stretch outside the screen
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['Question: '].toString(),
                          style: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 253, 216, 248),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['Correct Answer: '].toString(),
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 255, 52, 228),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['Chosen Answer: '].toString(),
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 253, 216, 248),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
