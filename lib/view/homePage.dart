import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistema_de_assistencia/view/clientRegister.dart';
import 'package:sistema_de_assistencia/view/serviceOrder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Penvmbra Serviços',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
        foregroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 2,//alterar para 7
          itemBuilder: (context, index) {
            // Lista de ícones
            List<IconData> icons = [
              Icons.person_add,
              Icons.build,
              // Icons.account_balance,
              // Icons.list_alt,
              // Icons.line_style_rounded,
              // Icons.featured_play_list_outlined,
              // Icons.support_outlined
            ];

            List<String> titles = [
              'Cadastrar Cliente',
              'Ordem de Serviço',
              // 'Cadastrar Fornecedor',
              // 'Listar Pessoa',
              // 'Listar Produto',
              // 'Listar Fornecedor',
              // 'Suporte'
            ];

            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(ClientRegister());
                    break;

                  case 1:
                    Get.to(ServiceOrder());
                    break;

                  // case 2: Navigator.pushNamed(context, AppRoutes.registerSupplierPage);
                  // break;
                  //
                  //   case 3:
                  //     Navigator.pushNamed(context, AppRoutes.listPersonPage);
                  //     break;
                  //
                  // case 4: Navigator.pushNamed(context, AppRoutes.listProductsPage);
                  // break;
                  //
                  // case 5: Navigator.pushNamed(context, AppRoutes.listSupplierPage);
                  // break;
                  // case 6:
                  //   Navigator.pushNamed(context, AppRoutes.websitePage);
                  //   break;
                }
                print('Navegando para ${titles[index]}');
              },
              child: Card(
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icons[index],
                      size: 80,
                      color: Colors.black,
                    ),
                    Text(
                      titles[index],
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
