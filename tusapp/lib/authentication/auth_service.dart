import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth authInstance = FirebaseAuth.instance;

  // Listen the changes on the user authentication
  Stream<String> get onAuthStateChanged {
    authInstance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<UserCredential> signInAnonymously() async {
    await authInstance.signInAnonymously();
  }

  Future<UserCredential> createWithEmailAndPasswd(
      String email, String passwd) async {
    try {
      UserCredential userCredential = await authInstance
          .createUserWithEmailAndPassword(email: email, password: passwd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //TODO: return weak password warning
      } else if (e.code == 'email-already-in-use') {
        //TODO: return this email is already taken error
      }
    } catch (e) {
      //TODO: return other error
    }
  }

  Future<UserCredential> signInWithEmailAndPasswd(
      String email, String passwd) async {
    try {
      UserCredential userCredential = await authInstance
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

  Future<bool> verifyEmail() async {
    if (!authInstance.currentUser.emailVerified) {
      await authInstance.currentUser.sendEmailVerification();
    }
  }
}
