part of 'todo_list_cubit.dart';

class TodoListState {
  final List<TodoModel> all;
  TodoListState({required this.all});
  factory TodoListState.initial(){
    return TodoListState(all: [
      TodoModel(id: "1", desc: "Hacer deporte"),
      TodoModel(id: "2", desc: "Hacer la cama"),
      TodoModel(id: "3", desc: "Hacer el desayuno"),
    ]);
  }
  TodoListState copyWitch({required List<TodoModel>? all}){
    return TodoListState(all: all?? this.all);
  }
}

