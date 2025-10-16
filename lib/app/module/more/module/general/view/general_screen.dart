import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/general/view/currency_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/date_format_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/first_day_of_week_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/language_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/number_format_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/theme_selection_screen.dart';



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
                    leading: HugeIcon(icon: HugeIcons.strokeRoundedMoney01),
                    trailing: HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowRight01,
                    ),
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
                    onTap: () {
                      _showCurrencyBottomSheet(context);
                    },
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
                  onTap: (){
                    _showCurrencySelectionList(context, colorScheme);
                  },
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(
                    icon: HugeIcons.strokeRoundedArrangeByNumbers19,
                  ),
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
                  onTap: () {
                    _showNumberFormatBottomSheet(context);
                  },
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
                  onTap: () {
                    _showFirstDayOfWeekSheet(context);
                  },
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  leading: HugeIcon(
                    icon: HugeIcons.strokeRoundedLanguageCircle,
                  ),
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
                  onTap: (){
                    _showLocaleSelectionSheet(context);
                  },
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
                    trailing: HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowRight01,
                    ),
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
                    onTap: () {
                      _showThemeSheet(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCurrencySelectionList(BuildContext context, ColorScheme colorSchema) {
    final height = MediaQuery.of(context).size.height * 0.7;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,       // allow full height control
      isDismissible: false,           // disable tap outside to close
      enableDrag: false,              // disable swipe down to close
      backgroundColor: Colors.transparent, // transparent to allow rounded corners
      builder: (context) => SizedBox(
        height: height,
        child: DateFormatBottomSheet(
          onFormatSelected: (format) {
            debugPrint('Selected Format: $format');
          },
        ),
      ),
    );
  }

  void _showCurrencyBottomSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: CurrencyBottomSheet(
          onCurrencySelected: (symbol) {
            debugPrint('Selected Currency: $symbol');
          },
        ),
      ),
    );
  }

  void _showNumberFormatBottomSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: NumberFormatBottomSheet(
          onFormatSelected: (format) {
            debugPrint('Selected Number Format: $format');
          },
        ),
      ),
    );
  }

  void _showLocaleSelectionSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: LocaleSelectionBottomSheet(
          onLocaleSelected: (locale) {
            debugPrint('Selected Locale: ${locale.languageCode}_${locale.countryCode}');
          },
        ),
      ),
    );
  }

  void _showFirstDayOfWeekSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: FirstDayOfWeekBottomSheet(
          onDaySelected: (day) {
            debugPrint('Selected First Day: $day');
          },
        ),
      ),
    );
  }

  void _showThemeSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => ThemeSelectionBottomSheet(
        onThemeSelected: (theme) {
          debugPrint('Selected Theme: $theme');
        },
      ),
    );
  }



}
