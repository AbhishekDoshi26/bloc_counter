import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is GetInitialValueEvent) {
      yield CounterSuccessState(value: 0);
    } else if (event is IncrementValueEvent) {
      yield CounterSuccessState(value: event.value + 1);
    } else if (event is DecrementValueEvent) {
      yield CounterSuccessState(value: event.value - 1);
    }
  }
}
