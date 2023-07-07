import 'package:art_tech_machine_test/src/auth/data/models/login_model/login_request.dart';
import 'package:art_tech_machine_test/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:art_tech_machine_test/src/auth/presentation/pages/auth/registration_screen.dart';
import 'package:art_tech_machine_test/src/auth/presentation/pages/home/home.dart';
import 'package:art_tech_machine_test/src/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/enums.dart';
import '../../widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Form(
          key: lFormKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormFieldWidget(
                controller: emailController,
                hint: "Email",
                isPassword: false,
                type: InputType.email,
                errorMsg: "Email required"),
            TextFormFieldWidget(
                controller: passwordController,
                hint: "Password",
                isPassword: false,
                type: InputType.password,
                errorMsg: "Password required"),
            BlocListener(
              bloc: BlocProvider.of<AuthBloc>(context),
              listener: (context, state) {
                if (state is LoginState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (coontext) => Home(
                                data: state.data,
                              )));
                }
              },
              child: BlocBuilder(
                  bloc: BlocProvider.of<AuthBloc>(context),
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return buttonWidget(context, emailController.text,
                          passwordController.text, true);
                    }
                    return buttonWidget(context, emailController.text,
                        passwordController.text, false);
                  }),
            ),
            ButtonWidget(
                isLoading: false,
                buttonName: "Register",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (coontext) => const RegistrationScreen()))),
          ]),
        ),
      ),
    );
  }

  buttonWidget(BuildContext context, email, password, isLoading) {
    return ButtonWidget(
        isLoading: isLoading,
        buttonName: "Login",
        onTap: () => context.read<AuthBloc>().add(LoginEvent(
            request: LoginRequest(email: email, password: password))));
  }
}

final lFormKey = GlobalKey<FormState>();
