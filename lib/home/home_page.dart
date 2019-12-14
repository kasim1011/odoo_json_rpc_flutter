import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:odoo_json_rpc_flutter/callback/odoo_callback.dart';
import 'package:odoo_json_rpc_flutter/config/config.dart';
import 'package:odoo_json_rpc_flutter/config/dio_factory.dart';
import 'package:odoo_json_rpc_flutter/entities/web.session.authenticate/authenticate_response.dart';
import 'package:odoo_json_rpc_flutter/odoo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var response = 'Response will display here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text(
                'Post Request',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                _authenticate();
              },
            ),
          ),
          Text(response)
        ],
      ),
    );
  }

  void _authenticate() async {
    final OnError onError = (final DioError error) {
      print(error.toString());
      if (error.type != DioErrorType.RESPONSE &&
          error.type != DioErrorType.CANCEL) {
        setState(() {
          this.response = 'Server unreachable';
        });
      } else {
        setState(() {
          this.response = error.message;
        });
      }
    };

    final OnResponse<AuthenticateResponse> onResponse =
        (final AuthenticateResponse response) {
      if (!response.isSuccessful) {
        print('${response.errorMessage}');
        setState(() {
          this.response = response.errorMessage;
        });
        return;
      }
      setState(() {
        this.response = 'authenticated';
      });
      _searchRead();
    };

    await Odoo.authenticate(
      login: Config.Email,
      password: Config.Password,
      db: Config.Database,
      onError: onError,
      onResponse: onResponse,
    );
  }

  void _searchRead() async {
    try {
      final data = {
        'jsonrpc': '2.0',
        'method': 'call',
        'id': 2,
        'params': {
          'model': 'res.partner',
          'fields': ['id', 'name', 'email'],
          'domain': [
            ['customer', '=', true]
          ],
          'offset': 0,
          'limit': 10,
          'sort': 'name ASC'
        }
      };
      final response = await DioFactory.dio
          .post<Map<String, dynamic>>('web/dataset/search_read', data: data);
      if (response.statusCode == 200) {
        debugPrint('search_read response is ${response.data}', wrapWidth: 1024);
        setState(() {
          this.response = 'Search Read: ${response.data}';
        });
      } else {
        print(
            'response failed with ${response.statusCode}:${response.statusMessage}');
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }
}
