library spotlight_nav_bar;

import 'package:flutter/material.dart';
import 'package:spotlight_nav_bar/spotlight_item.dart';

class SpotlightNavBar extends StatefulWidget {
  final List<SpotlightItem> items;

  const SpotlightNavBar({
    required this.items,
    super.key,
  });

  @override
  State<SpotlightNavBar> createState() => _SpotlightNavBarState();
}

class _SpotlightNavBarState extends State<SpotlightNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: widget.items[_selectedIndex].screen,
      bottomNavigationBar: Container(
        height: 80,
        color: theme.colorScheme.surface,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: MediaQuery.of(context).size.width /
                      widget.items.length *
                      _selectedIndex +
                  MediaQuery.of(context).size.width / widget.items.length / 2 -
                  15,
              top: -20,
              child: CustomPaint(
                painter: SpotlightPainter(
                  item: widget.items[_selectedIndex],
                  isDarkMode: isDarkMode,
                ),
                size: const Size(30, 80),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.items.length, (index) {
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Icon(
                    widget.items[index].icon,
                    size: 30,
                    color: isSelected
                        ? theme.colorScheme.secondary
                        : theme.iconTheme.color?.withOpacity(0.6),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class SpotlightPainter extends CustomPainter {
  final SpotlightItem item;
  final bool isDarkMode;

  const SpotlightPainter({
    required this.item,
    required this.isDarkMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          item.spotlightColor?.withOpacity(1) ??
              (isDarkMode ? Colors.white : Colors.black).withOpacity(1),
          item.spotlightColor?.withOpacity(0.0) ??
              (isDarkMode ? Colors.white : Colors.black).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Paint lightPaint = Paint()
      ..color = item.lampColor ?? (isDarkMode ? Colors.white : Colors.black)
      ..style = PaintingStyle.fill;

    final Path spotlight = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width + 5, size.height * 0.95)
      ..lineTo(-5, size.height * 0.95)
      ..close();

    final RRect roundedRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        27,
      ),
      topLeft: const Radius.circular(7),
      topRight: const Radius.circular(7),
      bottomLeft: const Radius.circular(7),
      bottomRight: const Radius.circular(7),
    );

    canvas.drawPath(spotlight, gradientPaint);
    canvas.drawRRect(roundedRect, lightPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
