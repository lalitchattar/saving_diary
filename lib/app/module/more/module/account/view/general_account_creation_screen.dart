import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/account/controller/account_controller.dart';
import 'package:saving_diary/app/utils/utility.dart';

import '../../general/controller/general_setting_controller.dart';

class GeneralAccount extends GetView<AccountController> {
  final String title;

  const GeneralAccount({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var generalController = Get.find<GeneralSettingsController>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    leading: const HugeIcon(
                      icon: HugeIcons.strokeRoundedCursorText,
                    ),
                    trailing: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.name.value == ''
                                ? 'Required'
                                : controller.name.value,
                            style: textTheme.bodyMedium?.copyWith(
                              color: controller.name.value == ''
                                  ? colorScheme.error
                                  : colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      "Name",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface,
                        letterSpacing: 0.15,
                      ),
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -2),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: const HugeIcon(icon: HugeIcons.strokeRoundedBank),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.institutionName.value == ''
                              ? 'Required'
                              : controller.institutionName.value,
                          style: textTheme.bodyMedium?.copyWith(
                            color: controller.institutionName.value == ''
                                ? colorScheme.error
                                : colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    "Institution Name",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  onTap: () {},
                ),
                Divider(color: colorScheme.outlineVariant.withOpacity(0.8)),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: const HugeIcon(icon: HugeIcons.strokeRoundedBank),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          maskString(controller.accountNumber.value),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    "Account Number",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  onTap: () {},
                ),
                Divider(color: colorScheme.outlineVariant.withOpacity(0.8)),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: const HugeIcon(icon: HugeIcons.strokeRoundedBank),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${generalController.getSetting("currency")} ${formatNumber(controller.balance.value, pattern: generalController.getSetting("decimalFormat"))}",
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    "Initial Balance",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      letterSpacing: 0.15,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  onTap: () {},
                ),
                Divider(color: colorScheme.outlineVariant.withOpacity(0.8)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    leading: HugeIcon(icon: HugeIcons.strokeRoundedColors),
                    trailing: Obx(
                      () => Switch(
                        value: controller
                            .showInNetWorth
                            .value, // Boolean observable
                        onChanged: (val) {
                          controller.showInNetWorth.value = val;
                        },
                        activeColor: colorScheme.primary,
                      ),
                    ),
                    title: Text(
                      "Show in Net Worth",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface,
                        letterSpacing: 0.15,
                      ),
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -2),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
