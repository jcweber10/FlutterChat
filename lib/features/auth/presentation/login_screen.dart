import 'package:chat_app/features/auth/presentation/providers/auth.dart';
import 'package:chat_app/features/core/presentation/widgets/call_to_action.dart';
import 'package:chat_app/features/list_conversations/presentation/list_conversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: const _LoginForm(),
  );
}

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 16),
          CallToAction(
            onPressed: email.isEmpty || password.isEmpty
                ? null
                : () async {
                    // TODO handle errors
                    await ref
                        .read(authProvider.notifier)
                        .login(email, password);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const ListConversationsScreen(),
                      ),
                      (route) => false,
                    );
                  },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
