import 'package:flutter/material.dart';
import 'villa_model.dart';

class VillaTestData {
  static final VillaModel executiveVilla = VillaModel(
    name: 'Вилла Executive',
    description: 'Гостевой дом площадью 243 м² с 4 спальнями, обеденным залом на 8 человек, гостиной с дровяным камином и открытым бассейном возле дома.',
    area: '243 м²',
    bedrooms: 4,
    diningRoom: 8,
    livingRoom: 1,
    fireplace: 'дровяной камин',
    openPool: 'открытый бассейн',
    accommodation: 'Возможно размещение до 8 человек: 1 спальня с собственным ванной и гардеробной на первом этаже, 3 спальни на втором этаже, две из которых с собственной ванной комнатой, а также общая ванная комната на этаже.',
    color: const Color(0xFF388E3C),
    location: 'Eco Village, Silk Road Samarkand',
    accessInfo: 'От центра города дорога займет около 15 минут.',
    wellnessServices: [
      WellnessService(
        name: 'Барокамера',
        description: 'комфортная кислородная терапия для восстановления организма',
        icon: Icons.air,
      ),
      WellnessService(
        name: 'Солная комната',
        description: 'отдых в пространстве, наполненном природной целебной солью',
        icon: Icons.spa,
      ),
      WellnessService(
        name: 'Прессотерапия',
        description: 'массаж с применением сжатого воздуха',
        icon: Icons.compress,
      ),
      WellnessService(
        name: 'Миостимуляция',
        description: 'укрепление глубоких и внутренних мышц',
        icon: Icons.fitness_center,
      ),
      WellnessService(
        name: 'Высокоинтенсивная магнитотерапия',
        description: 'лечение с применением магнитного поля',
        icon: Icons.medical_services,
      ),
      WellnessService(
        name: 'Микроволновая диатермия',
        description: 'глубокий прогрев тканей для быстрого восстановления',
        icon: Icons.waves,
      ),
    ],
  );

  static final List<VillaModel> allVillas = [
    executiveVilla,
    VillaModel(
      name: 'Вилла Superior',
      description: 'Уютная вилла для спокойного отдыха',
      area: '180 м²',
      bedrooms: 2,
      diningRoom: 4,
      livingRoom: 1,
      fireplace: 'газовый камин',
      openPool: 'открытый бассейн',
      accommodation: 'Возможно размещение до 4 человек: 2 спальни с собственными ванными комнатами.',
      color: const Color(0xFF1565C0),
      location: 'Eco Village, Silk Road Samarkand',
      accessInfo: 'От центра города дорога займет около 15 минут.',
      wellnessServices: [
        WellnessService(
          name: 'Солная комната',
          description: 'отдых в пространстве, наполненном природной целебной солью',
          icon: Icons.spa,
        ),
        WellnessService(
          name: 'Массаж',
          description: 'расслабляющий массаж для снятия напряжения',
          icon: Icons.healing,
        ),
      ],
    ),
    VillaModel(
      name: 'Вилла Premium',
      description: 'Роскошная вилла с дополнительными удобствами',
      area: '210 м²',
      bedrooms: 3,
      diningRoom: 6,
      livingRoom: 1,
      fireplace: 'дровяной камин',
      openPool: 'открытый бассейн с подогревом',
      accommodation: 'Возможно размещение до 6 человек: 3 спальни с собственными ванными комнатами и гардеробными.',
      color: const Color(0xFF7B1FA2),
      location: 'Eco Village, Silk Road Samarkand',
      accessInfo: 'От центра города дорога займет около 15 минут.',
      wellnessServices: [
        WellnessService(
          name: 'Барокамера',
          description: 'комфортная кислородная терапия для восстановления организма',
          icon: Icons.air,
        ),
        WellnessService(
          name: 'Солная комната',
          description: 'отдых в пространстве, наполненном природной целебной солью',
          icon: Icons.spa,
        ),
        WellnessService(
          name: 'Миостимуляция',
          description: 'укрепление глубоких и внутренних мышц',
          icon: Icons.fitness_center,
        ),
      ],
    ),
    VillaModel(
      name: 'Вилла Grand',
      description: 'Самая большая и роскошная вилла комплекса',
      area: '300 м²',
      bedrooms: 4,
      diningRoom: 10,
      livingRoom: 2,
      fireplace: 'дровяной камин с каминным залом',
      openPool: 'большой открытый бассейн с джакузи',
      accommodation: 'Возможно размещение до 8 человек: 4 просторные спальни с собственными ванными комнатами, гардеробными и балконами.',
      color: const Color(0xFFD32F2F),
      location: 'Eco Village, Silk Road Samarkand',
      accessInfo: 'От центра города дорога займет около 15 минут.',
      wellnessServices: [
        WellnessService(
          name: 'Барокамера',
          description: 'комфортная кислородная терапия для восстановления организма',
          icon: Icons.air,
        ),
        WellnessService(
          name: 'Солная комната',
          description: 'отдых в пространстве, наполненном природной целебной солью',
          icon: Icons.spa,
        ),
        WellnessService(
          name: 'Прессотерапия',
          description: 'массаж с применением сжатого воздуха',
          icon: Icons.compress,
        ),
        WellnessService(
          name: 'Миостимуляция',
          description: 'укрепление глубоких и внутренних мышц',
          icon: Icons.fitness_center,
        ),
        WellnessService(
          name: 'Высокоинтенсивная магнитотерапия',
          description: 'лечение с применением магнитного поля',
          icon: Icons.medical_services,
        ),
        WellnessService(
          name: 'Микроволновая диатермия',
          description: 'глубокий прогрев тканей для быстрого восстановления',
          icon: Icons.waves,
        ),
        WellnessService(
          name: 'Персональный SPA',
          description: 'индивидуальные процедуры в собственном SPA-центре',
          icon: Icons.local_hotel,
        ),
      ],
    ),
  ];
} 