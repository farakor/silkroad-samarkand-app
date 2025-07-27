import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'models/hotel_model.dart';

class HotelDetailsScreen extends StatelessWidget {
  final HotelModel hotel;
  
  const HotelDetailsScreen({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar с изображением
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.secondary,
                ),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      hotel.color,
                      hotel.color.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Декоративные элементы
                    Positioned(
                      top: 60,
                      right: 20,
                      child: _buildDecorativeCircle(120, AppColors.white.withOpacity(0.1)),
                    ),
                    Positioned(
                      top: 140,
                      left: 30,
                      child: _buildDecorativeCircle(80, AppColors.white.withOpacity(0.05)),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 50,
                      child: _buildDecorativeCircle(100, AppColors.white.withOpacity(0.08)),
                    ),
                    // Основная иконка
                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.hotel,
                          size: 60,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Контент
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок и рейтинг
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: AppTypography.headlineMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.amber.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              hotel.rating,
                              style: AppTypography.labelMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Описание
                  Text(
                    hotel.description,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.secondary,
                      height: 1.6,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Основная информация об отеле
                  _buildHotelInfo(),
                  
                  const SizedBox(height: 32),
                  
                  // Услуги
                  Text(
                    'Услуги',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildServices(),
                  
                  const SizedBox(height: 32),
                  
                  // Рестораны и бары
                  if (hotel.restaurants.isNotEmpty) ...[
                    Text(
                      'Рестораны и бары отеля',
                      style: AppTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                    
                                       const SizedBox(height: 16),
                   
                   _buildRestaurants(context),
                    
                    const SizedBox(height: 32),
                  ],
                  
                  // Конференц залы
                  if (hotel.conferenceRooms.isNotEmpty) ...[
                    Text(
                      'Конференц залы',
                      style: AppTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                    
                                       const SizedBox(height: 16),
                   
                   _buildConferenceRooms(context),
                    
                    const SizedBox(height: 32),
                  ],
                  
                  // Банкетный зал
                  if (hotel.banquetHall != null) ...[
                    Text(
                      'Банкетный зал',
                      style: AppTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildBanquetHall(),
                    
                    const SizedBox(height: 32),
                  ],
                  
                  // Как добраться
                  Text(
                    'Как добраться',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Адрес
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            hotel.location,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Карта (заглушка)
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey200),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primary.withOpacity(0.1),
                                AppColors.secondary.withOpacity(0.05),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.map,
                                size: 48,
                                color: AppColors.grey400,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Карта местности',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.grey600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Кнопки действий
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _bookHotel(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Забронировать',
                            style: AppTypography.labelLarge.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => _visitWebsite(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Перейти на сайт',
                            style: AppTypography.labelLarge.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
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
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildHotelInfo() {
    final infoItems = [
      {'label': '${hotel.info.floors} этажей', 'icon': Icons.business},
      {'label': '${hotel.info.rooms} номера', 'icon': Icons.bed},
      {'label': '${hotel.info.restaurants} ресторана', 'icon': Icons.restaurant},
      {'label': '${hotel.info.bars} бара', 'icon': Icons.local_bar},
      {'label': '${hotel.info.pools} бассейна', 'icon': Icons.pool},
      {'label': '${hotel.info.conferenceRooms} конференц зала', 'icon': Icons.meeting_room},
      {'label': '${hotel.info.banquetHalls} банкетный зал', 'icon': Icons.celebration},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          for (int i = 0; i < infoItems.length; i += 2)
            Padding(
              padding: EdgeInsets.only(bottom: i + 2 < infoItems.length ? 16 : 0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoItem(infoItems[i]),
                  ),
                  if (i + 1 < infoItems.length) ...[
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoItem(infoItems[i + 1]),
                    ),
                  ] else
                    const Expanded(child: SizedBox()),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(Map<String, dynamic> item) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: hotel.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            item['icon'] as IconData,
            size: 16,
            color: hotel.color,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            item['label'] as String,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServices() {
    return Column(
      children: [
        for (int i = 0; i < hotel.services.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: i + 2 < hotel.services.length ? 12 : 0),
            child: Row(
              children: [
                Expanded(
                  child: _buildServiceItem(hotel.services[i]),
                ),
                if (i + 1 < hotel.services.length) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildServiceItem(hotel.services[i + 1]),
                  ),
                ] else
                  const Expanded(child: SizedBox()),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildServiceItem(HotelService service) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.grey200, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            service.icon,
            size: 14,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              service.name,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurants(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: hotel.restaurants.map((restaurant) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 60) / 2, // 2 колонки с отступами (как конференц залы)
          height: 180,
          child: _buildFacilityCard(
            name: restaurant.name,
            description: restaurant.description,
            workingHours: restaurant.workingHours,
            color: restaurant.color,
            icon: Icons.restaurant,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildConferenceRooms(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: hotel.conferenceRooms.map((room) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 60) / 2, // 2 колонки с отступами
          height: 180,
          child: _buildFacilityCard(
            name: room.name,
            description: room.description,
            workingHours: room.workingHours,
            color: room.color,
            icon: Icons.meeting_room,
            capacity: room.capacity,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBanquetHall() {
    final hall = hotel.banquetHall!;
    return SizedBox(
      height: 160,
      child: _buildFacilityCard(
        name: hall.name,
        description: hall.description,
        workingHours: hall.workingHours,
        color: hall.color,
        icon: Icons.celebration,
        capacity: hall.capacity,
        isFullWidth: true,
      ),
    );
  }

  Widget _buildFacilityCard({
    required String name,
    required String description,
    required String workingHours,
    required Color color,
    required IconData icon,
    String? capacity,
    bool isFullWidth = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.9),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        icon,
                        size: 16,
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    if (capacity != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          capacity,
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                  ),
                  maxLines: isFullWidth ? 3 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  workingHours,
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _bookHotel(BuildContext context) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Функция бронирования в разработке',
          style: AppTypography.bodyMedium.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _visitWebsite(BuildContext context) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Переход на сайт отеля',
          style: AppTypography.bodyMedium.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
} 