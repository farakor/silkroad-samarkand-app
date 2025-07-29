import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../master_classes/master_classes_screen.dart';

class EternalCityScreen extends StatelessWidget {
  const EternalCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.secondary,
          ),
        ),
        title: Text(
          'Вечный Город',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with main info
            _buildHeaderSection(),
            
            const SizedBox(height: 16),
            
            // Central Street section
            _buildCentralStreetSection(),
            
            const SizedBox(height: 16),
            
            // Restaurants section
            _buildRestaurantsSection(),
            
            const SizedBox(height: 16),
            
            // Master classes section
            _buildMasterClassesSection(context),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Вечный Город',
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'На территории 17 га воссоздана настоящая древняя архитектура Старого города, где вы сможете прогуляться по старинным узким улочкам и лучше узнать традиции и культуру народа Узбекистана. На улицах стоят магазины лучших художников, искусных ремесленников, а также рестораны, музыкально-развлекательные заведения с уникальной восточной атмосферой.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey700,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          
          // Key features
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFeatureChip(Icons.landscape, '17 гектаров'),
              _buildFeatureChip(Icons.architecture, 'Древняя архитектура'),
              _buildFeatureChip(Icons.store, 'Магазины ремесленников'),
              _buildFeatureChip(Icons.restaurant, 'Аутентичные рестораны'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCentralStreetSection() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Центральная улица',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Central street image placeholder
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.7),
                  AppColors.primary.withOpacity(0.9),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.location_city,
                    size: 48,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Центральная улица с караванной транзитной архой называется главной туристической зоной города тысячи и одной ночи. Изготовлена из натурального камня, гости могут посетить Национальную библиотеку или просто полюбоваться красотой восточной архитектуры или природой, а также восточной кухней, ходящими художниками или самса.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantsSection() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Рестораны Вечного города',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Restaurants grid
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _restaurants.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final restaurant = _restaurants[index];
              return _buildRestaurantCard(restaurant);
            },
          ),
          
          const SizedBox(height: 16),
          
          // "Подробнее" button
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Navigate to restaurants screen
                },
                borderRadius: BorderRadius.circular(12),
                child: Center(
                  child: Text(
                    'Подробнее',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasterClassesSection(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Мастер-классы\nВечного города',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          
          Text(
            'Посещайте уникальные мастер-классы от лучших специалистов города и приобретайте подлинные навыки.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey700,
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Master classes button
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
                              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MasterClassesScreen(),
                      ),
                    );
                  },
                borderRadius: BorderRadius.circular(12),
                child: Center(
                  child: Text(
                    'Перейти к мастер-классам',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(EternalCityRestaurant restaurant) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Restaurant image placeholder
          Container(
            width: 80,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  restaurant.color.withOpacity(0.7),
                  restaurant.color.withOpacity(0.9),
                ],
              ),
            ),
            child: Center(
              child: Icon(
                restaurant.icon,
                size: 28,
                color: AppColors.white,
              ),
            ),
          ),
          
          // Restaurant info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.name,
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.workingHours,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                  if (restaurant.isOpen)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Открыто',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static final List<EternalCityRestaurant> _restaurants = [
    EternalCityRestaurant(
      name: 'Ресторан Afrosiyob',
      workingHours: 'Пн-Чт: 14:00-00:00',
      isOpen: true,
      color: const Color(0xFF1565C0),
      icon: Icons.restaurant,
    ),
    EternalCityRestaurant(
      name: 'Ресторан Samarkand',
      workingHours: 'Пт-Вс: 12:00-00:00',
      isOpen: false,
      color: const Color(0xFF7B1FA2),
      icon: Icons.local_dining,
    ),
  ];
}

class EternalCityRestaurant {
  final String name;
  final String workingHours;
  final bool isOpen;
  final Color color;
  final IconData icon;

  const EternalCityRestaurant({
    required this.name,
    required this.workingHours,
    required this.isOpen,
    required this.color,
    required this.icon,
  });
} 