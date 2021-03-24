import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class VDMNetwork{
  String CORS = "https://cors-anywhere.herokuapp.com/";
  BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://vmi461243.contaboserver.net:8069/',
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

  BaseOptions baseOptionsERP = BaseOptions(
      baseUrl: 'https://cors-anywhere.herokuapp.com/erp-test.elastoffice.net:8245/',
      responseType: ResponseType.plain,
      receiveDataWhenStatusError: true,
      connectTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000 // 60 seconds
  );
    var dio = Dio();






  vdmTest() async {
    var headers = {
      'Host': ' vmi461243.contaboserver.net',
      'Cookie': 'session_id=26bb194554a12ffd4a1cd9e6db2b8e1adb136d37'
    };
    var request = http.Request('GET', Uri.parse('https://vmi461243.contaboserver.net/api/eo.vdm.patient'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }


  }


  ERPTest() async{
    print("ERP TEST");
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'sid=8865a40a4edecbf02d60fafa040b5be932005de9'
    };
    var request = http.Request('POST', Uri.parse('https://erp-test.elastoffice.net:8245/web/dataset/search_read'));
    request.body = '''{"jsonrpc":"2.0","method":"call","params":{"model":"crm.lead","fields":["date_deadline","create_date","name","contact_name","country_id","email_from","phone","stage_id","user_id","partner_id","section_id","state","type_id","referred","channel_id","message_unread"],"domain":["|",["type","=","lead"],["type","=",false]],"context":{"lang":"ro_RO","tz":"Europe/Bucharest","uid":1,"default_type":"lead","stage_type":"lead","needaction_menu_ref":"crm.menu_crm_opportunities","bin_size":true},"offset":0,"limit":80,"sort":"","session_id":"dcac852fd6524f76b72bfa184cd7491a"},"id":"r72"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }

  fetchAppointments() async {
    dio.options = baseOptions;
      var headers = {
        'Host': ' https://cors-anywhere.herokuapp.com/vmi461243.contaboserver.net:8069',
        'Connection': ' keep-alive',
        // 'Cache-Control': ' max-age=0',
        // 'Upgrade-Insecure-Requests': ' 1',
        // 'User-Agent': ' Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36',
        // 'Accept': ' text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        // 'Accept-Encoding': ' gzip, deflate',
        // 'Accept-Language': ' hu-HU,hu;q=0.9,en-US;q=0.8,en;q=0.7',
        'Cookie': ' session_id=86f835ff7eef2f201d9a1863faf7b89e8c9824bb; session_id=a5045d56c80f9ec0b03045ea15ec4b34a0142ac0'
      };
      var x = await dio.get('/api/eo.vdm.appointment', options: Options(headers: headers,));
      print(x.data);
  }

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
    // print(response);

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
    print("Sending 2nd request!");

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
    print(data.headers);
    // return data.data;
  }

  postTry() async {
    var headers = {
      'Host': ' vmi461243.contaboserver.net:8069',
      'Connection': ' keep-alive',
      // 'Content-Length': ' 337',
      // 'Accept': ' application/json, text/javascript, */*; q=0.01',
      // 'X-Requested-With': ' XMLHttpRequest',
      // 'User-Agent': ' Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36',
      // 'Content-Type': ' application/json',
      // 'Origin': ' http://vmi461243.contaboserver.net:8069',
      // 'Referer': ' http://vmi461243.contaboserver.net:8069/web',
      // 'Accept-Encoding': ' gzip, deflate',
      // 'Accept-Language': ' hu-HU,hu;q=0.9,en-US;q=0.8,en;q=0.7',
      // 'Cookie': ' session_id=caa610f4aa8d3a083bc1dfbfbaef301468f443f1; session_id=a5045d56c80f9ec0b03045ea15ec4b34a0142ac0'
    };
    var request = http.Request('POST', Uri.parse('http://vmi461243.contaboserver.net:8069/web/dataset/search_read'));
    request.body = '''{"jsonrpc":"2.0","method":"call","params":{"model":"eo.vdm.patient","fields":["name","physician_id","birth_date","age","phone","count_appointment_ids","count_dossier_item_ids"],"domain":[],"context":{"lang":"en_US","tz":"Europe/Bucharest","uid":48,"params":{"action":115},"bin_size":true},"offset":0,"limit":80,"sort":""},"id":713557380}''';
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