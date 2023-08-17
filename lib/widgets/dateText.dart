import 'package:flutter/material.dart';

class DateText extends StatelessWidget {
  final String dateText;

  const DateText({super.key, required this.dateText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            dateText,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
