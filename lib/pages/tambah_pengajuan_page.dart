import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/pengajuan_controller.dart';
import '../models/pengajuan_model.dart';

class TambahPengajuanPage extends StatelessWidget {
  TambahPengajuanPage({super.key});

  final namaCtrl = TextEditingController();
  final nimCtrl = TextEditingController();
  final judulCtrl = TextEditingController();
  final dosenCtrl = TextEditingController();
  final ruangCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PengajuanController>(
      context,
      listen: false,
    );

    return Scaffold(
      // Background abu-abu tipis agar form putih terlihat pop-out (kontras)
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tambah Pengajuan",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sub-header petunjuk form
            Text(
              "Formulir Seminar TA",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Silakan lengkapi seluruh data di bawah ini secara valid.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 28),

            // 1. Input Nama
            _buildModernField(
              controller: namaCtrl,
              label: "Nama Lengkap Mahasiswa",
              hint: "Masukkan nama sesuai KTM",
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 20),

            // 2. Input NIM
            _buildModernField(
              controller: nimCtrl,
              label: "Nomor Induk Mahasiswa (NIM)",
              hint: "Contoh: 112324124",
              icon: Icons.badge_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // 3. Input Judul TA
            _buildModernField(
              controller: judulCtrl,
              label: "Judul Tugas Akhir",
              hint: "Tuliskan judul lengkap tugas akhir Anda",
              icon: Icons.assignment_outlined,
              maxLines: 2, // Memberikan ruang lebih lega untuk teks judul panjang
            ),
            const SizedBox(height: 20),

            // 4. Input Dosen
            _buildModernField(
              controller: dosenCtrl,
              label: "Dosen Pembimbing",
              hint: "Nama dosen pembimbing utama",
              icon: Icons.school_outlined,
            ),
            const SizedBox(height: 20),

            // 5. Input Ruangan
            _buildModernField(
              controller: ruangCtrl,
              label: "Ruangan Seminar",
              hint: "Contoh: Ruang A3 / Lab Komputer",
              icon: Icons.meeting_room_outlined,
            ),
            const SizedBox(height: 35),

            // Tombol Simpan Capsular Modern
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi sederhana sebelum menyimpan data
                  if (namaCtrl.text.trim().isEmpty || judulCtrl.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nama dan Judul TA wajib diisi!"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  controller.tambah(
                    PengajuanModel(
                      nama: namaCtrl.text,
                      nim: nimCtrl.text,
                      judul: judulCtrl.text,
                      dosen: dosenCtrl.text,
                      ruangan: ruangCtrl.text,
                      tanggal: DateTime.now().toString().substring(0, 10),
                      status: "Lengkap",
                    ),
                  );

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C853), // Hijau cerah matching dashboard
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: const Color(0xFF00C853).withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline_rounded, size: 22),
                    SizedBox(width: 10),
                    Text(
                      "Simpan Pengajuan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Komponen Helper untuk menyusun TextField agar kode di atas tetap bersih dan teratur
  Widget _buildModernField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(icon, color: const Color(0xFF00C853), size: 22),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            // Border saat form dalam keadaan standby / normal
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
            ),
            // Border berubah hijau saat kolom diklik oleh user
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFF00C853), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
