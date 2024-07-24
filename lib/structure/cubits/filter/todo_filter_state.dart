part of 'todo_filter_cubit.dart';

class TodoFilterState {
  final Filter filter;
  TodoFilterState({required this.filter});
  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.ALL);
  }
  TodoFilterState copyWitch({required Filter? filter}) {
    return TodoFilterState(filter: filter ?? this.filter);
  }
}
