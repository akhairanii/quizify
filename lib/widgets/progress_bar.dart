import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final int current;
  final int total;

  const ProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double progress = current / total;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Soal $current dari $total',
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: AppColors.primarySoft,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
          ),
        ),
      ],
    );
  }
}