import 'package:flutter/material.dart';

class SpotlightItem {
  final String? title;
  final Widget? screen;
  final IconData? icon;
  final Color? lampColor;
  final Color? spotlightColor;

  SpotlightItem(
      {this.title,
      this.screen,
      this.icon,
      this.lampColor,
      this.spotlightColor});
}
