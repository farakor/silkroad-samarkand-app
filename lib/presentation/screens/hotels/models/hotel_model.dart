import 'package:flutter/material.dart';

class HotelModel {
  final String name;
  final String description;
  final String rating;
  final int price;
  final Color color;
  final String location;
  final HotelInfo info;
  final List<HotelService> services;
  final List<Restaurant> restaurants;
  final List<ConferenceRoom> conferenceRooms;
  final BanquetHall? banquetHall;

  const HotelModel({
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.color,
    required this.location,
    required this.info,
    required this.services,
    required this.restaurants,
    required this.conferenceRooms,
    this.banquetHall,
  });
}

class HotelInfo {
  final int floors;
  final int rooms;
  final int restaurants;
  final int bars;
  final int pools;
  final int conferenceRooms;
  final int banquetHalls;

  const HotelInfo({
    required this.floors,
    required this.rooms,
    required this.restaurants,
    required this.bars,
    required this.pools,
    required this.conferenceRooms,
    required this.banquetHalls,
  });
}

class HotelService {
  final String name;
  final IconData icon;

  const HotelService({
    required this.name,
    required this.icon,
  });
}

class Restaurant {
  final String name;
  final String description;
  final String workingHours;
  final Color color;

  const Restaurant({
    required this.name,
    required this.description,
    required this.workingHours,
    required this.color,
  });
}

class ConferenceRoom {
  final String name;
  final String description;
  final String capacity;
  final String workingHours;
  final Color color;

  const ConferenceRoom({
    required this.name,
    required this.description,
    required this.capacity,
    required this.workingHours,
    required this.color,
  });
}

class BanquetHall {
  final String name;
  final String description;
  final String capacity;
  final String workingHours;
  final Color color;

  const BanquetHall({
    required this.name,
    required this.description,
    required this.capacity,
    required this.workingHours,
    required this.color,
  });
} 