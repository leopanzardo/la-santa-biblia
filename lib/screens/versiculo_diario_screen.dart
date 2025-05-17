import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../utils/versiculo_utils.dart';
import '../widgets/header_title.dart';

class VersiculoDiarioScreen extends StatefulWidget {
	const VersiculoDiarioScreen({super.key});

	@override
	State<VersiculoDiarioScreen> createState() => _VersiculoDiarioScreenState();
}

class _VersiculoDiarioScreenState extends State<VersiculoDiarioScreen> {
	String versiculo = 'Cargando...';
	String referencia = '';

	@override
	void initState() {
		super.initState();
		cargarVersiculoDelDia();
	}

	Future<void> cargarVersiculoDelDia() async {
		final resultado = await VersiculoDelDia.obtenerVersiculo();
		setState(() {
			versiculo = resultado['texto'] ?? '';
			referencia = resultado['referencia'] ?? '';
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: const PreferredSize(
				preferredSize: Size.fromHeight(60),
				child: HeaderTitle(),
			),
			body: Stack(
				children: [
					// Imagen de fondo en esquina inferior derecha
					Positioned(
						bottom: 0,
						right: 0,
						child: Opacity(
							opacity: 0.25,
							child: Image.asset(
								'assets/images/jesus-orando.png',
								width: 180,
							),
						),
					),
					// Contenido principal
					Padding(
						padding: const EdgeInsets.all(24),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text(
									'Versículo del Día',
									style: Theme.of(context).textTheme.headlineSmall,
									textAlign: TextAlign.center,
								),
								const SizedBox(height: 12),
								Text(
									referencia,
									style: Theme.of(context).textTheme.titleLarge,
									textAlign: TextAlign.center,
								),
								const SizedBox(height: 16),
								Html(
									data: '<p>$versiculo</p>',
									style: {
										'p': Style(
											fontFamily: 'EBGaramond',
											fontSize: FontSize(20),
											fontStyle: FontStyle.italic,
											textAlign: TextAlign.center,
										),
										'b': Style(fontWeight: FontWeight.bold),
									},
								),
								const SizedBox(height: 32),
								ElevatedButton(
									onPressed: () {
										Navigator.pushNamed(context, '/libros');
									},
									child: const Text('Leer la Biblia'),
								)
							],
						),
					),
				],
			),
		);
	}
}
