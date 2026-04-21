import 'package:flutter/material.dart';
import '../screens/result.dart';
class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.selectedMood,
    required TextEditingController taskController,
  }) : _taskController = taskController;

  final String selectedMood;
  final TextEditingController _taskController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        // Moving to Page 2 (Result Page) and passing data
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              mood: selectedMood,
              userTask: _taskController.text,
            ),
          ),
        );
      },
      child: const Text(
        "Generate My Plan",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}