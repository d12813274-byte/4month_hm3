import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hm2/data/models/cat_model.dart';
import 'cat_bloc.dart';

class MyCatsPage extends StatefulWidget {
  const MyCatsPage({super.key});

  @override
  State<MyCatsPage> createState() => _MyCatsPageState();
}

class _MyCatsPageState extends State<MyCatsPage> {
  final CatBloc _catBloc = CatBloc();

  @override
  void dispose() {
    _catBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кошки')),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          bloc: _catBloc,
          builder: (context, state) {
            if (state is LoadingCatState) {
              return const CircularProgressIndicator.adaptive();
            } else if (state is LoadedCatState) {
              final List<CatModel> list = state.list;
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return Image.network(
                    list[index].url,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 80),
                  );
                },
              );
            } else if (state is ErrorCatState) {
              return const Text(
                'ОШИБКА!',
                style: TextStyle(fontSize: 100, color: Colors.red),
              );
            } else {
              return TextButton(
                onPressed: () => _catBloc.add(LoadCatImagesEvent()),
                child: const Text('Load'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _catBloc.add(LoadCatImagesEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}