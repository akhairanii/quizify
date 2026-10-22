import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizify/constants/app_colors.dart';
import 'package:quizify/providers/auth_provider.dart';
import 'package:quizify/providers/quiz_provider.dart';
import 'package:quizify/providers/theme_provider.dart';
import 'package:quizify/data/quiz_data.dart';
import '../widgets/custom_button.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';
import 'history_screen.dart';
import 'signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedNav;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userName = authProvider.currentUser?.name ?? 'Pengguna';
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
                  'Quizify',
                  style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: isDark ? Colors.white : AppColors.primary,
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme(!isDark);
                    },
                  ),
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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      ClipOval(
                        child: Container(
                          height: 120,
                          width: 120,
                          color: AppColors.primarySoft,
                          child: Image.asset(
                            'assets/images/logo.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Halo, $userName!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Uji wawasan dan pengetahuan kamu tentang berbagai program studi bersama Quizify!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.white70 : AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: 'Mulai Kuis',
                        isSelected: _selectedNav == 'mulai',
                        onPressed: () {
                          setState(() {
                            _selectedNav = 'mulai';
                          });
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: isDark ? const Color(0xFF1E1A29) : AppColors.cardBg,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pilih Kategori Program Studi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isDark ? Colors.white : AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ...quizCategories.keys.map((category) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          tileColor: isDark ? const Color(0xFF121218) : AppColors.primarySoft.withOpacity(0.5),
                                          title: Text(
                                            category,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: isDark ? Colors.white : AppColors.textPrimary,
                                            ),
                                          ),
                                          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Provider.of<QuizProvider>(context, listen: false).loadQuiz(category);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const QuizScreen(),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedNav = 'riwayat';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                            color: _selectedNav == 'riwayat'
                                ? AppColors.primary.withOpacity(0.2)
                                : Colors.transparent,
                            border: Border.all(color: AppColors.primary, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Riwayat Kuis',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedNav = 'profil';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                            color: _selectedNav == 'profil'
                                ? AppColors.primary.withOpacity(0.2)
                                : Colors.transparent,
                            border: Border.all(color: AppColors.primary, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Lihat Profil',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
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