import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';
class WeatherServices{
  Future<WeatherModel> getWeather({required String cityName,}) async{
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'b9bbb5e90e8e4ec4a8045329230108';
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
   http.Response response = await http.get(url);

   Map<String, dynamic> data= jsonDecode(response.body);


   WeatherModel weather = WeatherModel.fromJson(data);

   return weather;
  }
}