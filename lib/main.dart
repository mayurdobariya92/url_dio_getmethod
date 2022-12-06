import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_dio_getmethod/newapi.dart';

import 'apinew.dart';

void main()
{
  runApp(MaterialApp(home: apinew(),));
}
class diogetmethod extends StatefulWidget {
  const diogetmethod({Key? key}) : super(key: key);

  @override
  State<diogetmethod> createState() => _diogetmethodState();
}

class _diogetmethodState extends State<diogetmethod> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get() async {
    try {
      var response = await Dio().get('https://reqres.in/api/unknown');

      Map m =response.data;

      print(m['page']);
      print(m['per_page']);
      print(m['total']);
      print(m['total_pages']);

      List list=m['data'];
      list.forEach((element) {
        print(element['id']);
        print(element['name']);
        print(element['year']);
        print(element['color']);
        print(element['pantone_value']);

        Map m1=m['support'];
        print(m1['url']);
        print(m1['text']);
      });
      print(m);


    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
