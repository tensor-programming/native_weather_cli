import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather/model/model.dart';

class WeatherApi {
  static const ID_URL =
      "https://www.metaweather.com/api/location/search/?query=[0]";
  static const API_URL = "https://www.metaweather.com/api/location/[0]/";

  Future<int> getCityId(String city) async {
    String url = ID_URL.replaceAll('[0]', city);
    http.Response res = await http.get(url);
    var json = jsonDecode(res.body);
    if ((json as List).isEmpty) {
      throw Exception("Can not find City");
    }
    return json[0]['woeid'];
  }

  Future<List<Weather>> getWeather(String city) async {
    int id = await getCityId(city);
    String url = API_URL.replaceAll('[0]', id.toString());
    http.Response res = await http.get(url);
    var json = jsonDecode(res.body);
    List<Weather> weather = [];

    (json['consolidated_weather'] as List<dynamic>)
      ..forEach(
        (j) => weather.add(Weather.fromJson(j)),
      );

    return weather;
  }
}
