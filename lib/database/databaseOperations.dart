import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatabaseOperationFirebase {
  final db = FirebaseFirestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNewClient(
      String nome,
      String sexo,
      String email,
      String CPF,
      String dataNascimento,
      String telefone,
      String rua,
      String bairro,
      String numero,
      String CEP) async {
    final validSexos = ['Masculino', 'Feminino', 'Outro'];
    if (!validSexos.contains(sexo)) {
      throw ArgumentError(
          'Sexo inválido. Os valores permitidos são: Masculino, Feminino ou Outro.');
    }

    final user = <String, dynamic>{
      "nome": nome,
      "sexo": sexo,
      "dataNascimento":
          Timestamp.fromDate(DateFormat('dd/MM/yyyy').parse(dataNascimento)),
      "CPF": CPF,
      "email": email,
      "telefone": telefone,
      "endereco": {
        "rua": rua,
        "bairro": bairro,
        "numero": numero,
        "CEP": CEP,
      },
    };

    await db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<List> listPersonFirebase() async {
    List<Object> nomes = [];

    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        var data = doc.data();
        var nome = data["nome"];
        nomes.add(nome.toString());
      }
    });
    return nomes;
  }

  Future<List<String>> getClientNames() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      return snapshot.docs.map((doc) => doc['nome'] as String).toList();
    } catch (e) {
      print('Erro ao buscar clientes: $e');
      return [];
    }
  }

  Future<void> createServiceOrder(
      String client,
      String device,
      String description,
      List<String> parts,
      List<String> services,
      String employee,
      String price
      ) async {
    final serviceOrder = <String, dynamic>{
      "client": client,
      "device": device,
      "description": description,
      "parts": parts,
      "services": services,
      "employee": employee,
      "price": price,
    };
    await db.collection("service_orders").add(serviceOrder).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

}
