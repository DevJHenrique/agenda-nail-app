import 'package:agenda_nail_app/src/modules/home/models/task_model.dart';

class Event {
  final String uid;
  final Task operation;
  final DateTime dateTime;

  Event({required this.uid, required this.operation, required this.dateTime});
}
