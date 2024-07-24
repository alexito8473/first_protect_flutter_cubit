import 'package:first_protect_flutter_cubit/structure/cubits/filter/todo_filter_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Todo_model.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
        height: size.height * 0.1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                filterButton(context, Filter.ALL),
                filterButton(context, Filter.ACTIVE),
                filterButton(context, Filter.COMPLETED)
              ],
            )
          ],
        ));
  }

  Color changeColor(BuildContext context, Filter filter) =>
      filter == context.watch<TodoFilterCubit>().state.filter
          ? Colors.red
          : context.watch<ThemeCubit>().state.theme == AppTheme.LIGHT
              ? Colors.black
              : Colors.white;

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter.content(),
        style: TextStyle(fontSize: 30, color: changeColor(context, filter)),
      ),
    );
  }
}
