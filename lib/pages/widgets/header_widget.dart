import 'package:first_protect_flutter_cubit/structure/cubits/list/todo_list_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Tareas",
              style: TextStyle(fontSize: 30.0),
            ),
            BlocBuilder<TodoListCubit, TodoListState>(
                builder: (context, state) => Text(
                    "Nº tareas: ${state.all.length}",
                    style: const TextStyle(fontSize: 20.0))),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Row(
                  children: [
                    const Icon(Icons.light_mode),
                    Switch(
                      value: state.theme!=AppTheme.LIGHT,
                      onChanged: (value) {
                        context.read<ThemeCubit>().changeTheme();
                      },
                    ),
                    const Icon(Icons.dark_mode),
                  ],
                );
              },
            )
          ],
        ));
  }
}
