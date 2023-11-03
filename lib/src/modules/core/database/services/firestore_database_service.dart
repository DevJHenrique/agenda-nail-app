import 'package:agenda_nail_app/src/modules/core/database/models/user_model.dart';
import 'package:agenda_nail_app/src/modules/core/database/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabaseService implements DatabaseService {
  final FirebaseFirestore db;

  FirestoreDatabaseService(this.db);

  @override
  Future<void> setUser(UserModel user) async {
    final docRef = db
        .collection("users")
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(),
        )
        .doc(user.id);

    await docRef.set(user);
  }

  @override
  Future<void> deleteUser(UserModel user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}
