import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../language_selection/language_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _backgroundController;
  
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _backgroundOpacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Инициализация контроллеров анимации
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    // Настройка анимаций
    _logoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));
    
    _logoOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));
    
    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    ));
    
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOutBack,
    ));
    
    _backgroundOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeIn,
    ));
    
    // Запуск анимаций последовательно
    _startAnimations();
  }

  void _startAnimations() async {
    // Запуск анимации фона
    _backgroundController.forward();
    
    // Небольшая задержка перед анимацией логотипа
    await Future.delayed(const Duration(milliseconds: 500));
    _logoController.forward();
    
    // Анимация текста после логотипа
    await Future.delayed(const Duration(milliseconds: 800));
    _textController.forward();
    
    // Переход на следующий экран
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LanguageSelectionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundController,
        builder: (context, child) {
          return Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary.withOpacity(_backgroundOpacityAnimation.value),
                  AppColors.secondary.withOpacity(_backgroundOpacityAnimation.value),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  
                  // Логотип с анимацией
                  AnimatedBuilder(
                    animation: _logoController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _logoScaleAnimation.value,
                        child: Opacity(
                          opacity: _logoOpacityAnimation.value,
                          child: _buildLogo(),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Название приложения с анимацией
                  AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      return SlideTransition(
                        position: _textSlideAnimation,
                        child: Opacity(
                          opacity: _textOpacityAnimation.value,
                          child: Column(
                            children: [
                              Text(
                                'SILKROAD',
                                style: AppTypography.headlineLarge.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'SAMARKAND',
                                style: AppTypography.titleLarge.copyWith(
                                  color: AppColors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                width: 60,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'TOURISTIC CENTRE',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.white.withOpacity(0.8),
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const Spacer(flex: 3),
                  
                  // Индикатор загрузки
                  AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _textOpacityAnimation.value,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.mosque,
          size: 60,
          color: AppColors.primary,
        ),
      ),
    );
  }
} 