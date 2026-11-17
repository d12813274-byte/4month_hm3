import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_bloc.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_event.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_state.dart';

class MyDogPage extends StatelessWidget {
  const MyDogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кошки')),
      body: Center(
        child: BlocBuilder<DogBloc, DogState>(
          builder: (context, state) {
            if (state is DogLoading) {
              return const CircularProgressIndicator();
            }
            if (state is DogLoaded) {
              return Image.network(
                state.imageUrl,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Не удалось показать картинку'),
              );
            }
            if (state is DogError) {
              return const Text('Ошибка загрузки');
            }
            return const Text('Нажми кнопку');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DogBloc>().add(LoadCatImage());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}