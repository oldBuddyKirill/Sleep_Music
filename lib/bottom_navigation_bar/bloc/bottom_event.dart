part of 'bottom_bloc.dart';

@immutable
abstract class BottomEvent{}

class Tap extends BottomEvent{

  final int index;
  Tap(this.index);
}