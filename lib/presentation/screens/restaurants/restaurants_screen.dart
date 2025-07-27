import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'models/restaurant_model.dart';
import 'restaurant_details_screen.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  RestaurantCategory? selectedCategory;

  List<RestaurantModel> get filteredRestaurants {
    if (selectedCategory == null) {
      return sampleRestaurants;
    }
    return sampleRestaurants.where((restaurant) => restaurant.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Рестораны',
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Категории фильтр
          _buildCategoryFilter(),
          
          // Список ресторанов
          Expanded(
            child: filteredRestaurants.isEmpty
                ? _buildEmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredRestaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = filteredRestaurants[index];
                      return _buildRestaurantCard(context, restaurant);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: RestaurantCategory.values.length + 1, // +1 для "Все"
        itemBuilder: (context, index) {
          if (index == 0) {
            // Кнопка "Все"
            return _buildCategoryChip(
              title: 'Все',
              icon: Icons.grid_view,
              isSelected: selectedCategory == null,
              onTap: () {
                setState(() {
                  selectedCategory = null;
                });
              },
            );
          }
          
          final category = RestaurantCategory.values[index - 1];
          return _buildCategoryChip(
            title: category.title,
            icon: category.icon,
            isSelected: selectedCategory == category,
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryChip({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grey200,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.white : AppColors.secondary,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: AppTypography.bodySmall.copyWith(
                color: isSelected ? AppColors.white : AppColors.secondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, RestaurantModel restaurant) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: AppColors.grey300.withOpacity(0.5),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          print('🍽️ Нажата карточка ресторана: ${restaurant.name}');
          HapticFeedback.lightImpact();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(restaurant: restaurant),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение ресторана
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      restaurant.color.withOpacity(0.8),
                      restaurant.color.withOpacity(0.6),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Декоративные элементы
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          restaurant.category.icon,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    
                    // Рейтинг
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              restaurant.rating.toString(),
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Центральная иконка
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.restaurant_menu,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Информация о ресторане
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      restaurant.cuisine,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.secondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 6),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                          color: AppColors.grey400,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            restaurant.location,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.grey400,
                              fontSize: 10,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    
                    const Spacer(),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant.priceRange,
                          style: AppTypography.bodySmall.copyWith(
                            color: restaurant.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (restaurant.hasDelivery)
                          Icon(
                            Icons.delivery_dining,
                            size: 16,
                            color: AppColors.success,
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
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: 64,
            color: AppColors.grey300,
          ),
          const SizedBox(height: 16),
          Text(
            'Рестораны не найдены',
            style: AppTypography.headlineSmall.copyWith(
              color: AppColors.grey400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Попробуйте изменить фильтр',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey400,
            ),
          ),
        ],
      ),
    );
  }

  // Примерные данные ресторанов
  static final List<RestaurantModel> sampleRestaurants = [
    // Restaurants
    RestaurantModel(
      id: 'seasons',
      name: 'Restaurant Seasons',
      description: 'Изысканная европейская кухня с панорамным видом на город',
      category: RestaurantCategory.restaurants,
      location: 'Hilton Samarkand Regency',
      rating: 4.8,
      priceRange: r'$$$$',
      imageUrl: '',
      color: Colors.deepPurple,
      cuisine: 'Европейская',
      workingHours: '18:00 - 23:00',
      phoneNumber: '+998 66 229 8888',
      features: ['Панорамный вид', 'Живая музыка', 'Винная карта'],
      hasDelivery: false,
      hasReservation: true,
    ),
    
    RestaurantModel(
      id: 'afrosiyob',
      name: 'Ресторан Afrosiyob',
      description: 'Традиционная узбекская кухня в современном исполнении',
      category: RestaurantCategory.restaurants,
      location: 'Hilton Garden Inn Samarkand Afrosiyob',
      rating: 4.6,
      priceRange: r'$$$',
      imageUrl: '',
      color: Colors.teal,
      cuisine: 'Узбекская',
      workingHours: '12:00 - 22:00',
      phoneNumber: '+998 66 229 7777',
      features: ['Национальная кухня', 'Тандыр', 'Халяльное меню'],
      hasDelivery: true,
      hasReservation: true,
    ),
    
    // Lobby bars
    RestaurantModel(
      id: 'hilton_lobby',
      name: 'Лобби бар Hilton Samarkand Regency',
      description: 'Элегантный лобби бар с изысканными коктейлями',
      category: RestaurantCategory.lobbyBars,
      location: 'Hilton Samarkand Regency',
      rating: 4.5,
      priceRange: r'$$$',
      imageUrl: '',
      color: Colors.indigo,
      cuisine: 'Коктейли и закуски',
      workingHours: '24/7',
      phoneNumber: '+998 66 229 8888',
      features: ['Круглосуточно', 'Коктейльная карта', 'Wi-Fi'],
      hasDelivery: false,
      hasReservation: false,
    ),
    
    RestaurantModel(
      id: 'charlotte',
      name: 'Кофейня Charlotte',
      description: 'Уютная кофейня с авторскими напитками и десертами',
      category: RestaurantCategory.lobbyBars,
      location: 'Центр города',
      rating: 4.7,
      priceRange: r'$$',
      imageUrl: '',
      color: Colors.brown,
      cuisine: 'Кофе и десерты',
      workingHours: '08:00 - 22:00',
      phoneNumber: '+998 66 123 4567',
      features: ['Авторский кофе', 'Свежая выпечка', 'Wi-Fi'],
      hasDelivery: true,
      hasReservation: false,
    ),
    
    // Lounge bars
    RestaurantModel(
      id: 'sky_bar',
      name: 'Ресторан Sky Bar',
      description: 'Роскошный ресторан на крыше с панорамным видом',
      category: RestaurantCategory.loungeBars,
      location: 'Крыша отеля',
      rating: 4.9,
      priceRange: r'$$$$',
      imageUrl: '',
      color: Colors.deepOrange,
      cuisine: 'Фьюжн',
      workingHours: '19:00 - 02:00',
      phoneNumber: '+998 66 999 8888',
      features: ['Панорамный вид', 'DJ сеты', 'VIP зоны'],
      hasDelivery: false,
      hasReservation: true,
    ),
    
    // Fitobars
    RestaurantModel(
      id: 'nephrite_fitobar',
      name: 'Фитобар Nephrite SPA & Wellness',
      description: 'Здоровые напитки и органические смузи',
      category: RestaurantCategory.fitoBars,
      location: 'Nephrite SPA',
      rating: 4.4,
      priceRange: r'$$',
      imageUrl: '',
      color: Colors.green,
      cuisine: 'Здоровое питание',
      workingHours: '09:00 - 21:00',
      phoneNumber: '+998 66 777 5555',
      features: ['Органические продукты', 'Детокс программы', 'Веганское меню'],
      hasDelivery: false,
      hasReservation: false,
    ),
    
    // Poolside bars
    RestaurantModel(
      id: 'poolside_hilton',
      name: 'Бар у бассейна Hilton Samarkand Regency',
      description: 'Освежающие коктейли и легкие закуски у бассейна',
      category: RestaurantCategory.poolsideBars,
      location: 'Hilton Samarkand Regency',
      rating: 4.3,
      priceRange: r'$$$',
      imageUrl: '',
      color: Colors.cyan,
      cuisine: 'Коктейли и гриль',
      workingHours: '10:00 - 22:00 (летний сезон)',
      phoneNumber: '+998 66 229 8888',
      features: ['Открытый бассейн', 'Гриль меню', 'Тропические коктейли'],
      hasDelivery: false,
      hasReservation: false,
    ),
    
    // Eternal City
    RestaurantModel(
      id: 'buyuk_samarkand',
      name: 'Ресторан Buyuk Samarkand',
      description: 'Аутентичная узбекская кухня в исторической части города',
      category: RestaurantCategory.eternalCity,
      location: 'Eternal City',
      rating: 4.6,
      priceRange: r'$$',
      imageUrl: '',
      color: Colors.amber,
      cuisine: 'Традиционная узбекская',
      workingHours: '11:00 - 23:00',
      phoneNumber: '+998 66 555 1234',
      features: ['Историческая атмосфера', 'Национальные танцы', 'Плов в тандыре'],
      hasDelivery: true,
      hasReservation: true,
    ),
    
    RestaurantModel(
      id: 'manzara',
      name: 'Чайхана Manzara',
      description: 'Традиционная чайхана с аутентичной атмосферой',
      category: RestaurantCategory.eternalCity,
      location: 'Eternal City',
      rating: 4.5,
      priceRange: r'$',
      imageUrl: '',
      color: Colors.orange,
      cuisine: 'Чайная традиция',
      workingHours: '08:00 - 24:00',
      phoneNumber: '+998 66 555 9876',
      features: ['Зеленый чай', 'Национальные сладости', 'Кальян'],
      hasDelivery: false,
      hasReservation: false,
    ),
  ];
} 