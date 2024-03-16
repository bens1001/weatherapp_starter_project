import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/core/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/modules/home/controller.dart';

class CurrentWeatherContainer extends StatelessWidget {
  CurrentWeatherContainer({super.key});

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/weather/${homeController.fetchedWeatherImage}.png',
              height: 80,
              width: 80,
            ),
            Container(
              height: 30,
              width: 1,
              color: CustomColors.dividerLine,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${homeController.fetchedWeatherTemperature.value}°",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 68,
                        color: CustomColors.textColorBlack),
                  ),
                  TextSpan(
                    text: homeController.fetchedWeatherDescription.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
