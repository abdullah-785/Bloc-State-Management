import 'package:bloc_app/Bloc/TaskList/task_events.dart';
import 'package:bloc_app/Bloc/TaskList/task_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvents, TaskStates> {
  List<String> task = [];

  // TaskBloc();

  TaskBloc() : super(TaskStates()) {
    on<AddItemEvent>(_addTaskItem);
    on<RemoveItemEvent>(_removeTaskItem);
  }

  void _addTaskItem(AddItemEvent events, Emitter<TaskStates> emit) {
    task.add(events.task);
    emit(state.copyWith(taskList: List.from(task)));
  }

  void _removeTaskItem(RemoveItemEvent events, Emitter<TaskStates> emit) {
    task.remove(events.Task);
    emit(state.copyWith(taskList: List.from(task)));
  }
}
