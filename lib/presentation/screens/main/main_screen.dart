import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../hotels/hotels_screen.dart';
import '../eco_village/eco_village_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.mosque,
                color: AppColors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Silkroad Samarkand',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Events Carousel
            _buildEventsCarousel(),
            
            const SizedBox(height: 16),
            
            // Main Sections Grid
            _buildSectionsGrid(),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsCarousel() {
    final events = [
      EventItem('Концерт в амфитеатре', 'Вечернее шоу с национальной музыкой', '22 ДЕК'),
      EventItem('Фестиваль фонтанов', 'Световое представление у фонтанов', '25 ДЕК'),
      EventItem('Новогодний гала', 'Праздничный банкет и развлечения', '31 ДЕК'),
    ];

    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 16),
      child: PageView.builder(
        controller: _pageController,
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Background gradient (placeholder for image)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withOpacity(0.7),
                          AppColors.secondary.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              event.date,
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            event.title,
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            event.description,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionsGrid() {
    final sections = [
      SectionItem('События', Icons.event, AppColors.primary),
      SectionItem('Отели', Icons.hotel, const Color(0xFF2196F3)),
      SectionItem('Eco Village', Icons.nature, const Color(0xFF4CAF50)),
      SectionItem('Рестораны', Icons.restaurant, const Color(0xFFE91E63)),
      SectionItem('SPA & Wellness', Icons.spa, const Color(0xFF9C27B0)),
      SectionItem('Развлечения', Icons.celebration, const Color(0xFFFF9800)),
      SectionItem('Concierge услуги', Icons.room_service, const Color(0xFF795548)),
      SectionItem('Мероприятия', Icons.business_center, const Color(0xFF607D8B)),
      SectionItem('Информация и отзывы', Icons.info_outline, const Color(0xFF00BCD4)),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.4,
        ),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return _buildGridSection(
            title: section.title,
            icon: section.icon,
            color: section.color,
            onTap: () => _navigateToSection(context, section.title),
          );
        },
      ),
    );
  }

  void _navigateToSection(BuildContext context, String sectionTitle) {
    switch (sectionTitle) {
      case 'Отели':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HotelsScreen(),
          ),
        );
        break;
      case 'События':
        // TODO: Navigate to events screen
        break;
      case 'Eco Village':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EcoVillageScreen(),
          ),
        );
        break;
      case 'Рестораны':
        // TODO: Navigate to restaurants screen
        break;
      case 'SPA & Wellness':
        // TODO: Navigate to spa screen
        break;
      case 'Развлечения':
        // TODO: Navigate to entertainment screen
        break;
      case 'Concierge услуги':
        // TODO: Navigate to concierge screen
        break;
      case 'Мероприятия':
        // TODO: Navigate to business events screen
        break;
      case 'Информация и отзывы':
        // TODO: Navigate to information screen
        break;
      default:
        break;
    }
  }

  Widget _buildGridSection({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: AppTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.grey400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventItem {
  final String title;
  final String description;
  final String date;

  EventItem(this.title, this.description, this.date);
}

class SectionItem {
  final String title;
  final IconData icon;
  final Color color;

  SectionItem(this.title, this.icon, this.color);
} 