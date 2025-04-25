import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:my_texi/common/color_extension.dart';

class TripRequest extends StatefulWidget {
  const TripRequest({super.key});

  @override
  State<TripRequest> createState() => _TripRequestState();
}

class _TripRequestState extends State<TripRequest> {
  bool isOpen = true;

  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
              userTrackingOption: UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
              ),
              roadConfiguration: const RoadOption(
                roadColor: Colors.yellowAccent,
              ),
              // markerOption: MarkerOption(
              //     defaultMarker: MarkerIcon(
              //       icon: Icon(
              //         Icons.person_pin_circle,
              //         color: Colors.blue,
              //         size: 56,
              //       ),
              //     ),
              // ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          "25 min",
                          style: TextStyle(
                            color: TColor.primarytext,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "\$12.50",
                          style: TextStyle(
                            color: TColor.secondarytext,
                            fontSize: 19,

                          ),
                        ),
                        Text(
                          "4.5KM",
                          style: TextStyle(
                            color: TColor.secondarytext,
                            fontSize: 19,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/img/rate_tip.png",width: 15,height: 15,),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "3.5",
                                style: TextStyle(
                                  color: TColor.secondarytext,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 25),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, -5),
                                  )
                                ]),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/img/close.png",width: 25,height: 25,),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "No Thanks",
                                  style: TextStyle(
                                    color: TColor.primarytext,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
