import 'package:clean_architecture_cubit/core/database/app_database.dart';
import 'package:clean_architecture_cubit/features/task/data/datasources/local_task_datasource.dart';
import 'package:clean_architecture_cubit/features/task/data/repositories/task_repository_impl.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/create_task_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/delete_task_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/get_task_by_id_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/get_tasks_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/update_task_use_case.dart';
import 'package:clean_architecture_cubit/features/task/presentation/cubits/cubit/task_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

Future<void> setup() async {
  await registerDatabase();
  registerDatasources();
  registerRepositories();
  registerUseCases();
  registerCubits();
}

Future registerDatabase() async {
  getIt.registerSingleton(await AppDatabase.database);
}

void registerDatasources() {
  getIt.registerSingleton(LocalTaskDatasource(database: getIt()));
}

void registerRepositories() {
  getIt.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(localTaskDatasource: getIt()),
  );
}

void registerUseCases() {
  getIt.registerSingleton(GetTasksUseCase(taskRepository: getIt()));
  getIt.registerSingleton(GetTaskByIdUseCase(taskRepository: getIt()));
  getIt.registerSingleton(CreateTaskUseCase(taskRepository: getIt()));
  getIt.registerSingleton(DeleteTaskUseCase(taskRepository: getIt()));
  getIt.registerSingleton(UpdateTaskUseCase(taskRepository: getIt()));
}

void registerCubits() async {
  getIt.registerFactory(
    () => TaskCubit(
      getTasksUseCase: getIt(),
      getTaskByIdUseCase: getIt(),
      deleteTaskUseCase: getIt(),
      createTaskUseCase: getIt(),
      updateTaskUseCase: getIt(),
    ),
  );
}
