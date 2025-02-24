part of 'temp_settings_cubit.dart';

enum TempSettings {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempSettings tempSettings;
  const TempSettingsState({
    this.tempSettings = TempSettings.celsius,
  });

  factory TempSettingsState.initial() {
    return const TempSettingsState();
  }

  @override
  List<Object?> get props => [tempSettings];

  @override
  String toString() => 'TempSettingsState(tempSettings: $tempSettings)';

  TempSettingsState copyWith({
    TempSettings? tempSettings,
  }) {
    return TempSettingsState(
      tempSettings: tempSettings ?? this.tempSettings,
    );
  }
}
