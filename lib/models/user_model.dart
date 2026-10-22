class User {
  final String name;
  final String email;
  final String password;
  final String faculty;
  final String studyProgram;
  String reason;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.faculty,
    required this.studyProgram,
    this.reason = '',
  });
}