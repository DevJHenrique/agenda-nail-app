import 'package:agenda_nail_app/src/modules/core/database/models/specialist_model.dart';
import 'package:agenda_nail_app/src/modules/core/database/models/user_model.dart';

class AppointmentModel {
  final String id;
  final UserModel user;
  final SpecialistModel specialist;
  final DateTime dateTime;
  final List<String> scheduledServicesId;
  final String? notes;

  AppointmentModel({
    required this.id,
    required this.user,
    required this.specialist,
    required this.dateTime,
    required this.scheduledServicesId,
    this.notes,
  });
}
