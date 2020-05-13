import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  final qrCodeData;

  QrCode({this.qrCodeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: qrCode(qrCodeData, context)
    );
  }

  Widget qrCode(String qrCodeData, BuildContext context){
    return Container(
      color: Color.fromRGBO(198, 198, 198, 0.1),
      child: 
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            QrImage(
              data: qrCodeData,
              version: QrVersions.auto,
              size: 200.0,
            )
            ,
            Text(qrCodeData)
          ]
        )
      )
    );
  }
}
