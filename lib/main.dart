import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizify/constants/app_theme.dart';
import 'package:quizify/providers/auth_provider.dart';
import 'package:quizify/providers/quiz_provider.dart';
import 'package:quizify/providers/theme_provider.dart';
import 'package:quizify/screens/signin_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const QuizifyApp(),
    ),
  );
}

class QuizifyApp extends StatelessWidget {
  const QuizifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizify',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const SignInScreen(),
    );
  }
}