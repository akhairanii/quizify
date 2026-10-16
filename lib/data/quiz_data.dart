import '../models/question_model.dart';

final List<Question> sampleQuestions = [
  Question(
    questionText: 'Widget apa yang digunakan untuk membuat tampilan stateless di Flutter?',
    options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'Provider'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'Bahasa pemrograman utama yang digunakan dalam pengembangan Flutter adalah...',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: 'Komponen apa yang digunakan untuk menangani state management dinamis di Flutter?',
    options: ['Container', 'Text', 'StatefulWidget', 'Column'],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: 'File konfigurasi utama untuk mendaftarkan aset dan dependensi di Flutter adalah...',
    options: ['main.dart', 'pubspec.yaml', 'AndroidManifest.xml', 'build.gradle'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'Widget apa yang digunakan untuk menyusun elemen secara vertikal?',
    options: ['Row', 'Stack', 'Column', 'GridView'],
    correctAnswerIndex: 2,
  ),
];