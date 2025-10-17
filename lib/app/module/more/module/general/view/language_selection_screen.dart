import 'package:flutter/material.dart';

class LocaleSelectionBottomSheet extends StatelessWidget {
  final Function(Locale, String) onLocaleSelected;

  const LocaleSelectionBottomSheet({super.key, required this.onLocaleSelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // List of locales with English name and native name
    final locales = [
      {'locale': Locale('en', 'US'), 'english': 'English', 'native': 'English'},
      {'locale': Locale('fr', 'FR'), 'english': 'French', 'native': 'Français'},
      {'locale': Locale('de', 'DE'), 'english': 'German', 'native': 'Deutsch'},
      {'locale': Locale('es', 'ES'), 'english': 'Spanish', 'native': 'Español'},
      {'locale': Locale('it', 'IT'), 'english': 'Italian', 'native': 'Italiano'},
      {'locale': Locale('ja', 'JP'), 'english': 'Japanese', 'native': '日本語'},
      {'locale': Locale('zh', 'CN'), 'english': 'Chinese', 'native': '中文'},
      {'locale': Locale('hi', 'IN'), 'english': 'Hindi', 'native': 'हिन्दी'},
      {'locale': Locale('ar', 'SA'), 'english': 'Arabic', 'native': 'العربية'},
    ];

    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- Grab handle ---
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // --- Header with centered title and X button ---
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Select Language",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        tooltip: "Close",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Scrollable List ---
                Flexible(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: colorScheme.outline.withOpacity(0.8),
                        width: 0.5,
                      ),
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      radius: const Radius.circular(8),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: locales.length,
                        separatorBuilder: (_, __) => Divider(
                          color: colorScheme.outlineVariant.withOpacity(0.8),
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final localeData = locales[index];
                          final locale = localeData['locale'] as Locale;
                          final englishName = localeData['english'] as String;
                          final nativeName = localeData['native'] as String;
                          return ListTile(
                            title: Text(
                              englishName,
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                letterSpacing: 0.1,
                              ),
                            ),
                            trailing: Text(
                              nativeName,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onLocaleSelected(locale, nativeName);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- Cancel Button ---
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonalIcon(
                    icon: const Icon(Icons.close_rounded),
                    label: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
