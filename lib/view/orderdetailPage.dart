import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/serviceorderController.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'homePage.dart';

class OrderDetailsPage extends StatelessWidget {
  final ServiceOrderController controller;

  const OrderDetailsPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Ordem de Serviço'),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.off(HomePage());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cliente: ${controller.selectedClient.value}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Text('Dispositivo: ${controller.selectedDevice.value}', style: TextStyle(fontSize: 22),),
            Text('Peças: ${controller.selectedParts.join(', ')}', style: TextStyle(fontSize: 22),),
            Text('Serviços: ${controller.selectedServices.join(', ')}', style: TextStyle(fontSize: 22),),
            Text('Funcionário: ${controller.selectedEmployee.value}', style: TextStyle(fontSize: 22),),
            Text('Descrição: ${controller.descriptionController.text}', style: TextStyle(fontSize: 22),),
            Text('Preço: R\$ ${controller.priceController.text}', style: TextStyle(fontSize: 22),),
            const SizedBox(height: 20),
            Center(
              child: QrImageView(
                data: 'Ordem de Serviço: ${controller.selectedClient.value} - ${controller.selectedDevice.value} - ${controller.selectedParts.join(', ')} - ${controller.selectedServices.join(', ')} - R\$ ${controller.priceController.text}',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
