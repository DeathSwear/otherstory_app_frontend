import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/auth_page/data/helpers/auth_ui_helpers.dart';
import 'package:otherstory_app/features/auth_page/domain/bloc/auth_bloc.dart';
import 'package:otherstory_app/features/auth_page/presentation/widgets/app_button.dart';
import 'package:otherstory_app/features/auth_page/presentation/widgets/custom_pincode.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int step = 0;
  bool isNewAccount = false;

  bool isButtonActive = false;

  TextEditingController textController = TextEditingController();

  TextEditingController textController2 = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void getBottomButtonFunction() {
    switch (step) {
      case 0:
        context.go('/login');
        return;
      case 2:
        print('retry code');
    }
  }

  String savedEmail = '';
  String savedPassword = '';
  String savedConfPassword = '';

  void mainFunction() {
    switch (step) {
      case 0:
        savedEmail = textController.text;
        setState(() {
          step++;
          textController.text = '';
          textController2.text = '';
          isButtonActive = false;
        });
        break;
      case 1:
        savedPassword = textController.text;
        savedConfPassword = textController2.text;
        context.read<AuthBloc>().add(AuthTryRegister(
            email: savedEmail,
            password: savedPassword,
            confPass: savedConfPassword));
        setState(() {
          step++;
          textController.text = '';
          textController2.text = '';
          isButtonActive = false;
        });
        break;
      case 2:
        context.read<AuthBloc>().add(AuthAddCode(code: textController.text));
        break;
      case 3:
        context.read<AuthBloc>().add(AuthMeeting(
            firstName: textController.text,
            lastName: textController2.text,
            isMan: true));
        break;
    }
  }

  void listenBlocStateChange(BuildContext context, AuthState state) {
    switch (state) {
      case AuthError _:
        setState(() {
          step = 0;
          textController.text = '';
          textController2.text = '';
          isButtonActive = false;
        });
        //AppModals.showTextOk(context, state.error, AppStrings.oops);
        break;
      case Sucsess _:
        if (step == 2) {
          setState(() {
            step++;
            textController.text = '';
            textController2.text = '';
            isButtonActive = false;
          });
        } else {
          context.go('/home');
        }

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AuthUiHelpers.getImage(step),
              height: MediaQuery.of(context).size.width * 142 / 400,
              width: MediaQuery.of(context).size.width * 142 / 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              AuthUiHelpers.getRegisterTitle(step),
              style: AppTextStyles.authTitle.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AuthUiHelpers.getRegisterSubTitle(step),
              style: AppTextStyles.authSubtitle.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 28,
            ),
            step == 2
                ? CustomPincode(
                    textEditingController: textController,
                    onEditingComplete: () {
                      if (textController.text.isNotEmpty && !isButtonActive) {
                        setState(() {
                          isButtonActive = true;
                        });
                      }
                      if (textController.text.isEmpty && isButtonActive) {
                        setState(() {
                          isButtonActive = false;
                        });
                      }
                    },
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        AuthUiHelpers.getRegisterLabel(step),
                        style: AppTextStyles.authTextFieldTitle
                            .copyWith(color: Color.fromRGBO(60, 60, 67, 0.6)),
                      ),
                      const SizedBox(height: 7),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(60, 60, 67, 0.6),
                                width: 1),
                            borderRadius: BorderRadius.circular(13)),
                        child: TextField(
                          onChanged: (value) {
                            if (textController.text.isNotEmpty &&
                                !isButtonActive) {
                              setState(() {
                                isButtonActive = true;
                              });
                            }
                            if (textController.text.isEmpty && isButtonActive) {
                              setState(() {
                                isButtonActive = false;
                              });
                            }
                          },
                          controller: textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AuthUiHelpers.getRegisterHint(step),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            hintStyle: AppTextStyles.authTextFieldHint.copyWith(
                                color: Color.fromRGBO(60, 60, 67, 0.6)),
                          ),
                        ),
                      ),
                      if (step == 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Фамилия',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.authTextFieldTitle.copyWith(
                                color: Color.fromRGBO(60, 60, 67, 0.6)),
                          ),
                        ),
                      if (step == 1 || step == 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(60, 60, 67, 0.6),
                                    width: 1),
                                borderRadius: BorderRadius.circular(13)),
                            child: TextField(
                              onChanged: (value) {
                                if (textController.text.isNotEmpty &&
                                    !isButtonActive) {
                                  setState(() {
                                    isButtonActive = true;
                                  });
                                }
                                if (textController.text.isEmpty &&
                                    isButtonActive) {
                                  setState(() {
                                    isButtonActive = false;
                                  });
                                }
                              },
                              controller: textController2,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AuthUiHelpers.getRegisterHint2(step),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 16,
                                ),
                                hintStyle: AppTextStyles.authTextFieldHint
                                    .copyWith(
                                        color: Color.fromRGBO(60, 60, 67, 0.6)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
            BlocListener<AuthBloc, AuthState>(
                listener: listenBlocStateChange, child: const Spacer()),
            AppButton(
                text: 'Продолжить',
                onPressed: mainFunction,
                isEnabled: isButtonActive),
            if (step == 0 || step == 2)
              GestureDetector(
                onTap: getBottomButtonFunction,
                child: Container(
                  height: 52,
                  alignment: Alignment.center,
                  child: Text(
                    AuthUiHelpers.getRegisterBottomButtonText(step),
                    style: AppTextStyles.authButtonText.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
