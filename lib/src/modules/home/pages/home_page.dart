import 'package:agenda_nail_app/src/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: TextButton(
                        onPressed: () {
                          Modular.to.navigate('/auth/');
                        },
                        child: const Text('ENTRAR'),
                      ),
                    ),
                  ),
                  headBanner(context),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'O que deseja agendar?',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      selectableCards(
                        context: context,
                        size: size,
                        imageURL:
                            'https://st2.depositphotos.com/1033977/5979/i/950/depositphotos_59792387-stock-photo-blue-pink-manicure.jpg',
                        title: 'ESMALTAÇÃO',
                        value: 'R\$ 120,00',
                        controller: controller,
                        index: 1,
                      ),
                      selectableCards(
                        context: context,
                        size: size,
                        imageURL:
                            'https://st2.depositphotos.com/1033977/5979/i/950/depositphotos_59792387-stock-photo-blue-pink-manicure.jpg',
                        title: 'ESMALTAÇÃO EM GEL',
                        value: 'R\$ 120,00',
                        controller: controller,
                        index: 2,
                      ),
                      selectableCards(
                        context: context,
                        size: size,
                        imageURL:
                            'https://st2.depositphotos.com/1033977/5979/i/950/depositphotos_59792387-stock-photo-blue-pink-manicure.jpg',
                        title: 'ALONGAMENTO EM FIBRA',
                        value: 'R\$ 120,00',
                        controller: controller,
                        index: 3,
                      ),
                      selectableCards(
                        context: context,
                        size: size,
                        imageURL:
                            'https://st2.depositphotos.com/1033977/5979/i/950/depositphotos_59792387-stock-photo-blue-pink-manicure.jpg',
                        title: 'SPA DO PÉ',
                        value: 'R\$ 120,00',
                        controller: controller,
                        index: 4,
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.only(left: 64, right: 64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          if (controller.selectedIndex != null) {
            Modular.to.pushNamed('./agendamento');
          } else {
            _showToast(context);
          }
        },
        label: Text(
          'Agendar',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget selectableCards({
    required BuildContext context,
    required Size size,
    required String imageURL,
    required String title,
    required String value,
    required HomeController controller,
    required int index,
  }) {
    bool isSelected = controller.selectedIndex == index;
    return GestureDetector(
      onTap: () {
        controller.select(index);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: isSelected ? 1 : 0.4,
                      child: Image.network(
                        colorBlendMode: BlendMode.lighten,
                        imageURL,
                        width: size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  descriptionCard(context, title, value),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget descriptionCard(BuildContext context, String title, String value) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(150)),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Text('A partir de'),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget headBanner(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Agende agora mesmo o seu horario na',
                style: Theme.of(context).textTheme.titleSmall),
            Text(
              'KB Nail Designer',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget promotionalBanner(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Agende agora mesmo o seu horario na',
                style: Theme.of(context).textTheme.titleSmall),
            Text(
              'KB Nail Designer',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.clearSnackBars();
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade900,
        margin: const EdgeInsets.fromLTRB(32, 12, 32, 12),
        content: const Text('Nenhum serviço selecionado ☹️'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
