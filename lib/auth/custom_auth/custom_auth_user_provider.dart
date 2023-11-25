import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class HaulageCompanyAuthUser {
  HaulageCompanyAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<HaulageCompanyAuthUser> haulageCompanyAuthUserSubject =
    BehaviorSubject.seeded(HaulageCompanyAuthUser(loggedIn: false));
Stream<HaulageCompanyAuthUser> haulageCompanyAuthUserStream() =>
    haulageCompanyAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
