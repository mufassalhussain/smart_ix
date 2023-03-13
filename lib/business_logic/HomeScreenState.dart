part of 'HomeScreenBloc.dart';

@immutable
class HomeScreenState {
  final int index;

  HomeScreenState({required this.index});

  factory HomeScreenState.initial() => HomeScreenState(index: 0);

  HomeScreenState copyWith({int? index}) {
    return HomeScreenState(index: index ?? this.index);
  }
}
