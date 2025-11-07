import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? cardBackground;
  final Color? tagExcellent;
  final Color? tagGood;
  final Color? tagPoor;
  final Color? containerBackground;

  const CustomColors({
    this.cardBackground,
    this.tagExcellent,
    this.tagGood,
    this.tagPoor,
    this.containerBackground,
  });

  @override
  CustomColors copyWith({
    Color? cardBackground,
    Color? tagExcellent,
    Color? tagGood,
    Color? tagPoor,
    Color? containerBackground,
  }) {
    return CustomColors(
      cardBackground: cardBackground ?? this.cardBackground,
      tagExcellent: tagExcellent ?? this.tagExcellent,
      tagGood: tagGood ?? this.tagGood,
      tagPoor: tagPoor ?? this.tagPoor,
      containerBackground: containerBackground ?? this.containerBackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t),
      tagExcellent: Color.lerp(tagExcellent, other.tagExcellent, t),
      tagGood: Color.lerp(tagGood, other.tagGood, t),
      tagPoor: Color.lerp(tagPoor, other.tagPoor, t),
      containerBackground: Color.lerp(containerBackground, other.containerBackground, t),
    );
  }
}
