import 'package:fitness/screens/select_activity.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:fitness/widgets/weight_input_widget.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';
import '../widgets/height_weight_input_widget.dart';

class HeightWeightScreen extends StatefulWidget {
  const HeightWeightScreen({super.key});

  @override
  State<HeightWeightScreen> createState() => _HeightWeightScreenState();
}

class _HeightWeightScreenState extends State<HeightWeightScreen> {
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
                      AppStrings.height_weight,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 150,
                      child: HeightInputWidget(),
                    ),
                    const SizedBox(
                      height: 250,
                      child: WeightInputWidget(),
                    )
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
                      builder: (context) => const SelectActivityScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
