import 'package:fitness/widgets/buildButtonWidget2.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import 'buildButtonWidget.dart';

class FilterBottomSheet extends StatelessWidget {
  final List<String> type;
  final String? selectedType;
  final ValueChanged<String?> onTypeSelected;

  final List<String> durations;
  final String? selectedDuration;
  final ValueChanged<String?> onDurationSelected;

  final VoidCallback onCancel;
  final VoidCallback onApply;

  const FilterBottomSheet({
    Key? key,
    required this.type,
    required this.selectedType,
    required this.onTypeSelected,
    required this.durations,
    required this.selectedDuration,
    required this.onDurationSelected,
    required this.onCancel,
    required this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Types",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: type.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 0.8,
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                  itemBuilder: (context, index) {
                    final item = type[index];
                    return RadioListTile<String>(
                      title: Text(item),
                      value: item,
                      groupValue: selectedType,
                      onChanged: onTypeSelected,
                      activeColor: AppColors.primary,
                    );
                  },
                ),
              ),
            ),
            Text(
              "Durations",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: durations.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 0.8,
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                  itemBuilder: (context, index) {
                    final item = durations[index];
                    return RadioListTile<String>(
                      title: Text(item),
                      value: item,
                      groupValue: selectedDuration,
                      onChanged: onDurationSelected,
                      activeColor: AppColors.primary,
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: buildButtonWidget2(
                        context: context,
                        label: 'Continue',
                        onTap: () {},
                        fontSize: 16,
                        textColor: AppColors.primary,
                        buttonColor: Colors.white,
                        borderColor: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: buildButtonWidget(
                        buttonColor: AppColors.primary,
                        textColor: AppColors.bg_Top_Gradient,
                        context: context,
                        label: 'Apply',
                        fontSize: 16,
                        onTap: onApply,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
