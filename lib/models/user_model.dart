class User{
  final String fullname;
  final String imgUrl;
  final String id;

  User({this.fullname, this.imgUrl, this.id});


  User.fromData(Map<String, dynamic> data)
    :  fullname = data["fullname"],
       id = data["id"],
       imgUrl = data["imgUrl"];


  Map<String, dynamic> toJson(){
    return {
      'fullname': fullname,
      'id': id,
      'imgUrl' : imgUrl
    };
  }
}