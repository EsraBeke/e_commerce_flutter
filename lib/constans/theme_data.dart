import 'package:e_commerce/constans/app_colors.dart';
import 'package:flutter/material.dart';

class Styles {
  // ThemeData nesnesi oluşturan bir metot.
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
        // Scaffold arka plan rengini temaya göre belirler.
        scaffoldBackgroundColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        // Kartların arka plan rengini temaya göre belirler.
        cardColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        // Temanın parlaklık ayarını belirler.
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        // AppBar'ın temaya göre tasarımını belirler.
        appBarTheme: AppBarTheme(
          // AppBar içindeki simge rengini temaya göre belirler.
          iconTheme:
              IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
          // AppBar'ın arka plan rengini temaya göre belirler.
          backgroundColor: isDarkTheme
              ? AppColors.darkScaffoldColor
              : AppColors.lightScaffoldColor,
          // AppBar'ın gölge efektini kaldırır.
          elevation: 0,
          // AppBar içindeki başlık metninin rengini temaya göre belirler.
          titleTextStyle:
              TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        ),
        // Input alanlarının temaya göre tasarımını belirler.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          // Aktif olmayan input alanı kenarlık rengini belirler.
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          // Aktif input alanı kenarlık rengini ve stilini belirler.
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: isDarkTheme ? Colors.white : Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          // Hata durumunda input alanı kenarlık rengini ve stilini belirler.
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          // Hata durumunda odaklanmış input alanı kenarlık rengini ve stilini belirler.
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ));
  }
}
