import 'package:flutter/material.dart';

enum RestaurantCategory {
  restaurants('Рестораны', Icons.restaurant),
  lobbyBars('Лобби бары', Icons.local_bar),
  loungeBars('Лаунж бары', Icons.wine_bar),
  fitoBars('Фитобары', Icons.local_drink),
  poolsideBars('Бары у бассейна', Icons.pool),
  eternalCity('Eternal City', Icons.location_city);

  const RestaurantCategory(this.title, this.icon);
  final String title;
  final IconData icon;
}

class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final RestaurantCategory category;
  final String location;
  final double rating;
  final String priceRange;
  final String imageUrl;
  final Color color;
  final String cuisine;
  final String workingHours;
  final String phoneNumber;
  final List<String> features;
  final bool hasDelivery;
  final bool hasReservation;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.location,
    required this.rating,
    required this.priceRange,
    required this.imageUrl,
    required this.color,
    required this.cuisine,
    required this.workingHours,
    required this.phoneNumber,
    required this.features,
    required this.hasDelivery,
    required this.hasReservation,
  });
}

class RestaurantMenuSection {
  final String name;
  final List<RestaurantMenuItem> items;

  const RestaurantMenuSection({
    required this.name,
    required this.items,
  });
}

class RestaurantMenuItem {
  final String name;
  final String description;
  final double price;
  final String category;
  final bool isRecommended;

  const RestaurantMenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.isRecommended = false,
  });
} 