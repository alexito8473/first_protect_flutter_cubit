import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/Todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) =>
      emit(state.copyWitch(filter: newFilter));
}
