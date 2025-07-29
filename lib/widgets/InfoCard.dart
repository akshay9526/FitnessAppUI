import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class InfoCard extends StatelessWidget {
  final String time;
  final String type;
  final String serving;

  const InfoCard({
    Key? key,
    required this.time,
    required this.type,
    required this.serving,
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
          _buildItem('Time', time),
          _buildDivider(),
          _buildItem('Type', type),
          _buildDivider(),
          _buildItem('Serving', serving),
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
