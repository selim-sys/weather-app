import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather-cubit/weather-cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';
class SearchScreen extends StatelessWidget {
   String? cityName;
   VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onChanged: (data){
              cityName = data;
            },
            onFieldSubmitted: (data) async{
              cityName = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);

            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 32,horizontal: 24),
              label: const Text('Search'),
              hintText: 'Enter City Name',
              suffixIcon: IconButton(
                onPressed: ()async{
                  WeatherServices service = WeatherServices();
                  WeatherModel weather = await service.getWeather(cityName: cityName!);
                  Navigator.pop(context);
                },
                  icon: const Icon(Icons.search)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(

                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}