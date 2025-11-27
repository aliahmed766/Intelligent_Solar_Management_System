import 'dart:ffi';

class DataWithBackup{
  final String device;
  final int quantity;
  final int backupHours;
  final int voltage;

  DataWithBackup(this.device, this.quantity, this.backupHours, this.voltage);
}