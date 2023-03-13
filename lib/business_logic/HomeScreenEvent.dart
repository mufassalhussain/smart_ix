part of 'HomeScreenBloc.dart';

@immutable
abstract class HomeScreenEvent {}

class SetIndexEvent extends HomeScreenEvent {
  final int index;

  SetIndexEvent({required this.index});

  @override
  List<Object> get props => [index];
}
