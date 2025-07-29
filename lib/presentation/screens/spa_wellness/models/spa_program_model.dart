import 'package:flutter/material.dart';

class SpaProgramModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String duration;
  final int price;
  final List<String> benefits;
  final List<String> procedures;
  final Color color;

  const SpaProgramModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.price,
    required this.benefits,
    required this.procedures,
    required this.color,
  });
}

class SpaService {
  final String name;
  final IconData icon;
  final String description;

  const SpaService({
    required this.name,
    required this.icon,
    required this.description,
  });
}

// Тестовые данные
final List<SpaProgramModel> sampleSpaPrograms = [
  SpaProgramModel(
    id: '1',
    title: 'Ваша красота',
    description: 'Уникальная индивидуальная программа омоложения и преображения, внутреннего и внешнего. Результат программы — видимое качественное преображение, омоложение и значительное улучшение общего самочувствия. Мы проведем полную персональную диагностику всех важных систем, составим паспорт кожи и здоровья. Получите детальные данные о состоянии организма, Вы узнаете персональные настройки для использования программ для поддержания красоты и молодости.',
    imageUrl: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '5-10 дней',
    price: 2500000,
    benefits: ['Омоложение кожи', 'Детоксикация организма', 'Персональная диагностика', 'Индивидуальная программа'],
    procedures: ['RF-Lifting', 'Прессотерапия и массажи лица', 'Процедуры для красоты лица и тела позволят достичь удивительного преображения — гладкой ровной кожи и подтянутой фигуры'],
    color: const Color(0xFFE17055),
  ),
  SpaProgramModel(
    id: '2',
    title: 'Программа Анти-стресс',
    description: 'Комплексная программа для снятия стресса и восстановления душевного равновесия с использованием современных методик релаксации',
    imageUrl: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '3-7 дней',
    price: 980000,
    benefits: ['Снятие стресса', 'Улучшение сна', 'Повышение работоспособности', 'Эмоциональный баланс'],
    procedures: ['Релаксационный массаж', 'Ароматерапия', 'Медитативные практики', 'Термальные процедуры'],
    color: const Color(0xFF6B73FF),
  ),
  SpaProgramModel(
    id: '3',
    title: 'Здоровое похудение',
    description: 'Комплексная медицинская программа снижения веса с учетом индивидуальных особенностей организма и метаболизма',
    imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '7-14 дней',
    price: 1850000,
    benefits: ['Безопасное снижение веса', 'Ускорение метаболизма', 'Коррекция пищевого поведения', 'Долгосрочный результат'],
    procedures: ['Медицинская диагностика метаболизма', 'Индивидуальная диетотерапия', 'Лимфодренажный массаж', 'Кавитация и RF-лифтинг тела'],
    color: const Color(0xFF51CF66),
  ),
  SpaProgramModel(
    id: '4',
    title: 'Комплексная детоксикация',
    description: 'Медицинская программа очищения организма с применением современных и традиционных методов детоксикации',
    imageUrl: 'https://images.unsplash.com/photo-1600334129128-685c5582fd35?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '5-7 дней',
    price: 1320000,
    benefits: ['Глубокое очищение организма', 'Нормализация обмена веществ', 'Повышение энергии', 'Укрепление иммунитета'],
    procedures: ['Медицинская диагностика интоксикации', 'Озонотерапия', 'Фитотерапия', 'Гидроколонотерапия'],
    color: const Color(0xFF74B9FF),
  ),
  SpaProgramModel(
    id: '5',
    title: 'Антицеллюлитная программа',
    description: 'Комплексная борьба с целлюлитом и улучшение состояния кожи',
    imageUrl: 'https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '6 дней',
    price: 590000,
    benefits: ['Уменьшение целлюлита', 'Упругость кожи', 'Коррекция фигуры'],
    procedures: ['Мезотерапия', 'Обертывания', 'Прессотерапия'],
    color: const Color(0xFFFFB340),
  ),
  SpaProgramModel(
    id: '6',
    title: 'Лимфатическая программа',
    description: 'Программа для улучшения лимфотока и выведения токсинов',
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '5 дней',
    price: 470000,
    benefits: ['Улучшение лимфотока', 'Снятие отеков', 'Детокс'],
    procedures: ['Лимфодренаж', 'Прессотерапия', 'Ручной массаж'],
    color: const Color(0xFF74B9FF),
  ),
  SpaProgramModel(
    id: '7',
    title: 'Антивозрастная медицина',
    description: 'Персональная программа замедления процессов старения с использованием передовых методов антиэйдж медицины',
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '10-14 дней',
    price: 3200000,
    benefits: ['Биологическое омоложение', 'Гормональная оптимизация', 'Клеточная регенерация', 'Улучшение качества жизни'],
    procedures: ['Комплексная антиэйдж диагностика', 'Биоревитализация премиум класса', 'Пептидная терапия', 'Инфузионная терапия'],
    color: const Color(0xFFA29BFE),
  ),
  SpaProgramModel(
    id: '8',
    title: 'Соляная терапия',
    description: 'Лечебная программа в соляной пещере для дыхательной системы',
    imageUrl: 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    duration: '3 дня',
    price: 280000,
    benefits: ['Улучшение дыхания', 'Очищение легких', 'Релаксация'],
    procedures: ['Галотерапия', 'Соляные ингаляции', 'Медитация'],
    color: const Color(0xFFA29BFE),
  ),
];

final List<SpaService> spaServices = [
  SpaService(
    name: 'Лечебная диагностика',
    icon: Icons.health_and_safety,
    description: 'Современные методы диагностики здоровья',
  ),
  SpaService(
    name: 'Современная аппаратура',
    icon: Icons.medical_services,
    description: 'Новейшее медицинское оборудование',
  ),
  SpaService(
    name: 'Лечебная терапия',
    icon: Icons.spa,
    description: 'Комплексные терапевтические процедуры',
  ),
  SpaService(
    name: 'Премиум номера',
    icon: Icons.hotel,
    description: 'Комфортабельное размещение',
  ),
]; 