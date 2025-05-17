import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import '../widgets/header_title.dart';
import '../widgets/subtitulo_ubicacion.dart';
import '../widgets/scroll_to_top_button.dart';

class VersosScreen extends StatefulWidget {
	const VersosScreen({super.key});

	@override
	State<VersosScreen> createState() => _VersosScreenState();
}

class _VersosScreenState extends State<VersosScreen> {
	List<dynamic> versos = [];
	final ScrollController _scrollController = ScrollController();
	bool mostrarBoton = false;

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		final args = ModalRoute.of(context)!.settings.arguments as Map;
		cargarVersos(args['libro']['id'], args['capitulo']);
	}

	Future<void> cargarVersos(int libroId, int capituloId) async {
		final data = await rootBundle.loadString('assets/data/biblia_versos.json');
		final todos = jsonDecode(data)['Versos'];

		setState(() {
			versos = todos
					.where((v) => v['libro'] == libroId && v['capitulo'] == capituloId)
					.toList();
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
		final args = ModalRoute.of(context)!.settings.arguments as Map;
		final libro = args['libro'];
		final capitulo = args['capitulo'];

		return Scaffold(
			appBar: PreferredSize(
				preferredSize: const Size.fromHeight(60),
				child: HeaderTitle(),
			),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					SubtituloUbicacion(
						texto: '${libro['libro']} - Capítulo $capitulo',
					),
					Expanded(
						child: ListView.builder(
							physics: const BouncingScrollPhysics(),
							controller: _scrollController,
							itemCount: versos.length,
							itemBuilder: (context, index) {
								final v = versos[index];
								return Padding(
									padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
									child: Html(
										data: '<b>${v['versiculo']}.</b> ${v['texto']}',
									),
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
