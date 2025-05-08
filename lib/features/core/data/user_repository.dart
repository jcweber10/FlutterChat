import 'package:chat_app/features/core/domain/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  ProfileRepository({required this.supabase});

  final SupabaseClient supabase;

  Future<Profile> getProfileByUsername(String username) async {
    final profileResponse = await supabase
        .from('profiles')
        .select('*')
        .ilike('username', '%$username%')
        .single();
    final profile = Profile.fromJson(profileResponse);
    return profile;
  }
}
