part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class GetInitialValueEvent extends CounterEvent {}

class IncrementValueEvent extends CounterEvent {
  final int value;
  IncrementValueEvent({this.value});
}

class DecrementValueEvent extends CounterEvent {
  final int value;
  DecrementValueEvent({this.value});
}
