import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository taskRepository;

  GetTasksUseCase({required this.taskRepository});

  Future<Either<Failure, List<Task>>> call() async {
    return await taskRepository.getTasks();
  }
}
