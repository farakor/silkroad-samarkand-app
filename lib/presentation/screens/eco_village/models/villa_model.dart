import 'package:flutter/material.dart';

class VillaModel {
  final String name;
  final String description;
  final String area;
  final int bedrooms;
  final int diningRoom;
  final int livingRoom;
  final String fireplace;
  final String openPool;
  final String accommodation;
  final Color color;
  final String location;
  final List<WellnessService> wellnessServices;
  final String accessInfo;

  const VillaModel({
    required this.name,
    required this.description,
    required this.area,
    required this.bedrooms,
    required this.diningRoom,
    required this.livingRoom,
    required this.fireplace,
    required this.openPool,
    required this.accommodation,
    required this.color,
    required this.location,
    required this.wellnessServices,
    required this.accessInfo,
  });
}

class WellnessService {
  final String name;
  final String description;
  final IconData icon;

  const WellnessService({
    required this.name,
    required this.description,
    required this.icon,
  });
} 