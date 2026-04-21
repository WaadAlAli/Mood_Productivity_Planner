//This file defines what a "Task" looks like
class Task {
  final String title;
  final String moodCategory; // Tired, Normal, or Energetic
  bool isCompleted;
 

  Task({
    required this.title,
    required this.moodCategory,
    this.isCompleted = false, // Tasks start as not finished

  });
}
