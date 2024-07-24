import 'package:bloc/bloc.dart';
import 'package:first_protect_flutter_cubit/models/Todo_model.dart';
import 'package:flutter/material.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());
  void changeCompleted(TodoModel todoModel) {
    state.all.firstWhere((element) => element == todoModel).completed =
        !todoModel.completed;
    emit(state.copyWitch(all: state.all));
  }

  void addTodo(TodoModel todoModel) {
    state.all.add(todoModel);
    emit(state.copyWitch(all: state.all));
  }
}
