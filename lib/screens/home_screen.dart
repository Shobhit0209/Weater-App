import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colos.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/headerwidget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkloading().isTrue
              ? Center(
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 65, 62, 62)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/weather/weather.gif',
                          height: 150,
                          width: 150,
                        ),
                        //  loadingProgres(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          'Updating weather...',
                          style: TextStyle(color: Colors.white),
                        ))
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Center(
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    const SizedBox(height: 20),
                    HeaderWidget(),
                    //widget for the current temperature ('current')
                    CurrentWeatherWidget(
                        weatherDataCurrent: globalController
                            .getweatherData()
                            .getcurrentweather()),
                    const SizedBox(height: 20),
                    HourlyWeatherWidget(
                        weatherDataHourly: globalController
                            .getweatherData()
                            .gethourlyweather()),
                    const SizedBox(height: 20),
                    DailylyWeatherWidget(
                        weatherDataDaily: globalController
                            .getweatherData()
                            .getdailyweather()),
                    SizedBox(
                      height: 10,
                    ),
                    ComfortLevel(
                        weatherDataCurrent: globalController
                            .getweatherData()
                            .getcurrentweather()),
                  ]),
                )))),
    );
  }

  Widget loadingProgres() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: 60,
        width: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.orbit,
          colors: [CustomColors.firstGradientColor, Colors.greenAccent],
          strokeWidth: 3,
        ));
  }
}
