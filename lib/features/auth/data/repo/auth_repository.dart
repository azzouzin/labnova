abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password, String name);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getCurrentUserId();
  Future<void> saveUserProfile(
      {required String uid, required String name, required String email});
  Future<Map<String, dynamic>?> getUserProfile(String uid);
}
