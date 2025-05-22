import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException signIn: \$e');
      return false;
    } catch (e) {
      print('Exception signIn: \$e');
      return false;
    }
  }

  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException signUp: \$e');
      return false;
    } catch (e) {
      print('Exception signUp: \$e');
      return false;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Add Google Sign-In and other auth methods as needed
}
