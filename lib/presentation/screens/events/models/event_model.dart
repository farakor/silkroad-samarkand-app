import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String dateTime;
  final String description;
  final String location;
  final Color color;
  final IconData icon;

  const EventModel({
    required this.title,
    required this.dateTime,
    required this.description,
    required this.location,
    required this.color,
    required this.icon,
  });
} 