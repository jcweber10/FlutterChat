import 'package:chat_app/features/auth/presentation/providers/auth.dart';
import 'package:chat_app/features/auth/presentation/sign_up_screen.dart';
import 'package:chat_app/features/list_conversations/presentation/list_conversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // Initialize supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authProvider).value;
    return MaterialApp(
      navigatorObservers: [routeObserver],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 72, 131, 6),
        ),
      ),
      home: currentUser == null
          ? const SignUpScreen()
          : const ListConversationsScreen(),
    );
  }
}
