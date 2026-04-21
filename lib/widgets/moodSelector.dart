import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  final String selectedMood;
  final Function(String) onChanged;

  const MoodSelector({
    super.key,
    required this.selectedMood,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          RadioListTile(
            title: const Text("Tired (Low Energy)"),
            value: "Tired",
            groupValue: selectedMood,
            onChanged: (val) => onChanged(val!),
          ),
          RadioListTile(
            title: const Text("Normal (Balanced)"),
            value: "Normal",
            groupValue: selectedMood,
            onChanged: (val) => onChanged(val!),
          ),
          RadioListTile(
            title: const Text("Energetic (High Energy)"),
            value: "Energetic",
            groupValue: selectedMood,
            onChanged: (val) => onChanged(val!),
          ),
        ],
      ),
    );
  }
}