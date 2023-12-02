import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/weatherBloc/weather_bloc.dart';
import '../../bloc/weatherBloc/weather_state.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/theme.dart';
import '../../utils/view.dart';

class CurrentLocationWeatherCard extends StatelessWidget {
  const CurrentLocationWeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherSuccess) {
        final weather = state.weather;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
          ),
          width: fullWidth(context) / 1.1,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    text_today,
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
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
