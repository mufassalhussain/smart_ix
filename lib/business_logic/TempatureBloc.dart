import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_ix/controllers/TempatureController.dart';

class TempatureState {
  final int selectedIndex;
  final double temperature;

  TempatureState({
    required this.selectedIndex,
    required this.temperature,
  });

  TempatureState copyWith({
    int? selectedIndex,
    double? temperature,
  }) {
    return TempatureState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      temperature: temperature ?? this.temperature,
    );
  }
}

class TempatureBloc extends BlocBase<TempatureState> {
  TempatureBloc() : super(TempatureState(selectedIndex: 0, temperature: 0));

  void updateSelectedIndex(int newIndex) {
    emit(state.copyWith(selectedIndex: newIndex));
  }

  void updateTempature(double temp) {
    // Add logic to update the temperature state here
  }

  void updateTemperature(double newTemperature) {
    emit(state.copyWith(temperature: newTemperature));
  }
}
