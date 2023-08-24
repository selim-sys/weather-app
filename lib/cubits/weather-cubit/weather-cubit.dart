import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather-cubit/states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherService) : super (WeatherLoadingState());
  WeatherServices weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async{
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }

  }
}