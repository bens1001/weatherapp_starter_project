import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/core/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/modules/home/controller.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/app_bar_text.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/current_weather_container.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/info_container.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/info_containers.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/loading_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.checkLoading().value
          ? const LoadingContainer()
          : Scaffold(
              appBar: AppBar(
                title: AppBarText(),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeController.getLocation();
                      homeController.fetchCurrentWeather(
                          homeController.latitude.value,
                          homeController.longitude.value);
                      homeController.isLoading.value = true;
                    },
                    icon: const Icon(Icons.refresh_outlined),
                  )
                ],
              ),
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      title: CurrentWeatherContainer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, right: 100, top: 30, bottom: 30),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.dividerLine,
                      ),
                    ),
                    ListTile(
                      title: InfoContainers(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, right: 100, top: 30, bottom: 30),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.dividerLine,
                      ),
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Sunrise",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 15),
                              InfoContainer(
                                icon: 'weather/50d',
                                data:
                                    homeController.fetchedWeatherSunrise.value,
                                iconSize: 50,
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: CustomColors.dividerLine,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Sunset",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 15),
                              InfoContainer(
                                icon: 'weather/50n',
                                data: homeController.fetchedWeatherSunset.value,
                                iconSize: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, right: 100, top: 30, bottom: 30),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.dividerLine,
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Comfort Level',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.textColorBlack),
                          ),
                        ),
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: double.parse(
                              homeController.fetchedWeatherHumidity.value),
                          appearance: CircularSliderAppearance(
                            infoProperties: InfoProperties(
                              bottomLabelText: 'Humidity',
                              bottomLabelStyle: const TextStyle(
                                letterSpacing: 0.1,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            animationEnabled: true,
                            size: 140,
                            customWidths: CustomSliderWidths(
                              handlerSize: 0,
                              trackWidth: 12,
                              progressBarWidth: 12,
                            ),
                            customColors: CustomSliderColors(
                              hideShadow: true,
                              trackColor: CustomColors.firstGradientColor
                                  .withAlpha(100),
                              progressBarColors: [
                                CustomColors.firstGradientColor,
                                CustomColors.secondGradientColor,
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Feels like: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.textColorBlack),
                                    ),
                                    TextSpan(
                                      text:
                                          "${homeController.fetchedWeatherFeelsLike.value}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: CustomColors.textColorBlack),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 1,
                                color: CustomColors.dividerLine,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Min Temp: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.textColorBlack),
                                    ),
                                    TextSpan(
                                      text:
                                          "${homeController.fetchedWeatherTempMin.value}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: CustomColors.textColorBlack),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 1,
                                color: CustomColors.dividerLine,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Max Temp: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.textColorBlack),
                                    ),
                                    TextSpan(
                                      text:
                                          "${homeController.fetchedWeatherTempMax.value}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: CustomColors.textColorBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
