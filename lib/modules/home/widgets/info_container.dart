import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {super.key,
      required this.icon,
      required this.data,
      required this.iconSize});

  final String icon;
  final String data;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset('assets/$icon.png',
                height: iconSize, width: iconSize),
          ),
          const SizedBox(height: 10),
          Text(
            data,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
