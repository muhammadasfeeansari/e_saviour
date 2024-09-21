import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sviour_app/helper/helper_func.dart';
import 'package:sviour_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const Color primary = Color(0xFF326BFB);

  final TextEditingController useremailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  void login() async {
//show dailog indigator
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try creating User
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useremailController.text, password: passwordController.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, MyRoutes.HomeRoute);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // error massage for the user
      displayErrorMassage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 290,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/travel.jpg'),
                            fit: BoxFit.cover),
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 7, right: 7, left: 7),
                    height: MediaQuery.of(context).size.height / 1.8,
                    decoration: const BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Welcome! \nPlease Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: useremailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust the radius here
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Same radius for focused state
                                borderSide: const BorderSide(
                                    color:
                                        Colors.white), // Change color if needed
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Same radius for enabled state
                                borderSide: const BorderSide(
                                    color:
                                        Colors.white), // Change color if needed
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12.0),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust the radius here
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Same radius for focused state
                                borderSide: const BorderSide(
                                    color:
                                        Colors.white), // Change color if needed
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Same radius for enabled state
                                borderSide: const BorderSide(
                                    color:
                                        Colors.white), // Change color if needed
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12.0),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: login,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              width: double.infinity,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                'Login',
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ),
                          ),
                           const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Dont Have`n Account?"),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.SignupRoute);
                                },
                                child: const Text(
                                  " Sign Up Here",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
