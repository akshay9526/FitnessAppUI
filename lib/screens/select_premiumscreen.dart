import 'package:fitness/screens/dashboard_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class SelectPremiumScreen extends StatefulWidget {
  const SelectPremiumScreen({super.key});

  @override
  State<SelectPremiumScreen> createState() => _SelectPremiumScreenState();
}

class _SelectPremiumScreenState extends State<SelectPremiumScreen> {
  String selectedLevel = 'onemonth';

  void selectGender(String gender) {
    setState(() {
      selectedLevel = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppStrings.premium,
          style: TextStyle(
            color: AppColors.bg_Top_Gradient,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.bg_Top_Gradient,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image with Gradient Overlay
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    "assets/images/select_goal_screen_img.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Foreground content over the background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.bg_Top_Gradient.withOpacity(0),
                  AppColors.bg_Bottom_Gradient.withOpacity(0.8),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Be Premium",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Get Unlimited Access",
                          style: TextStyle(
                            color: AppColors.bg_Top_Gradient,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Enjoy workout access without ads and restrictions",
                          style: TextStyle(
                            color: AppColors.bg_Bottom_Gradient.withOpacity(.8),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSelectAccessOption("onemonth", "1 Month",
                      "Pay once, Cancel any time", "1699.00"),
                  buildSelectAccessOption("sixmonth", "6 Month",
                      "Pay once, Cancel any time", "1699.00"),
                  buildSelectAccessOption("oneyear", "1 Year",
                      "Pay once, Cancel any time", "1699.00"),
                  const SizedBox(height: 20),
                  buildButtonWidget(
                    buttonColor: AppColors.primary,
                    textColor: AppColors.bg_Top_Gradient,
                    context: context,
                    label: 'Pay Now',
                    fontSize: 16,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectAccessOption(
      String option, String month, String message, String price) {
    final bool isSelected = selectedLevel == option;

    return GestureDetector(
      onTap: () => selectGender(option),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.bg_Top_Gradient.withOpacity(.9),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.bg_Top_Gradient,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
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
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
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
            Text(
              "₹. " + price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
