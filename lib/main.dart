import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/pengajuan_controller.dart';

import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/tambah_pengajuan_page.dart';
import 'pages/detail_pengajuan_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => PengajuanController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'e-Seminar App',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),

        scaffoldBackgroundColor: const Color(
          0xFFF5F5F5,
        ),
      ),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/tambah': (context) => TambahPengajuanPage(),
        '/detail': (context) => const DetailPengajuanPage(),
      },
    );
  }
}
