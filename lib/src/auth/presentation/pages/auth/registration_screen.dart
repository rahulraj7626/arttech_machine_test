import 'package:art_tech_machine_test/src/auth/data/models/register_model/register_request.dart';
import 'package:art_tech_machine_test/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:art_tech_machine_test/src/auth/presentation/pages/auth/login_screen.dart';
import 'package:art_tech_machine_test/src/auth/presentation/widgets/button_widget.dart';
import 'package:art_tech_machine_test/src/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_form_field_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fNameController = TextEditingController();
    final sNameController = TextEditingController();
    final genderController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Form(
          key: rFormKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormFieldWidget(
                controller: fNameController,
                hint: "First name",
                isPassword: false,
                type: InputType.text,
                errorMsg: "First name required"),
            TextFormFieldWidget(
                controller: sNameController,
                hint: "Last name",
                isPassword: false,
                type: InputType.text,
                errorMsg: "Last name required"),
            TextFormFieldWidget(
                controller: genderController,
                hint: "Gender",
                isPassword: false,
                type: InputType.text,
                errorMsg: "Gender required"),
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
                if (state is RegisterState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (coontext) => const LoginScreen()));
                }
              },
              child: BlocBuilder(
                  bloc: BlocProvider.of<AuthBloc>(context),
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return buttonWidget(
                          context,
                          emailController.text,
                          fNameController.text,
                          sNameController.text,
                          genderController.text,
                          passwordController.text,
                          true);
                    }
                    return buttonWidget(
                        context,
                        emailController.text,
                        fNameController.text,
                        sNameController.text,
                        genderController.text,
                        passwordController.text,
                        false);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

buttonWidget(
    BuildContext context, email, fname, snam, gender, password, isLoading) {
  return ButtonWidget(
      isLoading: isLoading,
      buttonName: "Register",
      onTap: () => context.read<AuthBloc>().add(RegisterEvent(
          request: RegisterRequest(
              email: email,
              fNamr: fname,
              gender: gender,
              lName: snam,
              password: password))));
}

final rFormKey = GlobalKey<FormState>();
