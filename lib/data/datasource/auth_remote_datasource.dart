import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signInWithEmail(String email, String password);
  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithApple();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // FirebaseAuth instance
  // Sign in with Email and Password
  @override
  Future<UserModel?> signInWithEmail(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;
      if (user != null) {
        return UserModel(id: user.uid, email: user.email ?? '');
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Sign in with Google
  @override
  Future<UserModel?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null; // The user canceled the sign-in
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    var user = userCredential.user;
    if (user != null) {
      return UserModel(id: user.uid, email: user.email ?? '');
    }
    return null;
  }

  // Sign in with Apple
  Future<User?> signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return userCredential.user;
  }
}
