import 'package:weather/commands/command.dart';
import 'package:weather/model/model.dart';

class NowCmd extends WeatherCmd {
  final name = 'now';
  final description = "Prints weather for right now at the given city";
  final loadingMessage = "looking for the current weather in";

  @override
  Future<List<Weather>> getWeather(String city) async {
    return [(await WeatherCmd.weatherApi.getWeather(city))[0]];
  }
}
