import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class FeatureCard3 extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color colorCode;

  const FeatureCard3(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.subtitle,
      required this.colorCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              color: colorCode,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(
                left: 16, right: 80), // right padding for image
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            bottom: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                iconPath,
                width: 160,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
