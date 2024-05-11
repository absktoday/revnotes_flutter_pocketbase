import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revnotes_flutter_pocketbase/src/providers/providers.dart';
import 'package:revnotes_flutter_pocketbase/src/widgets/common/terms_and_policy_footer.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  // password visible state
  bool _isObscure = true;

  // Form state vars
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _submitSignInForm() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      // PB.signIn(_emailController.text, _passwordController.text);

      ref
          .read(authProvider.notifier)
          .signIn(_emailController.text, _passwordController.text);

      _formKey.currentState!.reset();

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign In",
                      style: GoogleFonts.abrilFatface(
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || !EmailValidator.validate(value)) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'john.doe@example.com',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary), // Set border color here
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary), // Set border color here
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      onFieldSubmitted: (_) {
                        _submitSignInForm();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary), // Set border color here
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary), // Set border color here
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Submit Button
                    ElevatedButton(
                      onPressed: _submitSignInForm,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(1),
                        foregroundColor:
                            Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.onBackground,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 20),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Do not have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 2),
                        TextButton(
                          onPressed: () => context.go("/register"),
                          child: const Text("Register"),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TermsAndPolicyFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
