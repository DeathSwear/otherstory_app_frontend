import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/auth_page/presentation/widgets/app_button.dart';
import 'package:otherstory_app/features/auth_page/presentation/widgets/custom_pincode.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int step = 0;
  bool isNewAccount = false;

  bool isButtonActive = false;

  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  String getTitle() {
    switch (step) {
      case 0:
        return 'Вход';
      case 1:
        return 'Пароль';
      default:
        return 'Введите код';
    }
  }

  String getSubTitle() {
    switch (step) {
      case 0:
        return 'Текст при входе в акканут пользователя';
      case 1:
        return 'Текст при вводе пароля от акканута пользователя';
      default:
        return 'Текст при подтверждении почты, код приходит в письме';
    }
  }

  String getLabel() {
    switch (step) {
      case 0:
        return 'Почта';
      default:
        return 'Пароль';
    }
  }

  String getHint() {
    switch (step) {
      case 0:
        return 'Электронная почта';
      default:
        return 'Пароль';
    }
  }

  String getBottomButtonText() {
    switch (step) {
      case 0:
        return 'У меня нет аккаунта';
      case 1:
        return 'Я не помню пароль';
      default:
        return 'Отправить повторно';
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
            Container(
              color: Colors.red[100],
              height: MediaQuery.of(context).size.width * 142 / 400,
              width: MediaQuery.of(context).size.width * 142 / 400,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              getTitle(),
              style: AppTextStyles.authTitle.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              getSubTitle(),
              style: AppTextStyles.authSubtitle.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 28,
            ),
            step == 2
                ? CustomPincode(
                    textEditingController: textController,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        getLabel(),
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
                            hintText: getHint(),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            hintStyle: AppTextStyles.authTextFieldHint.copyWith(
                                color: Color.fromRGBO(60, 60, 67, 0.6)),
                          ),
                        ),
                      ),
                    ],
                  ),
            const Spacer(),
            AppButton(
                text: 'Продолжить',
                onPressed: () {
                  setState(() {
                    if (step == 2) {
                      step = 0;
                    } else {
                      step++;
                    }
                    textController.text = '';
                    isButtonActive = false;
                  });
                },
                isEnabled: isButtonActive),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 52,
                alignment: Alignment.center,
                child: Text(
                  getBottomButtonText(),
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
