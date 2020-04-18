class GeneralFundsModel{
  final String projectPic;
  final String usrImgUrl;
  final dynamic projectAmount;
  final String name;
  final String projectName;
  final String documentId;

  GeneralFundsModel.fromData(Map<String, dynamic> data, String documentId)
    :  projectPic = data["projectPic"],
       usrImgUrl = data["usrImgUrl"],
       projectAmount = data["projectAmount"],
       name = data["name"],
       documentId = documentId,
       projectName = data["projectName"];
}