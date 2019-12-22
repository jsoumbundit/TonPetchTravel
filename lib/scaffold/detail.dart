import 'package:flutter/material.dart';
import 'package:tonpetchtravel/models/travel_model.dart';
import 'package:tonpetchtravel/utility/my_style.dart';

class Detail extends StatefulWidget {
  final TravalModel travalModel;
  Detail({Key key, this.travalModel}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
// Field
  TravalModel myTravelModel;
  List<String> urlPaths = List();

// Method
  @override
  void initState() {
    super.initState();
    myTravelModel = widget.travalModel;
    createArrayList();
  }

  Widget showTextDetail() {
    return Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Text(
          myTravelModel.detail.replaceAll('*', '\n'),
        ));
  }

  void createArrayList() {
    String path = myTravelModel.path;
    if (path.length != 0) {
      setState(() {
        urlPaths.add(path);
      });
    }

    String path2 = myTravelModel.path2;
    if (path2.length != 0) {
      setState(() {
        urlPaths.add(path2);
      });
    }

    String path3 = myTravelModel.path3;
    if (path3.length != 0) {
      setState(() {
        urlPaths.add(path3);
      });
    }

    String path4 = myTravelModel.path4;
    if (path4.length != 0) {
      setState(() {
        urlPaths.add(path4);
      });
    }

    String path5 = myTravelModel.path5;
    if (path5.length != 0) {
      setState(() {
        urlPaths.add(path5);
      });
    }

    String path6 = myTravelModel.path6;
    if (path6.length != 0) {
      setState(() {
        urlPaths.add(path6);
      });
    }
  }

  Widget showImage() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: urlPaths.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return Container(
            width: 300.0,
            height: 200.0,
            child: Image.network(
              urlPaths[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  Widget header() {
    return Text(
      myTravelModel.name,
      style: MyStyle().h2Text,
    );
  }

  Widget showListDetail() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        header(),
        showImage(),
        Expanded(
          child: ListView(
            children: <Widget>[showTextDetail()],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: showListDetail(),
    );
  }
}
