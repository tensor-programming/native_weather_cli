import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:weather/api/api.dart';

import 'package:weather/model/model.dart';

abstract class WeatherCmd extends Command {
  String loadingMessage;

  static WeatherApi weatherApi = WeatherApi();

  Future<List<Weather>> getWeather(String city);

  @override
  Future<void> run() async {
    if (argResults.arguments.isEmpty) {
      throw Exception("City argument is required");
    }

    final city = argResults.arguments[0];
    final loadingString = loadingMessage + " $city";

    stdout.write("$loadingString\n");
    var weather = await getWeather(city);
    stdout.writeAll(weather);
  }
}
