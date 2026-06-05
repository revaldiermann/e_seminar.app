import 'package:flutter/material.dart';
import '../models/pengajuan_model.dart';

class PengajuanController extends ChangeNotifier {
  final List<PengajuanModel> _data = [];

  List<PengajuanModel> get data => _data;

  Null get pengajuanList => null;

  void tambah(PengajuanModel pengajuan) {
    _data.add(pengajuan);
    notifyListeners();
  }

  void hapus(int index) {
    _data.removeAt(index);
    notifyListeners();
  }

  void edit(int index, PengajuanModel pengajuanBaru) {
    _data[index] = pengajuanBaru;
    notifyListeners();
  }

  void hapusData(int index) {}
}
