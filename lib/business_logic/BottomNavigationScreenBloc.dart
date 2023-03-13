import 'package:bloc/bloc.dart';

class BottomNavigationBloc extends Bloc<int, int> {
  BottomNavigationBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
