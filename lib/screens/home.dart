import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/components/appLoader.dart';
import 'package:weather_app/screens/widgets/hourly_weather_widget.dart';
import 'package:weather_app/screens/widgets/location_weather_card.dart';
import 'package:weather_app/screens/widgets/random_text_widget.dart';
import 'package:weather_app/utils/images.dart';
import 'package:weather_app/utils/view.dart';

import '../bloc/weatherBloc/weather_bloc.dart';
import '../bloc/weatherforecast_bloc/weatherforecast_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context).state;
    BlocProvider.of<WeatherForeCastBloc>(context).state;
    showLoader();
    super.initState();
  }

  void showLoader(){
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  !isLoading?const AppLoader():Container(
          padding: const EdgeInsets.all(25),
          height: fullHeight(context),
          width: fullWidth(context),
          decoration: const BoxDecoration(
              image:
              DecorationImage(image: AssetImage(imageBg), fit: BoxFit.fill)),
          child: ListView(
            children: const [
              CurrentLocationWeatherCard(),
              HourlyWeatherWidget(),
              RandomTextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}





