import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colos.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 1, bottom: 20, right: 20),
          child: Text(
            "Comfort Level",
            style: TextStyle(color: CustomColors.textColorBlack, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                    min: 0,
                    max: 100,
                    initialValue:
                        weatherDataCurrent.current.humidity!.toDouble(),
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            handlerSize: 0,
                            trackWidth: 12,
                            progressBarWidth: 12),
                        infoProperties: InfoProperties(
                            bottomLabelText: "Humidity",
                            bottomLabelStyle: TextStyle(
                                letterSpacing: 0.1, fontSize: 15, height: 1.5)),
                        animationEnabled: true,
                        size: 140,
                        customColors: CustomSliderColors(
                            hideShadow: true,
                            trackColor:
                                CustomColors.firstGradientColor.withAlpha(100),
                            progressBarColors: [
                              CustomColors.firstGradientColor,
                              CustomColors.secondGradientColor
                            ]))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Feels Like",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text:
                            " ${weatherDataCurrent.current.feelslike?.toDouble()}",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400))
                  ])),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "UV Index",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text:
                            " ${weatherDataCurrent.current.uvindex?.toDouble()}",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400))
                  ]))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
