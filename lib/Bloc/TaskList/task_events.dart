import 'package:equatable/equatable.dart';

class TaskEvents extends Equatable {
  const TaskEvents();

  List<Object> get props => [];
}

class AddItemEvent extends TaskEvents {
  String task;

  AddItemEvent({required this.task});
}

class RemoveItemEvent extends TaskEvents {
  Object Task;

  RemoveItemEvent({required this.Task});
}
