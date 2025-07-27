import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

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
          'Отели',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            childAspectRatio: 1.8,
          ),
          itemCount: _hotels.length,
          itemBuilder: (context, index) {
            final hotel = _hotels[index];
            return _buildHotelCard(hotel);
          },
        ),
      ),
    );
  }

  Widget _buildHotelCard(Hotel hotel) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    hotel.color.withOpacity(0.7),
                    hotel.color.withOpacity(0.9),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            hotel.color.withOpacity(0.6),
                            hotel.color.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.hotel,
                        size: 48,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: AppColors.grey600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Hotel Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel name and price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: AppTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'от \$${hotel.price}',
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        hotel.rating,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static final List<Hotel> _hotels = [
    Hotel(
      name: 'Hilton Samarkand Regency',
      rating: '4.8',
      price: 285,
      color: const Color(0xFF1565C0),
    ),
    Hotel(
      name: 'Savitsky Plaza',
      rating: '4.7',
      price: 220,
      color: const Color(0xFF7B1FA2),
    ),
    Hotel(
      name: 'Silk Road by Minyoun',
      rating: '4.6',
      price: 195,
      color: const Color(0xFF388E3C),
    ),
    Hotel(
      name: 'Lial by Minyoun Stars',
      rating: '4.5',
      price: 180,
      color: const Color(0xFFD32F2F),
    ),
    Hotel(
      name: 'Hilton Garden Inn Afrosiyob',
      rating: '4.4',
      price: 165,
      color: const Color(0xFF455A64),
    ),
    Hotel(
      name: 'Hilton Garden Inn Sogd',
      rating: '4.3',
      price: 150,
      color: const Color(0xFF6A1B9A),
    ),
    Hotel(
      name: 'Wellness Park Hotel Turon',
      rating: '4.2',
      price: 135,
      color: const Color(0xFF00796B),
    ),
    Hotel(
      name: 'Wellness Park Hotel Bactria',
      rating: '4.1',
      price: 120,
      color: const Color(0xFFE64A19),
    ),
  ];
}

class Hotel {
  final String name;
  final String rating;
  final int price;
  final Color color;

  const Hotel({
    required this.name,
    required this.rating,
    this.price = 100,
    required this.color,
  });
} 