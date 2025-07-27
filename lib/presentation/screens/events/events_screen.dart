import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'event_details_screen.dart';
import 'models/event_model.dart';

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
            ...sampleEvents.map((event) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildEventCard(
                context,
                event: event,
              ),
            )),
            
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

  Widget _buildEventCard(BuildContext context, {required EventModel event}) {
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
          onTap: () {
            print('🎯 Нажата карточка мероприятия: ${event.title}');
            HapticFeedback.lightImpact();
            try {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(event: event),
                ),
              );
              print('✅ Навигация выполнена успешно');
            } catch (e) {
              print('❌ Ошибка навигации: $e');
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: event.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    event.icon,
                    color: event.color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: AppTypography.titleSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.description.length > 60 
                          ? '${event.description.substring(0, 60)}...'
                          : event.description,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.grey600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                            event.dateTime,
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

  static final List<EventModel> sampleEvents = [
    EventModel(
      title: 'Большой музыкальный вечер в Амфитеатре Вечного города',
      dateTime: '7 июня, 19:30',
      description: '7 июня в 19:30 на сцене амфитеатра Вечного города выступят всемирно известные коллективы Хор Турецкого & Soprano с программой «Песни Победы». Вас ждет незабываемый вечер живой музыки, ярких эмоций и любимых композиций, которые объединят поколения. Погрузитесь в атмосферу вдохновения и радости вместе с семьей и друзьями!',
      location: 'Амфитеатр Вечного города, Silk Road Samarkand',
      color: const Color(0xFF1565C0),
      icon: Icons.music_note,
    ),
    EventModel(
      title: 'Фестиваль фонтанов',
      dateTime: '25 декабря, 19:30',
      description: 'Грандиозное световое и музыкальное шоу у знаменитых фонтанов комплекса. Уникальное представление, которое объединяет водные струи, современную подсветку и классическую музыку.',
      location: 'Центральная площадь, Silk Road Samarkand',
      color: const Color(0xFF2196F3),
      icon: Icons.water_drop,
    ),
    EventModel(
      title: 'Новогодний гала',
      dateTime: '31 декабря, 21:00',
      description: 'Встретьте Новый год в роскошной атмосфере восточного гостеприимства! Праздничный банкет, живая музыка, развлекательная программа и незабываемая атмосфера.',
      location: 'Главный банкетный зал, Silk Road Samarkand',
      color: const Color(0xFFE91E63),
      icon: Icons.celebration,
    ),
    EventModel(
      title: 'Мастер-класс традиционных ремесел',
      dateTime: '15 января, 15:00',
      description: 'Познакомьтесь с древними традициями узбекского ремесла. Научитесь работать с керамикой, ткацким станком и создавать украшения в национальном стиле.',
      location: 'Мастерская ремесел, Silk Road Samarkand',
      color: AppColors.primary,
      icon: Icons.palette,
    ),
  ];

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