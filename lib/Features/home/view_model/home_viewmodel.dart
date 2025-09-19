import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/task_model.dart';

class HomeViewModel extends ChangeNotifier {
  late final Box<TaskModel> _taskBox;

  HomeViewModel() {
    _taskBox = Hive.box<TaskModel>('tasks'); // فتح Box موجود مسبقاً
  }

  List<TaskModel> get tasks => _taskBox.values.toList();

  void addTask(TaskModel task) {
    _taskBox.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _taskBox.deleteAt(index);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    final task = _taskBox.getAt(index);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      task.save(); // تحديث المهمة في الـ Box
      notifyListeners();
    }
  }

  void updateTask(int index, TaskModel updatedTask) {
    _taskBox.putAt(index, updatedTask);
    notifyListeners();
  }

  void clearTasks() {
    _taskBox.clear();
    notifyListeners();
  }
}
