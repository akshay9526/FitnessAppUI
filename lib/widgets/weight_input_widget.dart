import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class WeightInputWidget extends StatefulWidget {
  final VoidCallback? onContinue;

  const WeightInputWidget({super.key, this.onContinue});

  @override
  State<WeightInputWidget> createState() => _WeightInputWidgetState();
}

class _WeightInputWidgetState extends State<WeightInputWidget> {
  int selectedWeight = 128;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "What is your weight?",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "$selectedWeight lbs",
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "${(selectedWeight * 0.453592).toStringAsFixed(1)} kg",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            perspective: 0.005,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedWeight = index + 50;
              });
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index + 50 > 300) return null;
                return Center(
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: index + 50 == selectedWeight
                        ? Colors.red
                        : Colors.grey.shade300,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
