import 'package:bloc/bloc.dart';
import 'package:clean_architecture_cubit/features/task/domain/entities/task.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/create_task_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/delete_task_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/get_task_by_id_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/get_tasks_use_case.dart';
import 'package:clean_architecture_cubit/features/task/domain/usecases/update_task_use_case.dart';
import 'package:equatable/equatable.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final GetTasksUseCase getTasksUseCase;
  final GetTaskByIdUseCase getTaskByIdUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  TaskCubit({
    required this.getTasksUseCase,
    required this.getTaskByIdUseCase,
    required this.deleteTaskUseCase,
    required this.createTaskUseCase,
    required this.updateTaskUseCase,
  }) : super(TaskState()) {
    getTasks();
  }

  void getTasks() async {
    emit(state.copyWith(status: TaskStatus.loading));

    var result = await getTasksUseCase();

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorMessage: l.errorMessage,
            status: TaskStatus.error,
          ),
        );
      },
      (r) {
        emit(state.copyWith(status: TaskStatus.success, tasks: r));
      },
    );
  }

  void updateTask(Task task) async {
    emit(state.copyWith(status: TaskStatus.loading));

    var result = await updateTaskUseCase(task);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorMessage: l.errorMessage,
            status: TaskStatus.error,
          ),
        );
      },
      (r) {
        emit(state.copyWith(status: TaskStatus.success));
        getTasks();
      },
    );
  }

  void deleteTask(int id) async {
    emit(state.copyWith(status: TaskStatus.loading));

    var result = await deleteTaskUseCase(id);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorMessage: l.errorMessage,
            status: TaskStatus.error,
          ),
        );
      },
      (r) {
        emit(state.copyWith(status: TaskStatus.success));
        getTasks();
      },
    );
  }

  void createTask(Task task) async {
    emit(state.copyWith(status: TaskStatus.loading));

    var result = await createTaskUseCase(task);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorMessage: l.errorMessage,
            status: TaskStatus.error,
          ),
        );
      },
      (r) {
        emit(state.copyWith(status: TaskStatus.success));
        getTasks();
      },
    );
  }

  void getTaskById(int id) async {
    emit(state.copyWith(status: TaskStatus.loading));

    var result = await getTaskByIdUseCase(id);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorMessage: l.errorMessage,
            status: TaskStatus.error,
          ),
        );
      },
      (r) {
        emit(state.copyWith(status: TaskStatus.success, task: r));
        getTasks();
      },
    );
  }
}
