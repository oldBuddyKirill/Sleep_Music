part of 'bottom_bloc.dart';

@immutable
abstract class BottomState {}

class CurrentIndexChanged extends BottomState {
  final int currentIndex;
  CurrentIndexChanged(this.currentIndex);
}
