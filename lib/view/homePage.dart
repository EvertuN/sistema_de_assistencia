import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sistema_de_assistencia/view/clientRegister.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(20),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 7,
          itemBuilder: (context, index) {
            // Lista de ícones
            List<IconData> icons = [
              Icons.person_add, // Cadastrar Pessoa
              Icons.add_shopping_cart, // Cadastrar Produto
              Icons.account_balance, // Cadastrar Fornecedor
              Icons.list_alt, // Listar Pessoas
              Icons.line_style_rounded, // Listar Produtos
              Icons.featured_play_list_outlined, // Listar Fornecedor
              Icons.support_outlined
            ];

            // Lista de títulos
            List<String> titles = [
              'Cadastrar Cliente',
              'Cadastrar Produto',
              'Cadastrar Fornecedor',
              'Listar Pessoa',
              'Listar Produto',
              'Listar Fornecedor',
              'Suporte'
            ];
            // Retorna um GestureDetector para cada item da grade
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(ClientRegister());
                    break;
                //
                // case 1: Navigator.pushNamed(context, AppRoutes.registerProductPage);
                // break;
                //
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
                ;
                // Aqui você pode adicionar a navegação para cada página
                // Exemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => SuaPaginaDeCadastro()));
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
                      style: TextStyle(
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