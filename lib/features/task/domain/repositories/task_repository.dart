import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, Task>> getTaskById(int id);
  Future<Either<Failure, void>> createTask(Task task);
  Future<Either<Failure, void>> updateTask(Task task);
  Future<Either<Failure, void>> deleteTask(int id);
}
