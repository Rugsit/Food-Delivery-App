import 'package:ecommerce_project/features/authentication/domain/entities/form_input.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_event.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_state.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_event.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_state.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/AlertPopup.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/EcomButton.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/EcomSnackBar.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/EcomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        if (state is RegisterFailure) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Alertpopup(message: state.errorMessage, isError: true);
            },
          );
        } else if (state is RegisterSuccess) {
          context.read<ValidationFormBloc>().add(ResetFormField());
          EcomSnackbar(
            isError: false,
            text: "Create account successfully",
          ).showSnackBar(context);
          context.go("/login");
        } else if (state is RegisterLoading) {
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.go("/login");
            },
            icon: FaIcon(FontAwesomeIcons.arrowLeft),
          ),
        ),

        body: BlocBuilder<ValidationFormBloc, ValidationFormState>(
          builder: (context, validationState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's create your account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Ecomtextfield(
                          onChanged:
                              (value) => context.read<ValidationFormBloc>().add(
                                FirstNameChanged(value),
                              ),
                          formInputModel: validationState.firstName,
                          labelText: "First Name",
                          errorText: "First name musn't be empty.",
                          icon: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Ecomtextfield(
                          onChanged:
                              (value) => context.read<ValidationFormBloc>().add(
                                LastNameChanged(value),
                              ),
                          formInputModel: validationState.lastName,
                          labelText: "Last Name",
                          errorText: "Last name musn't be empty.",
                          icon: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          UserNameChanged(value),
                        ),
                    formInputModel: validationState.userName,
                    labelText: "User Name",
                    errorText: "User name musn't be empty.",
                    icon: FaIcon(
                      FontAwesomeIcons.userPen,
                      color: Colors.grey[500],
                    ),
                  ),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          EmailChanged(value),
                        ),
                    formInputModel: validationState.email,
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
                          PhoneNumberChanged(value),
                        ),
                    formInputModel: validationState.phoneNumber,
                    labelText: "Phone Number",
                    errorText: "Invalid phone number.",
                    icon: FaIcon(
                      FontAwesomeIcons.phone,
                      color: Colors.grey[500],
                    ),
                  ),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          PasswordChanged(value),
                        ),
                    formInputModel: validationState.password,
                    labelText: "Password",
                    errorText: "Password musn't be empty.",
                    isPassword: true,
                    icon: FaIcon(FontAwesomeIcons.key, color: Colors.grey[500]),
                  ),
                  Ecomtextfield(
                    onChanged:
                        (value) => context.read<ValidationFormBloc>().add(
                          ConfirmPasswordChanged(value),
                        ),
                    formInputModel: validationState.confirmPassword,
                    labelText: "Confirm Password",
                    errorText: "Password musn't be empty.",
                    icon: FaIcon(FontAwesomeIcons.key, color: Colors.grey[500]),
                    errorFunction:
                        (formInputModel) =>
                            formInputModel.isNotValid &&
                                    !formInputModel.isPure &&
                                    formInputModel.error ==
                                        ConfirmPasswordValidationError.empty
                                ? "Confirm password musn't be empty."
                                : formInputModel.isNotValid &&
                                    !formInputModel.isPure &&
                                    formInputModel.error ==
                                        ConfirmPasswordValidationError
                                            .notSameasPassword
                                ? "Confirm password must be same as password."
                                : null,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  BlocListener<ValidationFormBloc, ValidationFormState>(
                    listener: (context, state) {
                      if (state.validateStatus) {
                        context.read<RegisterBloc>().add(
                          SignUp(
                            firstName: validationState.firstName.value,
                            lastName: validationState.lastName.value,
                            userName: validationState.userName.value,
                            email: validationState.email.value,
                            phoneNumber: validationState.phoneNumber.value,
                            password: validationState.password.value,
                          ),
                        );
                        context.read<ValidationFormBloc>().add(
                          ResetFormStatus(),
                        );
                      }
                    },
                    child: EcomButton(
                      textColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      text: "Create Account",
                      onPressed: () {
                        context.read<ValidationFormBloc>().add(
                          ValidateRegisterForm(),
                        );
                      },
                    ),
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
