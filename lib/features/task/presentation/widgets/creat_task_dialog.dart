import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/presentation/cubits/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: title,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: description,
            decoration: InputDecoration(hintText: 'description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (title.text.isNotEmpty && description.text.isNotEmpty) {
              context.read<TaskCubit>().createTask(
                Task(
                  title: title.text.trim(),
                  description: description.text.trim(),
                  isCompleted: false,
                  createdAt: DateTime.now(),
                ),
              );
              Navigator.pop(context);
            }
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}
