import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/account/controller/account_controller.dart';
import 'package:saving_diary/app/module/more/module/account/view/general_account_creation_screen.dart';

class AccountTypeScreen extends StatelessWidget {
  AccountTypeScreen({super.key});

  final generalAccountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("Account Type"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Cash",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
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
                            vertical: 0,
                          ),
                          leading: HugeIcon(icon: HugeIcons.strokeRoundedBank),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Bank Account",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: colorScheme.onSurface,
                              letterSpacing: 0.15,
                            ),
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          onTap: () {
                            generalAccountController.reset();
                            Get.to(() => GeneralAccount(title: "Bank Account", type: "Bank Account", category: "Assets",));
                          },
                        ),
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        leading: HugeIcon(icon: HugeIcons.strokeRoundedCash01),
                        trailing: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                        title: Text(
                          "Cash",
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onSurface,
                            letterSpacing: 0.15,
                          ),
                        ),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -2),
                        onTap: () {
                          generalAccountController.reset();
                          Get.to(() => GeneralAccount(title: "Cash", type: "Cash", category: "Assets",));
                        },
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        leading: HugeIcon(
                          icon: HugeIcons.strokeRoundedWallet01,
                        ),
                        trailing: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                        title: Text(
                          "Wallet",
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onSurface,
                            letterSpacing: 0.15,
                          ),
                        ),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -2),
                        onTap: () {
                          generalAccountController.reset();
                          Get.to(() => GeneralAccount(title: "Wallet", type: "Wallet", category: "Assets",));
                        },
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedMoneySend02,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Lending",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: colorScheme.onSurface,
                              letterSpacing: 0.15,
                            ),
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          onTap: () {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Credit",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
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
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedCreditCard,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Credit Card",
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
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedMoneyBag02,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Line of Credit",
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Investment",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
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
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedPayment01,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Brokerage",
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
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        leading: HugeIcon(
                          icon: HugeIcons.strokeRoundedMoneySavingJar,
                        ),
                        trailing: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                        title: Text(
                          "Investment",
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
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        leading: HugeIcon(
                          icon: HugeIcons.strokeRoundedShield02,
                        ),
                        trailing: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                        title: Text(
                          "Insurance",
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
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedBitcoinWallet,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Crypto",
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Loans",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
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
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedMoneyReceiveFlow01,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Loan",
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
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        leading: HugeIcon(
                          icon: HugeIcons.strokeRoundedMoneySend02,
                        ),
                        trailing: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowRight01,
                        ),
                        title: Text(
                          "Mortgage",
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
                      Divider(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedInvoice01,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Borrowing",
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Assets",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
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
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          leading: HugeIcon(
                            icon: HugeIcons.strokeRoundedPropertyNew,
                          ),
                          trailing: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight01,
                          ),
                          title: Text(
                            "Property",
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
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
