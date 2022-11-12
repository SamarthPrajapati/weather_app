import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather/model/weather_data_current.dart';
import 'package:weather/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, bottom: 20, left: 20, right: 20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(fontSize: 18),
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
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      handlerSize: 0,
                      trackWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: const TextStyle(
                          letterSpacing: 1,
                          fontSize: 14,
                          height: 1.5,
                        )),
                    size: 140,
                    animationEnabled: true,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: CustomColors.firstGradientColor.withAlpha(50),
                      progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Feels Like ',
                            style: TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.textColorBlack,
                            )),
                        TextSpan(
                            text: '${weatherDataCurrent.current.feelsLike}',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.textColorBlack,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 1,
                    margin: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'UV Index ',
                            style: TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.textColorBlack,
                            )),
                        TextSpan(
                            text: '${weatherDataCurrent.current.uvIndex}',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.textColorBlack,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
