import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather-cubit/weather-cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {
   WeatherApp({ Key? key }) : super(key: key);
   WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Provider.of<WeatherProvider>(context).weatherData?.getThemeColor() == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}