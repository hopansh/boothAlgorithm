import 'package:boothAlgorithm/screens/about.dart';
import 'package:boothAlgorithm/screens/solution.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

class MyHome extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-9302800870253054~6193003212" ).then((response){
       myBanner..load()..show();
       });

   final appBar = AppBar(
      title: Text("Booth Algorithm"),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(icon:Icon(Icons.info),onPressed: (){
          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                         About()),
                                );
        },)
      ],
    );
    final height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    int mval, qval;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
                height: height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 8),
                color: Color(0xff262626),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: width - 36,
                          child: Text(
                            "Multiplier(Q)",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Enter in Decimal',
                          hoverColor: Colors.white,
                          fillColor: Colors.white10,
                          focusColor: Colors.white10,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter a value";
                          }
                        },
                        onSaved: (value) {
                          qval = int.parse(value);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: width - 36,
                          child: Text(
                            "Multiplicand(M)",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      TextFormField(
                        onSaved: (value) {
                          mval = int.parse(value);
                        },
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter in Decimal',
                          hoverColor: Colors.white,
                          fillColor: Colors.white70,
                          focusColor: Colors.white70,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter a value";
                          }
                        },
                      ),
                      Center(
                          heightFactor: 1.3,
                          child: FloatingActionButton.extended(
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Solution(height, qval, mval)),
                                );
                              },
                              backgroundColor: Colors.black,
                              label: Text("Multiply",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  
}
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['Maths', 'calculator','booth','boothalgorithm'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  adUnitId: "ca-app-pub-9302800870253054/1036933357",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);