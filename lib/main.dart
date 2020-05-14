import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'widgets/InfosPatientWidget.dart';

/* Theme de l'application */
final appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromRGBO(34, 189, 200, 1),
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0),
    title: TextStyle(fontSize: 36.0),
    body1: TextStyle(fontSize: 18.0),
    body2: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
    display1: TextStyle(fontSize: 24, fontFamily: 'Varela', color: Color.fromRGBO(34, 189, 200, 1)),
  ),
);

/* Lancement de l'application */
void main() => runApp(MyApp());

class MyApp extends StatefulWidget  {
 @override
  ApplicationWidgetPrincipal createState() => new ApplicationWidgetPrincipal();
}

class ApplicationWidgetPrincipal extends State<MyApp> {
  String userId;

  final messagesBadge = Icon(Icons.notifications);

  @override
  void initState() {
    super.initState();
    initOneSignal();
  }

  Future<void> initOneSignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    });

    OneSignal.shared
    .setInAppMessageClickedHandler((OSInAppMessageAction action) {
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
          //DEBUG : Affiche l'état de souscription aux notifications
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared
    .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      print("In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    await OneSignal.shared
        .init("f7d2cc16-39b0-415c-b53b-76eef4acccbb", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    var status = await OneSignal.shared.getPermissionSubscriptionState();
    this.setState(() {
      userId = status.subscriptionStatus.userId;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[messagesBadge],
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.fingerprint))
                    ],
                  ),
                  title: Text('QR Code POC'),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    (userId != null) ? InfosPatient(qrCodeData: userId) : InfosPatient(qrCodeData: "")
                  ],
                ),
              ),
            ),
            theme: appTheme));
  }
}
