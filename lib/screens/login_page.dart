import 'package:anonymous/colorTheme.dart';
import 'package:anonymous/resourses/auth_methods.dart';
import 'package:anonymous/screens/signup_page.dart';
import 'package:anonymous/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  void logInUser() async {
    setState(() {
      _isLoading = true;
    });

    String response = await AuthMethods().loginInUser(
      email: _emailController.text,
      password: _passController.text,
    );
    print("Reponse received from Firebase " + response);
    setState(() {
      _isLoading = false;
    });
  }

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

              //image
              TextFieldWidget(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter your Email'),
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
                onTap: logInUser,
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
                  child: _isLoading
                      ? Container(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Login In",
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignUpPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            " Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            "Sign Up",
                          ),
                        ),
                      ],
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
