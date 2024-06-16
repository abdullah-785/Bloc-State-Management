import 'package:bloc/bloc.dart';
import 'package:bloc_app/Bloc/switch/switch_events.dart';
import 'package:bloc_app/Bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisable>(_enableOrDisable);
    on<Sliderrs>(_slider);
  }

  void _enableOrDisable(SwitchEvents events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(Sliderrs events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
