part of 'theme_cubit.dart';

enum AppTheme {
  DARK,
  LIGHT;

  AppTheme reverse() {
    return this == AppTheme.DARK ? AppTheme.LIGHT : AppTheme.DARK;
  }
}

class ThemeState {
  final AppTheme theme;
  ThemeState({required this.theme});
  factory ThemeState.initial({required AppTheme theme}) {
    return ThemeState(theme: theme);
  }
  ThemeState copyWith({required AppTheme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
