import 'package:flutter/material.dart';
import 'package:my_book_finder/src/screens/sign_in_screen.dart';
import 'package:my_book_finder/src/services/auth_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:my_book_finder/src/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Auth auth = Auth();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name Must Not be Empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      prefixIcon: Icon(
                        Icons.person,
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
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Must Not be Empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Must Not be Empty';
                    }
                    return null;
                  },
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
                              var response = await auth.signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text);
                              if (response != null) {
                                // ignore: use_build_context_synchronously
                                navigateAndRemove(context, SignInScreen());
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
                          child: Text('Sign Up'),
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
                    Text('Alredy have an account?'),
                    TextButton(
                      onPressed: () {
                        navigateAndRemove(context, SignInScreen());
                      },
                      child: Text(
                        'Sign In',
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
