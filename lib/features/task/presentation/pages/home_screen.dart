import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/get_it.dart';
import '../cubits/cubit/task_cubit.dart';
import 'home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TaskCubit(
          getTasksUseCase: getIt(),
          getTaskByIdUseCase: getIt(),
          deleteTaskUseCase: getIt(),
          createTaskUseCase: getIt(),
          updateTaskUseCase: getIt(),
        ),
        child: HomeView(),
      ),
    );
  }
}
