import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _motivationController = TextEditingController();
  bool _isEditing = false;
  String _tempMotivation = '';

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _motivationController.text = authProvider.currentUser?.motivation ?? '';
    _tempMotivation = _motivationController.text;
  }

  @override
  void dispose() {
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final user = authProvider.currentUser;
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
                title: Text(
                  'Profil Pengguna',
                  style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary),
                ),
                iconTheme: IconThemeData(color: isDark ? Colors.white : AppColors.textPrimary),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E1A29) : AppColors.cardBg,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.06),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: AppColors.primarySoft,
                              child: Text(
                                user != null && user.name.isNotEmpty ? user.name[0].toUpperCase() : 'P',
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              user?.name ?? 'Pengguna',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user?.email ?? '-',
                              style: TextStyle(fontSize: 14, color: isDark ? Colors.white70 : AppColors.textSecondary),
                            ),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Fakultas', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                      const SizedBox(height: 4),
                                      Text(
                                        user?.faculty ?? '-',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark ? Colors.white : AppColors.textPrimary),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(height: 30, width: 1, color: AppColors.primarySoft),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Program Studi', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                      const SizedBox(height: 4),
                                      Text(
                                        user?.studyProgram ?? '-',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark ? Colors.white : AppColors.textPrimary),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kata-kata Semangat / Motivasi',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimary),
                          ),
                          if (!_isEditing)
                            IconButton(
                              icon: const Icon(Icons.edit, color: AppColors.primary),
                              onPressed: () {
                                setState(() {
                                  _tempMotivation = _motivationController.text;
                                  _isEditing = true;
                                });
                              },
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tuliskan motivasi atau kata-kata semangat belajar Anda:',
                        style: TextStyle(fontSize: 13, color: isDark ? Colors.white70 : AppColors.textSecondary),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _motivationController,
                        enabled: _isEditing,
                        maxLines: 3,
                        style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'Belum ada motivasi...',
                          hintStyle: TextStyle(color: isDark ? Colors.white38 : AppColors.textSecondary),
                          filled: true,
                          fillColor: isDark ? const Color(0xFF1E1A29) : AppColors.cardBg,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (_isEditing)
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: AppColors.error, width: 2),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _motivationController.text = _tempMotivation;
                                      _isEditing = false;
                                    });
                                  },
                                  child: const Text('Batal', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                text: 'Simpan',
                                onPressed: () {
                                  authProvider.updateMotivation(_motivationController.text.trim());
                                  setState(() {
                                    _isEditing = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Motivasi berhasil disimpan!')),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
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