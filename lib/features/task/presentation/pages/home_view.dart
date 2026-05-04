import 'package:clean_architecture_cubit/features/task/presentation/cubits/cubit/task_cubit.dart';
import 'package:clean_architecture_cubit/features/task/presentation/widgets/creat_task_dialog.dart';
import 'package:clean_architecture_cubit/features/task/presentation/widgets/task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state.status == TaskStatus.error) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          }

          if (state.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task, color: Colors.grey.shade600, size: 40),
                  SizedBox(height: 10),
                  Text(
                    'There aren\'t any assignments yet',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: state.tasks.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final task = state.tasks[index];

              if (state.status == TaskStatus.loading) {
                return Center(child: CupertinoActivityIndicator());
              }

              return TaskWidget(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final taskCubit = context.read<TaskCubit>();
          showDialog(
            context: context,
            builder: (context) =>
                BlocProvider.value(value: taskCubit, child: CreateTaskDialog()),
          );
        },
      ),
    );
  }
}
