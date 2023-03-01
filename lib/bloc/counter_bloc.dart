import 'package:bloc/bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterEvent) {
      yield UpdatedCounterState(count: state.count + 1);
    } else if (event is DecrementCounterEvent) {
      yield UpdatedCounterState(count: state.count - 1);
    }
  }
}
