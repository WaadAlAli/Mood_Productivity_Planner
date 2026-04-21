//​The main entry point where users select their mood and add custom tasks.
import 'package:flutter/material.dart';
import '../widgets/navigationButton.dart';
import '../widgets/moodSelector.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. State Variables
  String selectedMood = 'Normal';
  final TextEditingController _taskController = TextEditingController();

  // 2. Logic to change background color based on mood
  Color getBackground() {
    switch (selectedMood) {
      case 'Tired':
        return const Color(0xFFE1E5F2); // Soft Blue
      case 'Energetic':
        return const Color(0xFFFFF3E0); // Soft Orange
      default:
        return const Color(0xFFE8F5E9); // Soft Green
    }
  }

  // 3. Logic to change image URL based on mood
  String getImageUrl() {
    if (selectedMood == 'Tired') {
      return "assets/tired.jpg";
    }
    if (selectedMood == 'Energetic') {
      return "assets/energetic.jpg";
    }
    return "assets/balanced.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackground(),
      appBar: AppBar(
        title: const Text(
          "Mood Planner",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // IMAGE SECTION
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                getImageUrl(),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "How is your energy level?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),

            MoodSelector(
             selectedMood: selectedMood,
             onChanged: (val) {
             setState(() {
                selectedMood = val;
                  });
  },
),

            const SizedBox(height: 20),

            // TEXT FIELD SECTION
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Add a specific task (Optional)",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.add_task),
              ),
            ),

            const SizedBox(height: 30),

            // NAVIGATION BUTTON
            NavigationButton(selectedMood: selectedMood, 
            taskController: _taskController),
          ],
        ),
      ),
    );
  }
}


