import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../database/databaseOperations.dart';

class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

final TextEditingController _nomeController = TextEditingController();
final TextEditingController _sexoController = TextEditingController();
final TextEditingController _cpfController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _dataNascimentoController = TextEditingController();
final TextEditingController _telefoneController = TextEditingController();
final TextEditingController _ruaController = TextEditingController();
final TextEditingController _bairroController = TextEditingController();
final TextEditingController _numeroController = TextEditingController();
final TextEditingController _cepController = TextEditingController();

class _ClientRegisterState extends State<ClientRegister> {
  @override
  void dispose() {
    _nomeController.dispose();
    _sexoController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _dataNascimentoController.dispose();
    _telefoneController.dispose();
    _ruaController.dispose();
    _bairroController.dispose();
    _numeroController.dispose();
    _cepController.dispose();
    super.dispose();
  }

  String? _selectedSexo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text(
          'Penvmbra Serviços',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navegação de voltar usando GetX
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _cpfController,
              decoration: const InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dataNascimentoController,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(), onConfirm: (date) {
                  setState(() {
                    _dataNascimentoController.text =
                        DateFormat('dd/MM/yyyy').format(date);
                  });
                }, currentTime: DateTime.now());
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _telefoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Sexo',
                border: OutlineInputBorder(),
              ),
              value: _selectedSexo,
              items: const [
                DropdownMenuItem(
                  value: 'Masculino',
                  child: Text('Masculino'),
                ),
                DropdownMenuItem(
                  value: 'Feminino',
                  child: Text('Feminino'),
                ),
                DropdownMenuItem(
                  value: 'Outro',
                  child: Text('Outro'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSexo = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _cepController,
              decoration: const InputDecoration(
                labelText: 'CEP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _bairroController,
              decoration: const InputDecoration(
                labelText: 'Bairro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _numeroController,
              decoration: const InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ruaController,
              decoration: const InputDecoration(
                labelText: 'Rua',
                border: OutlineInputBorder(),
              ),
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
                DatabaseOperationFirebase().createNewClient(
                  _nomeController.text,
                  _selectedSexo!,
                  _emailController.text,
                  _cpfController.text,
                  _dataNascimentoController.text,
                  _telefoneController.text,
                  _ruaController.text,
                  _bairroController.text,
                  _numeroController.text,
                  _cepController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cadastro feito com sucesso!')),
                );
                print('Cadastrando...');
              },
              child: const Text(
                'Cadastrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
