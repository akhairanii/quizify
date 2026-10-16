import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  final List<Question> _questions = sampleQuestions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswered => _isAnswered;

  void selectAnswer(int index) {
    if (_isAnswered) return;

    _selectedAnswerIndex = index;
    _isAnswered = true;

    if (index == currentQuestion.correctAnswerIndex) {
      _score += 10; // Tambah 10 poin per jawaban benar
    }
    notifyListeners();
  }

  bool nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _isAnswered = false;
      notifyListeners();
      return true; // Masih ada soal berikutnya
    }
    return false; // Kuis selesai
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedAnswerIndex = null;
    _isAnswered = false;
    notifyListeners();
  }
}