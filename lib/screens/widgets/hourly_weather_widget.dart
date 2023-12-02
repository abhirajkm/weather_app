import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/weatherforecast_bloc/weatherforecast_bloc.dart';
import '../../utils/images.dart';
import '../../utils/theme.dart';
import '../../utils/view.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor.withOpacity(.9),
      ),
      width: fullWidth(context) / 1.1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              WeatherListItem(index: 0),
              WeatherListItem(index: 1),
              WeatherListItem(index: 2),
              WeatherListItem(index: 3),
            ],
          ),
          const Divider(color: white, thickness: 1.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              WeatherListItem(index: 4),
              WeatherListItem(index: 5),
              WeatherListItem(index: 6),
              WeatherListItem(index: 7),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherListItem extends StatelessWidget {
  final int index;
  const WeatherListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForeCastBloc, WeatherForeCastState>(
      builder: (context, state) {
        if (state is WeatherForeCastSuccess) {
          final weatherList = state.hourlyWeather;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.jm().format(weatherList[index].date!).toString(),
                style: poppins15,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    imageCloudWhite,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${weatherList[index].temperature!.celsius!.round().toString()}°C",
                    style: poppins15,
                  )
                ],
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
