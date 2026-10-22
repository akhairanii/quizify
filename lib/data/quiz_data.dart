import '../models/question_model.dart';

final Map<String, List<Question>> quizCategories = {
  'Mobile Programming': [
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
  ],
  'Ilmu Komputer': [
    Question(
      questionText: 'Manakah yang termasuk perangkat penyimpanan sekunder?',
      options: ['RAM', 'Cache Memory', 'Hard Disk', 'Register'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Algoritma pencarian yang bekerja dengan membagi dua data terurut disebut...',
      options: ['Linear Search', 'Binary Search', 'Bubble Sort', 'DFS'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Komponen utama CPU yang melakukan operasi aritmatika dan logika adalah...',
      options: ['CU', 'ALU', 'RAM', 'ROM'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Struktur data yang menggunakan prinsip LIFO (Last In First Out) adalah...',
      options: ['Queue', 'Stack', 'Tree', 'Graph'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Gerbang logika yang menghasilkan nilai true jika kedua input bernilai true adalah...',
      options: ['OR', 'AND', 'NOT', 'NOR'],
      correctAnswerIndex: 1,
    ),
  ],
  'Teknik Informatika': [
    Question(
      questionText: 'Manakah yang merupakan basis data relasional?',
      options: ['MongoDB', 'MySQL', 'Redis', 'Cassandra'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Paradigma pemrograman yang berfokus pada objek disebut...',
      options: ['Procedural', 'OOP', 'Functional', 'Logical'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Protokol yang digunakan untuk pengiriman halaman web yang aman adalah...',
      options: ['HTTP', 'FTP', 'HTTPS', 'SMTP'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Proses mencari dan memperbaiki kesalahan pada kode program disebut...',
      options: ['Compiling', 'Debugging', 'Deploying', 'Designing'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Model SDLC yang pengerjaannya berurutan seperti air terjun disebut...',
      options: ['Agile', 'Scrum', 'Waterfall', 'Spiral'],
      correctAnswerIndex: 2,
    ),
  ],
  'Sistem Informasi': [
    Question(
      questionText: 'Sistem yang menyediakan informasi untuk mendukung pengambilan keputusan manajemen disebut...',
      options: ['TPS', 'DSS', 'Oasis', 'BIOS'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Tahapan pertama dalam analisis dan perancangan sistem adalah...',
      options: ['Perancangan', 'Implementasi', 'Identifikasi dan Investigasi', 'Pengujian'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Diagram yang memodelkan proses bisnis dan aliran data dalam sistem adalah...',
      options: ['ERD', 'DFD', 'UML', 'Class Diagram'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Perencanaan sumber daya perusahaan secara terintegrasi dikenal dengan istilah...',
      options: ['CRM', 'ERP', 'SCM', 'POS'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Evaluasi kelayakan sistem mencakup aspek teknis, operasional, dan...',
      options: ['Estetika', 'Ekonomis', 'Teoretis', 'Geografis'],
      correctAnswerIndex: 1,
    ),
  ],
};