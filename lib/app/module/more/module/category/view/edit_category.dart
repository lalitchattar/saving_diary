import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/common/widget/text_box_screen.dart';
import 'package:saving_diary/app/data/model/category_model.dart';
import 'package:saving_diary/app/module/more/module/category/controller/category_controller.dart';
import '../../../../../common/widget/icon_picker_screen.dart';
import '../../../../../common/widget/option_selection_screen.dart';
import '../../../../../common/widget/validation_message_screen.dart';
import '../../../../../utils/huge_icon_sets.dart';

class EditCategoryScreen extends GetView<CategoryController> {
  EditCategoryScreen({super.key});

  final Category category = Get.arguments;

  void _initializeController() {
    if (controller.name.value.isEmpty) {
      controller.name.value = category.name;
      controller.type.value = category.type;
      controller.icon.value = category.icon!;
    }
  }

  @override
  Widget build(BuildContext context) {

    _initializeController();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;


    return Scaffold(
      appBar: AppBar(title: const Text("Update Category"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                // ... your existing Card and ListTiles remain unchanged
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: colorScheme.outline.withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          leading: const HugeIcon(icon: HugeIcons.strokeRoundedCursorText),
                          trailing: Obx(
                                () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.name.value == ''
                                      ? 'Required'
                                      : controller.name.value,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: controller.name.value == '' ? colorScheme.error : colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
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
                        color: colorScheme.outlineVariant.withOpacity(0.8),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        leading: const HugeIcon(icon: HugeIcons.strokeRoundedShapeCollection),
                        trailing: Obx(
                              () => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.type.value == ''
                                    ? 'Required'
                                    : controller.type.value,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: controller.type.value == '' ? colorScheme.error : colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                            ],
                          ),
                        ),
                        title: Text(
                          "Type",
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onSurface,
                            letterSpacing: 0.15,
                          ),
                        ),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -2),
                        onTap: () {
                          _showCategoryTypeScreen(context);
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
                          leading: HugeIcon(icon: HugeIcons.strokeRoundedAiImage),
                          trailing: Obx(
                                () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (IconsSets.getIconByKey(controller.icon.value) != null)
                                  IconsSets.getIconByKey(controller.icon.value)!,
                                const SizedBox(width: 6),
                                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                              ],
                            ),
                          ),
                          title: Text(
                            "Icon",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: colorScheme.onSurface,
                              letterSpacing: 0.15,
                            ),
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          onTap: () {
                            _showIconPickerScreen(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // --- FilledButton added at the bottom ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.tonalIcon(
              icon: const Icon(Icons.save_rounded),
              label: const Text("Update"),
              onPressed: () {
                if(controller.name.value == '') {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      isDismissible: false,
                      builder: (context) => ValidationMessageScreen(errorMessages: ["Name is required"]));
                  return;
                }
                _updateCategory();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary, // set primary color
                foregroundColor: Colors.white, // text/icon color
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          )
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
        hintText: 'Provide Category Name',
        initialValue: category.name,
        validator: (categoryName) async {
          if (categoryName.isEmpty) {
            return "Category name cannot be empty.";
          }
          if(categoryName != category.name) {
            final exists = await controller.isNameExists(categoryName);
            if (exists) {
              return "This category already exists.";
            }
          }

          return null; // valid
        },

        // ✅ Called only when valid
        onValidSubmit: (categoryName) {
          controller.name.value = categoryName;
        },
      ),
    );
  }

  void _showCategoryTypeScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => OptionSelectionScreen(
        onOptionSelected: (option) {
          controller.type.value = option;
        }, options: [{'name': 'Expense'}, {'name': 'Income'}],
      ),
    );
  }

  void _showIconPickerScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => IconPickerScreen(onIconSelected: (String iconName) {
        controller.icon.value = iconName;
      },),
    );
  }
  _updateCategory() async {
    await controller.updateCategory(id: category.id, fieldsToUpdate: ['name', 'type', 'icon']);
    controller.reset();
    Get.back();
  }
}
