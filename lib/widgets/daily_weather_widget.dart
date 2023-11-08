import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colos.dart';

class DailylyWeatherWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailylyWeatherWidget({super.key, required this.weatherDataDaily});
  //String manipulation
  String getday(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            "Next Days",
            style: TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
          ),
        ),
        Dailylist(),
      ]),
    );
  }

  Widget Dailylist() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Text(
                          getday(weatherDataDaily.daily[index].dt),
                          style: TextStyle(
                              color: CustomColors.textColorBlack, fontSize: 13),
                        )),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                    ),
                    Text(
                        '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°')
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
