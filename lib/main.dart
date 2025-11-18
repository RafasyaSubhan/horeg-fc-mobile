import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:horeg_fc/screens/login.dart';
import 'package:horeg_fc/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: "ℌ𝔬𝔯𝔢𝔤 𝔉ℭ'",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.carmine, // Warna dasar (Generate otomatis palette lain)
            primary: AppColors.carmine,   // Paksa warna primary jadi Carmine
            secondary: AppColors.mossGreen, // Warna secondary
            surface: AppColors.white,     // Warna permukaan kartu/menu
            background: AppColors.sage,   // Warna background aplikasi
          ),
          scaffoldBackgroundColor: AppColors.sage,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,      // Background Putih
            foregroundColor: AppColors.sage,    // Teks & Ikon jadi Sage
            surfaceTintColor: Colors.transparent, // Biar ga berubah warna pas discroll
            iconTheme: IconThemeData(color: AppColors.sage), // Ikon drawer/back
            titleTextStyle: TextStyle(
              color: AppColors.sage, // Warna Judul Sage
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}