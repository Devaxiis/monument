import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';
import 'package:monumentuz/src/presentation/ui/future/google_map_screen.dart';
import 'package:monumentuz/src/presentation/widget/outlined_back_widget.dart';
import 'package:monumentuz/src/utils/custom_widget/ui_toast.dart';

class DetailScreen extends StatefulWidget {
  final AllManumentDataDataList? item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();


  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(41.311081, 69.240562),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);

 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color045646,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedBackWidget(
                        icon: Icons.arrow_back,
                        onTab: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      OutlinedBackWidget(
                        icon: Icons.location_on_outlined,
                        onTab: () {
                          if (widget.item!.lon == '' &&
                              widget.item!.lat == '') {
                            UiToast.uiToastBottom(
                                "Manzil mavjud emas", context);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => MapSample(
                               
                                long: widget.item!.lon == ''
                                    ? 69.240562
                                    : double.parse(widget.item!.lon),
                                lat: widget.item!.lon == ''
                                    ? 41.311081
                                    : double.parse(widget.item!.lat),
                              ),
                            ));
                          }
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 420,
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${Apis.baseImgUrl}${widget.item!.attachments[0].contentURL}"),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border:
                            Border.all(width: 2, color: AppColors.color045646),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-5, 5),
                            color: AppColors.color000000.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 3,
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: context.locale == const Locale("en", "EN")
                      ? Text(
                          widget.item!.nameEng,
                          style: StyleUtil.detailNameStyle,
                        )
                      : Text(
                          widget.item!.nameUz,
                          style: StyleUtil.detailNameStyle,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.item!.buildAt,
                    style: StyleUtil.detailDateStyle,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: context.locale == const Locale("en", "EN")
                      ? Text(
                          Bidi.enforceLtrInText(widget.item!.descriptionEng),
                          style: StyleUtil.detailDescStyle,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          Bidi.enforceLtrInText(widget.item!.descriptionUz),
                          style: StyleUtil.detailDescStyle,
                          textAlign: TextAlign.center,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
