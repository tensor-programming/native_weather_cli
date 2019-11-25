import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:weather/commands/now.dart';
import 'package:weather/commands/week.dart';

Future<void> weatherCLI(List<String> args) async {
  final runner = CommandRunner('weather', 'Dart weather CLI');

  runner
    ..addCommand(
      NowCmd(),
    )
    ..addCommand(
      WeekCmd(),
    );

  return await runner.run(args).catchError((e) {
    stdout.write("${e ?? "An Error Occured"}");

    exitCode = 1;
  });
}
