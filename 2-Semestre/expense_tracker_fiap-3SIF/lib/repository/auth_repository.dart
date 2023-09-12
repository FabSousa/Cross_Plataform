class AuthRepository {
  Future<bool> login(String email, String senha) async {
    await Future.delayed(Duration(seconds: 2));

    if (email.toLowerCase() != 'email@email.com' ||
        senha.toLowerCase() != '123456') {
      return false;
    }

    return true;
  }

  Future<bool> registrar(String email, String senha) async {
    await Future.delayed(Duration(seconds: 2));

    if (email.toLowerCase() == "email@email.com") {
      return false;
    }

    return true;
  }
}
