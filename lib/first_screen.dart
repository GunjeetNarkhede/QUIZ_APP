import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void startQuiz() {}

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      // wrapping column with center object in order to make column occupy the whole
      // screen for our gradient
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(162, 255, 255, 255),
            // for adding transparency to the inserted image we first set its color to
            // white and then use the transparency slider after hovering over the color
            // command
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 230, 230),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            // in order to add icons to our buttons we use outlinedbutton.icon instead of
            // outlinedbutton as it provides with the features of adding icons
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.handshake_sharp),
            label: const Text(
              // we initialized text as label and not child according to syntax that goes
              // with using outlinedbutton.icon
              'Start Quiz',
              style: TextStyle(
                color: Color.fromARGB(255, 238, 213, 255),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
