import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class DashboardUserPage extends StatefulWidget {
  const DashboardUserPage({super.key});

  @override
  State<DashboardUserPage> createState() => _DashboardUserPageState();
}

class _DashboardUserPageState extends State<DashboardUserPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _BerandaPage(),
    const Center(child: Text('Kursus')),
    const Center(child: Text('Notifikasi')),
    const Center(child: Text('Profil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF002F6C),
        style: TabStyle.reactCircle,
        color: Colors.white70,
        activeColor: Colors.white,
        height: 65,
        items: const [
          TabItem(icon: LucideIcons.home, title: 'Beranda'),
          TabItem(icon: LucideIcons.bookOpen, title: 'Kursus'),
          TabItem(icon: LucideIcons.bell, title: 'Notifikasi'),
          TabItem(icon: LucideIcons.user, title: 'Profil'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}

class _BerandaPage extends StatelessWidget {
  const _BerandaPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/alvian.jpg'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alvian Ahmad Febrian",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0C3C78),
                  ),
                ),
                Text(
                  "Teknologi Informasi",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.settings, color: Color(0xFF002F6C)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Statistik
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF003182), Color(0xFF0052A5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
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

            // Grid Menu
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildMenuItem(Icons.schedule, "Jadwal", Colors.indigo),
                _buildMenuItem(Icons.school, "Nilai", Colors.indigo),
                _buildMenuItem(Icons.people, "Presensi", Colors.indigo),
                _buildMenuItem(Icons.assignment, "Tugas", Colors.indigo),
                _buildMenuItem(Icons.menu_book, "Materi", Colors.indigo),
                _buildMenuItem(Icons.payment, "Biaya", Colors.indigo),
                _buildMenuItem(Icons.bar_chart, "Progress", Colors.indigo),
                _buildMenuItem(
                  Icons.question_answer,
                  "Kuesioner",
                  Colors.indigo,
                ),
                _buildMenuItem(Icons.emoji_events, "Sertifikat", Colors.indigo),
              ],
            ),

            const SizedBox(height: 40),

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
    );
  }

  static Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
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

  static Widget _buildMenuItem(IconData icon, String title, Color color) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(14),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF002F6C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
