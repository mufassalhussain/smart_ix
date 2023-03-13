part of 'LightsBloc.dart';

abstract class LightsEvent extends Equatable {
  const LightsEvent();

  @override
  List<Object> get props => [];
}

class LoadLightsEvent extends LightsEvent {}

class SetIndexEvent extends LightsEvent {
  final int index;

  const SetIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class SetSliderDataEvent extends LightsEvent {
  final double sliderData;

  const SetSliderDataEvent(this.sliderData);

  @override
  List<Object> get props => [sliderData];
}

class SetSwitchDataEvent extends LightsEvent {
  final bool switchData;

  const SetSwitchDataEvent(this.switchData);

  @override
  List<Object> get props => [switchData];
}
