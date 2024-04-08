import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return  Icon(iconData,  size: 36.0 );
  }
}
