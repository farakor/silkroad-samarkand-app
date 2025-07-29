import 'package:flutter/material.dart';

class DailyProgramModel {
  final String id;
  final String programName;
  final int days;
  final String description;
  final String imageUrl;
  final int totalCost;
  final List<ProgramSection> sections;
  final Color color;

  const DailyProgramModel({
    required this.id,
    required this.programName,
    required this.days,
    required this.description,
    required this.imageUrl,
    required this.totalCost,
    required this.sections,
    required this.color,
  });
}

class ProgramSection {
  final String title;
  final List<ProgramItem> items;

  const ProgramSection({
    required this.title,
    required this.items,
  });
}

class ProgramItem {
  final String name;
  final String description;
  final int durationMinutes;
  final int? sessions; // Количество процедур
  final int dayNumber; // Номер дня в программе

  const ProgramItem({
    required this.name,
    required this.description,
    required this.durationMinutes,
    this.sessions,
    required this.dayNumber,
  });
}

// Тестовые данные для программы "Ваша красота"
final List<DailyProgramModel> sampleDailyPrograms = [
  DailyProgramModel(
    id: 'beauty_5_days',
    programName: 'Ваша красота',
    days: 5,
    description: 'Комплексная программа оздоровления, разработанная нашими специалистами для восстановления вашего здоровья и красоты.',
    imageUrl: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    totalCost: 4315000,
    color: const Color(0xFFE17055),
    sections: [
      ProgramSection(
        title: 'Состав программы',
        items: [
          ProgramItem(
            name: 'Первичная консультация врача-куратора',
            description: '',
            durationMinutes: 20,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Повторная консультация врача-куратора',
            description: '',
            durationMinutes: 20,
            dayNumber: 3,
          ),
          ProgramItem(
            name: 'Заключительная консультация врача-куратора с формированием «Паспорт здоровья»',
            description: '',
            durationMinutes: 20,
            dayNumber: 5,
          ),
        ],
      ),
      ProgramSection(
        title: 'Пакет анализов',
        items: [
          ProgramItem(
            name: 'Комплексное обследование',
            description: 'Общий анализ крови с СОЭ, Т3, Т4 свободный, ТЗ свободный, антитела к ТПО, кортизол, пролактин, ФСГ, ЛГ, эстрадиол, тестостерон свободный, СА 125, СА 15-3, СА 19-9, РЭА, ПСА свободный и общий, АФП, НСЕ, общий анализ мочи',
            durationMinutes: 10,
            dayNumber: 1,
          ),
        ],
      ),
      ProgramSection(
        title: 'Консультации и процедуры',
        items: [
          ProgramItem(
            name: 'Консультация специалиста',
            description: 'диетолог, эндокринолог или уролог',
            durationMinutes: 20,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Радиоультразвуковой лифтинг',
            description: 'аппарат BTL EXILIS Elite',
            durationMinutes: 20,
            dayNumber: 2,
          ),
          ProgramItem(
            name: 'Косметологический массаж лица',
            description: 'классический',
            durationMinutes: 20,
            dayNumber: 2,
          ),
          ProgramItem(
            name: 'PRP терапия с консультацией',
            description: 'плазмотерапия, 1 процедура',
            durationMinutes: 0,
            sessions: 2,
            dayNumber: 3,
          ),
          ProgramItem(
            name: 'Индивидуальные занятия ЛФК',
            description: '',
            durationMinutes: 30,
            dayNumber: 3,
          ),
          ProgramItem(
            name: 'Магнитотерапия',
            description: 'для снятия мышечного стресса',
            durationMinutes: 30,
            dayNumber: 4,
          ),
          ProgramItem(
            name: 'Прессотерапия',
            description: 'для детокс эффекта и сосудов ног',
            durationMinutes: 20,
            dayNumber: 4,
          ),
          ProgramItem(
            name: 'Общий массаж',
            description: '',
            durationMinutes: 60,
            dayNumber: 4,
          ),
          ProgramItem(
            name: 'Нормобарическая оксигенация',
            description: '',
            durationMinutes: 60,
            dayNumber: 5,
          ),
          ProgramItem(
            name: 'УЗИ органов брюшной полости и почек',
            description: '',
            durationMinutes: 20,
            dayNumber: 5,
          ),
        ],
      ),
    ],
  ),
  DailyProgramModel(
    id: 'beauty_7_days',
    programName: 'Ваша красота',
    days: 7,
    description: 'Расширенная программа оздоровления с дополнительными процедурами для максимального эффекта.',
    imageUrl: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    totalCost: 5890000,
    color: const Color(0xFFE17055),
    sections: [
      ProgramSection(
        title: 'Состав программы',
        items: [
          ProgramItem(
            name: 'Первичная консультация врача-куратора',
            description: '',
            durationMinutes: 20,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Промежуточная консультация врача-куратора',
            description: '',
            durationMinutes: 20,
            dayNumber: 4,
          ),
          ProgramItem(
            name: 'Заключительная консультация врача-куратора с формированием «Паспорт здоровья»',
            description: '',
            durationMinutes: 20,
            dayNumber: 7,
          ),
        ],
      ),
      ProgramSection(
        title: 'Расширенный пакет анализов',
        items: [
          ProgramItem(
            name: 'Полное комплексное обследование',
            description: 'Расширенный анализ крови, гормональная панель, онкомаркеры, витамины D3, B12, фолиевая кислота',
            durationMinutes: 15,
            dayNumber: 1,
          ),
        ],
      ),
      ProgramSection(
        title: 'Консультации и процедуры',
        items: [
          ProgramItem(
            name: 'Консультация специалистов',
            description: 'диетолог, эндокринолог, кардиолог',
            durationMinutes: 60,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Радиоультразвуковой лифтинг',
            description: 'курс из 3 процедур',
            durationMinutes: 20,
            sessions: 3,
            dayNumber: 2,
          ),
          ProgramItem(
            name: 'PRP терапия лица',
            description: 'курс из 2 процедур',
            durationMinutes: 30,
            sessions: 2,
            dayNumber: 3,
          ),
          ProgramItem(
            name: 'Индивидуальные занятия ЛФК',
            description: 'ежедневно',
            durationMinutes: 30,
            sessions: 7,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Общий массаж',
            description: 'курс из 3 процедур',
            durationMinutes: 60,
            sessions: 3,
            dayNumber: 3,
          ),
        ],
      ),
    ],
  ),
  DailyProgramModel(
    id: 'beauty_10_days',
    programName: 'Ваша красота',
    days: 10,
    description: 'Максимально полная программа оздоровления и омоложения с комплексным подходом.',
    imageUrl: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    totalCost: 8750000,
    color: const Color(0xFFE17055),
    sections: [
      ProgramSection(
        title: 'VIP состав программы',
        items: [
          ProgramItem(
            name: 'Первичная консультация врача-куратора',
            description: 'персональный план лечения',
            durationMinutes: 30,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Еженедельные консультации врача-куратора',
            description: 'контроль прогресса',
            durationMinutes: 20,
            sessions: 2,
            dayNumber: 5,
          ),
          ProgramItem(
            name: 'Финальная консультация с полным «Паспортом здоровья»',
            description: 'рекомендации на год',
            durationMinutes: 40,
            dayNumber: 10,
          ),
        ],
      ),
      ProgramSection(
        title: 'Премиум диагностика',
        items: [
          ProgramItem(
            name: 'Максимальный пакет обследований',
            description: 'Полная лабораторная диагностика, МРТ, УЗИ всех органов, ЭКГ, анализы на все витамины и микроэлементы',
            durationMinutes: 45,
            dayNumber: 1,
          ),
        ],
      ),
      ProgramSection(
        title: 'Интенсивная терапия',
        items: [
          ProgramItem(
            name: 'Ежедневные процедуры красоты',
            description: 'RF-лифтинг, мезотерапия, массаж лица',
            durationMinutes: 90,
            sessions: 10,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Курс PRP терапии',
            description: 'омоложение лица и тела',
            durationMinutes: 45,
            sessions: 4,
            dayNumber: 2,
          ),
          ProgramItem(
            name: 'Профессиональный массаж',
            description: 'ежедневные сеансы',
            durationMinutes: 90,
            sessions: 10,
            dayNumber: 1,
          ),
          ProgramItem(
            name: 'Комплексная детоксикация',
            description: 'очищение организма',
            durationMinutes: 60,
            sessions: 5,
            dayNumber: 2,
          ),
        ],
      ),
    ],
  ),
]; 