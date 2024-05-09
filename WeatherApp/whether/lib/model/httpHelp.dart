import 'package:whether/model/whether.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String baseURL = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'e77e558e80f3b53249ddb36c055b14f9';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameter = {
      'q': location,
      'appId': apiKey
    };

    Uri uri = Uri.https(baseURL, path, parameter);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weatherData = Weather.fromJson(data);
    return weatherData;
  }
}
