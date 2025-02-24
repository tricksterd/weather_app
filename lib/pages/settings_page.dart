import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
// import 'package:weather_app/cubits/temp_settings/temp_settings_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit (Default: Celcius)'),
          trailing: Switch(
              value: context.watch<TempSettingsBloc>().state.tempSettings ==
                  TempSettings.celsius,
              onChanged: (_) {
                context.read<TempSettingsBloc>().add(ToggleTempUnitEvent());
              }),
        ),
      ),
    );
  }
}
