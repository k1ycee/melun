class UserFundsModel{
  final String projectPic;
  final String usrImgUrl;
  final dynamic projectAmount;
  final String name;
  final String projectName;
  final String documentId;

  UserFundsModel({this.projectPic, this.usrImgUrl, this.projectAmount, this.name, this.projectName, this.documentId});

  UserFundsModel.fromData(Map<String, dynamic> data, String documentId)
    :  projectPic = data["projectPic"],
       usrImgUrl = data["usrImgUrl"],
       projectAmount = data["projectAmount"],
       name = data["name"],
       documentId = documentId,
       projectName = data["projectName"];


  Map<String, dynamic> toJson(){
    return {
      'projectPic': projectPic,
      'usrImgUrl': usrImgUrl,
      'projectAmount': projectAmount,
      'name': name,
      'projectName': projectName
    };
  }
}