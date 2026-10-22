import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question_model.dart';

class QuizHistory {
  final int score;
  final String date;

  QuizHistory({required this.score, required this.date});
}

class QuizProvider extends ChangeNotifier {
  final List<Question> _questions = sampleQuestions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  final List<QuizHistory> _quizHistories = [];

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswered => _isAnswered;
  List<QuizHistory> get quizHistories => _quizHistories;

  void selectAnswer(int index) {
    if (_isAnswered) return;

    _selectedAnswerIndex = index;
    _isAnswered = true;

    if (index == currentQuestion.correctAnswerIndex) {
      int pointsPerQuestion = (100 / _questions.length).round();
      _score += pointsPerQuestion;
    }
    notifyListeners();
  }

  bool nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _isAnswered = false;
      notifyListeners();
      return true;
    } else {
      String formattedDate = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}";
      _quizHistories.add(QuizHistory(score: _score, date: formattedDate));
      notifyListeners();
    }
    return false;
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedAnswerIndex = null;
    _isAnswered = false;
    notifyListeners();
  }
}