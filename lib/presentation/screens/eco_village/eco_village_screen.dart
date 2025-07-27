import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class EcoVillageScreen extends StatelessWidget {
  const EcoVillageScreen({super.key});

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
          'Eco Village',
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
            Container(
              width: double.infinity,
              color: AppColors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Выберите виллу',
                    style: AppTypography.headlineSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Роскошные виллы для вашего отдыха',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Info section
            Container(
              width: double.infinity,
              color: AppColors.white,
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Об Eco Village',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Eco Village — комплекс из 14 коттеджей для частного размещения и проведения мероприятий. Дома полностью сконструированы из бруса. Каждый коттедж оснащен кухней, гостиной и столовой. На территории возле дома есть свой бассейн.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.grey700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Amenities
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildAmenityChip(Icons.home, '14 Вилл'),
                      _buildAmenityChip(Icons.villa, '2 Виллы Гранд'),
                      _buildAmenityChip(Icons.pool, 'Бассейн'),
                      _buildAmenityChip(Icons.deck, 'Терраса'),
                      _buildAmenityChip(Icons.local_parking, 'Парковка'),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Villas grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.5,
                    ),
                itemCount: _villas.length,
                itemBuilder: (context, index) {
                  final villa = _villas[index];
                  return _buildVillaCard(villa);
                },
              ),
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
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

  Widget _buildVillaCard(Villa villa) {
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
      child: Row(
        children: [
          // Villa Image
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    villa.color.withOpacity(0.7),
                    villa.color.withOpacity(0.9),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
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
                            villa.color.withOpacity(0.6),
                            villa.color.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.villa,
                        size: 36,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Villa Info
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Villa name
                  Text(
                    villa.name,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Guests info
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 18,
                        color: Colors.amber.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        villa.guestInfo,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
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

  static final List<Villa> _villas = [
    Villa(
      name: 'Вилла Superior',
      guestInfo: '2-4 гостя',
      color: const Color(0xFF1565C0),
    ),
    Villa(
      name: 'Вилла Premium',
      guestInfo: '3-6 гостей',
      color: const Color(0xFF7B1FA2),
    ),
    Villa(
      name: 'Вилла Executive',
      guestInfo: '2-8 гостей',
      color: const Color(0xFF388E3C),
    ),
    Villa(
      name: 'Вилла Grand',
      guestInfo: '2-8 гостей',
      color: const Color(0xFFD32F2F),
    ),
  ];
}

class Villa {
  final String name;
  final String guestInfo;
  final Color color;

  const Villa({
    required this.name,
    required this.guestInfo,
    required this.color,
  });
} 