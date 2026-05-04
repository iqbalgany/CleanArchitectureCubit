// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_cubit.dart';

enum TaskStatus { initial, loading, success, error }

class TaskState extends Equatable {
  final TaskStatus status;
  final String errorMessage;
  final List<Task> tasks;
  final Task? task;
  const TaskState({
    this.status = TaskStatus.initial,
    this.errorMessage = '',
    this.tasks = const [],
    this.task,
  });

  @override
  List<Object?> get props => [tasks, task, errorMessage, status];

  TaskState copyWith({
    TaskStatus? status,
    String? errorMessage,
    List<Task>? tasks,
    Task? task,
  }) {
    return TaskState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      tasks: tasks ?? this.tasks,
      task: task ?? this.task,
    );
  }
}
