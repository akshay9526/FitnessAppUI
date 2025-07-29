import 'package:fitness/screens/height_weight_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  var age = 25;

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
              children: [
                // Top content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.old_r_u,
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
                      const SizedBox(height: 100),
                      Center(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_up,
                                  size: 32, color: AppColors.primary),
                              onPressed: () {
                                setState(() {
                                  if (age < 100) age++;
                                });
                              },
                            ),
                            NumberPicker(
                              value: age,
                              minValue: 18,
                              maxValue: 100,
                              onChanged: (value) => setState(() => age = value),
                              selectedTextStyle: TextStyle(
                                color: AppColors.primary,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  ),
                                  bottom: BorderSide(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                  size: 32, color: AppColors.primary),
                              onPressed: () {
                                setState(() {
                                  if (age > 18) age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Button
                buildButtonWidget(
                  buttonColor: AppColors.primary,
                  textColor: AppColors.bg_Top_Gradient,
                  context: context,
                  label: AppStrings.Continue,
                  fontSize: 16,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HeightWeightScreen()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
