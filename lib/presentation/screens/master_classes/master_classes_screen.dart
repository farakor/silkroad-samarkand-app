import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'master_class_details_screen.dart';

class MasterClassesScreen extends StatelessWidget {
  const MasterClassesScreen({super.key});

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
          'Мастер-классы',
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            _buildHeaderSection(),
            
            const SizedBox(height: 16),
            
            // Master classes grid
            _buildMasterClassesGrid(),
            
            const SizedBox(height: 16),
            
            // Why choose us section
            _buildWhyChooseUsSection(),
            
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
            'Погружение в мир ремесел:\nМастер-классы и творения в\nкомплексе Вечный город',
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Добро пожаловать на уникальную возможность погрузиться в мир ремесел и создать что-то собственными руками! В нашем комплексе «Вечный город» мы предлагаем широкий спектр мастер-классов, которые познакомят вас с традиционными ремеслами Узбекистана. Будь то лепка керамики, ткачество, резьба по дереву или изготовление национальных блюд, наши кулинарные деть мастеров научат вас создавать уникальные произведения искусства.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey700,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasterClassesGrid() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: _masterClasses.length,
        itemBuilder: (context, index) {
          final masterClass = _masterClasses[index];
          return _buildMasterClassCard(context, masterClass);
        },
      ),
    );
  }

  Widget _buildMasterClassCard(BuildContext context, MasterClass masterClass) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
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
          // Image placeholder
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    masterClass.color.withOpacity(0.7),
                    masterClass.color.withOpacity(0.9),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  masterClass.icon,
                  size: 32,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          
          // Content
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    masterClass.title,
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Details
                  _buildDetailRow(Icons.people, masterClass.participants),
                  const SizedBox(height: 4),
                  _buildDetailRow(Icons.access_time, masterClass.duration),
                  const SizedBox(height: 4),
                  _buildDetailRow(Icons.child_care, masterClass.ageRange),
                  
                  const SizedBox(height: 12),
                  
                  // Button
                  Container(
                    width: double.infinity,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MasterClassDetailsScreen(
                                masterClass: masterClass,
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Center(
                          child: Text(
                            'Подробнее',
                            style: AppTypography.labelMedium.copyWith(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: AppColors.grey600,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.grey600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildWhyChooseUsSection() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Почему стоит выбрать наши\nмастер-классы:',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildBenefitItem(
            '⭐',
            'Профессиональные мастера с многолетним опытом.',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            '🎨',
            'Аутентичные рецепты и техники.',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            '💎',
            'Высококачественные материалы и инструменты.',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            '🏛️',
            'Уникальная атмосфера старинного города Самарканда.',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            '👥',
            'Небольшие группы для индивидуального подхода к каждому участнику.',
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String emoji, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grey700,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  static final List<MasterClass> _masterClasses = [
    MasterClass(
      title: 'Плов по самаркандски',
      participants: '3-10',
      duration: '90 минут',
      ageRange: '5+',
      color: const Color(0xFFE91E63),
      icon: Icons.restaurant_menu,
    ),
    MasterClass(
      title: 'Лепешка самаркандская',
      participants: '3-10',
      duration: '60 минут',
      ageRange: '5+',
      color: const Color(0xFFFF9800),
      icon: Icons.local_dining,
    ),
    MasterClass(
      title: 'Самса самаркандская',
      participants: '5-7',
      duration: '45 минут',
      ageRange: '6-12',
      color: const Color(0xFF4CAF50),
      icon: Icons.restaurant,
    ),
    MasterClass(
      title: 'Сладости изготовление',
      participants: '5-30',
      duration: '40-60 минут',
      ageRange: '5-30',
      color: const Color(0xFF9C27B0),
      icon: Icons.cake,
    ),
    MasterClass(
      title: 'Бумага изготовление',
      participants: '6-12',
      duration: '40-60 минут',
      ageRange: '6-12',
      color: const Color(0xFF795548),
      icon: Icons.note,
    ),
    MasterClass(
      title: 'Лепка из глины',
      participants: '2-6',
      duration: '40-60 минут',
      ageRange: '3-30',
      color: const Color(0xFF607D8B),
      icon: Icons.palette,
    ),
    MasterClass(
      title: 'Роспись по дереву',
      participants: '3-30',
      duration: '40-60 минут',
      ageRange: '3-10',
      color: const Color(0xFF8BC34A),
      icon: Icons.brush,
    ),
    MasterClass(
      title: 'Резьба по дереву',
      participants: '5-00',
      duration: '40-60 минут',
      ageRange: '5-00',
      color: const Color(0xFF00BCD4),
      icon: Icons.handyman,
    ),
    MasterClass(
      title: 'Окрашивание шарфов из шёлка',
      participants: '3-10',
      duration: '30-60 минут',
      ageRange: '3-10',
      color: const Color(0xFFE91E63),
      icon: Icons.palette,
    ),
    MasterClass(
      title: 'Чеканка по металлу',
      participants: '3-10',
      duration: '30-60 минут',
      ageRange: '3-10',
      color: const Color(0xFF757575),
      icon: Icons.construction,
    ),
    MasterClass(
      title: 'Художественная миниатюра',
      participants: '3-30',
      duration: '40-60 минут',
      ageRange: '3-10',
      color: const Color(0xFF3F51B5),
      icon: Icons.auto_fix_normal,
    ),
    MasterClass(
      title: 'Живопись акварельная',
      participants: '5-20',
      duration: '30-60 минут',
      ageRange: '5-20',
      color: const Color(0xFF2196F3),
      icon: Icons.color_lens,
    ),
    MasterClass(
      title: 'Кузнечное дело',
      participants: '3-10',
      duration: '40-60 минут',
      ageRange: '3-10',
      color: const Color(0xFF424242),
      icon: Icons.build,
    ),
    MasterClass(
      title: 'Шитьё и вышивка',
      participants: '3-10',
      duration: '30-60 минут',
      ageRange: '3-10',
      color: const Color(0xFFE91E63),
      icon: Icons.content_cut,
    ),
  ];
}

class MasterClass {
  final String title;
  final String participants;
  final String duration;
  final String ageRange;
  final Color color;
  final IconData icon;

  const MasterClass({
    required this.title,
    required this.participants,
    required this.duration,
    required this.ageRange,
    required this.color,
    required this.icon,
  });
} 