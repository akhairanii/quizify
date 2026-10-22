import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/theme_provider.dart';

class OptionCard extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.optionText,
    required this.isSelected,
    required this.isAnswered,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    Color cardColor = isDark ? const Color(0xFF2A233C) : AppColors.cardBg;
    Color textColor = isDark ? Colors.white : AppColors.textPrimary;
    Color borderColor = isDark ? AppColors.primary.withOpacity(0.3) : AppColors.primarySoft;

    if (isAnswered) {
      if (isSelected) {
        cardColor = isCorrect ? AppColors.success : AppColors.error;
        borderColor = isCorrect ? AppColors.success : AppColors.error;
        textColor = AppColors.textPrimary;
      } else if (isCorrect) {
        cardColor = AppColors.success.withOpacity(0.3);
        borderColor = AppColors.success;
        textColor = isDark ? Colors.white : AppColors.textPrimary;
      }
    } else if (isSelected) {
      borderColor = AppColors.primary;
      cardColor = isDark ? const Color(0xFF3B3054) : AppColors.primarySoft;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}