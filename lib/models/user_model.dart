class User{
  final String fullname;
  final String imgUrl;
  final String imgFilename;
  final String id;

  User({this.fullname, this.imgUrl, this.id, this.imgFilename});


  User.fromData(Map<String, dynamic> data)
    :  fullname = data["fullname"],
       id = data["id"],
       imgFilename = data["imgFilename"],
       imgUrl = data["imgUrl"];


  Map<String, dynamic> toJson(){
    return {
      'fullname': fullname,
      'id': id,
      'imgUrl' : imgUrl,
      'imgFileName': imgFilename
    };
  }
}