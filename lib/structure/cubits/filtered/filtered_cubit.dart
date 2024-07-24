import 'package:bloc/bloc.dart';

import '../../../models/Todo_model.dart';

part 'filtered_state.dart';

class FilteredCubit extends Cubit<FilteredState> {
  FilteredCubit(List<TodoModel> list) : super(FilteredState.initial(list));

  void setFiltered(Filter filter, List<TodoModel> filtered) {
    List<TodoModel> newListModel;
    switch (filter) {
      case Filter.ACTIVE:
        newListModel=filtered
            .where((element) => element.completed == false)
            .toList();
        break;
      case Filter.COMPLETED:
        newListModel=filtered
            .where((element) => element.completed == true)
            .toList();
        break;
      case Filter.ALL:
        newListModel=filtered;
    }
    emit(state.copyWith(filtered: newListModel));
  }
}
