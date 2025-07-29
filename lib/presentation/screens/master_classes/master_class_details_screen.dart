import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'master_classes_screen.dart';

class MasterClassDetailsScreen extends StatelessWidget {
  final MasterClass masterClass;
  
  const MasterClassDetailsScreen({
    super.key,
    required this.masterClass,
  });

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
          'Мастер классы',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            _buildHeroImage(),
            
            // Content
            _buildContent(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBookButton(context),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            masterClass.color.withOpacity(0.8),
            masterClass.color.withOpacity(0.6),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background image placeholder with food pattern
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
          // Icon
          Center(
            child: Icon(
              masterClass.icon,
              size: 80,
              color: AppColors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            _getMasterClassTitle(),
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Description Section
          _buildDescriptionSection(),
          
          const SizedBox(height: 24),
          
          // What you'll cook section
          _buildWhatYouCookSection(),
          
          const SizedBox(height: 24),
          
          // Information section
          _buildInformationSection(),
          
          const SizedBox(height: 24),
          
          // Program section
          _buildProgramSection(),
          
          const SizedBox(height: 24),
          
          // Master section
          _buildMasterSection(),
          
          const SizedBox(height: 100), // Space for bottom button
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Описание',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _getDescription(),
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.grey700,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildWhatYouCookSection() {
    if (!_isKitchenMasterClass()) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Что вы приготовите',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _getWhatYouCook().map((item) => _buildCookingItem(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildCookingItem(String item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3C4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        item,
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInformationSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3C4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Информация',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildInfoRow(Icons.account_balance_wallet, 'Стоимость на 1 человека', _getPrice()),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.people, 'Кол-во участников', masterClass.participants),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.access_time, 'Время проведения', _getDuration()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF8B7355),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.grey600,
                ),
              ),
              Text(
                value,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgramSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Программа мастер-класса',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        ...(_getProgramItems().map((item) => _buildProgramItem(item)).toList()),
      ],
    );
  }

  Widget _buildProgramItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check,
              size: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.grey700,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Мастер-класс проводит',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Master avatar
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.7),
                    AppColors.primary.withOpacity(0.9),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 32,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getMasterName(),
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getMasterExperience(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF8B7355),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Handle booking
                _showBookingDialog(context);
              },
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Text(
                  'Забронировать',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Бронирование',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        content: Text(
          'Функция бронирования будет добавлена в следующей версии приложения.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.grey700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods to get specific data based on master class type
  String _getMasterClassTitle() {
    switch (masterClass.title) {
      case 'Плов по самаркандски':
        return 'Мастер-класс по приготовлению\nСамаркандского плова';
      case 'Самса самаркандская':
        return 'Мастер-класс по приготовлению\nСамаркандской самсы';
      case 'Лепешка самаркандская':
        return 'Мастер-класс по приготовлению\nСамаркандской лепешки';
      default:
        return 'Мастер-класс по\n${masterClass.title}';
    }
  }

  String _getDescription() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return 'Самса - это традиционная, сытная и ароматная выпечка, которая готовится из слоеного теста с разнообразными начинками. Такие как с мясом, с зеленью, с картофелем, с тыквой и т.д.\n\nПекарь расскажет и покажет о всех тонкостях приготовления самсы, а гости могут поучаствовать в процессе, а затем попробовать их на вкус.';
      case 'Плов по самаркандски':
        return 'Плов - это традиционное блюдо узбекской кухни, которое готовится из риса, мяса, моркови и специй. Наш мастер-повар расскажет секреты приготовления настоящего самаркандского плова.';
      default:
        return 'Увлекательный мастер-класс, где вы изучите традиционные техники и секреты мастерства. Наши опытные мастера поделятся с вами знаниями, накопленными поколениями.';
    }
  }

  List<String> _getWhatYouCook() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return ['Мясная самса', 'Тыквенная самса', 'Самса с зеленью'];
      case 'Плов по самаркандски':
        return ['Плов с бараниной', 'Плов с говядиной', 'Плов с курицей'];
      case 'Лепешка самаркандская':
        return ['Оби-нон', 'Патыр', 'Чалпак'];
      default:
        return [];
    }
  }

  List<String> _getProgramItems() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return [
          'Приготовление слоеного теста',
          'Подготовка начинок',
          'Формирование самсы',
          'Выпекание в традиционном тандыре',
        ];
      case 'Плов по самаркандски':
        return [
          'Подготовка ингредиентов',
          'Обжарка мяса и моркови',
          'Добавление риса и специй',
          'Томление в казане',
        ];
      default:
        return [
          'Знакомство с инструментами',
          'Изучение техники',
          'Практическая работа',
          'Завершение проекта',
        ];
    }
  }

  String _getMasterName() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return 'Ошлас Ошпазов';
      case 'Плов по самаркандски':
        return 'Усто Каримов';
      default:
        return 'Мастер ${masterClass.title}';
    }
  }

  String _getMasterExperience() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return 'Шеф-повар с 15-летним опытом';
      case 'Плов по самаркандски':
        return 'Мастер плова с 20-летним опытом';
      default:
        return 'Опытный мастер своего дела';
    }
  }

  String _getPrice() {
    switch (masterClass.title) {
      case 'Самса самаркандская':
        return '\$7';
      case 'Плов по самаркандски':
        return '\$12';
      case 'Лепешка самаркандская':
        return '\$5';
      default:
        return '\$8';
    }
  }

  String _getDuration() {
    return masterClass.duration;
  }

  bool _isKitchenMasterClass() {
    return ['Плов по самаркандски', 'Самса самаркандская', 'Лепешка самаркандская', 'Сладости изготовление']
        .contains(masterClass.title);
  }
} 