import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/serviceorderController.dart';
import 'orderdetailPage.dart';

class ServiceOrder extends StatelessWidget {
  final ServiceOrderController controller = Get.put(ServiceOrderController());

  ServiceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text(
          'Ordem de Serviço',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Obx(() {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Selecionar Cliente',
                  border: OutlineInputBorder(),
                ),
                value: controller.selectedClient.value.isEmpty
                    ? null
                    : controller.selectedClient.value,
                items: controller.clientNames.map((String client) {
                  return DropdownMenuItem<String>(
                    value: client,
                    child: Text(client),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedClient.value = value;
                  }
                },
              );
            }),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Dispositivo',
                border: OutlineInputBorder(),
              ),
              value: controller.selectedDevice.value.isEmpty
                  ? null
                  : controller.selectedDevice.value,
              items: const [
                DropdownMenuItem(
                  value: 'Notebook',
                  child: Text('Notebook'),
                ),
                DropdownMenuItem(
                  value: 'Desktop',
                  child: Text('Desktop'),
                ),
                DropdownMenuItem(
                  value: 'Impressora',
                  child: Text('Impressora'),
                ),
              ],
              onChanged: (value) {
                controller.selectedDevice.value = value!;
              },
            ),
            const SizedBox(height: 10),
            const Text('Peças:'),
            Obx(() {
              return Column(
                children: controller.partsList.map((part) {
                  return CheckboxListTile(
                    title: Text(part),
                    value: controller.selectedParts.contains(part),
                    onChanged: (bool? isChecked) {
                      if (isChecked!) {
                        controller.selectedParts.add(part);
                      } else {
                        controller.selectedParts.remove(part);
                      }
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 10),
            const Text('Serviços:'),
            Obx(() {
              return Column(
                children: controller.servicesList.map((service) {
                  return CheckboxListTile(
                    title: Text(service),
                    value: controller.selectedServices.contains(service),
                    onChanged: (bool? isChecked) {
                      if (isChecked!) {
                        controller.selectedServices.add(service);
                      } else {
                        controller.selectedServices.remove(service);
                      }
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Selecionar Funcionário',
                border: OutlineInputBorder(),
              ),
              value: controller.selectedEmployee.value.isEmpty
                  ? null
                  : controller.selectedEmployee.value,
              items: const [
                DropdownMenuItem(
                  value: 'João',
                  child: Text('João'),
                ),
                DropdownMenuItem(
                  value: 'Maria',
                  child: Text('Maria'),
                ),
                DropdownMenuItem(
                  value: 'Pedro',
                  child: Text('Pedro'),
                ),
              ],
              onChanged: (value) {
                controller.selectedEmployee.value = value!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
              textAlignVertical: TextAlignVertical.top,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.priceController,
              decoration: const InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+([.,]?\d{0,2})?$')),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                backgroundColor: Colors.blueAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                Get.to(() => OrderDetailsPage(controller: controller));
              },
              child: const Text(
                'Cadastrar Ordem',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
