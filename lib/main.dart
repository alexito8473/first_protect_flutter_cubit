import 'package:first_protect_flutter_cubit/pages/screens/home_screen.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/filter/todo_filter_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/filtered/filtered_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/list/todo_list_cubit.dart';
import 'package:first_protect_flutter_cubit/structure/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtén el tema actual del dispositivo
    var brightness = MediaQuery.of(context).platformBrightness;

    // Comprueba si el tema es oscuro
    bool isDarkMode = brightness == Brightness.dark;

    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoListCubit>(
            create: (context) => TodoListCubit(),
          ),
          BlocProvider<TodoFilterCubit>(
            create: (context) => TodoFilterCubit(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(theme: isDarkMode?AppTheme.DARK:AppTheme.LIGHT),
          ),
          BlocProvider<FilteredCubit>(
            create: (context) => FilteredCubit(context.read<TodoListCubit>().state.all),
          ),
        ],
        child: BlocBuilder<ThemeCubit,ThemeState>(builder: (context, state) {
          return MaterialApp(
              title: 'First proyect example cubit',
              themeMode: ThemeMode.system,
              theme: state.theme == AppTheme.LIGHT
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: const HomeScreen(),
          );
        },) );
  }
}
