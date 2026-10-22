class User {
  final String name;
  final String email;
  final String password;
  final String faculty;
  final String studyProgram;
  String motivation;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.faculty,
    required this.studyProgram,
    this.motivation = '',
  });
}