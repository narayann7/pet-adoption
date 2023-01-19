part of 'app_global_cubit.dart';

@immutable
class AppGlobalState {
  final bool isDark;
  final ThemeData currentTheme;
  final int buttomNavIndex;

  const AppGlobalState({
    required this.isDark,
    required this.currentTheme,
    required this.buttomNavIndex,
  });

  factory AppGlobalState.initial({
    bool isDark = false,
  }) {
    return AppGlobalState(
      isDark: isDark,
      currentTheme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      buttomNavIndex: 0,
    );
  }

  AppGlobalState copyWith({
    bool? isDark,
    ThemeData? currentTheme,
    int? buttomNavIndex,
  }) {
    return AppGlobalState(
      isDark: isDark ?? this.isDark,
      currentTheme: currentTheme ?? this.currentTheme,
      buttomNavIndex: buttomNavIndex ?? this.buttomNavIndex,
    );
  }

  @override
  String toString() =>
      'AppGlobalState(isDark: $isDark, currentTheme: $currentTheme, buttomNavIndex: $buttomNavIndex)';
}
