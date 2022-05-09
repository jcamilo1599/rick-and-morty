import 'package:flutter/material.dart';

import '../../../mappers/character/character_mapper.dart';
import '../../../models/character/character.dart';
import '../../../models/list/list_api_response.dart';
import '../../../models/list/list_config.dart';
import '../../molecules/card/card.dart';
import '../../templates/template_main.dart';

class ListPage extends StatefulWidget {
  static const String routeName = '/list';

  final ListConfigModel config;

  const ListPage({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();
  List<CharacterModel>? _list = [];
  bool _isLoading = false;
  String? _nextPath;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getCharacters('https://rickandmortyapi.com/api/character');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateMainWidget(
      title: 'Rick and Morty',
      body: _list!.isEmpty && _isLoading ? _getLoading() : _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Expanded(
          child: NotificationListener(
            child: _getList(),
            onNotification: (Notification notification) {
              final bool endOfScroll = _scrollController.position.pixels >=
                  (_scrollController.position.maxScrollExtent - 10);

              if (endOfScroll && !_isLoading) {
                _isLoading = true;
                setState(() {});
              } else if (!endOfScroll && _isLoading) {
                _isLoading = false;
                setState(() {});
              }

              return true;
            },
          ),
        ),
        _isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: _getLoading(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _getList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _list!.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int number) {
        Widget response = const SizedBox.shrink();

        if ((number + 1) == _list!.length && _nextPath != null && !_isLoading) {
          _getCharacters(_nextPath!, build: true);
        } else {
          response = CardWidget(character: _list![number]);
        }

        return response;
      },
    );
  }

  Widget _getLoading() {
    return const Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _getCharacters(String path, {bool build = false}) async {
    if (!build) {
      _isLoading = true;
      setState(() {});
    }

    ListApiResponseModel apiCharacters =
        await widget.config.homeApi.execute(path: path);

    _nextPath = apiCharacters.info?.next;

    // En caso de tener un mensaje de error
    if (apiCharacters.message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(apiCharacters.message!)),
      );
    }

    // Si obtiene resultados
    if (apiCharacters.results != null) {
      final List<CharacterModel>? newList = apiCharacters.results
          ?.map<CharacterModel>(
              (character) => CharacterMapper(character).execute())
          .toList();

      _list = _list?..addAll(newList!.toList());
    }

    _isLoading = false;
    setState(() {});
  }
}
