import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

final categories = [
  Category(
    id: '1',
    name: 'Books',
    icon: Icons.book,
    color: '#3498db',
  ),
  Category(
    id: '2',
    name: 'Movies & TV Shows',
    icon: Icons.movie,
    color: '#e74c3c',
  ),
  Category(
    id: '3',
    name: 'Recipes',
    icon: Icons.restaurant_menu,
    color: '#2ecc71',
  ),
  Category(
    id: '4',
    name: 'Board Games',
    icon: Icons.games,
    color: '#f39c12',
  ),
  Category(
    id: '5',
    name: 'Music',
    icon: Icons.music_note,
    color: '#9b59b6',
  ),
  Category(
    id: '6',
    name: 'Video Games',
    icon: Icons.videogame_asset,
    color: '#f1c40f',
  ),
  Category(
    id: '7',
    name: 'Online Channels & Profiles',
    icon: Icons.language,
    color: '#e91e63',
  ),
  Category(
    id: '8',
    name: 'Outras',
    icon: Icons.more_horiz,
    color: '#CCCCCC',
  )
];
