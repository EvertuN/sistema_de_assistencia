import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../database/databaseOperations.dart';

class ClientRegisterController extends GetxController {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final telefoneController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final numeroController = TextEditingController();
  final cepController = TextEditingController();

  RxString selectedSexo = ''.obs;

  void createNewClient() {
    DatabaseOperationFirebase().createNewClient(
      nomeController.text,
      selectedSexo.value,
      emailController.text,
      cpfController.text,
      dataNascimentoController.text,
      telefoneController.text,
      ruaController.text,
      bairroController.text,
      numeroController.text,
      cepController.text,
    );
    Get.snackbar(
      'Cadastro',
      'Cadastro feito com sucesso!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    // Dispose controllers
    nomeController.dispose();
    emailController.dispose();
    cpfController.dispose();
    dataNascimentoController.dispose();
    telefoneController.dispose();
    ruaController.dispose();
    bairroController.dispose();
    numeroController.dispose();
    cepController.dispose();
    super.onClose();
  }
}
