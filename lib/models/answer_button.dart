import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  // function that has no return value and will be called whenever the button is pressed
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        foregroundColor: Colors.white,
        // this function is used to set the color that will temporarily emerge when the
        // button is pressed.
        backgroundColor: Colors.black54,
        shape: RoundedRectangleBorder(
          // we want buttons with circular sides so using shape function.
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
