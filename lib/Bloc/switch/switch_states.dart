import 'package:bloc_app/Bloc/switch/switch_events.dart';
import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  bool isSwitch;
  double slider;

  SwitchStates({this.isSwitch = false, this.slider = 0});

  SwitchStates copyWith({bool? isSwitch, double? slider}) {
    return SwitchStates(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, slider];
}
