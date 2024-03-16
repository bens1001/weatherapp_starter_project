import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/core/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/modules/home/controller.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/app_bar_title.dart';
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
                title: AppBarTitle(),
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
                    const SizedBox(height: 20),
                    ListTile(
                      title: InfoContainers(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
