import 'package:weather/commands/command.dart';
import 'package:weather/model/model.dart';

class WeekCmd extends WeatherCmd {
  final name = 'week';
  final description = "Prints weather for the week in given city";
  final loadingMessage = "Looking for weekly weather in";

  @override
  Future<List<Weather>> getWeather(String city) async {
    return await WeatherCmd.weatherApi.getWeather(city);
  }
}
