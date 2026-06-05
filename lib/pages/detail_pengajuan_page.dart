import 'package:flutter/material.dart';
import '../models/pengajuan_model.dart';

class DetailPengajuanPage extends StatelessWidget {
  const DetailPengajuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!
            .settings
            .arguments as PengajuanModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text("Nama : ${data.nama}"),
            Text("NIM : ${data.nim}"),
            Text("Judul : ${data.judul}"),
            Text("Dosen : ${data.dosen}"),
            Text("Ruangan : ${data.ruangan}"),
            Text("Tanggal : ${data.tanggal}"),
            Text("Status : ${data.status}"),
          ],
        ),
      ),
    );
  }
}
