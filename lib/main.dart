import 'package:bloc_app/Bloc/TaskList/task_bloc.dart';
import 'package:bloc_app/Bloc/counter/counter_bloc.dart';
import 'package:bloc_app/Bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/Bloc/switch/switch_%20bloc.dart';
import 'package:bloc_app/Utils/image_picker_utils.dart';
import 'package:bloc_app/ui/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TaskBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Counter(),
      ),
    );
  }
}
