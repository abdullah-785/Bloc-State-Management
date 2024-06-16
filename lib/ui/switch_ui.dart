import 'package:bloc_app/Bloc/counter/counter_states.dart';
import 'package:bloc_app/Bloc/switch/switch_%20bloc.dart';
import 'package:bloc_app/Bloc/switch/switch_events.dart';
import 'package:bloc_app/Bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Column(
        children: [
          BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                return Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      // print("switch");
                      context.read<SwitchBloc>().add(EnableOrDisable());
                    });
              }),

          SizedBox(
            height: 20,
          ),

          BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      // print("Slider");
                      // state.slider = value;
                      context.read<SwitchBloc>().add(Sliderrs(slider: value));
                    });
              })
          //
        ],
      ),
    );
  }
}
