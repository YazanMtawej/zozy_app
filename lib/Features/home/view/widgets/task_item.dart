import 'package:flutter/material.dart';
import 'package:zozy/Features/home/model/task_model.dart';
import 'package:zozy/core/constants/app_color.dart';


class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  });

  Color get _priorityColor {
    switch (task.priority) {
      case 1:
        return Colors.redAccent;
      case 2:
        return Colors.orangeAccent;
      default:
        return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: task.isCompleted
              ? LinearGradient(
                  colors: [Colors.green.shade700, Colors.green.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    AppColors.primaryMid.withOpacity(0.9),
                    AppColors.primaryLight.withOpacity(0.8)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ✅ Checkbox أخضر متحرك
            InkWell(
              onTap: onToggle,
              borderRadius: BorderRadius.circular(20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: task.isCompleted ? Colors.green : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: task.isCompleted ? Colors.green : AppColors.accentGold,
                    width: 2,
                  ),
                ),
                child: task.isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : null,
              ),
            ),
            const SizedBox(width: 12),

            // عنوان ووصف المهمة
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${task.description}\nDue: ${task.dueDate.toLocal().toString().split(' ')[0]}",
                    style: TextStyle(
                      color: AppColors.textLight.withOpacity(0.85),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // مؤشر الأولوية
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _priorityColor,
              ),
            ),

            // زر الحذف
            GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withOpacity(0.9),
                ),
                child: const Icon(Icons.delete, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
