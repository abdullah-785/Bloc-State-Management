import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableOrDisable extends SwitchEvents {}

class Sliderrs extends SwitchEvents {
  double slider;

  Sliderrs({this.slider = 0});
  @override
  List<Object> get props => [slider];
}
