import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, List<String>> _universityData = {
    'Fakultas Kedokteran': ['Pendidikan Dokter', 'Ilmu Biomedik'],
    'Fakultas Hukum': ['Ilmu Hukum'],
    'Fakultas Pertanian': ['Agroteknologi', 'Agribisnis', 'Ilmu dan Teknologi Pangan', 'Manajemen Sumber Daya Perairan', 'Peternakan', 'Keteknikan Pertanian', 'Penyuluhan dan Komunikasi Pertanian'],
    'Fakultas Teknik': ['Teknik Sipil', 'Teknik Mesin', 'Teknik Elektro', 'Teknik Industri', 'Teknik Kimia', 'Arsitektur', 'Teknik Lingkungan'],
    'Fakultas Ekonomi dan Bisnis': ['Manajemen', 'Akuntansi', 'Ekonomi Pembangunan', 'Kewirausahaan'],
    'Fakultas Kedokteran Gigi': ['Pendidikan Dokter Gigi'],
    'Fakultas Ilmu Budaya': ['Sastra Indonesia', 'Sastra Inggris', 'Sastra Batak', 'Sastra Melayu', 'Sastra Jepang', 'Ilmu Sejarah', 'Etnomusikologi', 'Perpustakaan dan Sains Informasi'],
    'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)': ['Matematika', 'Fisika', 'Kimia', 'Biologi', 'Statistika', 'Aktuaria', 'Kimia Terapan'],
    'Fakultas Ilmu Sosial dan Ilmu Politik (FISIP)': ['Ilmu Administrasi Publik', 'Ilmu Administrasi Bisnis / Niaga', 'Ilmu Kesejahteraan Sosial', 'Ilmu Komunikasi', 'Ilmu Politik', 'Sosiologi', 'Antropologi Sosial'],
    'Fakultas Kesehatan Masyarakat (FKM)': ['Kesehatan Masyarakat', 'Gizi'],
    'Fakultas Farmasi': ['Farmasi'],
    'Fakultas Psikologi': ['Psikologi'],
    'Fakultas Keperawatan': ['Ilmu Keperawatan'],
    'Fakultas Ilmu Komputer dan Teknologi Informasi (Fasilkom-TI)': ['Ilmu Komputer', 'Teknologi Informasi'],
    'Fakultas Kehutanan': ['Kehutanan / Ilmu Kehutanan'],
    'Fakultas Vokasi': ['D3 Teknik Informatika', 'D3 Statistika', 'D3 Keuangan', 'D3 Akuntansi', 'D3 Kesekretariatan', 'D3 Perpajakan', 'D3 Perjalanan Wisata', 'D3 Perpustakaan', 'D3 Metrologi dan Instrumentasi', 'D3 Analis Farmasi dan Makanan'],
  };

  String? _selectedFaculty;
  String? _selectedStudyProgram;
  List<String> _availableStudyPrograms = [];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || _selectedFaculty == null || _selectedStudyProgram == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap lengkapi semua data, fakultas, dan prodi!')),
      );
      return;
    }

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kata sandi harus minimal 8 karakter!')),
      );
      return;
    }

    bool success = authProvider.signUp(
      name: name,
      email: email,
      password: password,
      faculty: _selectedFaculty!,
      studyProgram: _selectedStudyProgram!,
    );

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pendaftaran berhasil! Silakan tekan Masuk.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.errorMessage ?? 'Gagal mendaftar')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF1E1A29), const Color(0xFF121218)]
                : [const Color(0xFFF7F5FF), const Color(0xFFEEDCFF), const Color(0xFFD4F1FF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('Daftar Akun', style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary)),
                iconTheme: IconThemeData(color: isDark ? Colors.white : AppColors.textPrimary),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Buat Akun Baru',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Daftarkan diri kamu untuk mulai bermain kuis.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white70 : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Nama Lengkap',
                          prefixIcon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Alamat Email',
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Kata Sandi',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _selectedFaculty,
                          hint: Text(
                            'Pilih Fakultas',
                            style: TextStyle(color: isDark ? Colors.white70 : AppColors.textSecondary.withOpacity(0.6)),
                          ),
                          dropdownColor: isDark ? const Color(0xFF2A233C) : AppColors.cardBg,
                          isExpanded: true,
                          style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary, fontFamily: 'Urbanist', fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.business_outlined, color: AppColors.primary),
                            filled: true,
                            fillColor: isDark ? const Color(0xFF2A233C) : AppColors.cardBg,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: isDark ? AppColors.primary.withOpacity(0.4) : AppColors.primary.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.primary, width: 2),
                            ),
                          ),
                          items: _universityData.keys.map((String faculty) {
                            return DropdownMenuItem<String>(
                              value: faculty,
                              child: Text(faculty, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: (String? newFaculty) {
                            setState(() {
                              _selectedFaculty = newFaculty;
                              _selectedStudyProgram = null;
                              _availableStudyPrograms = _universityData[newFaculty] ?? [];
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _selectedStudyProgram,
                          hint: Text(
                            'Pilih Program Studi',
                            style: TextStyle(color: isDark ? Colors.white70 : AppColors.textSecondary.withOpacity(0.6)),
                          ),
                          dropdownColor: isDark ? const Color(0xFF2A233C) : AppColors.cardBg,
                          isExpanded: true,
                          style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary, fontFamily: 'Urbanist', fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.school_outlined, color: AppColors.primary),
                            filled: true,
                            fillColor: isDark ? const Color(0xFF2A233C) : AppColors.cardBg,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: isDark ? AppColors.primary.withOpacity(0.4) : AppColors.primary.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.primary, width: 2),
                            ),
                          ),
                          items: _availableStudyPrograms.map((String prodi) {
                            return DropdownMenuItem<String>(
                              value: prodi,
                              child: Text(prodi, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: _selectedFaculty == null ? null : (String? newProdi) {
                            setState(() {
                              _selectedStudyProgram = newProdi;
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'Daftar',
                          onPressed: _handleSignUp,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}