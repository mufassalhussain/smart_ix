import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/HomeScreenController.dart';

part 'HomeScreenEvent.dart';
part 'HomeScreenState.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeScreenController _controller;

  HomeScreenBloc({required HomeScreenController controller})
      : _controller = controller,
        super(HomeScreenState(index: 0)) {
    on<SetIndexEvent>((event, emit) {
      _controller.setIndex(event.index);
      emit(HomeScreenState(index: event.index));
    });
  }
}
