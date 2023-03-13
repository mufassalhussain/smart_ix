import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'LightsEvent.dart';
part 'LightsState.dart';

class LightsBloc extends Bloc<LightsEvent, LightsState> {
  int _index = 0;
  double _sliderValue = 50.0;
  bool _switchValue = false;
  LightsBloc()
      : super(LightsLoadedState(
            index: 0, sliderValue: 50.0, switchValue: false)) {
    on<SetIndexEvent>((event, emit) {
      _index = event.index;
      emit(LightsLoadedState(
        index: _index,
        sliderValue: _sliderValue,
        switchValue: _switchValue,
      ));
    });
    on<SetSliderDataEvent>((event, emit) {
      _sliderValue = event.sliderData;
      emit(LightsLoadedState(
        index: _index,
        sliderValue: _sliderValue,
        switchValue: _switchValue,
      ));
    });
    on<SetSwitchDataEvent>((event, emit) {
      _switchValue = event.switchData;
      emit(LightsLoadedState(
        index: _index,
        sliderValue: _sliderValue,
        switchValue: _switchValue,
      ));
    });
  }

  void setIndex(int index) {
    add(SetIndexEvent(index));
  }

  void setSliderData(double sliderData) {
    add(SetSliderDataEvent(sliderData));
  }

  void setSwitchData(bool switchData) {
    add(SetSwitchDataEvent(switchData));
  }
}

class LightInitial extends LightsState {
  final int index;
  final double sliderData;
  final bool switchData;

  LightInitial({
    required this.index,
    required this.sliderData,
    required this.switchData,
  });

  @override
  List<Object?> get props => [index, sliderData, switchData];
}
