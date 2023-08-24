import 'package:flutter/material.dart';


class WeatherModel{
   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;
  WeatherModel(
      {
        required this.date,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['current']['last_updated'],
        temp: data['current']['temp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
   String getImage(){
   if(weatherStateName == 'Thunder'
       || weatherStateName == 'Thundery outbreaks in nearby'){
   return 'assets/images/thunderstorm.png';
   }
   else if(weatherStateName == 'Clear'
       || weatherStateName == 'Partly Cloud'){
     return 'assets/images/clear.png';
   }
   else if(weatherStateName == 'Cloudy'
       || weatherStateName == 'Overcast'){
     return 'assets/images/cloudy.png';
   }
   else if(weatherStateName == 'Patchy snow nearby'
       || weatherStateName == 'Patchy sleet nearby'
       || weatherStateName == 'Patchy freezing drizzle nearby'
       || weatherStateName == 'Blowing snow'
       || weatherStateName == 'Blizzard') {
     return 'assets/images/snow.png';
   }
   else if(weatherStateName == 'Patchy rain possible'
       || weatherStateName == 'Moderate rain'
       || weatherStateName == 'Mist'
       || weatherStateName == 'Light rain'
       || weatherStateName == 'Heavy rain'){
     return 'assets/images/rainy.png';
   }
   else if (weatherStateName == 'Fog' || weatherStateName == 'Freezing fog'){
     return 'assets/images/fog.png';
   }
   else{
   return 'assets/images/clear.png';
   }
}
   MaterialColor getThemeColor(){
     if(weatherStateName == 'Thunder'
         || weatherStateName == 'Thundery outbreaks in nearby'){
       return Colors.purple;
     }
     else if(weatherStateName == 'Sunny'){
       return Colors.orange;
     }
     else if(weatherStateName == 'Clear'
         || weatherStateName == 'Partly Cloud'){
       return Colors.cyan;
     }
     else if(weatherStateName == 'Cloudy'
         || weatherStateName == 'Overcast'){
       return Colors.blueGrey;
     }
     else if(weatherStateName == 'Patchy snow nearby'
         || weatherStateName == 'Patchy sleet nearby'
         || weatherStateName == 'Patchy freezing drizzle nearby'
         || weatherStateName == 'Blowing snow'
         || weatherStateName == 'Blizzard') {
       return Colors.grey;
     }
     else if(weatherStateName == 'Patchy rain possible'
         || weatherStateName == 'Moderate rain'
         || weatherStateName == 'Mist'
         || weatherStateName == 'Light rain'
         || weatherStateName == 'Heavy rain'){
       return Colors.blue;
     }
     else if (weatherStateName == 'Fog' || weatherStateName == 'Freezing fog'){
       return Colors.indigo;
     }
     else{
       return Colors.cyan;
     }
   }
}
