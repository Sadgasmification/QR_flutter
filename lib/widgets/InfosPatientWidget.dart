import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfosPatient extends StatelessWidget {
  final qrCodeData;

  InfosPatient({this.qrCodeData});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => ListView(children: <Widget>[
          Center(
              child: QrImage(
              data: qrCodeData,
              version: QrVersions.auto,
              size: 200.0,
            )),
          SizedBox(height: 20),
          Center(
              child: Text(qrCodeData)
            ),
        ]
        )
      )
    );
  }
}
