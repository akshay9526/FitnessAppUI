import 'package:fitness/screens/dashboard_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class Congratulationscreen extends StatefulWidget {
  const Congratulationscreen({super.key});

  @override
  State<Congratulationscreen> createState() => _CongratulationscreenState();
}

class _CongratulationscreenState extends State<Congratulationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.bg_Top_Gradient,
              AppColors.bg_Bottom_Gradient,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/workout.png',
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              AppStrings.congrats,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppStrings.complete_workout_msg,
              style: TextStyle(
                color: AppColors.black.withOpacity(.6),
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: buildButtonWidget(
                  buttonColor: AppColors.primary,
                  textColor: AppColors.bg_Bottom_Gradient,
                  context: context,
                  label: AppStrings.home,
                  fontSize: 16,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
