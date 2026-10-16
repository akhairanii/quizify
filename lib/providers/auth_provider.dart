import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  final List<User> _registeredUsers = [];
  String? _errorMessage;

  User? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;

  bool signUp({
    required String name,
    required String email,
    required String password,
    required String faculty,
    required String studyProgram,
  }) {
    bool exists = _registeredUsers.any((u) => u.email == email);
    if (exists) {
      _errorMessage = 'Email sudah terdaftar. Silakan masuk.';
      notifyListeners();
      return false;
    }

    final newUser = User(
        name: name,
        email: email,
        password: password,
        faculty: faculty,
        studyProgram: studyProgram,
    );
    _registeredUsers.add(newUser);
    _currentUser = newUser;
    _errorMessage = null;
    notifyListeners();
    return true;
  }

  bool signIn({required String email, required String password}) {
    try {
      final user = _registeredUsers.firstWhere(
            (u) => u.email == email && u.password == password,
      );
      _currentUser = user;
      _errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Email atau kata sandi salah!';
      notifyListeners();
      return false;
    }
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}