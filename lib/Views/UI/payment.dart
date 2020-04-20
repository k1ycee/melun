import 'package:flutter/material.dart';
import 'package:flutter_rave/flutter_rave.dart';

  class Pay extends StatefulWidget {
    @override
    _PayState createState() => _PayState();
  }
  
  class _PayState extends State<Pay> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          child: Column(
            children: <Widget>[
              Text('Please Note that this is a live payment\n option if you make any payments you will be debitted \n\nNGN 10000', style: TextStyle(color: Colors.blue[500], fontSize: 25, fontWeight: FontWeight.w200,)),
              SizedBox(height: 120,),
              Builder(
                builder: (context) => GestureDetector( 
                  onTap: () => _pay(context),  
                  child: InkWell(
                    child: AnimatedContainer(
                      height: 40,
                      width: 45,
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                    horizontal:  10,
                    vertical: 10),
                    decoration: BoxDecoration(
                  color:  Colors.blue[400],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Pay'),
                    ),
                  )
                  )
                  ),
            ],
          ),
        ),
          ),
      );
    }
  _pay(BuildContext context){
  final snackBaronFailure = SnackBar(content: Text('Transaction Failed :('), backgroundColor: Colors.red,);
  final snackBaronClosed = SnackBar(content: Text('Transaction Closed !'), backgroundColor: Colors.amber,);
  final _rave = RaveCardPayment(
    isDemo: false,
    encKey:"75bbce79a9ac2fd0c035865e",
    publicKey: "FLWPUBK-1bb46cacbb720bb232c0d36ff0af566b-X",
    transactionRef: "hvHPvKYaRuJLlJWSPWGGKUyaAfWeZKnm",
    amount: 10000,
    email: 'chiagozieani145@gmail.com',
    onSuccess: (response){
      print('$response');
      print('Transaction Successful');
      if (mounted){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Transaction Successful'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
        );
      }
    },
    onFailure: (err){
      print('$err');
      print('Transaction Failed');
      Scaffold.of(context).showSnackBar(snackBaronFailure);
    },
    onClosed: (){
      print('Transaction Closed!');
      Scaffold.of(context).showSnackBar(snackBaronClosed);
    },
    context: context,
  );
  _rave.process();
}
}