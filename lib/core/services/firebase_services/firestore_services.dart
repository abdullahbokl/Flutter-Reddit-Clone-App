import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final FirebaseFirestore firestore;

  FirestoreServices({required this.firestore});

  Future<void> saveData({
    required String collectionName,
    required String? docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      docId ??= DateTime.now().millisecondsSinceEpoch.toString();
      await firestore.collection(collectionName).doc(docId).set(data);
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirestoreServices',
        message: e.toString(),
        code: '500', // 500 is the default code for all unknown errors
      );
    }
  }

  Future getData({
    required String collectionName,
    String? docId,
    int? limit,
    String? orderBy,
    bool? descending,
  }) async {
    try {
      final res = await firestore
          .collection(collectionName)
          .orderBy(orderBy ?? "id", descending: descending ?? false)
          // .startAfter([docId ?? 0])
          .limit(limit ?? 20)
          .get();

      return res;
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirestoreServices',
        message: e.toString(),
        code: '500',
      );
    }
  }

  Future<void> updateData({
    required String collectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(collectionName).doc(docId).update(data);
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirestoreServices',
        message: e.toString(),
        code: '500',
      );
    }
  }

  Future<void> deleteData({
    required String collectionName,
    required String docId,
  }) async {
    try {
      await firestore.collection(collectionName).doc(docId).delete();
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirestoreServices',
        message: e.toString(),
        code: '500', // 500 is the default code for all unknown errors
      );
    }
  }
}
