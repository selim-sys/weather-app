import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather-cubit/states.dart';
import 'package:weather/cubits/weather-cubit/weather-cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';


class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
        if (state == WeatherLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        else if (state == WeatherSuccessState) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return SuccessBody(weatherData: weatherData!,);
        }

        else if (state == WeatherFailureState) {
          return Center(child: Text('Somthing Went Wrong'),);
        }

        else {
          return DefaultBody();
        }
      },),
    );
  }
}
class SuccessBody extends StatelessWidget {
   SuccessBody({
     required this.weatherData
  });
  WeatherModel weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.2,
                  1
                ],
                colors: [
                  // Provider.of<WeatherProvider>(context)
                  //     .weatherData!
                  //     .getThemeColor(),
                  // Provider.of<WeatherProvider>(context)
                  //     .weatherData!
                  //     .getThemeColor()[50]!,
                ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                // Provider.of<WeatherProvider>(context)?.cityName ?? '',
                '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                  ''),
              // 'Updated at:  ${Provider.of<WeatherProvider>(context).weatherData?.date} '),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image.asset(Provider.of<WeatherProvider>(context)
                  //     .weatherData!
                  //     .getImage()),
                  Text(
                    '',
                    // '${Provider.of<WeatherProvider>(context).weatherData?.temp.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                          ''),
                      // 'max: ${Provider.of<WeatherProvider>(context).weatherData?.maxTemp.toInt() ?? ''}'),
                      Text(
                          '')
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text(
                '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ));;
  }
}


class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen()));
            },
            child: const Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
