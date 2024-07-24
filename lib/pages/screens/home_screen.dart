import 'package:first_protect_flutter_cubit/models/Todo_model.dart';
import 'package:first_protect_flutter_cubit/pages/widgets/header_widget.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/list/todo_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/search_widget.dart';
import '../widgets/show_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Nueva tarea'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Introduce la tarea que quieres hacer',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Añadir'),
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          context.read<TodoListCubit>().addTodo(TodoModel(
                              id: context
                                  .read<TodoListCubit>()
                                  .state
                                  .all
                                  .length
                                  .toString(),
                              desc: controller.text));
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: const SafeArea(
            child: Column(
          children: [
            HeaderWidget(),
            SearchWidget(),
            Expanded(child: ShowWidget())
          ],
        )));
  }
}
