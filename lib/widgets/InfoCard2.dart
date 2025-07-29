import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class InfoCard2 extends StatelessWidget {
  final String weight;
  final String height;
  final String age;

  const InfoCard2({
    Key? key,
    required this.weight,
    required this.height,
    required this.age,
  }) : super(key: key);

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
      child: Row(
        children: [
          _buildItem('Weight', weight),
          _buildDivider(),
          _buildItem('Height', height),
          _buildDivider(),
          _buildItem('Age', age),
        ],
      ),
    );
  }

  Widget _buildItem(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.withOpacity(0.4),
    );
  }
}
