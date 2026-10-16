import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizify/constants/app_colors.dart';
import 'package:quizify/providers/auth_provider.dart';
import 'package:quizify/providers/quiz_provider.dart';
import '../widgets/custom_button.dart';
import 'quiz_screen.dart';
import 'signin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.currentUser?.name ?? 'Pengguna';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.error),
            onPressed: () {
              authProvider.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.quiz_rounded,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Halo, $userName! 👋',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Uji wawasan dan pengetahuan kamu tentang Mobile Programming bersama Quizify!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Mulai Kuis 🚀',
                onPressed: () {
                  Provider.of<QuizProvider>(context, listen: false).resetQuiz();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}