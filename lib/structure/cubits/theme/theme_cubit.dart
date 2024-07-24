import 'dart:ui';

import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required AppTheme theme}) : super(ThemeState.initial(theme: theme));

  void changeTheme(){
    emit(state.copyWith(theme: state.theme.reverse()));
  }

}
