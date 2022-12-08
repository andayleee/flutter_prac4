import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListInitial> {
  ListCubit() : super(ListInitial(history: []));
  void addHistory(String action) {
    List history = state.history;
    history.add(action);
    emit(ListInitial(history: history));
  }
}
