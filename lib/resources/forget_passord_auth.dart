

import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordAuth {
  Future<void> sendPasswordResetEmail(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    print("Password reset email sent to $email");
  } catch (e) {
    print("Failed to send password reset email: $e");
    // Handle error
  }
}
}
