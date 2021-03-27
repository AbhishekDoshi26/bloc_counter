part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterSuccessState extends CounterState {
  final int value;
  CounterSuccessState({this.value});
}
