import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/module/more/module/account/controller/account_controller.dart';
import 'package:saving_diary/app/module/more/module/account/view/account_type_selection_screen.dart';
import 'package:saving_diary/app/utils/utility.dart';


class AccountListScreen extends GetView<AccountController> {
  const AccountListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Obx(
          () => Scaffold(
        appBar: AppBar(title: Text("Accounts"), centerTitle: true),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.isLoading.value
              ? _buildLoader(context, colorScheme)
              : controller.accounts.isEmpty
              ? _buildEmptyState(context, colorScheme, textTheme)
              : _buildLabelList(context, colorScheme, textTheme),
        ),
        floatingActionButton: controller.accounts.isNotEmpty
            ? FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text("Add Account"),
          onPressed: () {
            //controller.reset();
            //Get.to(() => AddLabelScreen());
          },
        )
            : null,
      ),
    );
  }

  Widget _buildLoader(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: CircularProgressIndicator(
        color: colorScheme.primary,
        strokeWidth: 3,
      ),
    );
  }

  /// --- Empty State View ---
  Widget _buildEmptyState(
      BuildContext context,
      ColorScheme colorScheme,
      TextTheme textTheme,
      ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: HugeIcons.strokeRoundedBank, size: 100, color: Colors.grey,),
            const SizedBox(height: 24),
            Text(
              "No Accounts Yet",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Stay on top of your finances by adding all your accounts — savings, wallets, and more. Create your first account today!",
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                controller.reset();
                Get.to(() => AccountTypeScreen());
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Account"),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelList(
      BuildContext context,
      ColorScheme colorScheme,
      TextTheme textTheme,
      ) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: controller.accounts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final account = controller.accounts[index];

        return Card(
          color: colorScheme.surfaceContainerLow,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: colorScheme.outlineVariant, width: 1),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            splashColor: colorScheme.primary.withOpacity(0.08),
            highlightColor: colorScheme.primary.withOpacity(0.04),
            onTap: () {
              //controller.reset();
              //Get.to(() => EditLabelScreen(), arguments: label);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Leading colored circle with status halo
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: 24,
                          backgroundColor: getColorFromHex("#000000"),
                          child: HugeIcon(icon: HugeIcons.strokeRoundedLabel, size: 22,)
                      ),
                      if (account.isActive)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.greenAccent,
                              border: Border.all(
                                color: colorScheme.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                              border: Border.all(
                                color: colorScheme.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(width: 16),

                  // Label name
                  Expanded(
                    child: Text(
                      account.name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Transaction count badge
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          '${account.transactionCount}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Transaction${account.transactionCount > 1 ? 's' : ''}',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
