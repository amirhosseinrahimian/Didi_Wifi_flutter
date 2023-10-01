import 'package:didi_wifi/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: AppColors.darkBack, statusBarColor: Colors.transparent),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          fontFamily: "Vazir",
          colorScheme: const ColorScheme.dark(
            primary: AppColors.darkAccent,
            background: AppColors.darkBack,
            surface: AppColors.darkCard,
            onSurface: AppColors.darkText,
            surfaceVariant: AppColors.darkLightenCard,
          ),
          splashFactory: InkRipple.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: AppColors.darkCard.withOpacity(.4),
          scaffoldBackgroundColor: AppColors.darkBack,
          cardColor: AppColors.darkCard,
          dividerColor: AppColors.darkDivider,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              /// device name in selected area
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
            titleMedium: TextStyle(
              /// device name in list card
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
            titleSmall: TextStyle(
              /// small yellow titles
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.darkAccent,
            ),
            bodyLarge: TextStyle(
              /// texts in body
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
            bodyMedium: TextStyle(
              /// hint text in card
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.darkHint,
            ),
            bodySmall: TextStyle(
              /// hints in page
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.darkHint,
            ),
            headlineLarge: TextStyle(
              /// for main page title
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
            headlineMedium: TextStyle(
              /// for other page title
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
            headlineSmall: TextStyle(
              /// for bottomSheet
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
            labelLarge: TextStyle(
              /// device types
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.darkDimText,
            ),
            labelMedium: TextStyle(
              /// device types
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkDimText,
            ),
            labelSmall: TextStyle(
              /// badge
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
        ),
        home: const DiDi(),
      ),
    );
  }
}

class DiDi extends StatefulWidget {
  const DiDi({super.key});

  @override
  State<DiDi> createState() => _DiDiState();
}

class _DiDiState extends State<DiDi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
