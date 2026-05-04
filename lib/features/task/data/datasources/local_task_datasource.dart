import 'package:clean_architecture_cubit/features/task/data/models/task_model.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalTaskDatasource {
  final Database database;

  LocalTaskDatasource({required this.database});

  Future<List<TaskModel>> getTasks() async {
    var result = await database.query('tasks');
    return result.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future createTask(TaskModel taskModel) async {
    await database.insert('tasks', taskModel.toMap());
  }

  Future updateTask(TaskModel taskModel) async {
    await database.update(
      'tasks',
      taskModel.toMap(),
      where: 'id = ?',
      whereArgs: [taskModel.id],
    );
  }

  Future deleteTask(int id) async {
    await database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<TaskModel> getTaskById(int id) async {
    var result = await database.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    return TaskModel.fromMap(result.first);
  }
}
