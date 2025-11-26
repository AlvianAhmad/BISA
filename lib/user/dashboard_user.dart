import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart'; // paket ikon ringan

class DashboardUserPage extends StatelessWidget {
  const DashboardUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF8FF),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF002F6C),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bookOpen),
            label: "Kursus",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bell),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: "Profil",
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage(
                          'assets/images/alvian.jpg',
                        ), // ganti sesuai
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alvian Ahmad Febrian",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0C3C78),
                            ),
                          ),
                          Text(
                            "Teknologi Informasi",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.settings,
                      color: Color(0xFF002F6C),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Card Statistik
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF002F6C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem("3.9", "IPK"),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    _buildStatItem("25", "Kursus Aktif"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Menu Grid
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuItem(Icons.schedule, "Jadwal", Colors.orange),
                  _buildMenuItem(Icons.school, "Nilai", Colors.green),
                  _buildMenuItem(Icons.people, "Presensi", Colors.blueAccent),
                  _buildMenuItem(Icons.assignment, "Tugas", Colors.purple),
                  _buildMenuItem(Icons.menu_book, "Materi", Colors.teal),
                  _buildMenuItem(Icons.payment, "Biaya", Colors.redAccent),
                  _buildMenuItem(Icons.bar_chart, "Progress", Colors.amber),
                  _buildMenuItem(
                    Icons.question_answer,
                    "Kuesioner",
                    Colors.pink,
                  ),
                  _buildMenuItem(
                    Icons.emoji_events,
                    "Sertifikat",
                    Colors.indigo,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Footer kecil
              Center(
                child: Text(
                  "© 2025 Edura LMS. All rights reserved.",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              radius: 24,
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF002F6C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
