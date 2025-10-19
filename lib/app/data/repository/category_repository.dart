
import 'package:saving_diary/app/data/model/category_model.dart';
import '../../utils/app_logger.dart';
import '../db/database_helper.dart';

class CategoryRepository {
  final dbHelper = DatabaseHelper();

  Future<void> createCategory(Category category) async {
    try {
      final db = await dbHelper.database;
      await db.insert('categories', category.toMap());
    } catch (e, stack) {
      appLogger.e('Error creating category: ${category.name}', error: e, stackTrace: stack);
    }
  }

  Future<void> updateCategory(Category category, {List<String>? fieldsToUpdate}) async {
    try {
      final db = await dbHelper.database;

      // Convert entire model to map
      final fullMap = category.toMap();

      // If specific fields provided → filter only those
      final updateMap = fieldsToUpdate != null && fieldsToUpdate.isNotEmpty
          ? Map.fromEntries(
        fullMap.entries.where((e) => fieldsToUpdate.contains(e.key)),
      )
          : fullMap; // else, update all fields
      await db.update(
        'categories',
        updateMap,
        where: 'id = ?',
        whereArgs: [category.id],
      );
    } catch (e, stack) {
      appLogger.e(
        'Error updating category id: ${category.id}',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      final db = await dbHelper.database;
      final maps = await db.query('categories', where: 'is_deleted = ?', whereArgs: [0]);
      return maps.map((map) => Category.fromMap(map)).toList();
    } catch (e, stack) {
      appLogger.e('Error fetching all categories', error: e, stackTrace: stack);
      return [];
    }
  }

  Future<Category?> getCategory(int id) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'categories',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Category.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating category id: $id', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<Category?> getCategoryByName(String name) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'categories',
        where: 'name = ? and is_deleted = ?',
        whereArgs: [name, 0],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Category.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating category id: $name', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<int> deleteCategory(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'categories',
        {'is_deleted': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating category id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> deactivateCategory(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'categories',
        {'is_active': 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error deactivating category id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> activateCategory(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'categories',
        {'is_active': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating category id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<void> dispose() async {
    await dbHelper.close();
  }
}
