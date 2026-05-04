import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository taskRepository;

  UpdateTaskUseCase({required this.taskRepository});

  Future<Either<Failure, void>> call(Task task) async {
    return await taskRepository.updateTask(task);
  }
}
