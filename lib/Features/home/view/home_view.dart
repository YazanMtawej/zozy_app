import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                        return TaskItem(
                          task: viewModel.tasks[index],
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

  void _showAddTaskDialog(BuildContext context, HomeViewModel viewModel) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.primaryMid,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Add Task",
          style: TextStyle(color: AppColors.textWhite),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.textWhite),
          decoration: const InputDecoration(
            hintText: "Enter your task",
            hintStyle: TextStyle(color: AppColors.textLight),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.accentGold),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.accentGold),
            ),
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
              viewModel.addTask(controller.text);
              Navigator.pop(context);
            },
            child: const Text(
              "Add",
              style: TextStyle(color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}
