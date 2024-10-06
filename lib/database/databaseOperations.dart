import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatabaseOperationFirebase {
  final db = FirebaseFirestore.instance;

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
      "nome": "$nome",
      "sexo": "$sexo",
      "dataNascimento":
          Timestamp.fromDate(DateFormat('dd/MM/yyyy').parse(dataNascimento)),
      "CPF": "$CPF",
      "email": "$email",
      "telefone": "$telefone",
      "endereco": {
        "rua": rua,
        "bairro": bairro,
        "numero": numero,
        "CEP": CEP,
      },
    };

// Add a new document with a generated ID
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
}
