class FundsModel{
  final String projectName;
  final String days;
  final int amount;
  final String id;
  final String imgUrl;

FundsModel({this.projectName, this.days, this.amount,this.id,this.imgUrl});

FundsModel.fromData(Map<String,dynamic> data) 
:    projectName = data["projectName"],
      days = data["days"],
      amount = data["amount"],
      imgUrl = data["imgUrl"],
      id = data["id"];

Map<String,dynamic> toJson(){
  return {
    'projectName': projectName,
    'days': days,
    'amount': amount,
    'id': id,
    'imgUrl': imgUrl
  };
 }
}