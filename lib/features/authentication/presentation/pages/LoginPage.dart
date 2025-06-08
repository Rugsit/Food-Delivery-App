import 'package:ecommerce_project/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_event.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_state.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/AlertPopup.dart';
import 'package:ecommerce_project/core/widget/EcomButton.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/EcomSnackBar.dart';
import 'package:ecommerce_project/core/widget/EcomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        if (state is LoginFailure) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Alertpopup(message: state.errorMessage, isError: true);
            },
          );
        } else if (state is LoginSuccess) {
          EcomSnackbar(
            isError: false,
            text: "Sign in successfully",
          ).showSnackBar(context);
          context.go("/home");
        } else if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ValidationFormBloc, ValidationFormState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Discover, Limitless Choices and Unmatched Convenience",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          EmailChanged(value),
                        ),
                    formInputModel: state.email,
                    labelText: "Email",
                    errorText: "Invalid email.",
                    icon: FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.grey[500],
                    ),
                  ),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          PasswordChanged(value),
                        ),
                    isPassword: true,
                    formInputModel: state.password,
                    labelText: "Password",
                    errorText: "Password musn't be empty.",
                    icon: FaIcon(FontAwesomeIcons.key, color: Colors.grey[500]),
                  ),
                  SizedBox(height: 20),
                  BlocListener<ValidationFormBloc, ValidationFormState>(
                    listener: (context, state) {
                      if (state.validateStatus) {
                        context.read<LoginBloc>().add(
                          SignIn(state.email.value, state.password.value),
                        );
                        context.read<ValidationFormBloc>().add(
                          ResetFormStatus(),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: EcomButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            onPressed: () {
                              context.read<ValidationFormBloc>().add(
                                ValidateLoginForm(),
                              );
                            },
                            text: "Sign In",
                            textColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: EcomButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            context.read<ValidationFormBloc>().add(
                              ResetFormField(),
                            );
                            context.go("/register");
                          },
                          text: "Create Account",
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          borderColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
