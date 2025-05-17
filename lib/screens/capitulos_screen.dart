import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/header_title.dart';
import '../widgets/biblia_list_item.dart';
import '../widgets/subtitulo_ubicacion.dart';
import '../widgets/scroll_to_top_button.dart';

class CapitulosScreen extends StatefulWidget {
	const CapitulosScreen({super.key});

	@override
	State<CapitulosScreen> createState() => _CapitulosScreenState();
}

class _CapitulosScreenState extends State<CapitulosScreen> {
	List<dynamic> capitulos = [];
	final ScrollController _scrollController = ScrollController();
	bool mostrarBoton = false;

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		final libro = ModalRoute.of(context)!.settings.arguments as Map;
		cargarCapitulos(libro['id']);
	}

	Future<void> cargarCapitulos(int libroId) async {
		final data = await rootBundle.loadString('assets/data/biblia_capitulos.json');
		final todos = jsonDecode(data)['Capitulos'];

		setState(() {
			capitulos = todos.where((c) => c['libro'] == libroId).toList();
		});
	}

	@override
	void initState() {
		super.initState();

		_scrollController.addListener(() {
			if (_scrollController.offset > 300 && !mostrarBoton) {
				setState(() => mostrarBoton = true);
			} else if (_scrollController.offset <= 300 && mostrarBoton) {
				setState(() => mostrarBoton = false);
			}
		});
	}

	@override
	void dispose() {
		_scrollController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final libro = ModalRoute.of(context)!.settings.arguments as Map;

		return Scaffold(
			appBar: const PreferredSize(
				preferredSize: Size.fromHeight(60),
				child: HeaderTitle(),
			),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					SubtituloUbicacion(texto: libro['libro']),
					Expanded(
						child: ListView.builder(
							physics: const BouncingScrollPhysics(),
							controller: _scrollController,
							itemCount: capitulos.length,
							itemBuilder: (context, index) {
								final cap = capitulos[index];
								return BibliaListItem(
									title: 'Capítulo ${cap['capitulo']}',
									onTap: () {
										Navigator.pushNamed(
											context,
											'/versos',
											arguments: {
												'libro': libro,
												'capitulo': cap['capitulo'],
											},
										);
									},
								);
							},
						),
					),
				],
			),
			floatingActionButton: ScrollToTopButton(
				visible: mostrarBoton,
				controller: _scrollController,
			),
		);
	}
}
