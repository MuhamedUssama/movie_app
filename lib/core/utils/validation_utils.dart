import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'app_regex.dart';

class AppValidator {
  static String? validateEmailAddress({
    String? email,
    required AppLocalizations locale,
  }) {
    if (email == null || email.trim().isEmpty) {
      return locale.emptyEmailAddress;
    } else if (!AppRegex.emailRegex.hasMatch(email.trim())) {
      return locale.invalidEmailAddress;
    }
    return null;
  }

  static String? validateFieldIsNotEmpty({
    String? value,
    required String message,
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validatePassword({
    required String? password,
    required AppLocalizations locale,
  }) {
    if (password == null || password.trim().isEmpty) {
      return locale.emptyPassword;
    } else if (password.length < 6) {
      return locale.passwordTooShort;
    }
    return null;
  }

  static String? validateConfirmPassword({
    required String password,
    required String? confirmPassword,
    required AppLocalizations locale,
  }) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return locale.emptyConfirmPassword;
    }
    if (confirmPassword != password) {
      return locale.passwordsDoNotMatch;
    }
    return null;
  }
}
