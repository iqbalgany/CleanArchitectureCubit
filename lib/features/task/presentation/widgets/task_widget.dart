import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/presentation/cubits/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          context.read<TaskCubit>().updateTask(
            task.copyWith(isCompleted: value ?? false),
          );
        },
      ),
      trailing: IconButton(
        onPressed: () {
          context.read<TaskCubit>().deleteTask(task.id!);
        },
        icon: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }
}
