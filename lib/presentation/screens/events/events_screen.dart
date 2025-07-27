import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Афиша',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upcoming Events Section
            Text(
              'Ближайшие события',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Event Cards
            _buildEventCard(
              title: 'Концерт в амфитеатре',
              description: 'Вечернее шоу с национальной музыкой',
              date: '22 ДЕК',
              time: '20:00',
              color: AppColors.primary,
            ),
            const SizedBox(height: 12),
            _buildEventCard(
              title: 'Фестиваль фонтанов',
              description: 'Световое представление у фонтанов',
              date: '25 ДЕК',
              time: '19:30',
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            _buildEventCard(
              title: 'Новогодний гала',
              description: 'Праздничный банкет и развлечения',
              date: '31 ДЕК',
              time: '21:00',
              color: const Color(0xFFE91E63),
            ),
            
            const SizedBox(height: 24),
            
            // Categories Section
            Text(
              'Категории событий',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildCategoryGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String description,
    required String date,
    required String time,
    required Color color,
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
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date.split(' ')[0],
                        style: AppTypography.labelSmall.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        date.split(' ')[1],
                        style: AppTypography.labelSmall.copyWith(
                          color: color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.titleSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.grey600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: AppColors.grey400,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.grey600,
                            ),
                          ),
                        ],
                      ),
                    ],
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

  Widget _buildCategoryGrid() {
    final categories = [
      {'title': 'Концерты', 'icon': Icons.music_note, 'color': AppColors.primary},
      {'title': 'Мастер-классы', 'icon': Icons.palette, 'color': const Color(0xFF4CAF50)},
      {'title': 'Экскурсии', 'icon': Icons.location_on, 'color': const Color(0xFF2196F3)},
      {'title': 'Шоу', 'icon': Icons.theater_comedy, 'color': const Color(0xFFE91E63)},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
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
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: (category['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        category['icon'] as IconData,
                        color: category['color'] as Color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category['title'] as String,
                      style: AppTypography.titleSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
} 