import 'package:isar/isar.dart';
import 'package:tankobon/domain/collections/current_instance.dart';
import 'package:tankobon/domain/collections/instance.dart';

class IsarClient {
  factory IsarClient() => _isarClient;

  IsarClient._internal();
  final isar = Isar.openSync([
    InstanceSchema,
    CurrentInstanceSchema,
  ]);

  static final IsarClient _isarClient = IsarClient._internal();
}
