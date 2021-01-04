import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:dio/dio.dart';
import 'package:odoo_api/odoo_api_connector.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:http/http.dart' as http;

class VDMNetwork{
  BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://cors-anywhere.herokuapp.com/vmi461243.contaboserver.net:8069/',
      responseType: ResponseType.plain,
      receiveDataWhenStatusError: true,
      connectTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000 // 60 seconds
      // validateStatus: (code) {
      //   if (code >= 200) {
      //     return true;
      //   }
      //   return false;
      // }
      );

    var dio = Dio();



  postRequest() async {
    // Restore session ID from storage and pass it to client constructor.
    // final baseUrl = 'http://vmi461243.contaboserver.net:8069/';
    // Subscribe to session changes to store most recent one
    dio.options = baseOptions;
    final authURL = "web/session/authenticate/";
    var body = {"jsonrpc": "2.0",
      "params": {
        "login": "vdmanager@eomedical.com",
        "password": "eomedical",
        "db": "vdmtest"
      }
    };
    var auth = await dio.post(authURL, data: body, options: Options(headers: {'Content-Type': 'application/json'},));
    var response = json.decode(auth.data);
    var session_id = response["result"]["session_id"];
    print(response);

    final dataURL = "/web/dataset/search_read";
    body = {
      "jsonrpc": "2.0",
      "method": "call",
      "params": {
        "model": "eo.vdm.patient",
        "fields": [
          "name",
          "physician_id",
          "birth_date",
          "age",
          "phone",
          "count_appointment_ids",
          "count_dossier_item_ids"
        ],
        "domain": [],
        "context": {
          "lang": "en_US",
          "tz": "Europe/Bucharest",
          "uid": 48,
          "params": {"action": 115},
          "bin_size": true
        },
        "offset": 0,
        "limit": 80,
        "sort": ""
      },
      "id": 201088730
    };
    var data = await dio.post(
        dataURL,
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Content-Length' : 337,
            'Cookie': 'session_id= + $session_id',
            'Connection' : 'keep-alive',
            },

        )
    );
    print(data.data);
    return data.data;
  }

  postTry() async {
    var headers = {
      'Cookie': 'session_id=f004addb85b41d88751580a7a2a625a433f53bc2;',
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin" : "*",
      'Content-Length' : '274'
    };
    var request = http.Request('POST', Uri.parse('https://vmi461243.contaboserver.net:8069/web/dataset/search_read'));
    request.body = '''{"jsonrpc":"2.0","method":"call","params":{"model":"eo.vdm.patient","fields":["name","physician_id","birth_date","age","phone","count_appointment_ids","count_dossier_item_ids"],"domain":[],"context":{"lang":"en_US","tz":"Europe/Bucharest","uid":48,"params":{"action":115},"bin_size":true},"offset":0,"limit":80,"sort":""},"id":201088730}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }

}