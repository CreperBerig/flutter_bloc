import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0, fontSize: 24)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(
        counterValue: state.counterValue + 1,
        fontSize: state.fontSize
      ));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(
        counterValue: state.counterValue - 1,
        fontSize: state.fontSize
      ));
    });

    on<ChangeFontSizeEvent>((event, emit) {
      emit(CounterState(
        counterValue: state.counterValue,
        fontSize: state.fontSize + 2
      ));
    });
  }
}