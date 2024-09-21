import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sviour_app/helper/helper_func.dart';
import 'package:sviour_app/utils/routes.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigUpPage> {
  static const Color primary = Color(0xFF326BFB);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController useremailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController useraddressController = TextEditingController();
  final TextEditingController userageController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // Register function
  void registerUser() async {
  if (formkey.currentState!.validate()) {
    // Show loading dialog
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: useremailController.text,
              password: passwordController.text);
      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': usernameController.text,
        'email': useremailController.text, // Make sure this is included
        'address': useraddressController.text,
        'age': userageController.text,
        'createdAt': Timestamp.now(),
      });
      // Remove loading dialog
      Navigator.pop(context);
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Sign Up Successfully",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      );
      // Navigate to Login screen
      Navigator.pushNamed(context, MyRoutes.LoginRoute);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayErrorMassage(e.code, context);
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to store user data: ${e.toString()}'),
        ),
      );
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: MediaQuery.sizeOf(context).height * 0.31,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/travel.jpg'),
                          fit: BoxFit.cover),
                    )),
                Container(
                  padding: const EdgeInsets.only(
                      left: 7.0, right: 7.0, bottom: 7.0, top: 14.0),
                  margin: const EdgeInsets.all(7),
                  // height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Create \nyour Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your full name',
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
                          const SizedBox(height: 12),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter an Email';
                              } else if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                                  .hasMatch(value)) {
                                return 'Please Enter a Valid Gmail Address';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            controller: useremailController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
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
                          const SizedBox(height: 12),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must contain 6 letters';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
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
                          const SizedBox(height: 12),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter address';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            controller: useraddressController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Address',
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
                          const SizedBox(height: 12),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter age';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            controller: userageController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Age ',
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
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: registerUser,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              width: double.infinity,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                'Sign up',
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
                              const Text("Already Have`n Account?"),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.LoginRoute);
                                },
                                child: const Text(
                                  " Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
