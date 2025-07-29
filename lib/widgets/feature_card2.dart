import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class FeatureCard2 extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color colorCode;

  const FeatureCard2(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.subtitle,
      required this.colorCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: colorCode,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Image section
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      iconPath,
                      width: 80,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Text & progress
                Expanded(
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
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(8),
                          value: 0.6,
                          backgroundColor: AppColors.primary.withOpacity(0.2),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.primary),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // "Beginner" label
          Positioned(
            top: 8,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Beginner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
