import 'package:ca202/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class My_Signin_Screen extends StatefulWidget {
  const My_Signin_Screen({super.key});

  @override
  State<My_Signin_Screen> createState() => _My_Signin_ScreenState();
}

class _My_Signin_ScreenState extends State<My_Signin_Screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 15.0,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Lets help to login application",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.only(
                    //     left: 20.0,
                    //     right: 20.0,
                    //     top: 0.0,
                    //   ),
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Color.fromARGB(255, 247, 234, 234),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: TextFormField(
                    //     // controller: _emailController,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: "Enter your name",
                    //       hintStyle: TextStyle(
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 0.0,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 234, 234),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 0.0,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 234, 234),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your password",
                          hintStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.only(
                    //     left: 20.0,
                    //     right: 20.0,
                    //     top: 0.0,
                    //   ),
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Color.fromARGB(255, 247, 234, 234),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: "Enter confirm password",
                    //       hintStyle: TextStyle(
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Registered successfully",
                                ),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return My_Login_Screen();
                                },
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.toString(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an acount?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return My_Login_Screen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              " Login Now",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
