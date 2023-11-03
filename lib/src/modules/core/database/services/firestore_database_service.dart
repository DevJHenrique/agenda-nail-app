import 'package:agenda_nail_app/src/modules/core/database/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabaseService {
  final FirebaseFirestore db;

  FirestoreDatabaseService(this.db);

  Future<void> add(UserModel user) async {
    print(user);
    final docRef = db
        .collection("users")
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(),
        )
        .doc(user.id);
    print(docRef.path);
    await docRef.set(user);
  }
}
