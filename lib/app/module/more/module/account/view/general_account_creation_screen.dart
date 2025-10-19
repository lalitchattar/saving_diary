import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/account/controller/account_controller.dart';
import 'package:saving_diary/app/module/more/module/account/view/account_screen.dart';
import 'package:saving_diary/app/utils/utility.dart';

import '../../../../../common/widget/text_box_screen.dart';
import '../../../../../common/widget/validation_message_screen.dart';
import '../../general/controller/general_setting_controller.dart';

class GeneralAccount extends GetView<AccountController> {
  final String title;
  final String type;
  final String category;

  const GeneralAccount({
    super.key,
    required this.title,
    required this.type,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    var generalController = Get.find<GeneralSettingsController>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 0,
                  ),
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
                          ),
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
                          onTap: () {
                            _showNameTextBoxScreen(context);
                          },
                        ),
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      Visibility(
                        visible: type != "Cash",
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              leading: const HugeIcon(
                                icon: HugeIcons.strokeRoundedBank,
                              ),
                              trailing: Obx(
                                () => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      controller.institutionName.value == ''
                                          ? 'Required'
                                          : controller.institutionName.value,
                                      style: textTheme.bodyMedium?.copyWith(
                                        color:
                                            controller.institutionName.value ==
                                                ''
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
                              onTap: () {
                                _showInstitutionNameTextBoxScreen(context);
                              },
                            ),
                            Divider(
                              color: colorScheme.outlineVariant.withOpacity(
                                0.8,
                              ),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              leading: const HugeIcon(
                                icon: HugeIcons.strokeRoundedArrangeByNumbers91,
                              ),
                              trailing: Obx(
                                () => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      maskString(
                                        controller.accountNumber.value,
                                      ),
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
                              onTap: () {
                                _showAccountNumberTextBoxScreen(context);
                              },
                            ),
                            Divider(
                              color: colorScheme.outlineVariant.withOpacity(
                                0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        leading: const HugeIcon(
                          icon: HugeIcons.strokeRoundedMoney01,
                        ),
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
                        onTap: () {
                          _showInitialBalanceTextBoxScreen(context);
                        },
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withOpacity(0.8),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedSummation02,
                          ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.tonalIcon(
              icon: const Icon(Icons.save_rounded),
              label: const Text("Save"),
              onPressed: () {
                if (controller.name.value == '') {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    isDismissible: false,
                    builder: (context) => ValidationMessageScreen(
                      errorMessages: ["Name is required"],
                    ),
                  );
                  return;
                }

                if (controller.institutionName.value == '' && type != "Cash") {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    isDismissible: false,
                    builder: (context) => ValidationMessageScreen(
                      errorMessages: ["Institution name is required"],
                    ),
                  );
                  return;
                }
                _saveGeneralAccount();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary, // set primary color
                foregroundColor: Colors.white, // text/icon color
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  _showNameTextBoxScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => SingleTextInputScreen(
        title: 'Name',
        hintText: 'Provide Account Name',
        validator: (accountName) async {
          if (accountName.isEmpty) {
            return "Account name cannot be empty.";
          }
          final exists = await controller.isNameExists(accountName, type);
          if (exists) {
            return "This account already exists.";
          }
          return null; // valid
        },

        // ✅ Called only when valid
        onValidSubmit: (accountName) {
          controller.name.value = accountName;
        },
      ),
    );
  }

  _showInstitutionNameTextBoxScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => SingleTextInputScreen(
        title: 'Institution Name',
        hintText: 'Provide Institution Name',
        validator: (institutionName) async {
          if (institutionName.isEmpty) {
            return "Institution name cannot be empty.";
          }
          return null; // valid
        },

        // ✅ Called only when valid
        onValidSubmit: (institutionName) {
          controller.institutionName.value = institutionName;
        },
      ),
    );
  }

  _showAccountNumberTextBoxScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => SingleTextInputScreen(
        title: 'Account Number',
        hintText: 'Provide Account Number',
        textInputType: TextInputType.number,
        onValidSubmit: (accountNumber) {
          controller.accountNumber.value = accountNumber;
        },
      ),
    );
  }

  _showInitialBalanceTextBoxScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => SingleTextInputScreen(
        title: 'Initial Balance',
        hintText: 'Provide Initial Balance Number',
        textInputType: TextInputType.number,
        onValidSubmit: (balance) {
          controller.balance.value = double.parse(balance);
        },
      ),
    );
  }

  _saveGeneralAccount() async {
    await controller.createGeneralAccount(type, category);
    controller.reset();
    Get.off(AccountListScreen());
  }
}
