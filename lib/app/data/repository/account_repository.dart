
import 'package:saving_diary/app/data/model/account_model.dart';
import '../../utils/app_logger.dart';
import '../db/database_helper.dart';

class AccountRepository {
  final dbHelper = DatabaseHelper();

  Future<void> createAccount(Account account) async {
    try {
      final db = await dbHelper.database;
      await db.insert('accounts', account.toMap());
    } catch (e, stack) {
      appLogger.e('Error creating accounts: ${account.name}', error: e, stackTrace: stack);
    }
  }

  Future<void> updateAccount(Account account, {List<String>? fieldsToUpdate}) async {
    try {
      final db = await dbHelper.database;

      // Convert entire model to map
      final fullMap = account.toMap();

      // If specific fields provided → filter only those
      final updateMap = fieldsToUpdate != null && fieldsToUpdate.isNotEmpty
          ? Map.fromEntries(
        fullMap.entries.where((e) => fieldsToUpdate.contains(e.key)),
      )
          : fullMap; // else, update all fields
      await db.update(
        'accounts',
        updateMap,
        where: 'id = ?',
        whereArgs: [account.id],
      );
    } catch (e, stack) {
      appLogger.e(
        'Error updating account id: ${account.id}',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<List<Account>> getAllAccounts() async {
    try {
      final db = await dbHelper.database;
      final maps = await db.query('accounts', where: 'is_deleted = ?', whereArgs: [0]);
      return maps.map((map) => Account.fromMap(map)).toList();
    } catch (e, stack) {
      appLogger.e('Error fetching all accounts', error: e, stackTrace: stack);
      return [];
    }
  }

  Future<Account?> getAccount(int id) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'accounts',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Account.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating accounts id: $id', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<Account?> getAccountByName(String name, String type) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(
        'accounts',
        where: 'name = ? and type = ? and is_deleted = ?',
        whereArgs: [name, type, 0],
        limit: 1,
      );

      if (result.isNotEmpty) {
        return Account.fromMap(result.first);
      } else {
        return null;
      }
    } catch (e, stack) {
      appLogger.e('Error activating account id: $name', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<int> deleteAccount(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'accounts',
        {'is_deleted': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating accounts id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> deactivateAccount(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'accounts',
        {'is_active': 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error deactivating account id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> activateAccount(int id) async {
    try {
      final db = await dbHelper.database;
      return await db.update(
        'accounts',
        {'is_active': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, stack) {
      appLogger.e('Error activating account id: $id', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<void> dispose() async {
    await dbHelper.close();
  }
}
