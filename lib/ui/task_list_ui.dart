import 'package:bloc_app/Bloc/TaskList/task_bloc.dart';
import 'package:bloc_app/Bloc/TaskList/task_events.dart';
import 'package:bloc_app/Bloc/TaskList/task_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: Column(
        children: [
          BlocBuilder<TaskBloc, TaskStates>(builder: (context, state) {
            if (state.taskList.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${state.taskList[index]}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  context.read<TaskBloc>().add(RemoveItemEvent(
                                      Task: state.taskList[index]));
                                },
                                child: Icon(Icons.delete))
                          ],
                        ),
                      );
                    }),
              );
            }
          })
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          for (var i = 0; i < 20; i++) {
            context
                .read<TaskBloc>()
                .add(AddItemEvent(task: "Task: " + (i + 1).toString()));
          }
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
