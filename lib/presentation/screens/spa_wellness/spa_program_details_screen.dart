import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'models/spa_program_model.dart';
import 'models/daily_program_model.dart';
import 'daily_program_screen.dart';

class SpaProgramDetailsScreen extends StatelessWidget {
  final SpaProgramModel program;
  
  const SpaProgramDetailsScreen({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
          'Программа',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
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
            _buildHeroImage(),
            const SizedBox(height: 24),
            _buildProgramTitle(),
            const SizedBox(height: 16),
            _buildMainDescription(),
            const SizedBox(height: 32),
            _buildProgramIncludes(),
            const SizedBox(height: 24),
            _buildDetailedSections(),
            const SizedBox(height: 24),
            _buildProgramCost(),
            const SizedBox(height: 24),
            _buildProgramComposition(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(program.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProgramTitle() {
    return Text(
      'Программа «${program.title}»',
      style: AppTypography.headlineSmall.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.secondary,
      ),
    );
  }

  Widget _buildMainDescription() {
    return Text(
      program.description,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.grey600,
        height: 1.6,
      ),
    );
  }

  Widget _buildProgramIncludes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Программа «${program.title}» включает в себя:',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        ...program.procedures.map((procedure) => Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey200,
              width: 1,
            ),
          ),
          child: Text(
            procedure,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildDetailedSections() {
    final sections = [
      {
        'title': 'Диагностика организма',
        'description': 'Полная диагностика организма поможет определить истинные несовершенства кожи и причины их старения, а также составить прогноз на будущее.',
      },
      {
        'title': 'Персональная программа преображения',
        'description': 'Получив результаты обследования, врач-куратор составляет индивидуальную программу омоложения.',
      },
      {
        'title': 'Активация ресурсов организма',
        'description': 'Косметологи и врачи медицинского центра проводят процедуры, направленные на улучшение работы всех внутренних органов.',
      },
      {
        'title': 'Разработка комплексной стратегии',
        'description': 'По завершению программы, Вы получите личный «Паспорт кожи и здоровья» с персональными рекомендациями для поддержания достигнутых результатов и соблюдению здорового образа жизни.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((section) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section['title']!,
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              section['description']!,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.grey600,
                height: 1.5,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildProgramCost() {
    final includedItems = [
      'специализированные обследования;',
      'разработка и реализация персонального плана оздоровления;',
      'медицинские и косметологические процедуры;',
      'основы правильного питания;',
      'ежедневные консультирование с персональным врачом-куратором;',
      'заключительная консультация лечащего врача;',
      'формирование «Паспорта здоровья».',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'В стоимость программы включены:',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        ...includedItems.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.grey600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildProgramComposition(BuildContext context) {
    final programOptions = [
      {'days': '5 дней', 'color': const Color(0xFFE3F2FD)},
      {'days': '7 дней', 'color': const Color(0xFFF3E5F5)},
      {'days': '10 дней', 'color': const Color(0xFFE8F5E8)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Состав оздоровительной программы',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 16),
        ...programOptions.map((option) => Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: option['color'] as Color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.grey200,
              width: 1,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                HapticFeedback.lightImpact();
                _navigateToDailyProgram(context, option['days'] as String);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Программа на ${option['days']}',
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )).toList(),
      ],
    );
  }

  void _navigateToDailyProgram(BuildContext context, String daysOption) {
    // Извлекаем количество дней из строки "5 дней"
    final days = int.parse(daysOption.split(' ')[0]);
    
    // Находим соответствующую программу по дням
    final dailyProgram = sampleDailyPrograms.firstWhere(
      (dailyProg) => dailyProg.days == days && dailyProg.programName == program.title,
      orElse: () => sampleDailyPrograms.first, // fallback на первую программу
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DailyProgramScreen(program: dailyProgram),
      ),
    );
  }
} 