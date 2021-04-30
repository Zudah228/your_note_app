String errorMessageToText(String e) {
  switch (e) {
    case kPasswordTooShort:
      return 'パスワードは最低6文字必要です。';
    case kEmailAlreadyInUse:
      return 'そのユーザーはすでに存在しています。';
    case kInvalidPassword:
      return 'そのユーザーは存在しないか、パスワードが違います。';
    case kInvalidUserAddress:
      return 'そのユーザーは存在しないか、メールアドレスが間違っています。';
    case kEmailSyntaxError:
      return 'メールアドレスの形式が正しくありません。';
    case kManySignInError:
      return '多くのサインイン失敗により、アカウントがロックされました。しばらくしてからまたお試しください。';
    case kManyRequestFromSameDevice:
      return '同じデバイスから過剰なリクエストがあったのでブロックされました。しばらくしてからまたお試しください。';
    default:
      // TODO(me): 問い合わせフォームを作成したら、文言を変更。
      return '通信エラーです。通信環境を改善してください。';
  }
}

// CreateAccountのエラー
const String kPasswordTooShort =
    '[firebase_auth/weak-password] Password should be at least 6 characters';
const String kEmailAlreadyInUse =
    '[firebase_auth/email-already-in-use] The email address is already in use by another account.';

// SignInのエラー
const String kInvalidPassword =
    '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.';
const String kInvalidUserAddress =
    '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.';
const String kEmailSyntaxError =
    '[firebase_auth/invalid-email] The email address is badly formatted.';
const String kManySignInError =
    '[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.';
const String kManyRequestFromSameDevice =
    '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.';
