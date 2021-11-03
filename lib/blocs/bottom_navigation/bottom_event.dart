part of 'bottom_bloc.dart';

@immutable
abstract class BottomEvent{}

class BottomTap extends BottomEvent{

  final int index;
  BottomTap(this.index);
}