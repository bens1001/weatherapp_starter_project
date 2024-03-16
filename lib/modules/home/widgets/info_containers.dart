import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/core/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/modules/home/controller.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/info_container.dart';

class InfoContainers extends StatelessWidget {
  InfoContainers({super.key});

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoContainer(
            icon: 'windspeed',
            data: "${homeController.fetchedWeatherWindSpeed.value}km/h",
          ),
          Container(
            height: 30,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          InfoContainer(
            icon: 'clouds',
            data: "${homeController.fetchedWeatherCloud.value}%",
          ),
          Container(
            height: 30,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          InfoContainer(
            icon: 'humidity',
            data: "${homeController.fetchedWeatherHumidity.value}%",
          ),
        ],
      ),
    );
  }
}
