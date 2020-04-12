class User{
  final String id;
  final String fullname;

  User({this.id, this.fullname});
    User.fromData(Map<String,dynamic> data)
    :   id = data["id"],
        fullname = data["fullname"];

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fullname':fullname,
    };
  }
}