import 'package:otherstory_app/theme/image_source.dart';

class AuthUiHelpers {
  static String getLoginTitle(int step) {
    switch (step) {
      case 0:
        return 'Вход';
      case 1:
        return 'Пароль';
      default:
        return 'Введите код';
    }
  }

  static String getLoginSubTitle(int step) {
    switch (step) {
      case 0:
        return 'Текст при входе в акканут пользователя';
      case 1:
        return 'Текст при вводе пароля от акканута пользователя';
      default:
        return 'Текст при подтверждении почты, код приходит в письме';
    }
  }

  static String getLoginLabel(int step) {
    switch (step) {
      case 0:
        return 'Почта';
      default:
        return 'Пароль';
    }
  }

  static String getLoginHint(int step) {
    switch (step) {
      case 0:
        return 'Электронная почта';
      default:
        return 'Пароль';
    }
  }

  static String getLoginBottomButtonText(int step) {
    switch (step) {
      case 0:
        return 'У меня нет аккаунта';
      case 1:
        return 'Я не помню пароль';
      default:
        return 'Отправить повторно';
    }
  }

  static String getRegisterTitle(int step) {
    switch (step) {
      case 0:
        return 'Авторизация';
      case 1:
        return 'Придумайте пароль';
      case 2:
        return 'Введите код';
      default:
        return 'Давайте познакомимся';
    }
  }

  static String getRegisterSubTitle(int step) {
    switch (step) {
      case 0:
        return 'Текст при авторизации пользователя';
      case 1:
        return 'Текст при придумывании пароля от акканута пользователя';
      case 2:
        return 'Текст при подтверждении почты, код приходит в письме';
      default:
        return 'Текст при вводе данных пользователя';
    }
  }

  static String getRegisterLabel(int step) {
    switch (step) {
      case 0:
        return 'Почта';
      default:
        return 'Пароль';
    }
  }

  static String getRegisterHint(int step) {
    switch (step) {
      case 0:
        return 'Электронная почта';
      case 1:
        return 'Придумайте пароль';
      default:
        return 'Ваше имя';
    }
  }

  static String getRegisterHint2(int step) {
    switch (step) {
      case 1:
        return 'Повторите пароль';
      default:
        return 'Ваша фамилия';
    }
  }

  static String getRegisterBottomButtonText(int step) {
    switch (step) {
      case 0:
        return 'У меня есть аккаунт';
      default:
        return 'Отправить повторно';
    }
  }

  static String getImage(int step) {
    switch (step) {
      case 0:
        return ImageSource.authEnter;
      case 1:
        return ImageSource.authPassword;
      case 2:
        return ImageSource.authCode;
      default:
        return ImageSource.authMeeting;
    }
  }
}
