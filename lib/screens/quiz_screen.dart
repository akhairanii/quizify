import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizify/constants/app_colors.dart';
import 'package:quizify/providers/quiz_provider.dart';
import 'package:quizify/providers/theme_provider.dart';
import 'package:quizify/widgets/custom_button.dart';
import 'package:quizify/widgets/option_card.dart';
import 'package:quizify/widgets/progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final question = quizProvider.currentQuestion;
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF1E1A29), const Color(0xFF121218)]
                : [const Color(0xFFF7F5FF), const Color(0xFFEEDCFF), const Color(0xFFD4F1FF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Kuis Pilihan Ganda',
                  style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary),
                ),
                iconTheme: IconThemeData(color: isDark ? Colors.white : AppColors.textPrimary),
                automaticallyImplyLeading: false,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProgressBar(
                        current: quizProvider.currentQuestionIndex + 1,
                        total: quizProvider.totalQuestions,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF2A233C) : AppColors.cardBg,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          question.questionText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
                          itemCount: question.options.length,
                          itemBuilder: (context, index) {
                            final optionText = question.options[index];
                            final isSelected = quizProvider.selectedAnswerIndex == index;
                            final isCorrect = index == question.correctAnswerIndex;

                            return OptionCard(
                              optionText: optionText,
                              isSelected: isSelected,
                              isAnswered: quizProvider.isAnswered,
                              isCorrect: isCorrect,
                              onTap: () {
                                quizProvider.selectAnswer(index);
                              },
                            );
                          },
                        ),
                      ),
                      if (quizProvider.isAnswered)
                        CustomButton(
                          text: quizProvider.currentQuestionIndex < quizProvider.totalQuestions - 1
                              ? 'Lanjut Soal Berikutnya ➔'
                              : 'Lihat Hasil Akhir',
                          onPressed: () {
                            bool hasNext = quizProvider.nextQuestion();
                            if (!hasNext) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ResultScreen(),
                                ),
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}