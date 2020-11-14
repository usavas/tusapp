import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static AuthService _authServiceInstance;
  FirebaseAuth _authInstance;
  AuthService._() {
    _authInstance = FirebaseAuth.instance;
  }

  static AuthService get getService =>
      _authServiceInstance = _authServiceInstance ?? AuthService._();

  FirebaseAuth get getAuthInstance => _authInstance;

  // Listen the changes on the user authentication
  Stream<String> get onAuthStateChanged {
    _authInstance.userChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }

      if (user.emailVerified) {
        print('user email verified');
      }
    });
  }

  Future<UserCredential> signInAnonymously() async {
    await _authInstance.signInAnonymously();
  }

  Future<UserCredential> createUserWithEmailAndPasswd(
      String email, String passwd) async {
    try {
      return await _authInstance.createUserWithEmailAndPassword(
          email: email, password: passwd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Şifreniz güçsüz');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('E-posta adresi zaten kullanımda');
      } else if (e.code == 'invalid-email') {
        throw ('Geçersiz e-posta adresi');
      }
      throw (e.code);
    }
  }

  Future<UserCredential> signInWithEmailAndPasswd(
      String email, String passwd) async {
    try {
      UserCredential userCredential = await _authInstance
          .signInWithEmailAndPassword(email: email, password: passwd);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //TODO: return user not found with this email error
      } else if (e.code == 'wrong-password') {
        //TODO: return password wrong error
      }
    }
  }

  Future<void> verifyEmail() async {
    if (!_authInstance.currentUser.emailVerified) {
      await _authInstance.currentUser.sendEmailVerification();
    }
  }
}
