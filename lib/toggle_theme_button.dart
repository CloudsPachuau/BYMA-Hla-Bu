import 'package:flutter/material.dart';

class ToggleThemeButton extends StatelessWidget {
  final bool isDarkMode;
  final void Function(bool) toggleTheme;
  final double width;
  final double height;

  const ToggleThemeButton({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    this.width = 60.0,
    this.height = 34.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleTheme(!isDarkMode),
      child: Semantics(
        label: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2),
            color: isDarkMode ? Colors.black : Colors.grey.shade400,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.light_mode,
                      color: isDarkMode ? Colors.transparent : Colors.yellow,
                      size: height * 0.6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.dark_mode,
                      color: isDarkMode ? Colors.white : Colors.transparent,
                      size: height * 0.6,
                    ),
                  ),
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: isDarkMode ? width - height + 2 : 2,
                top: 2,
                bottom: 2,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: height - 4,
                  height: height - 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode
                        ? Colors.brown.shade900
                        : Colors.cyan.shade900,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.5)
                            : Colors.grey.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
