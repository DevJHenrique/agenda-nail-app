import 'package:agenda_nail_app/src/modules/core/database/models/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends BaseModel {
  final String id;
  final String name;
  final String email;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
    SnapshotOptions? options,
  ) {
    final data = document.data();
    return UserModel(
      id: document.id,
      name: data?["name"],
      email: data?["email"],
      phone: data?["phone"],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
