import 'package:equatable/equatable.dart';

class TaskStates extends Equatable {
  List<String> taskList;

  TaskStates({this.taskList = const []});

  TaskStates copyWith({List<String>? taskList}) {
    return TaskStates(taskList: taskList ?? this.taskList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [taskList];
}
