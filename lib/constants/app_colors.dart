import 'package:flutter/material.dart';

class AppColors {
  // Warna Utama (Primary & Secondary)
  static const Color primary = Color(0xFF9B82EC);       // Ungu Muda (Aksen Utama / Tombol)
  static const Color primarySoft = Color(0xFFE8E0FF);   // Ungu Pastel (Background Kartu / Highlight)
  static const Color secondary = Color(0xFF82C8EC);     // Biru Soft (Elemen Pendukung / Progres Bar)
  static const Color accentPink = Color(0xFFFF9ECD);    // Pink Soft (Aksen Menarik / Skor)

  // Warna Background & Permukaan
  static const Color background = Color(0xFFF7F5FF);    // Background Utama (Sangat Lembut di Mata)
  static const Color cardBg = Colors.white;             // Warna Kartu/Container

  // Warna Teks
  static const Color textPrimary = Color(0xFF332A4A);   // Ungu Gelap (Untuk Teks Utama agar Kontras)
  static const Color textSecondary = Color(0xFF7E7398); // Ungu Abu-Abu (Untuk Subtitle/Teks Sekunder)

  // Warna Status Jawaban
  static const Color success = Color(0xFF7ED9B1);       // Hijau Pastel (Jawaban Benar)
  static const Color error = Color(0xFFFFB2B2);         // Merah/Pink Soft (Jawaban Salah)
}