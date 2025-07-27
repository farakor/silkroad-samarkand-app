import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'models/restaurant_model.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantDetailsScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Заголовок с динамическим фоном
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: restaurant.color,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      restaurant.color.withOpacity(0.9),
                      restaurant.color.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Декоративные круги
                    Positioned(
                      top: 60,
                      right: -50,
                      child: _buildDecorativeCircle(120, restaurant.color.withOpacity(0.1)),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -40,
                      child: _buildDecorativeCircle(80, restaurant.color.withOpacity(0.2)),
                    ),
                    Positioned(
                      top: 140,
                      left: 30,
                      child: _buildDecorativeCircle(40, restaurant.color.withOpacity(0.15)),
                    ),
                    
                    // Центральный контент
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              restaurant.category.icon,
                              size: 40,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Основной контент
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Основная информация о ресторане
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          style: AppTypography.headlineLarge.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.rating.toString(),
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: restaurant.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          restaurant.category.title,
                          style: AppTypography.bodySmall.copyWith(
                            color: restaurant.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        restaurant.cuisine,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        restaurant.priceRange,
                        style: AppTypography.bodyLarge.copyWith(
                          color: restaurant.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    restaurant.description,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.secondary,
                      height: 1.6,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Время работы и контакты
                  _buildRestaurantInfo(),
                  
                  const SizedBox(height: 32),
                  
                  // Особенности ресторана
                  Text(
                    'Особенности',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildFeatures(),
                  
                  const SizedBox(height: 32),
                  
                  // Услуги и возможности
                  Text(
                    'Услуги',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildServices(),
                  
                  const SizedBox(height: 32),
                  
                  // Локация
                  Text(
                    'Как добраться',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: restaurant.color,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                restaurant.location,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.map,
                                  color: AppColors.grey400,
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Карта',
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.grey400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Кнопки действий
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _makeReservation,
                          icon: const Icon(Icons.event_available),
                          label: const Text('Забронировать'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: restaurant.color,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _callRestaurant,
                          icon: const Icon(Icons.phone),
                          label: const Text('Позвонить'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: restaurant.color,
                            side: BorderSide(color: restaurant.color),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.access_time,
            title: 'Время работы',
            value: restaurant.workingHours,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            icon: Icons.phone,
            title: 'Телефон',
            value: restaurant.phoneNumber,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            icon: Icons.location_on,
            title: 'Адрес',
            value: restaurant.location,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: restaurant.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 16,
            color: restaurant.color,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.grey400,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: restaurant.features.map((feature) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: restaurant.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: restaurant.color.withOpacity(0.3),
            ),
          ),
          child: Text(
            feature,
            style: AppTypography.bodySmall.copyWith(
              color: restaurant.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildServices() {
    return Row(
      children: [
        if (restaurant.hasReservation)
          Expanded(
            child: _buildServiceCard(
              icon: Icons.event_available,
              title: 'Бронирование',
              subtitle: 'Доступно',
              color: AppColors.success,
            ),
          ),
        if (restaurant.hasReservation && restaurant.hasDelivery)
          const SizedBox(width: 12),
        if (restaurant.hasDelivery)
          Expanded(
            child: _buildServiceCard(
              icon: Icons.delivery_dining,
              title: 'Доставка',
              subtitle: 'Доступна',
              color: AppColors.warning,
            ),
          ),
      ],
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: AppTypography.bodySmall.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _makeReservation() {
    HapticFeedback.lightImpact();
    // TODO: Implement reservation logic
    print('Бронирование ресторана: ${restaurant.name}');
  }

  void _callRestaurant() {
    HapticFeedback.lightImpact();
    // TODO: Implement call logic
    print('Звонок в ресторан: ${restaurant.phoneNumber}');
  }
} 