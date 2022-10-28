import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/models/pessoa_models.dart';

import '../components/app_drawer.dart';
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
            markerId: MarkerId(motorista.id ?? ''),
            position: LatLng(
              motorista.location.latitude,
              motorista.location.longitude,
            ),
            onTap: () => {
              showDialog(
                context: context,
                // ignore: prefer_const_constructors
                builder: (ctx) => AlertDialog(
                  title: const Text('Informações'),
                  actions: [
                    TextButton(
                      onPressed: () => {},
                      child: const Text('Avaliar'),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text('Mensagem'),
                    )
                  ],
                  content: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Text('Nome: ${motorista.nome}'),
                        const Divider(),
                        Text('CPF: ${motorista.cpfcnpj}'),
                        const Divider(),
                        Text('Cep: ${motorista.cep}'),
                        const Divider(),
                        Text('Telefone: ${motorista.telefone}'),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              )
            },
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
          zoom: 10,
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
