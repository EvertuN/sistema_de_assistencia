import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../database/databaseOperations.dart';

class ServiceOrderController extends GetxController {
  RxString selectedClient = ''.obs;
  RxList<String> clientNames = <String>[].obs;
  RxString selectedDevice = ''.obs;
  RxList<String> selectedParts = <String>[].obs;
  RxList<String> selectedServices = <String>[].obs;
  RxString selectedEmployee = ''.obs;
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  List<String> partsList = [
    'Placa Mãe',
    'Memória RAM',
    'Placa de Vídeo',
    'HD',
    'SSD',
    'Monitor',
    'Outros'
  ];

  List<String> servicesList = [
    'Limpeza',
    'Concerto',
    'Troca de Componentes',
    'Instalação de Software'
  ];

  @override
  void onInit() {
    super.onInit();
    fetchClientNames();
  }

  void fetchClientNames() async {
    clientNames.value = await DatabaseOperationFirebase().getClientNames();
  }

  void createNewServiceOrder() {
    DatabaseOperationFirebase().createServiceOrder(
      selectedClient.value,
      selectedDevice.value,
      descriptionController.text,
      selectedParts.toList(),
      selectedServices.toList(),
      selectedEmployee.value,
      priceController.text,
    );
    Get.snackbar(
      'Concluído',
      'Ordem feita com sucesso',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
