import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_learning_event.dart';
part 'bloc_learning_state.dart';

class BlocLearningBloc extends Bloc<BlocLearningEvent, BlocLearningState> {
  BlocLearningBloc() : super(BlocLearningInitial()) {
    on<BlocLearningEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
