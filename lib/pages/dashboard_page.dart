import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controller.dart';
import '../controllers/pengajuan_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthController>(context);
    final pengajuan = Provider.of<PengajuanController>(context);

    return Scaffold(
      // Mengubah background aplikasi menjadi abu-abu terang sesuai gambar
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        top: false, // Agar bagian gradasi hijau atas penuh sampai mentok layar
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 1. Custom Header dengan Gradasi Hijau
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 25, left: 24, right: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00C853), // Hijau terang cerah
                    Color(0xFF1B5E20), // Hijau gelap
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "Pengajuan Seminar TA",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 2. Judul "Daftar Pengajuan Seminar"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.school,
                    color: Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Daftar Pengajuan Seminar",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 3. List Data Pengajuan Custom Card
            ...List.generate(
              pengajuan.data.length,
              (index) {
                final data = pengajuan.data[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon Check Hijau Bulat di Sebelah Kiri
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Konten Data Utama
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Baris Atas: Nama, Status Berkas, Tombol Hapus & Edit
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.nama,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                // Badge Berkas Lengkap
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    "Berkas Lengkap",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Tombol Hapus (Trash)
                                InkWell(
                                  onTap: () => pengajuan.hapus(index),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Tombol Edit (Pensil Biru)
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/detail', // Sesuai rute navigasi bawaan Anda
                                      arguments: data,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                            
                            // NIM (Ganti ke data.nim jika model Anda memiliki properti NIM)
                            const SizedBox(height: 2),
                            Text(
                              "111112344", 
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 13,
                              ),
                            ),
                            
                            // Judul Tugas Akhir
                            const SizedBox(height: 10),
                            Text(
                              data.judul,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),

                            // Informasi Pembimbing & Ruangan
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.person, color: Colors.green, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Salamun", // Ganti ke data.pembimbing jika ada
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                                ),
                                const SizedBox(width: 15),
                                const Icon(Icons.meeting_room, color: Colors.green, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "A3", // Ganti ke data.ruangan jika ada
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                                ),
                              ],
                            ),

                            // Informasi Tanggal
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month, color: Colors.green, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "2025-06-23", // Ganti ke data.tanggal jika ada
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 100), // Spacing bodi bawah agar tidak tertutup FAB
          ],
        ),
      ),

      // 4. Floating Action Button Lebar (Extended) Berwarna Hijau
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/tambah');
        },
        label: const Text(
          "Tambah Pengajuan",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.white, size: 24),
        backgroundColor: const Color(0xFF00C853),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
