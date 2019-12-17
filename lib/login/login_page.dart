import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _hostKey = GlobalKey<FormState>();
  final _hostFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Builder(
          builder: (BuildContext context) {
            return Form(
              key: _hostKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                  ),
                  Image.asset(
                    'assets/launch_image.png',
                    scale: 1.25,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    focusNode: _hostFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Host',
                      hintText: 'e.g. www.odoo.com',
                    ),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please, type host URL';
                      }
                      if (!(value.startsWith('http://') ||
                          value.startsWith('https://'))) {
                        value = 'https://$value';
                      }
                      final validHostUrlMsg = 'Please, type valid host URL';
                      final ipPattern =
                          r'https?:\/\/[0-9]+(?:\.[0-9]+){3}(:[0-9]+)?';
                      final urlPattern =
                          r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)';

                      final ipMatch = RegExp(ipPattern).stringMatch(value);
                      final urlMatch = RegExp(urlPattern).stringMatch(value);
                      if (!kReleaseMode) {
                        print('ipMatch is $ipMatch');
                        print('urlMatch is $urlMatch');
                        print('value is $value');
                      }
                      if (ipMatch == null && urlMatch == null) {
                        return validHostUrlMsg;
                      }
                      if (ipMatch != null) {
                        if (ipMatch != value) {
                          return validHostUrlMsg;
                        }
                      } else if (urlMatch != null) {
                        if (urlMatch != value) {
                          return validHostUrlMsg;
                        }
                      }
                      return null;
                    },
                    onSaved: (String value) {

                    },
                  ),
                  RaisedButton(
                    child: Text('Connect to Server'),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_hostKey.currentState.validate()) {
                        // Process data.

                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showMsg(
      BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
