import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';

class GetTaskByIdUseCase {
  final TaskRepository taskRepository;

  GetTaskByIdUseCase({required this.taskRepository});

  Future<Either<Failure, Task>> call(int id) async {
    return await taskRepository.getTaskById(id);
  }
}
