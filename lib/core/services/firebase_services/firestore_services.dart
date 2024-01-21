import 'package:cloud_firestore/cloud_firestore.dart';

import '../../common/models/post_model.dart';
import '../../utils/app_strings.dart';

class FirestoreServices {
  final FirebaseFirestore firestore;

  FirestoreServices({required this.firestore});

  Future<PostModel> saveData({
    required String collectionName,
    required String? docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      docId ??= DateTime.now().millisecondsSinceEpoch.toString();
      await firestore.collection(collectionName).doc(docId).set(data);
      return PostModel.fromMap(data).copyWith(
          //   remote id if needed
          );
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

  Future<bool> checkIfDocIsExisted({
    required String collectionName,
    required String docId,
  }) async {
    try {
      final res = await firestore.collection(collectionName).doc(docId).get();
      return res.exists;
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
    String? lastDocId,
    int? limit,
    String? orderBy,
    bool? descending,
  }) async {
    final lastDoc = lastDocId != null
        ? await firestore.collection(collectionName).doc(lastDocId).get()
        : null;
    try {
      final QuerySnapshot<Map<String, dynamic>> res = lastDoc == null
          ? await firestore
              .collection(collectionName)
              .orderBy(orderBy ?? AppStrings.postModelId,
                  descending: descending ?? true)
              .limit(limit ?? 10)
              .get()
          : await firestore
              .collection(collectionName)
              .orderBy(orderBy ?? AppStrings.postModelId,
                  descending: descending ?? true)
              .startAfterDocument(lastDoc)
              .limit(limit ?? 10)
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
