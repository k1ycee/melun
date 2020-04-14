


class User{
  final String id;
  final String fullname;
  final String userImage;

  User({this.userImage,this.id, this.fullname});
    User.fromData(Map<String,dynamic> data)
    :   id = data["id"],
        fullname = data["fullname"],
        userImage = data["userImage"];



  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fullname':fullname,
      'userImage': userImage
    };
  }
}