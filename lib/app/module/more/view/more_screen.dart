import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("More"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              "Manage",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
              ),
            ),
          ),
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
                      icon: HugeIcons.strokeRoundedBitcoinWallet,
                    ),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "Account",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedTag01),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Category",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedStore01),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Merchant",
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
                    leading: HugeIcon(icon: HugeIcons.strokeRoundedTransaction),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "Transaction",
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
              "Settings",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
              ),
            ),
          ),
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
                      icon: HugeIcons.strokeRoundedAccountSetting01,
                    ),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "General",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedDatabaseRestore),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Backup & Restore",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedFileExport),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Export Data",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedFileImport),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Import Data",
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
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedMessageNotification01),
                  trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                  title: Text(
                    "Notification",
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
                    leading: HugeIcon(icon: HugeIcons.strokeRoundedAiSecurity01),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                    title: Text(
                      "Security",
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
              "About",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
              ),
            ),
          ),
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    leading: HugeIcon(
                      icon: HugeIcons.strokeRoundedInformationCircle,
                    ),
                    trailing: Text(
                      "1.0.0",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurface,
                        letterSpacing: 0.15,
                      ),
                    ),
                    title: Text(
                      "App Version",
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
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
