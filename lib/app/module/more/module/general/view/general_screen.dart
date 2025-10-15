import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("General"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.8),
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    leading: HugeIcon(
                      icon: HugeIcons.strokeRoundedMoney01,
                    ),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "Currency",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface,
                        letterSpacing: 0.15,
                      ),
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -2),
                  ),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedCalendar01),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Date Format",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedArrangeByNumbers19),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Decimal Place",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedCalendarAdd01),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "First day of week",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedLanguageCircle),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Language",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    leading: HugeIcon(icon: HugeIcons.strokeRoundedColors),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "Theme",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface,
                        letterSpacing: 0.15,
                      ),
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -2),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
