import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class newapi extends StatefulWidget {
  const newapi({Key? key}) : super(key: key);

  @override
  State<newapi> createState() => _newapiState();
}

class _newapiState extends State<newapi> {

Map<String, dynamic>? m;

myclass? mycl;

bool getdata=false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();

  }

  get() async {

         try {
        var response = await Dio().get('https://reqres.in/api/unknown');
        print(response);
        m=response.data;
        mycl=myclass.fromJson(m!);
        setState(() {
          getdata=true;
        });
      } catch (e) {
        print(e);
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getdata?Column(
        children: [
          Text("${mycl!.page}"),
          Text("${mycl!.perPage}"),
          Text("${mycl!.total}"),
          Text("${mycl!.totalPages}"),
          Text("${mycl!.support!.url}"),
          Text("${mycl!.support!.text}"),
      ],
    ):Text(""),
    );
  }
}

class myclass {
int? page;
int? perPage;
int? total;
int? totalPages;
List<Data>? data;
Support? support;

myclass(
    {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

myclass.fromJson(Map<String, dynamic> json) {
page = json['page'];
perPage = json['per_page'];
total = json['total'];
totalPages = json['total_pages'];
if (json['data'] != null) {
data = <Data>[];
json['data'].forEach((v) {
data!.add(new Data.fromJson(v));
});
}
support =
json['support'] != null ? new Support.fromJson(json['support']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['page'] = this.page;
  data['per_page'] = this.perPage;
  data['total'] = this.total;
  data['total_pages'] = this.totalPages;
  if (this.data != null) {
    data['data'] = this.data!.map((v) => v.toJson()).toList();
  }
  if (this.support != null) {
    data['support'] = this.support!.toJson();
  }
  return data;
}
}

class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['color'] = this.color;
    data['pantone_value'] = this.pantoneValue;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
