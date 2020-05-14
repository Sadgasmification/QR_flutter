import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfosPatient extends StatelessWidget {
  final qrCodeData;

  InfosPatient({this.qrCodeData});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: 
            Center(child:     
              Builder(
              builder: (context) => ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Merci de faire scanner ce QR Code lors de votre arrivée au centre de test", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5), textAlign: TextAlign.center),
                ),
                Center(
                    child: QrImage(
                    data: qrCodeData,
                    version: QrVersions.auto,
                    size: 300.0,
                  )),
                SizedBox(height: 20),
              ]
              )
            )
          )
        ),
      ),
    );
  }
}
