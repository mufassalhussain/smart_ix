part of 'LightsBloc.dart';

abstract class LightsState {}

class LightsInitialState extends LightsState {}

class LightsLoadingState extends LightsState {}

class LightsLoadedState extends LightsState {
  final int index;
  final double sliderValue;
  final bool switchValue;

  LightsLoadedState(
      {required this.index,
      required this.sliderValue,
      required this.switchValue});

  @override
  List<Object> get props => [index, sliderValue, switchValue];

  LightsLoadedState copyWith(
      {int? index, double? sliderValue, bool? switchValue}) {
    return LightsLoadedState(
      index: index ?? this.index,
      sliderValue: sliderValue ?? this.sliderValue,
      switchValue: switchValue ?? this.switchValue,
    );
  }

  double get sliderData => sliderValue;

  bool get switchData => switchValue;
}
