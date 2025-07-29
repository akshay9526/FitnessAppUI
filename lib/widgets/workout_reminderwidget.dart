import 'package:fitness/screens/workout_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class WorkoutReminderwidget extends StatelessWidget {
  final String title;
  final String ampm;
  final String subtitle;
  bool switchValue = true;

  WorkoutReminderwidget(
      {Key? key,
      required this.title,
      required this.ampm,
      required this.subtitle,
      required this.switchValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const WorkoutDetailsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.bg_Bottom_Gradient.withOpacity(.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Text & progress
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(.8),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ampm,
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subtitle,
                                  style: TextStyle(
                                    color: AppColors.black.withOpacity(.6),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: AppColors.primary,
                              value: switchValue,
                              onChanged: (value) {
                                switchValue = value;
                              },
                            ),
                          ),
                        ],
                      ),
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
