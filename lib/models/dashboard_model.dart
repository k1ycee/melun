class DashModel{
  final String imgUrl;
  final String usrImgUrl;
  final int amt;
  final String name;
  final String projectName;
  final String days;

  DashModel({this.imgUrl, this.usrImgUrl, this.amt, this.name, this.days, this.projectName});


  DashModel.fromData(Map<String, dynamic> data)
    :  imgUrl = data["imgUrl"],
       usrImgUrl = data["usrImgUrl"],
       amt = data["amt"],
       name = data["name"],
       days = data["days"],
       projectName = data["projectName"];

  Map<String, dynamic> toJson(){
    return {
      'imgUrl': imgUrl,
      'usrImgUrl': usrImgUrl,
      'amt': amt,
      'name': name,
      'days': days,
      'projectName': projectName
    };
  }
}