import 'package:fitness/screens/select_goal_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class SelectActivityScreen extends StatefulWidget {
  const SelectActivityScreen({super.key});

  @override
  State<SelectActivityScreen> createState() => _SelectActivityScreenState();
}

class _SelectActivityScreenState extends State<SelectActivityScreen> {
  String selectedLevel = AppStrings.Intermediate;

  void selectGender(String gender) {
    setState(() {
      selectedLevel = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Top_Gradient,
        title: Text(
          '',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select activity level?",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 50,
                      child: Divider(
                        color: AppColors.primary,
                        thickness: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    buildSelectLevelOption("Beginner",
                        'I have not tried weighted exercise \n or just started.'),
                    buildSelectLevelOption("Intermediate",
                        'I have practiced common weighted exercise.'),
                    buildSelectLevelOption("Advanced",
                        'I have practiced strength-training for years.'),
                  ],
                ),
              ),
              buildButtonWidget(
                buttonColor: AppColors.primary,
                textColor: AppColors.bg_Top_Gradient,
                context: context,
                label: AppStrings.Continue,
                fontSize: 16,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SelectGoalScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectLevelOption(String option, String message) {
    final bool isSelected = selectedLevel == option;

    return GestureDetector(
      onTap: () => selectGender(option),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bg_Bottom_Gradient : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.bg_Bottom_Gradient
                : AppColors.bg_Bottom_Gradient,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primary,
              )
            else
              const Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
