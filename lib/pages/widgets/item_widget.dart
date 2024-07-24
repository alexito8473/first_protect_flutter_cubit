import 'package:first_protect_flutter_cubit/models/Todo_model.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/filter/todo_filter_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/filtered/filtered_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/list/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemWidget extends StatelessWidget {
  final TodoModel todo;
  final Size size;
  const ItemWidget({super.key, required this.todo, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<TodoListCubit>().changeCompleted(todo);
          context.read<FilteredCubit>().setFiltered(
              context.read<TodoFilterCubit>().state.filter,
              context.read<TodoListCubit>().state.all);
        },
        child: SizedBox(
            height: size.height * 0.1,
            width: size.width,
            child: Row(
              children: [
                AbsorbPointer(
                  absorbing: true,
                  child: Checkbox(
                    value: todo.completed,
                    onChanged: (bool? value) {},
                  ),
                ),
                Text(
                  todo.desc,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            )));
  }
}
