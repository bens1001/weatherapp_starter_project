import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/modules/home/controller.dart';

class AppBarText extends StatelessWidget {
  AppBarText({super.key});

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, bottom: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homeController.city.value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text(
              "${homeController.date.value} ${homeController.time.value}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
