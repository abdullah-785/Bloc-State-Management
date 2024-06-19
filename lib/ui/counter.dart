import 'package:bloc_app/Bloc/counter/counter_bloc.dart';
import 'package:bloc_app/Bloc/counter/counter_event.dart';
import 'package:bloc_app/Bloc/counter/counter_states.dart';
import 'package:bloc_app/ui/image_picker_ui.dart';
import 'package:bloc_app/ui/post_comment.dart';
import 'package:bloc_app/ui/switch_ui.dart';
import 'package:bloc_app/ui/task_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter using bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Text("Add")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Text("subtract")),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SwitchWidget()));
              },
              child: Text("Go to Switch")),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePickerWidget()));
              },
              child: Text("Go to imagePicker")),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskList()));
              },
              child: Text("Task")),

          // PostCommentUi

          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostCommentUi()));
              },
              child: Text("Post Comments")),
        ],
      ),
    );
  }
}
