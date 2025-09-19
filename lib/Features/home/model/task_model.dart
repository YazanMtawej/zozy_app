import 'package:hive/hive.dart';

part 'task_model.g.dart'; // 🔥 مهم جدًا

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime dueDate;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  int priority;

  TaskModel({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
    this.priority = 2,
  });
}
