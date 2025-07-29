import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../navigation/main_navigation_screen.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Set<String> _selectedInterests = {};

  final List<InterestCategory> _interests = [
    InterestCategory(
      id: 'business',
      title: 'Деловая поездка',
      subtitle: 'Конференции и встречи',
      icon: Icons.business_center,
      color: AppColors.primary,
    ),
    InterestCategory(
      id: 'family',
      title: 'Семейный отдых',
      subtitle: 'Время с близкими',
      icon: Icons.family_restroom,
      color: const Color(0xFF4CAF50),
    ),
    InterestCategory(
      id: 'kids',
      title: 'Отдых с детьми',
      subtitle: 'Развлечения для малышей',
      icon: Icons.child_friendly,
      color: const Color(0xFF2196F3),
    ),
    InterestCategory(
      id: 'romantic',
      title: 'Романтический отдых',
      subtitle: 'Время для двоих',
      icon: Icons.favorite,
      color: const Color(0xFFE91E63),
    ),
    InterestCategory(
      id: 'spa',
      title: 'SPA & Wellness',
      subtitle: 'Релаксация и здоровье',
      icon: Icons.spa,
      color: const Color(0xFF9C27B0),
    ),
    InterestCategory(
      id: 'culture',
      title: 'Культура и традиции',
      subtitle: 'История и наследие',
      icon: Icons.museum,
      color: const Color(0xFF795548),
    ),
    InterestCategory(
      id: 'shopping',
      title: 'Шоппинг',
      subtitle: 'Покупки и сувениры',
      icon: Icons.shopping_bag,
      color: const Color(0xFFFF9800),
    ),
    InterestCategory(
      id: 'relax',
      title: 'Релакс',
      subtitle: 'Спокойный отдых',
      icon: Icons.beach_access,
      color: const Color(0xFF00BCD4),
    ),
    InterestCategory(
      id: 'gastronomy',
      title: 'Гастрономия',
      subtitle: 'Кулинарные изыски',
      icon: Icons.restaurant_menu,
      color: const Color(0xFF607D8B),
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

  void _toggleInterest(String interestId) {
    setState(() {
      if (_selectedInterests.contains(interestId)) {
        _selectedInterests.remove(interestId);
      } else {
        _selectedInterests.add(interestId);
      }
    });
  }

  void _continue() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainNavigationScreen(),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              AppColors.surfaceVariant,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // Заголовок
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                        child: AnimationConfiguration.staggeredList(
                          position: 0,
                          duration: const Duration(milliseconds: 800),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/stc-logo-horiz.svg',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Что вас интересует?',
                                    style: AppTypography.headlineMedium.copyWith(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Выберите категории, которые вам интересны.\nМы персонализируем контент для вас',
                                    style: AppTypography.bodyLarge.copyWith(
                                      color: AppColors.grey600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  if (_selectedInterests.isNotEmpty)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Выбрано: ${_selectedInterests.length}',
                                        style: AppTypography.labelMedium.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      // Сетка интересов
                      AnimationLimiter(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: _interests.length,
                          itemBuilder: (context, index) {
                            final interest = _interests[index];
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 600),
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _buildInterestCard(interest),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Кнопка продолжить
                      AnimationConfiguration.staggeredList(
                        position: _interests.length + 1,
                        duration: const Duration(milliseconds: 800),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _selectedInterests.isNotEmpty ? _continue : null,
                                    child: const Text('Продолжить'),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextButton(
                                  onPressed: _continue,
                                  child: Text(
                                    'Пропустить',
                                    style: AppTypography.labelLarge.copyWith(
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInterestCard(InterestCategory interest) {
    final isSelected = _selectedInterests.contains(interest.id);
    
    return GestureDetector(
      onTap: () => _toggleInterest(interest.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          color: isSelected ? interest.color : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? interest.color : AppColors.grey200,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? interest.color.withOpacity(0.3)
                  : AppColors.grey300.withOpacity(0.3),
              blurRadius: isSelected ? 20 : 10,
              offset: Offset(0, isSelected ? 8 : 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Иконка
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected 
                      ? AppColors.white.withOpacity(0.2)
                      : interest.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  interest.icon,
                  size: 22,
                  color: isSelected ? AppColors.white : interest.color,
                ),
              ),
              
              // Название
              Text(
                interest.title,
                style: AppTypography.labelLarge.copyWith(
                  color: isSelected ? AppColors.white : AppColors.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              // Индикатор выбора
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 20,
                height: 20,
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
                        size: 12,
                        color: interest.color,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestCategory {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const InterestCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
} 