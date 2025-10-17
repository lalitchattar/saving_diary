import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/utils/huge_icon_sets.dart';
import '../controller/category_controller.dart';
import 'add_category.dart';
import 'edit_category.dart';

class CategoryListScreen extends GetView<CategoryController> {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final RxString selectedType = 'Income'.obs; // Selected tab

    return Obx(
          () => Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                    () => SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Income', label: Text('Income')),
                    ButtonSegment(value: 'Expense', label: Text('Expense')),
                  ],
                  selected: <String>{selectedType.value},
                  onSelectionChanged: (newSelection) {
                    selectedType.value = newSelection.first;
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.isLoading.value
                    ? _buildLoader(colorScheme)
                    : controller.categories.isEmpty
                    ? _buildEmptyState(colorScheme, textTheme)
                    : _buildCategoryList(
                    context, colorScheme, textTheme, selectedType.value),
              ),
            ),
          ],
        ),
        floatingActionButton: controller.categories.isNotEmpty
            ? FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text("Add Category"),
          onPressed: () {
            controller.reset();
            Get.to(() => AddCategoryScreen());
          },
        )
            : null,
      ),
    );
  }

  Widget _buildLoader(ColorScheme colorScheme) {
    return Center(
      child: CircularProgressIndicator(
        color: colorScheme.primary,
        strokeWidth: 3,
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedTag01,
              size: 100,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            Text(
              "No Category Yet",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Categories help you group your expenses and earnings for better tracking. Create your first category today!",
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
                Get.to(() => AddCategoryScreen());
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Category"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, ColorScheme colorScheme,
      TextTheme textTheme, String typeFilter) {
    final filteredCategories =
    controller.categories.where((c) => c.type == typeFilter).toList();

    if (filteredCategories.isEmpty) {
      return Center(
        child: Text(
          "No $typeFilter Categories",
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: filteredCategories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final category = filteredCategories[index];

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
              controller.reset();
              Get.to(() => EditCategoryScreen(), arguments: category);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: colorScheme.primaryContainer.withOpacity(0.3),
                    child: IconsSets.getIconByKey(category.icon!),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          category.name,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          '${category.transactionCount}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Transaction${category.transactionCount > 1 ? 's' : ''}',
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
