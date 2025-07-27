import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'hotel_details_screen.dart';
import 'models/hotel_model.dart';

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
          itemCount: sampleHotels.length,
          itemBuilder: (context, index) {
            final hotel = sampleHotels[index];
            return _buildHotelCard(context, hotel);
          },
        ),
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, HotelModel hotel) {
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('🏨 Нажата карточка отеля: ${hotel.name}');
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailsScreen(hotel: hotel),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
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
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: AppColors.grey400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final List<HotelModel> sampleHotels = [
    HotelModel(
      name: 'Hilton Samarkand Regency',
      description: 'Hilton Samarkand Regency расположен в центре в Самарканде, в 5 минутах ходьбы от площади Регистан. Современные номера, спа-центр, фитнес-зал и конгресс-центр на 300 человек.',
      rating: '4.8',
      price: 285,
      color: const Color(0xFF1565C0),
      location: 'площадь Регистан, Самарканд, Узбекистан',
      info: const HotelInfo(
        floors: 20,
        rooms: 232,
        restaurants: 26,
        bars: 2,
        pools: 2,
        conferenceRooms: 2,
        banquetHalls: 1,
      ),
      services: const [
        HotelService(name: 'Профессиональный завтрак', icon: Icons.breakfast_dining),
        HotelService(name: 'Бесплатная парковка', icon: Icons.local_parking),
        HotelService(name: 'Спа и оздоровительный центр', icon: Icons.spa),
        HotelService(name: 'Трансфер от/до аэропорта', icon: Icons.transfer_within_a_station),
        HotelService(name: 'Бесплатный Wi-Fi', icon: Icons.wifi),
        HotelService(name: 'Можно с питомцами', icon: Icons.pets),
        HotelService(name: 'Семейные номера', icon: Icons.family_restroom),
        HotelService(name: 'Доставка еды в номер', icon: Icons.room_service),
        HotelService(name: 'Номера для некурящих', icon: Icons.smoke_free),
      ],
      restaurants: const [
        Restaurant(
          name: 'Rooftop Bar Hillton Samarkand Regency',
          description: 'Крыша ресторана с видом на регистан',
          workingHours: '17:00 - 12:00',
          color: Color(0xFF2E7D32),
        ),
        Restaurant(
          name: 'Panorama Lounge Hillton Samarkand Regency',
          description: 'Панорамный лаундж с видом на город',
          workingHours: '07:00 - 23:00',
          color: Color(0xFF1976D2),
        ),
      ],
      conferenceRooms: const [
        ConferenceRoom(
          name: 'Amirjon + Navoi',
          description: 'Большой конференц-зал для деловых встреч с современным оборудованием',
          capacity: 'до 300 гостей',
          workingHours: '08:00 - 22:00',
          color: Color(0xFFD32F2F),
        ),
        ConferenceRoom(
          name: 'Mukimxon + Bukhari',
          description: 'Банкетный зал с кухней для корпоративных событий и праздников',
          capacity: 'до 150 гостей',
          workingHours: '08:00 - 22:00',
          color: Color(0xFFF57C00),
        ),
      ],
      banquetHall: const BanquetHall(
        name: 'Тилловат Банкетный',
        description: 'Роскошный зал для свадеб и торжественных мероприятий с профессиональным обслуживанием',
        capacity: 'до 250 гостей',
        workingHours: '10:00 - 02:00',
        color: Color(0xFF7B1FA2),
      ),
    ),
    HotelModel(
      name: 'Savitsky Plaza',
      description: 'Роскошный отель в центре Самарканда с видом на исторические памятники. Предлагает высококлассное обслуживание и современные удобства.',
      rating: '4.7',
      price: 220,
      color: const Color(0xFF7B1FA2),
      location: 'улица Мирзо Улугбека, Самарканд',
      info: const HotelInfo(
        floors: 15,
        rooms: 180,
        restaurants: 3,
        bars: 2,
        pools: 1,
        conferenceRooms: 2,
        banquetHalls: 1,
      ),
      services: const [
        HotelService(name: 'Спа-центр', icon: Icons.spa),
        HotelService(name: 'Фитнес-центр', icon: Icons.fitness_center),
        HotelService(name: 'Бассейн', icon: Icons.pool),
        HotelService(name: 'Бесплатный Wi-Fi', icon: Icons.wifi),
        HotelService(name: 'Парковка', icon: Icons.local_parking),
        HotelService(name: 'Ресторан', icon: Icons.restaurant),
      ],
      restaurants: const [
        Restaurant(
          name: 'Savitsky Grill',
          description: 'Ресторан европейской кухни',
          workingHours: '12:00 - 23:00',
          color: Color(0xFF8E24AA),
        ),
        Restaurant(
          name: 'Oriental Lounge',
          description: 'Восточная кухня и чайхана',
          workingHours: '18:00 - 01:00',
          color: Color(0xFF6A1B9A),
        ),
      ],
      conferenceRooms: const [
        ConferenceRoom(
          name: 'Business Hall',
          description: 'Современный зал для деловых встреч',
          capacity: 'до 100 гостей',
          workingHours: '09:00 - 21:00',
          color: Color(0xFF9C27B0),
        ),
      ],
      banquetHall: const BanquetHall(
        name: 'Grand Hall',
        description: 'Элегантный банкетный зал для торжеств',
        capacity: 'до 200 гостей',
        workingHours: '10:00 - 02:00',
        color: Color(0xFFAB47BC),
      ),
    ),
    HotelModel(
      name: 'Silk Road by Minyoun',
      description: 'Уютный бутик-отель в традиционном стиле с современными удобствами. Идеальное место для знакомства с культурой Самарканда.',
      rating: '4.6',
      price: 195,
      color: const Color(0xFF388E3C),
      location: 'Старый город, рядом с мавзолеем Гур-Эмир',
      info: const HotelInfo(
        floors: 8,
        rooms: 95,
        restaurants: 2,
        bars: 1,
        pools: 1,
        conferenceRooms: 1,
        banquetHalls: 1,
      ),
      services: const [
        HotelService(name: 'Национальная кухня', icon: Icons.restaurant),
        HotelService(name: 'Экскурсии', icon: Icons.tour),
        HotelService(name: 'Wi-Fi', icon: Icons.wifi),
        HotelService(name: 'Парковка', icon: Icons.local_parking),
        HotelService(name: 'Трансфер', icon: Icons.airport_shuttle),
      ],
      restaurants: const [
        Restaurant(
          name: 'Silk Road Restaurant',
          description: 'Аутентичная узбекская кухня',
          workingHours: '07:00 - 22:00',
          color: Color(0xFF4CAF50),
        ),
      ],
      conferenceRooms: const [
        ConferenceRoom(
          name: 'Heritage Room',
          description: 'Зал в традиционном стиле',
          capacity: 'до 50 гостей',
          workingHours: '09:00 - 20:00',
          color: Color(0xFF2E7D32),
        ),
      ],
      banquetHall: const BanquetHall(
        name: 'Traditional Hall',
        description: 'Банкетный зал в национальном стиле',
        capacity: 'до 80 гостей',
        workingHours: '12:00 - 00:00',
        color: Color(0xFF66BB6A),
      ),
    ),
  ];
} 