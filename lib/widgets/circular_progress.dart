import 'package:flutter/material.dart';

Widget buildProgressCircle(int total, int completed) {
  double progress = total > 0 ? completed / total : 0.0;

  String quote = "Start your tasks!";
  if (progress > 0 && progress < 0.5) quote = "Keep going!";
  if (progress >= 0.5 && progress < 1.0) quote = "Halfway there!";
  if (progress == 1.0) quote = "All done! Great job!";

  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
            ),
          ),
          Text("${(progress * 100).toInt()}%"),
        ],
      ),
      const SizedBox(height: 10),
      Text(quote),
    ],
  );
}