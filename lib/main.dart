import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Настройка системного UI
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Блокировка поворота экрана (только портретная ориентация)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  runApp(
    const ProviderScope(
      child: SilkroadSamarkandApp(),
    ),
  );
}

class SilkroadSamarkandApp extends StatelessWidget {
  const SilkroadSamarkandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silkroad Samarkand',
      debugShowCheckedModeBanner: false,
      
      // Тема приложения
      theme: AppTheme.lightTheme,
      
      // Локализация
      supportedLocales: const [
        Locale('uz', 'UZ'), // Узбекский
        Locale('ru', 'RU'), // Русский
        Locale('en', 'US'), // Английский
      ],
      
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Стартовый экран
      home: const SplashScreen(),
    );
  }
} 