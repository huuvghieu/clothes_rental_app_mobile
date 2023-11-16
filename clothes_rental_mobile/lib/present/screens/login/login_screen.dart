import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/user_model.dart';
import 'package:clothes_rental_mobile/present/screens/home/home_screen.dart';
import 'package:clothes_rental_mobile/present/widgets/text_form_field_custom.dart';
import 'package:clothes_rental_mobile/services/login_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String routeName = '/';
  const Login({super.key});
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const Login(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 50.0),
                   LoginForm(),
                   SizedBox(
                    height: 15.0,
                  ),
                   SizedBox(
                    height: 20.0,
                  ),
                   SizedBox(height: 10.0),
                   SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: const Padding(
        padding: EdgeInsets.only(left: 95),
        child: Text(
          'Clothes Rental',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Solway',
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final SharedPref sharedPref = SharedPref();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontFamily: 'Solway',
                  fontSize: 45.0,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldCustom(
                      label: "Tài khoản",
                      hint: "Nhập tài khoản...",
                      icon: Icons.account_circle_rounded,
                      isPassword: false,
                      controller: userController),
                  const SizedBox(height: 25.0),
                  TextFormFieldCustom(
                      label: "Mật khẩu",
                      hint: "Nhập mật khẩu...",
                      icon: Icons.password,
                      isPassword: true,
                      controller: passwordController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator(
                                    color: AppColor.primaryDark));
                          });
                      LoginService.login(
                              userController.text, passwordController.text)
                          .then((result) => {
                                Navigator.of(context).pop(),
                                if (result is UserModel)
                                  {
                                    AppString.userName = result.name!,
                                    Navigator.pushReplacementNamed(
                                      context,
                                      HomeScreen.routeName
                                    ),
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(SnackBar(
                                        elevation: 0,
                                        duration:
                                            const Duration(milliseconds: 2000),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: 'Login success!',
                                          message:
                                              'Welcome ${result.name.toString()} to Clothes Rental!',
                                          contentType: ContentType.success,
                                        ),
                                      ))
                                  }
                                else if (result is String)
                                  {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(SnackBar(
                                        elevation: 0,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: 'Login fail!',
                                          message: result,
                                          contentType: ContentType.failure,
                                        ),
                                      ))
                                  }
                              });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        elevation: 5.0,
                        shadowColor: Colors.black,
                        minimumSize: const Size(double.infinity, 20.0),
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
