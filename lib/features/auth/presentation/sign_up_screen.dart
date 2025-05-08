import 'package:chat_app/features/auth/presentation/login_screen.dart';
import 'package:chat_app/features/auth/presentation/providers/auth.dart';
import 'package:chat_app/features/core/presentation/widgets/call_to_action.dart';
import 'package:chat_app/features/list_conversations/presentation/list_conversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Sign Up')),
    body: const _SignUpForm(),
  );
}

class _SignUpForm extends ConsumerStatefulWidget {
  const _SignUpForm();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends ConsumerState<_SignUpForm> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '';
  String username = '';
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
    usernameController.addListener(() {
      setState(() {
        username = usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
          TextField(
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          CallToAction(
            onPressed: email.isEmpty || username.isEmpty || password.isEmpty
                ? null
                : () async {
                    await ref
                        .read(authProvider.notifier)
                        .signUp(
                          email: email,
                          username: username,
                          password: password,
                        );
                    // TODO handle errors
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const ListConversationsScreen(),
                      ),
                      (route) => false,
                    );
                  },
            child: const Text('Sign Up'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
