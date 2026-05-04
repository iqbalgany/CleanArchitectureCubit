import 'package:clean_architecture_cubit/core/model/either.dart';
import 'package:clean_architecture_cubit/core/model/failure.dart';
import 'package:clean_architecture_cubit/features/task/data/datasources/local_task_datasource.dart';
import 'package:clean_architecture_cubit/features/task/data/models/task_model.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalTaskDatasource localTaskDatasource;

  TaskRepositoryImpl({required this.localTaskDatasource});

  @override
  Future<Either<Failure, void>> createTask(Task task) async {
    try {
      await localTaskDatasource.createTask(TaskModel.fromtEntity(task));
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Create task Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      await localTaskDatasource.deleteTask(id);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Delete task Failure'));
    }
  }

  @override
  Future<Either<Failure, Task>> getTaskById(int id) async {
    try {
      return Right(await localTaskDatasource.getTaskById(id));
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Get task Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      return Right(await localTaskDatasource.getTasks());
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Get tasks Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(Task task) async {
    try {
      await localTaskDatasource.updateTask(TaskModel.fromtEntity(task));
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Update task Failure'));
    }
  }
}
