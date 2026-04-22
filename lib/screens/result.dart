import 'package:flutter/material.dart';
import 'package:mood_productivity/widgets/circular_progress.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class ResultScreen extends StatefulWidget {
  final String mood;
  final String userTask;

  const ResultScreen({
    super.key,
    required this.mood,
    required this.userTask,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Set<int> completedTasks = {};

  List<Task> getMoodSuggestions() {
    List<Task> list = [];

    if (widget.userTask.isNotEmpty) {
      list.add(Task(title: widget.userTask, moodCategory: 'User'));
    }

    if (widget.mood == 'Tired') {
      list.addAll([
        Task(title: "Stretch for 5 minutes", moodCategory: 'Tired'),
        Task(title: "Drink water", moodCategory: 'Tired'),
        Task(title: "Organize desktop", moodCategory: 'Tired'),
      ]);
    } else if (widget.mood == 'Energetic') {
      list.addAll([
        Task(title: "Deep work session", moodCategory: 'Energetic'),
        Task(title: "Workout", moodCategory: 'Energetic'),
        Task(title: "Clean room", moodCategory: 'Energetic'),
      ]);
    } else {
      list.addAll([
        Task(title: "Read book", moodCategory: 'Normal'),
        Task(title: "Reply emails", moodCategory: 'Normal'),
        Task(title: "Plan tomorrow", moodCategory: 'Normal'),
      ]);
    }

    return list;
  }

  void toggleTask(int index) {
    setState(() {
      if (completedTasks.contains(index)) {
        completedTasks.remove(index);
      } else {
        completedTasks.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = getMoodSuggestions();

    return Scaffold(
      appBar: AppBar(title: Text("${widget.mood} Plan")),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // ✅ PROGRESS
          buildProgressCircle(tasks.length, completedTasks.length),

          const SizedBox(height: 30),

          const Text(
            "Your Tasks",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: tasks[index],
                  isDone: completedTasks.contains(index),
                  onDone: () => toggleTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
