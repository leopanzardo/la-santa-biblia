import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/header_title.dart';
import '../widgets/biblia_list_item.dart';
import '../widgets/subtitulo_ubicacion.dart';
import '../widgets/scroll_to_top_button.dart';

class LibrosScreen extends StatefulWidget {
	const LibrosScreen({super.key});

	@override
	State<LibrosScreen> createState() => _LibrosScreenState();
}

class _LibrosScreenState extends State<LibrosScreen> {
	List<dynamic> libros = [];
	final ScrollController _scrollController = ScrollController();
	bool mostrarBoton = false;

	Future<void> cargarLibros() async {
		final data = await rootBundle.loadString('assets/data/biblia_libros.json');
		setState(() {
			libros = jsonDecode(data)['Libros'];
		});
	}

	@override
	void initState() {
		super.initState();
		cargarLibros();

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
		return Scaffold(
			appBar: const PreferredSize(
				preferredSize: Size.fromHeight(60),
				child: HeaderTitle(),
			),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					const SubtituloUbicacion(texto: 'Libros'),
					Expanded(
						child: ListView.builder(
							physics: const BouncingScrollPhysics(),
							controller: _scrollController,
							itemCount: libros.length,
							itemBuilder: (context, index) {
								final libro = libros[index];
								return BibliaListItem(
									title: libro['libro'],
									onTap: () {
										Navigator.pushNamed(
											context,
											'/capitulos',
											arguments: libro,
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
