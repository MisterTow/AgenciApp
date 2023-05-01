import 'package:agencia/models/vivienda.dart';
import 'package:agencia/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(splash());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? _controller;
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);
  List<Marker> allMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Viviendas.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.direccion),
          draggable: false,
          infoWindow: InfoWindow(
              title: element.direccion, snippet: element.descripcion),
          position: element.ubicacion));
    });
  }

  _viviendasList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
              height: Curves.easeInOut.transform(value) * 125.0,
              width: Curves.easeInOut.transform(value) * 350.0,
              child: widget),
        );
      },
      child: InkWell(
        onTap: () {
          moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0)
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(children: [
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(Viviendas[index].imagen),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Viviendas[index].direccion,
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 170.0,
                          child: Text(
                            Viviendas[index].descripcion,
                            style: TextStyle(
                                fontSize: 11.0, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          Viviendas[index].precio,
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 50.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(18.461120, -69.965047), zoom: 15.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Positioned(
            bottom: 20.0,
            child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: Viviendas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _viviendasList(index);
                  },
                )))
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Viviendas[_pageController.page!.round()].ubicacion,
        zoom: 18.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
