import 'package:flutter/material.dart';
import 'package:sviour_app/utils/routes.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigUpPage> {
  static const Color primary = Color(0xFF326BFB);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/travel.jpg'),
                    ),
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
                      TextField(
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
                                color: Colors.white), // Change color if needed
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Same radius for enabled state
                            borderSide: const BorderSide(
                                color: Colors.white), // Change color if needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: passwordController,
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
                                color: Colors.white), // Change color if needed
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Same radius for enabled state
                            borderSide: const BorderSide(
                                color: Colors.white), // Change color if needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: usernameController,
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
                                color: Colors.white), // Change color if needed
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Same radius for enabled state
                            borderSide: const BorderSide(
                                color: Colors.white), // Change color if needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: usernameController,
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
                                color: Colors.white), // Change color if needed
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Same radius for enabled state
                            borderSide: const BorderSide(
                                color: Colors.white), // Change color if needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: usernameController,
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
                                color: Colors.white), // Change color if needed
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Same radius for enabled state
                            borderSide: const BorderSide(
                                color: Colors.white), // Change color if needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
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
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Have`n Account?"),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.LoginRoute);
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
            ],
          ),
        ),
      ),
    );
  }
}
