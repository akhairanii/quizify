import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question_model.dart';

class QuizHistory {
  final int score;
  final String date;
  final String category;
  final int correctCount;
  final int incorrectCount;

  QuizHistory({
    required this.score,
    required this.date,
    required this.category,
    required this.correctCount,
    required this.incorrectCount,
  });
}

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = quizCategories['Mobile Programming']!;
  String _currentCategory = 'Mobile Programming';
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  int _correctAnswersCount = 0;

  final List<QuizHistory> _quizHistories = [];

  List<Question> get questions => _questions;
  String get currentCategory => _currentCategory;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswered => _isAnswered;
  List<QuizHistory> get quizHistories => _quizHistories;

  int get totalOverallScore {
    int total = 0;
    for (var history in _quizHistories) {
      total += history.score;
    }
    return total;
  }

  void loadQuiz(String category) {
    _currentCategory = category;
    _questions = quizCategories[category] ?? quizCategories['Mobile Programming']!;
    _currentQuestionIndex = 0;
    _score = 0;
    _correctAnswersCount = 0;
    _selectedAnswerIndex = null;
    _isAnswered = false;
    notifyListeners();
  }

  void selectAnswer(int index) {
    if (_isAnswered) return;

    _selectedAnswerIndex = index;
    _isAnswered = true;

    if (index == currentQuestion.correctAnswerIndex) {
      int pointsPerQuestion = (100 / _questions.length).round();
      _score += pointsPerQuestion;
      _correctAnswersCount++;
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
      int incorrect = _questions.length - _correctAnswersCount;
      _quizHistories.add(QuizHistory(
        score: _score,
        date: formattedDate,
        category: _currentCategory,
        correctCount: _correctAnswersCount,
        incorrectCount: incorrect,
      ));
      notifyListeners();
    }
    return false;
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _correctAnswersCount = 0;
    _selectedAnswerIndex = null;
    _isAnswered = false;
    notifyListeners();
  }
}