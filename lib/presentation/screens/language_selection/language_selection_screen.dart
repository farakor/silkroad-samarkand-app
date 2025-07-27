import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../auth/auth_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String? _selectedLanguage;

  final List<LanguageOption> _languages = [
    LanguageOption(
      code: 'uz',
      name: 'O\'zbekcha',
      flag: '🇺🇿',
      nativeName: 'Ўзбекча',
    ),
    LanguageOption(
      code: 'ru',
      name: 'Русский',
      flag: '🇷🇺',
      nativeName: 'Русский',
    ),
    LanguageOption(
      code: 'en',
      name: 'English',
      flag: '🇺🇸',
      nativeName: 'English',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
    });
    
    // Небольшая задержка для визуального эффекта
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AuthScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.background,
              AppColors.surfaceVariant,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                
                // Заголовок
                AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.language,
                              size: 40,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Выберите язык',
                            style: AppTypography.headlineMedium.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Choose your preferred language\nTilni tanlang',
                            style: AppTypography.bodyLarge.copyWith(
                              color: AppColors.grey600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Список языков
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: _languages.length,
                      itemBuilder: (context, index) {
                        final language = _languages[index];
                        return AnimationConfiguration.staggeredList(
                          position: index + 1,
                          duration: const Duration(milliseconds: 600),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: _buildLanguageCard(language),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(LanguageOption language) {
    final isSelected = _selectedLanguage == language.code;
    
    return GestureDetector(
      onTap: () => _selectLanguage(language.code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grey200,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? AppColors.primary.withOpacity(0.3)
                  : AppColors.grey300.withOpacity(0.3),
              blurRadius: isSelected ? 20 : 10,
              offset: Offset(0, isSelected ? 8 : 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Флаг
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.white.withOpacity(0.2)
                    : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  language.flag,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            
            const SizedBox(width: 20),
            
            // Название языка
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language.name,
                    style: AppTypography.titleLarge.copyWith(
                      color: isSelected ? AppColors.white : AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    language.nativeName,
                    style: AppTypography.bodyMedium.copyWith(
                      color: isSelected 
                          ? AppColors.white.withOpacity(0.8)
                          : AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Индикатор выбора
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.white : AppColors.grey400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.primary,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption {
  final String code;
  final String name;
  final String flag;
  final String nativeName;

  const LanguageOption({
    required this.code,
    required this.name,
    required this.flag,
    required this.nativeName,
  });
} 