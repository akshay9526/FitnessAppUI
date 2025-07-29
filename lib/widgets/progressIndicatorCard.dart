import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/appColors.dart';

class ProgressIndicatorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bg_Top_Gradient.withOpacity(.9),
      clipBehavior: Clip.antiAlias,
      elevation: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          width: 0.2,
          color: AppColors.bg_Bottom_Gradient,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildItem(AppColors.primary, "50%", 0.5),
              _buildItem(AppColors.progress_g, "40%", 0.4),
              _buildItem(AppColors.progress_y, "85%", 0.8),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Divider(
              color: AppColors.black.withOpacity(.5),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Carbs",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "51g",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Total Fat",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "43g",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Protein",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "87g",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(Color color, String percentage, double per) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: per,
          animation: true, // Enable animation
          animationDuration: 1200, // Duration in milliseconds
          center: Text(
            percentage,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
      ),
    );
  }
}
