part of 'app_theme_cubit.dart';

@immutable
class AppThemeState {
  final bool isDark;
  final ThemeData currentTheme;
  const AppThemeState({
    required this.isDark,
    required this.currentTheme,
  });

  factory AppThemeState.initial() {
    return AppThemeState(
      isDark: false,
      currentTheme: AppTheme.lightTheme,
    );
  }

  AppThemeState copyWith({
    bool? isDark,
    ThemeData? currentTheme,
  }) {
    return AppThemeState(
      isDark: isDark ?? this.isDark,
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }

  @override
  String toString() =>
      'AppThemeInitial(isDark: $isDark, currentTheme: $currentTheme)';
}
