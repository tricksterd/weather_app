import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_event.dart';
part 'temp_settings_state.dart';

class TempSettingsBloc extends Bloc<TempSettingsEvent, TempSettingsState> {
  TempSettingsBloc() : super(TempSettingsState.initial()) {
    on<ToggleTempUnitEvent>(_toggleUnit);
  }

  void _toggleUnit(
      ToggleTempUnitEvent event, Emitter<TempSettingsState> emit) {
    final newUnit = state.tempSettings == TempSettings.celsius
        ? TempSettings.fahrenheit
        : TempSettings.celsius;
    emit(state.copyWith(
      tempSettings: newUnit,
    ));
  }
}
