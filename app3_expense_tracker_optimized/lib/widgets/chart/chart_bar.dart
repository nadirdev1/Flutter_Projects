import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
    required this.totalExpenses,
  });

  final double fill;
  final double totalExpenses;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: fill,
        widthFactor: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
