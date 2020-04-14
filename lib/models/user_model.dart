


class User{
  final String id;
  final String fullname;
  final String userImage;
  final String password;
  final String email;

  User({this.userImage,this.id, this.fullname,this.email,this.password});
    User.fromData(Map<String,dynamic> data)
    :   id = data["id"],
        fullname = data["fullname"],
        email = data["email"],
        password = data["password"],
        userImage = data["userImage"];



  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fullname':fullname,
      'userImage': userImage,
      'email': email,
      'password': password
    };
  }
}