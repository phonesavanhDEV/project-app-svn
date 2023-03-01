part of 'counter_bloc.dart';

class CounterState {
  final int count;

  CounterState({required this.count});
}

class InitialCounterState extends CounterState {
  InitialCounterState() : super(count: 0);
}

class UpdatedCounterState extends CounterState {
  UpdatedCounterState({required int count}) : super(count: count);
}
