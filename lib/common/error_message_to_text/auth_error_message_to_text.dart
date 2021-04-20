String errorMessageToText(String e){
  switch (e) {
    case kInvalidPassword:
      return 'パスワードが違います。';
    case kInvalidUserAddress:
      return 'そのユーザーは存在しないか、メールアドレスが間違っています。';
    case kEmailSyntaxError:
      return 'メールアドレスが正しくありません。';
    case kManySignInError:
      return '多くのサインイン失敗により、アカウントがロックされました。しばらくしてからまたお試しください。';
    default :
      return '通信エラーです。';
  }
}

const String kInvalidPassword =
    '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.';
const String kInvalidUserAddress =
    '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.';
const String kEmailSyntaxError =
    '[firebase_auth/invalid-email] The email address is badly formatted.';
const String kManySignInError =
    '[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.';