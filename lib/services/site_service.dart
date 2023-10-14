import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csse/models/site_model.dart';
import 'package:csse/utils/collection_names.dart';

class SiteService {
  final _firebase = FirebaseFirestore.instance;
  Future<Site?> getSite(String id) async {
    try {
      return await _firebase
          .collection(siteCollection)
          .where('siteManagerId', isEqualTo: id)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          return Site.fromDocumentSnapshot(value.docs[0]);
        }
        return null;
      });
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<Site?> getSiteByUserEmail(String email) async {
    try {
      return await _firebase
          .collection(siteCollection)
          .where("siteManagerId", isEqualTo: email)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          return Site.fromDocumentSnapshot(value.docs[0]);
        } else {
          return null;
        }
      });
    } catch (e) {
      throw Error.safeToString(e);
    }
  }
}
