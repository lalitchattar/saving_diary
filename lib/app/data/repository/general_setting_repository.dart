
import 'package:sqflite/sqflite.dart';


import '../db/database_helper.dart';

class GeneralSettingRepository {
  final dbHelper = DatabaseHelper();

  // Insert or update a setting
  Future<void> setSetting(String key, String value) async {
    final db = await dbHelper.database;
    await db.insert(
      'settings',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get a single setting
  Future<String?> getSetting(String key) async {
    final db = await dbHelper.database;
    final result = await db.query('settings', where: 'key = ?', whereArgs: [key], limit: 1);
    return result.isNotEmpty ? result.first['value'] as String : null;
  }

  // Get all settings
  Future<Map<String, String>> getAllSettings() async {
    final db = await dbHelper.database;
    final result = await db.query('settings');
    return {for (var row in result) row['key'] as String: row['value'] as String};
  }

  // Initialize default settings if not exist
  Future<void> initDefaultSettings() async {
    final existing = await getAllSettings();
    if (!existing.containsKey('currency')) await setSetting('currency', '₹');
    if (!existing.containsKey('currencyCountryName')) await setSetting('currencyCountryName', 'India');
    if (!existing.containsKey('dateFormat')) await setSetting('dateFormat', 'dd/MM/yyyy');
    if (!existing.containsKey('decimalFormat')) await setSetting('decimalFormat', '#.##');
    if (!existing.containsKey('firstDayOfWeek')) await setSetting('firstDayOfWeek', 'Monday');
    if (!existing.containsKey('language')) await setSetting('language', 'English');
    if (!existing.containsKey('languageCode')) await setSetting('language', 'en');
    if (!existing.containsKey('languageCountryCode')) await setSetting('language', 'US');
    if (!existing.containsKey('theme')) await setSetting('theme', 'Light');
  }
}