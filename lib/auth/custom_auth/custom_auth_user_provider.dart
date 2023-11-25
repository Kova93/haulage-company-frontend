import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class HaulageCompanyAuthUser {
  HaulageCompanyAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  AuthResponseDTOStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<HaulageCompanyAuthUser> haulageCompanyAuthUserSubject =
    BehaviorSubject.seeded(HaulageCompanyAuthUser(loggedIn: false));
Stream<HaulageCompanyAuthUser> haulageCompanyAuthUserStream() =>
    haulageCompanyAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
