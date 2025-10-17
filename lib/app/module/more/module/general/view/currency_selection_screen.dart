import 'package:flutter/material.dart';

class CurrencySelectionScreen extends StatelessWidget {
  final Function(String, String) onCurrencySelected;

  const CurrencySelectionScreen({super.key, required this.onCurrencySelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Sample list of countries and currencies
    final currencies = [
      {'country': 'United States', 'symbol': '\$', 'flag': '🇺🇸'},
      {'country': 'India', 'symbol': '₹', 'flag': '🇮🇳'},
      {'country': 'United Kingdom', 'symbol': '£', 'flag': '🇬🇧'},
      {'country': 'Japan', 'symbol': '¥', 'flag': '🇯🇵'},
      {'country': 'Eurozone', 'symbol': '€', 'flag': '🇪🇺'},
      {'country': 'Canada', 'symbol': '\$', 'flag': '🇨🇦'},
      {'country': 'Australia', 'symbol': '\$', 'flag': '🇦🇺'},
      {'country': 'Switzerland', 'symbol': 'CHF', 'flag': '🇨🇭'},
      {'country': 'Singapore', 'symbol': 'S\$', 'flag': '🇸🇬'},
      {'country': 'China', 'symbol': '¥', 'flag': '🇨🇳'},
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
                        "Select Currency",
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

                // --- Scrollable Card with currencies ---
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
                        itemCount: currencies.length,
                        separatorBuilder: (_, __) => Divider(
                          color: colorScheme.outlineVariant.withOpacity(0.8),
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final currency = currencies[index];
                          return ListTile(
                            leading: Text(
                              currency['flag']!,
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(
                              currency['country']!,
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                letterSpacing: 0.1,
                              ),
                            ),
                            trailing: Text(
                              currency['symbol']!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onCurrencySelected(
                                  currency['symbol']!, currency['country']!);
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
