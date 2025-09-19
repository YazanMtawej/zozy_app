import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zozy/Features/home/model/task_model.dart';
import 'package:zozy/Features/home/view/widgets/empty_state.dart';
import 'package:zozy/Features/home/view/widgets/task_item.dart';
import 'package:zozy/Features/home/view_model/home_viewmodel.dart';
import '../../../core/constants/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryDark,
              elevation: 0,
              title: const Text(
                "My Tasks",
                style: TextStyle(
                  color: AppColors.accentGold,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.delete_sweep,
                    color: AppColors.accentGold,
                  ),
                  onPressed: () => _confirmClearTasks(context, viewModel),
                  tooltip: "Clear All Tasks",
                ),
              ],
            ),

            body: viewModel.tasks.isEmpty
                ? const EmptyState()
                : Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryMid,
                          AppColors.primaryLight,
                          AppColors.primaryDark,
                          AppColors.primaryMid,
                          AppColors.primaryLight,
                          AppColors.primaryDark,
                          AppColors.primaryLight,

                          AppColors.accentGold,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: viewModel.tasks.length,
                      itemBuilder: (context, index) {
                        final task = viewModel.tasks[index];
                        return TaskItem(
                          task: task,
                          onToggle: () => viewModel.toggleTaskCompletion(index),
                          onDelete: () => viewModel.removeTask(index),
                        );
                      },
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.accentGold,
              child: const Icon(Icons.add, color: AppColors.primaryDark),
              onPressed: () {
                _showAddTaskDialog(context, viewModel);
              },
            ),
          );
        },
      ),
    );
  }

  void _confirmClearTasks(BuildContext context, HomeViewModel viewModel) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.primaryMid,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Confirm",
          style: TextStyle(
            color: AppColors.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Are you sure you want to delete all tasks?",
          style: TextStyle(color: AppColors.textLight),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: AppColors.textWhite),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentGold,
            ),
            onPressed: () async {
              Navigator.pop(context); // أغلق الـ Dialog أولاً
              await Future.delayed(
                const Duration(milliseconds: 50),
              ); // اسمح للـ UI بالتحديث
              viewModel.clearTasks();
            },
            child: const Text(
              "Delete All",
              style: TextStyle(color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, HomeViewModel viewModel) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    DateTime dueDate = DateTime.now();
    int priority = 2;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.primaryMid,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text(
              "Add Task",
              style: TextStyle(color: AppColors.textWhite),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleCtrl,
                    style: const TextStyle(color: AppColors.textWhite),
                    decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(color: AppColors.textLight),
                    ),
                  ),
                  TextField(
                    controller: descCtrl,
                    style: const TextStyle(color: AppColors.textWhite),
                    decoration: const InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(color: AppColors.textLight),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "Priority:",
                        style: TextStyle(color: AppColors.textWhite),
                      ),
                      const SizedBox(width: 10),
                      DropdownButton<int>(
                        dropdownColor: AppColors.primaryDark,
                        value: priority,
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "High",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Medium",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text(
                              "Low",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                        onChanged: (val) => setState(() => priority = val!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: AppColors.textLight),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentGold,
                ),
                onPressed: () {
                  viewModel.addTask(
                    TaskModel(
                      title: titleCtrl.text,
                      description: descCtrl.text,
                      dueDate: dueDate,
                      priority: priority,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: AppColors.primaryDark),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
