import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/icon_title_buttton.dart';
import 'package:my_texi/view/home/trip_request.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {
                        context.push(const TripRequest());
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  )
                                ]),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "GO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Image.asset(
                        "assets/img/current_location.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          icon: Image.asset(
                            isOpen
                                ? "assets/img/open_btn.png"
                                : "assets/img/close_btn.png",
                            width: 15,
                            height: 15,
                          ),
                        ),
                        Text(
                          "You're offline",
                          style: TextStyle(
                            color: TColor.primarytext,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    if (isOpen)
                      Container(
                        height: 0.5,
                        width: double.maxFinite,
                        color: TColor.placeholder.withOpacity(0.5),
                      ),
                    if (isOpen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: IconTitleButtton(
                                title: "90.0%",
                                subtitle: "Acceptance",
                                icon: "assets/img/acceptance.png",
                                onpress: () {}),
                          ),
                          Container(
                            height: 100,
                            width: 0.5,
                            color: TColor.placeholder.withOpacity(0.5),
                          ),
                          Expanded(
                            child: IconTitleButtton(
                                title: "4.75%",
                                subtitle: "Rating",
                                icon: "assets/img/rate.png",
                                onpress: () {}),
                          ),
                          Container(
                            height: 100,
                            width: 0.5,
                            color: TColor.placeholder.withOpacity(0.5),
                          ),
                          Expanded(
                            child: IconTitleButtton(
                                title: "2.0%",
                                subtitle: "Cancelleation",
                                icon: "assets/img/cancelleation.png",
                                onpress: () {}),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 60,
                    ),
                    Container(
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
                          Text(
                            "\$",
                            style: TextStyle(
                              color: TColor.secondarytext,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "155",
                            style: TextStyle(
                              color: TColor.primarytext,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/img/u1.png",width: 40,height: 40,),),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            constraints: const BoxConstraints(minWidth: 15),
                            child: const Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
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
