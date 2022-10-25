import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/models/song_model.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';

class SpotifySearchDeletegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Artist, Song, or podcast';
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121212),
        ),
        backgroundColor: const Color(0xff121212),
        scaffoldBackgroundColor: const Color(0xff121212));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final spotifyProvider =
        Provider.of<SpotifyProvider>(context, listen: false);
    return FutureBuilder(
      future: spotifyProvider.getSearchSongs(query),
      builder: (_, AsyncSnapshot<List<SongModel>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final songs = snapshot.data!;
        return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (_, int index) => _SongItemSearchResult(songs[index]));
      },
    );
  }

  Widget _emptyContainer() {
    return Container();
  }
}

class _SongItemSearchResult extends StatelessWidget {
  final SongModel songResult;

  const _SongItemSearchResult(this.songResult);

  @override
  Widget build(BuildContext context) {
    songResult.songid = 'search-${songResult.songid}';

    return ListTile(
      leading: Hero(
        tag: songResult.songid!,
        child: FadeInImage(
          placeholder: const NetworkImage(
              'https://flevix.com/wp-content/uploads/2020/02/Loading-Image.gif'),
          image: NetworkImage(songResult.coverImageUrl!),
          width: 56,
          height: 56,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(songResult.songname!),
      subtitle: Text(songResult.name!),
      onTap: () {
        Navigator.pushNamed(context, 'player', arguments: songResult);
      },
    );
  }
}
