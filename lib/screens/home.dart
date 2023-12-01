import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/utils/images.dart';
import 'package:weather_app/utils/strings.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/utils/view.dart';

import '../bloc/weather_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
    if( state is WeatherSuccess){
      final weather = state.weather;
      return Container(
        padding: const EdgeInsets.all(25),
        height: fullHeight(context),
        width: fullWidth(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBg), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
              ),
              width: fullWidth(context) / 1.3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Today",
                        style: poppins25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Icon(
                          Icons.expand_more,
                          color: textLightBrown,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imageCloud,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${weather.temperature!.celsius!.round().toString()}°C',
                        style: poppins63,
                      ),
                    ],
                  ),
                  Text(
                    weather.weatherMain!,
                    style: poppins13,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weather.areaName!,
                    style: poppins10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    DateFormat(text_dd_mm_yy).format(weather.date!),
                    style: poppins10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ('$text_feels_like${weather.tempFeelsLike!.celsius!.round()} '),
                        style: poppins10,
                      ),
                      const Text(
                        "|",
                        style: poppins10,
                      ),
                      Text(
                        ('$text_sunset${DateFormat.Hm().format(weather.sunset!)} '),
                        style: poppins10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            HourlyWeatherWidget()
          ],
        ),
      );
    }else{
      return const SizedBox.shrink();
    }

  },
),
    );
  }
}


class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      width: fullWidth(context) / 1.3,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
