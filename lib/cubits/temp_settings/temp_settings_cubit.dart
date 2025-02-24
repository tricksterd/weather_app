import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_state.dart';

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    final newUnit = state.tempSettings == TempSettings.celsius
        ? TempSettings.fahrenheit
        : TempSettings.celsius;
    emit(state.copyWith(
      tempSettings: newUnit,
    ));
  }
}
