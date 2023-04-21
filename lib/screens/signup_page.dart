import 'dart:typed_data';

import 'package:anonymous/resourses/auth_methods.dart';
import 'package:anonymous/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  Uint8List? _image;

  bool _isloading = false;

  ImagePicker picker = ImagePicker();

  Future selectImage(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source);
    Uint8List img = await image!.readAsBytes();

    setState(() {
      _image = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signUpUser(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passController.text,
      image: _image!,
    );

    setState(() {
      _isloading = false;
    });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  _image == null
                      ? const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          selectImage(ImageSource.gallery);
                        },
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
                onTap: signUpUser,
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
                  child: _isloading
                      ? Container(
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            "Have an account? ",
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
                            "Sign In",
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
