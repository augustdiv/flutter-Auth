import 'package:firetest/pages/home_page.dart';
import 'package:firetest/pages/sign_up.dart';
import 'package:flutter/material.dart';
import '../components/field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  login() async {
    User? CurrentUser;

    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      CurrentUser = auth.user;
    }).catchError((error) {
      print(error);
    });

    if (CurrentUser != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'We are always available to give \n you the best services',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        // topRight: Radius.circular(2),
                      ),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[300]),
                              ),
                              Text(
                                'we offer the best services',
                                style: TextStyle(
                                    color: Colors.blue[300], fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                      FieldWidget('Email', Icons.email, emailController),
                      FieldWidget('password', Icons.lock, passwordController),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                          ),
                          onPressed: () {
                            login();
                          },
                          child: const Text(
                            'access',
                            style: TextStyle(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don\'t have an account yet',
                            style: TextStyle(color: Colors.blue[300]),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => const SignUpPage()));
                            },
                            child: const Text(
                              'SignUp',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
