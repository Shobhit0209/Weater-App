// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_colos.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyWeatherWidget({
    Key? key,
    required this.weatherDataHourly,
  }) : super(key: key);

  //card index
  RxInt cardindex = GlobalController().getindex();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          alignment: Alignment.topCenter,
          child: Text('Today', style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 5,
        ),
        Hourlylist()
      ],
    );
  }

  Widget Hourlylist() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      height: 160,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 185, 231, 194),
          borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 20
            : weatherDataHourly.hourly.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx((() => GestureDetector(
                onTap: () {
                  cardindex.value = index;
                },
                child: Container(
                  width: 80,
                  margin: EdgeInsets.only(left: 16, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.5, 0),
                            blurRadius: 30,
                            spreadRadius: 1,
                            color: CustomColors.dividerLine.withAlpha(150))
                      ],
                      gradient: cardindex.value == index
                          ? LinearGradient(colors: [
                              CustomColors.firstGradientColor,
                              CustomColors.secondGradientColor
                            ])
                          : null),
                  child: HourlyDetails(
                      index: index,
                      cardindex: cardindex.toInt(),
                      timestamp: weatherDataHourly.hourly[index].dt!,
                      temp: weatherDataHourly.hourly[index].temp!,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon!),
                ),
              )));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int temp;
  int timestamp;
  String weatherIcon;
  int index;
  int cardindex;

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.timestamp,
    required this.weatherIcon,
    required this.index,
    required this.cardindex,
  }) : super(key: key);

  String getTime(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String y = DateFormat('jm').format(time);
    return y;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            getTime(timestamp),
            style: TextStyle(
                color:
                    cardindex == index ? CustomColors.cardColor : Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset('assets/weather/$weatherIcon.png',
              height: 32, width: 32),
        ),
        Container(
          child: Text('$temp°',
              style: TextStyle(
                  color: cardindex == index
                      ? CustomColors.cardColor
                      : Colors.black)),
        )
      ],
    ));
  }
}
