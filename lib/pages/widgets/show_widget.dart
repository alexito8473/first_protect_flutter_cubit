import 'package:first_protect_flutter_cubit/structure/cubits/filter/todo_filter_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/filtered/filtered_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/list/todo_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Todo_model.dart';
import 'item_widget.dart';

class ShowWidget extends StatelessWidget {
  const ShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocListener<TodoFilterCubit, TodoFilterState>(
        listener: (context, state) {
      context
          .read<FilteredCubit>()
          .setFiltered(state.filter, context.read<TodoListCubit>().state.all);
    }, child: BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        var all = context.watch<FilteredCubit>().state.filtered;
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              todo: all[index],
              size: size,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.blue,
            );
          },
          itemCount: all.length,
        );
      },
    ));
  }
}
