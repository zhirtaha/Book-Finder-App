import 'package:flutter/material.dart';
import 'package:my_book_finder/src/layout/main_layout.dart';
import 'package:my_book_finder/src/screens/sign_up_screen.dart';
import 'package:my_book_finder/src/services/auth_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:my_book_finder/src/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Auth auth = Auth();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: secondaryColor,
        elevation: 0.0,
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/book.png',
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                  controller: emailController,
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: secondaryColor,
                      ),
                      fillColor: Colors.grey[150],
                      focusColor: secondaryColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                  controller: passwordController,
                  cursorColor: secondaryColor,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: secondaryColor,
                      ),
                      fillColor: Colors.grey[150],
                      focusColor: secondaryColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? Center(child: CircularProgressIndicator(
                      color: accentColor,
                    ))
                    : Container(
                        padding: EdgeInsets.all(0),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (formKey.currentState!.validate()) {
                              var response = await auth.signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              if (response != null) {
                                // ignore: use_build_context_synchronously
                                navigateAndRemove(context, MainLayout());
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shadowColor: secondaryColor,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                              primary: secondaryColor,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text('Sign In'),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        navigateAndRemove(context, SignUpScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
