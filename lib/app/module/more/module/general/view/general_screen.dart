import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/general/controller/general_setting_controller.dart';
import 'package:saving_diary/app/module/more/module/general/view/currency_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/date_format_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/first_day_of_week_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/language_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/number_format_selection_screen.dart';
import 'package:saving_diary/app/module/more/module/general/view/theme_selection_screen.dart';



class GeneralScreen extends GetView<GeneralSettingsController> {
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
                    trailing: Obx(() => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${controller.getSetting("currency")} (${controller.getSetting("currencyCountryName")})",
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          )
                        ],
                      ),
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
                      _showCurrencySelectionList(context);
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
                  trailing: Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.getSetting("dateFormat"),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                      )
                    ],
                  ),
                  ),
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
                    _showDateFormatSelectionList(context, colorScheme);
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
                  trailing: Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.getSetting("decimalFormat"),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                      )
                    ],
                  ),
                  ),
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
                    _showNumberFormatSelectionList(context);
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
                  trailing: Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.getSetting("firstDayOfWeek"),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                      )
                    ],
                  ),
                  ),
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
                    _showFirstDayOfWeekSelectionList(context);
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
                  trailing: Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.getSetting("language"),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                      )
                    ],
                  ),
                  ),
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
                    _showLocaleSelectionList(context);
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
                    trailing: Obx(() => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.getSetting("theme"),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        )
                      ],
                    ),
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
                      _showThemeSelectionList(context);
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

  void _showCurrencySelectionList(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: CurrencySelectionScreen(
          onCurrencySelected: (symbol, country) {
            controller.updateSetting("currency", symbol);
            controller.updateSetting("currencyCountryName", country);
          },
        ),
      ),
    );
  }


  void _showDateFormatSelectionList(BuildContext context, ColorScheme colorSchema) {
    final height = MediaQuery.of(context).size.height * 0.7;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,       // allow full height control
      isDismissible: false,           // disable tap outside to close
      enableDrag: false,              // disable swipe down to close
      backgroundColor: Colors.transparent, // transparent to allow rounded corners
      builder: (context) => SizedBox(
        height: height,
        child: DateFormatSelectionScreen(
          onFormatSelected: (format) {
            controller.updateSetting("dateFormat", format);
          },
        ),
      ),
    );
  }
  void _showNumberFormatSelectionList(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: NumberFormatSelectionScreen(
          onFormatSelected: (format) {
            controller.updateSetting("decimalFormat", format);
          },
        ),
      ),
    );
  }

  void _showLocaleSelectionList(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: LocaleSelectionScreen(
          onLocaleSelected: (locale, nativeName) {
            controller.updateSetting("language", nativeName);
            controller.updateSetting("languageCode", locale.languageCode);
            controller.updateSetting("languageCountryCode", locale.countryCode!);
          },
        ),
      ),
    );
  }

  void _showFirstDayOfWeekSelectionList(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: height,
        child: FirstDayOfWeekSelectionScreen(
          onDaySelected: (day) {
            controller.updateSetting("firstDayOfWeek", day);
          },
        ),
      ),
    );
  }

  void _showThemeSelectionList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => ThemeSelectionScreen(
        onThemeSelected: (theme) {
          controller.updateSetting("theme", theme);
        },
      ),
    );
  }



}
