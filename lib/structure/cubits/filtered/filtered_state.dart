part of 'filtered_cubit.dart';

class FilteredState {
  final List<TodoModel> filtered;
  const FilteredState({required this.filtered});
  factory FilteredState.initial(List<TodoModel> list) {
    return FilteredState(filtered: list);
  }
  FilteredState copyWith({required List<TodoModel>? filtered}) {
    return FilteredState(filtered: filtered ?? this.filtered);
  }
}
