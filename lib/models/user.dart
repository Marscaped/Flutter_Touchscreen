class User {
  int id;
  String email;
  String password;
  String permissions;

  User(this.id, this.email, this.password, this.permissions);

  static User? currentUser;

  static void loginUser(User newUser) {
    currentUser = newUser;
  }

  static void logoutUser(User newUser) {
    currentUser = null;
  }
}
