class FundsModel{
  final String projectName;
  final String days;
  final int amount;
  final String id;

FundsModel({this.projectName, this.days, this.amount,this.id});

FundsModel.fromData(Map<String,dynamic> data) 
:    projectName = data["projectName"],
      days = data["days"],
      amount = data["amount"],
      id = data["id"];

Map<String,dynamic> toJson(){
  return {
    'projectName': projectName,
    'days': days,
    'amount': amount,
    'id': id
  };
}
}