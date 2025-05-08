import 'package:chat_app/features/core/presentation/providers/supabase_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Stream<User?> build() {
    final supabase = ref.read(supabaseClientProvider);
    return supabase.auth.onAuthStateChange.map(
      (event) => supabase.auth.currentUser,
    );
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await ref
        .read(supabaseClientProvider)
        .auth
        .signUp(email: email, password: password, data: {'username': username});
    return response;
  }

  Future<AuthResponse> login(String email, String password) async {
    final response = await ref
        .read(supabaseClientProvider)
        .auth
        .signInWithPassword(email: email, password: password);
    return response;
  }
}
