import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data/root_gateway/root_gateway.dart';
import '../../shared/init/core_d_i.dart';
import '../../shared/navigator/navigator1_helper.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../../shared/widgets/logger.dart';
import '../../shared/widgets/text_fields/email_textfield.dart';
import '../../shared/widgets/text_fields/password_text_field.dart';
import '../../splash_screen/splash_screen.dart';
import '../data/bloc/bloc.dart';
import '../data/sourse/auth_api.dart';
import '/shared/l10n/l10n_helper.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailField = EmailTextfield(
    data: EmailTextfieldData(
      hintText: 'Please enter your email ',
    ),
  );

  final passwordField = PasswordTextField(
    data: PasswordTextfieldData(hintText: 'Your password'),
  );

  bool isDoctor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(
          local: CoreDi.get(),
          remote: AuthApi(
            api: CoreDi.get(),
          ),
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {}
            if (state is AuthSuccess) {
              CoreDi.get<RootGateway>().token = state.token;
              context.rootRouter.use.push(const SplashScreen());
              Log.w(state.token);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            // if (state is AuthError) {
            //   return AppErrorWidget(
            //     message: state.error,
            //     onRefresh: () {
            //       //TODO обновлять состояние
            //       //BlocProvider.of<AuthBloc>(context).add(AuthReset()) => emit(AuthInitial())
            //     },
            //   );
            // }
            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(context.s.login, style: context.text.m24w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: Text(
                      context.s.enterYourEmailAndPassword,
                      style: context.text.sn14w400,
                    ),
                  ),
                  emailField,
                  const SizedBox(height: 16),
                  passwordField,
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(context.s.forgotPassword),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isDoctor,
                        onChanged: (v) {
                          setState(() {
                            isDoctor = v ?? false;
                          });
                        },
                      ),
                      const Text('Is doctor App'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: context.button.elevated1,
                          onPressed: () {
                            if (emailField.data.validate || passwordField.data.validate) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthSignIn(
                                  login: emailField.data.controller.text,
                                  pass: passwordField.data.controller.text,
                                  isDoctor: isDoctor,
                                ),
                              );
                            }
                          },
                          child: Text(
                            context.s.continuee,
                            style: context.text.n16w400,
                          ),
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
