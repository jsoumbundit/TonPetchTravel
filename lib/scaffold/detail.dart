import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    print('lat: ${myTravelModel.lat}');
    createArrayList();
  }

  Widget headTitle(String string) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Text(
        string,
        style: MyStyle().h3Text,
      ),
    );
  }

  Widget showAddress() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Text(myTravelModel.address),
    );
  }

  Set<Marker> mySetMarker() {
    double lat = myTravelModel.lat;
    double lng = myTravelModel.lng;

    LatLng latLng = LatLng(lat, lng);

    return <Marker>[
      Marker(
        position: latLng,
        markerId: MarkerId('MyIdMarker'),
      )
    ].toSet();
  }

  Widget showMap() {
    double lat = myTravelModel.lat;
    double lng = myTravelModel.lng;

    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );

    return Container(
      padding: EdgeInsets.only(top: 20.0,bottom: 20.0, left: 20.0, right: 20.0),
      width: 300.0,
      height: 200.0,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController googleMapController) {},
        markers: mySetMarker(),
      ),
    );
  }

  Widget showMapLatLng() {
    if (myTravelModel.lat == null) {
      return SizedBox();
    } else {
      return showMap();
    }
  }

  Widget showMapTitle() {
    if (myTravelModel.lat == null) {
      return SizedBox();
    } else {
      return headTitle('Map location');
    }
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
            padding: EdgeInsets.only(right: 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width*0.56,
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
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 20.0,bottom: 10.0),
      child: Text(
        myTravelModel.name,
        style: MyStyle().h2Text,
      ),
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
            children: <Widget>[
              headTitle('Detail'),
              showTextDetail(),
              showMapTitle(),
              showMapLatLng(),
              headTitle('Address:'),
              showAddress()
            ],
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
