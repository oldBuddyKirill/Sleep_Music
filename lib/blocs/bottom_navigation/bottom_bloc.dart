import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_event.dart';
part 'bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {
  int currentIndex = 0;
  BottomBloc() : super(CurrentIndexChanged(0)) {
    on<Tap>((event, emit) {
      currentIndex = event.index;
      emit(CurrentIndexChanged(currentIndex));
    });
  }
}
