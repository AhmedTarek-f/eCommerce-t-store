import 'package:get/get.dart';

/// Custom exception class to handle various Firebase authentication-related errors.
class TFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.'.tr;
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.'.tr;
      case 'network-request-failed':
        return 'There is a network problem, Please check your network connection and try again.'.tr;
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.'.tr;
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.'.tr;
      case 'user-not-found':
        return 'Invalid login details. User not found.'.tr;
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.'.tr;
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.'.tr;
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.'.tr;
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.'.tr;
      case 'provider-already-linked':
        return 'The account is already linked with another provider.'.tr;
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.'.tr;
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.'.tr;
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.'.tr;
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.'.tr;
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.'.tr;
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.'.tr;
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.'.tr;
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.'.tr;
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.'.tr;
      case 'wrong-password':
        return 'The password is invalid. Please check your password and try again.'.tr;
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.'.tr;
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.'.tr;
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.'.tr;
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.'.tr;
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.'.tr;
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.'.tr;
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.'.tr;
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification link.'.tr;
      case 'missing-app-credential':
        return 'The app credential is missing. Please provide valid app credentials.'.tr;
      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.'.tr;
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.'.tr;
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.'.tr;
      case 'invalid-cordova-configuration':
        return 'The provided Cordova configuration is invalid.'.tr;
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.'.tr;
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.'.tr;
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.'.tr;
      case 'invalid-credential':
        return 'The supplied credential is invalid. Please check the credential and try again.'.tr;
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.'.tr;
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.'.tr;
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.'.tr;
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.'.tr;
      default:
        return 'An unexpected authentication error occurred. Please try again.'.tr;
    }
  }
}
