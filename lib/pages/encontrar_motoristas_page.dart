import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/models/pessoa_models.dart';
import 'package:truckerfinder/utils/location_util.dart';

import '../components/app_drawer.dart';
import '../provider/google_maps_provider.dart';
import '../provider/pessoas_provider.dart';

class EncontrarMotoristasPage extends StatefulWidget {
  const EncontrarMotoristasPage({Key? key}) : super(key: key);

  @override
  State<EncontrarMotoristasPage> createState() =>
      _EncontrarMotoristasPageState();
}

class _EncontrarMotoristasPageState extends State<EncontrarMotoristasPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    Provider.of<PessoaProvider>(context, listen: false).fetchAllMotoristas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Pessoa> motoristas =
        Provider.of<PessoaProvider>(context).allMotoristas;
    Pessoa pessoaSelected =
        ModalRoute.of(context)?.settings.arguments as Pessoa;
    final markers = <Marker>{};

    motoristas.forEach((motorista) => {
          markers.add(Marker(
            markerId: MarkerId(motorista.id as String),
            position: LatLng(
              motorista.location.latitude,
              motorista.location.longitude,
            ),
            infoWindow: InfoWindow(title: motorista.nome),
            onTap: (() {}),
          ))
        });

    return Scaffold(
      drawer: AppDrawer(pessoaSelected: pessoaSelected),
      appBar: AppBar(
        title: const Text('Encontrar Motoristas'),
      ),
      body: GoogleMap(
        buildingsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(pessoaSelected.location.latitude,
              pessoaSelected.location.longitude),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: markers,
      ),
    );
  }
}
