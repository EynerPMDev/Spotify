import 'package:flutter/material.dart';
import 'package:spotify_flutter/models/song_model.dart';

class AlbumSongsList extends StatelessWidget {
  const AlbumSongsList({Key? key, required this.songsBySinger})
      : super(key: key);

  final List<SongModel> songsBySinger;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: songsBySinger.length,
        (context, index) => DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: ListTile(
            onTap: () {},
            tileColor: Colors.black,
            leading: Hero(
              tag: songsBySinger[index].trackid!,
              child: FadeInImage(
                placeholder: const NetworkImage(
                    'https://flevix.com/wp-content/uploads/2020/02/Loading-Image.gif'),
                image: NetworkImage(songsBySinger[index].coverImageUrl!),
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              songsBySinger[index].songname!,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            subtitle: Text(
              "${songsBySinger[index].name!}  .  ${songsBySinger[index].duration!}",
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
