import 'package:anonymous/resourses/auth_methods.dart';
import 'package:anonymous/screens/login_page.dart';
import 'package:flutter/material.dart';

import '../colorTheme.dart';
import '../widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              const SizedBox(
                height: 64,
              ),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //image
              TextFieldWidget(
                  textEditingController: _usernameController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter your Username'),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                textEditingController: _emailController,
                textInputType: TextInputType.text,
                hintText: 'Enter your Email',
              ),

              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                textEditingController: _passController,
                textInputType: TextInputType.text,
                hintText: 'Enter your Password',
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () => AuthMethods().signUpUser(
                  username: _usernameController.text,
                  email: _emailController.text,
                  password: _passController.text,
                ),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Flexible(
                child: Container(),
                flex: 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Have an account?",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Sign In",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
