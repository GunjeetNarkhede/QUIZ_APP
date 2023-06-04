import 'package:flutter/material.dart';

class DecoratedIndex extends StatelessWidget {
  const DecoratedIndex(this.summary, this.index, {super.key});
  final List<Map<String,Object>> summary;
  final int index;
  @override
  Widget build(context) {
    final bool check =
        summary[index-1]['Chosen Answer: '] == summary[index-1]['Correct Answer: '];
        // the index would come as (1,6) but for referring to elements of list we
        // would need it to start from 0 so using 'index-1'
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: check
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
      ),
      child: Text(
        (index).toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
