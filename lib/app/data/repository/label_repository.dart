

import 'package:saving_diary/app/data/model/label_model.dart';
import '../../utils/app_logger.dart';
import '../db/database_helper.dart';

class LabelRepository {
  final dbHelper = DatabaseHelper();

  Future<void> createLabel(Label label) async {
    try {
      final db = await dbHelper.database;
      await db.insert('labels', label.toMap());
    } catch (e, stack) {
      appLogger.e('Error creating label: ${label.name}', error: e, stackTrace: stack);
    }
  }

  Future<void> updateLabel(Label label, {List<String>? fieldsToUpdate}) async {
    try {
      final db = await dbHelper.database;

      // Convert entire model to map
      final fullMap = label.toMap();

      // If specific fields provided → filter only those
      final updateMap = fieldsToUpdate != null && fieldsToUpdate.isNotEmpty
          ? Map.fromEntries(
        fullMap.entries.where((e) => fieldsToUpdate.contains(e.key)),
      )
          : fullMap; // else, update all fields
      await db.update(
        'labels',
        updateMap,
        where: 'id = ?',
        whereArgs: [label.id],
      );
    } catch (e, stack) {
      appLogger.e(
        'Error updating label id: ${label.id}',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<List<Label>> getAllLabels() async {
    try {
      final db = await dbHelper.database;
      final maps = await db.query('labels', where: 'is_deleted = ?', whereArgs: [0]);
      return maps.map((map) => Label.fromMap(map)).toList();
    } catch (e, stack) {
      appLogger.e('Error fetching all labels', error: e, stackTrace: stack);
      return [];
    }
  }

  Future<Label?> getLabel(int id) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'labels',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Label.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating label id: $id', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<Label?> getLabelByName(String name) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'labels',
        where: 'name = ? and is_deleted = ?',
        whereArgs: [name, 0],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Label.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating label id: $name', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<int> deleteLabel(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'labels',
        {'is_deleted': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating label id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> inactivateLabel(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'labels',
        {'is_active': 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error deactivating label id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> activateLabel(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'labels',
        {'is_active': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating label id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<void> dispose() async {
    await dbHelper.close();
  }
}
