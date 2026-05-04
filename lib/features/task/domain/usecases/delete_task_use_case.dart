import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository taskRepository;

  DeleteTaskUseCase({required this.taskRepository});

  Future<Either<Failure, void>> call(int id) async {
    return await taskRepository.deleteTask(id);
  }
}
