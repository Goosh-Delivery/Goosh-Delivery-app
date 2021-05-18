class User {
  final int userId;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String password;
  final String profilePicture;

  User(this.userId, this.username, this.email, this.phone, this.address,
      this.password, this.profilePicture);

  static User fetchUserById(int userId) {
    return User(1, "michael belete", "mike@mike.com", "09600021406",
        "Addis Ababa", "*****", "assets/images/profile.jpg");
  }
}
