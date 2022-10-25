import 'package:flutter/material.dart';
import 'package:spotify_flutter/models/filteritem_model.dart';
import 'package:spotify_flutter/models/playlist_model.dart';
import 'package:spotify_flutter/models/searchlist_model.dart';

List<PlayListModel> playlistMusic = [
  PlayListModel(
      title: 'Discover Weekly',
      imageUrl:
          'https://i04.fotocdn.net/s120/4817cfcc54ca9dc7/gallery_m/2738200936.jpg'),
  PlayListModel(
      title: 'Daily Mix 1',
      imageUrl:
          'https://i0.wp.com/www.noise11.com/wp/wp-content/uploads/2021/11/Adele-30.jpg?fit=875%2C875'),
  PlayListModel(
      title: 'Daily Mix 3',
      imageUrl:
          'https://yt3.ggpht.com/ytc/AKedOLSrzEtaB6cNd0sxMDapTZ0ZIIKcGQMtGNaZ6py00Q=s900-c-k-c0x00ffffff-no-rj'),
  PlayListModel(
      title: 'Chill Vibes',
      imageUrl:
          'https://www.fashionkibatain.com/wp-content/uploads/2017/04/guided-meditaiton.jpg'),
  PlayListModel(
      title: 'Tea Time',
      imageUrl: 'https://yanashla.com/wp-content/uploads/2020/01/9-15.jpg'),
  PlayListModel(
      title: 'Power Hour',
      imageUrl:
          'https://i.pinimg.com/originals/83/89/e0/8389e09578661f065d4b63ad86274b85.jpg'),
];

List<PlayListModel> playlistPodcast = [
  PlayListModel(
      title: 'Supercars and cities',
      imageUrl:
          'https://www.wallpaperup.com/uploads/wallpapers/2013/01/01/27232/c59d12f56d7184506feedc70a6e99d07.jpg',
      owner: 'Show • Urban racer'),
  PlayListModel(
      title: 'Best barn finds',
      imageUrl:
          'https://avatars.mds.yandex.net/i?id=2a00000179eebf726d02d101ef4e3b2f77b4-2465206-images-thumbs&n=13',
      owner: 'Show • Car finder'),
  PlayListModel(
      title: 'Life at the red line',
      imageUrl:
          'https://www.mayrolaw.com/wp-content/uploads/2015/01/bigstock-Reducing-Speed-Safe-Driving-Co-50241104.jpg',
      owner: 'Show • Speedometer'),
];

List<PlayListModel> playlistForYou = [
  PlayListModel(
    title: 'Current favorites and exciting new music. Cover: Charlie Puth',
    imageUrl:
        'https://i.pinimg.com/originals/00/08/f1/0008f11215f57750298696f2f922bdec.jpg',
  ),
  PlayListModel(
    title: 'Viral classics. Yep, we\'re at that stage.',
    imageUrl:
        'https://i.guim.co.uk/img/media/e66319b921c674d456265f30cfddb1750516c402/0_122_3905_2343/master/3905.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=e8262c27baa05ec6ba2b0f48b95433dd',
  ),
  PlayListModel(
    title: 'A mega mix of 75 favorites from the last few years!',
    imageUrl:
        'https://images6.fanpop.com/image/photos/39000000/Billboard-Photoshoot-ed-sheeran-39022303-540-665.jpg',
  ),
];

List<SearchListModel> playlistAdded = [
  SearchListModel(
    title: 'Rock',
    imageUrl: 'https://pbs.twimg.com/media/EJMbrPkVUAIxT9g.jpg',
    backgroudColor: Colors.red,
  ),
  SearchListModel(
      title: 'Indie',
      imageUrl:
          'https://slaysonics.com/wp-content/uploads/2019/01/Indie-Electronic-Playlist.jpg',
      backgroudColor: const Color.fromARGB(255, 194, 152, 1)),
];

List<SearchListModel> allSearh = [
  SearchListModel(
    title: 'Holiday',
    imageUrl:
        'https://banner2.cleanpng.com/20180325/xye/kisspng-beach-arecaceae-drawing-clip-art-beaches-5ab80b35ea50d6.7026522115220109339598.jpg',
    backgroudColor: const Color.fromARGB(255, 194, 152, 1),
  ),
  SearchListModel(
      title: 'Trending',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-esquire-inorout-ep05-jack-harlow-kd-dn-rough-v1-copy-01-00-02-55-00-still008-1584377354.jpg',
      backgroudColor: const Color.fromARGB(255, 249, 64, 255)),
  SearchListModel(
      title: 'Sleep',
      imageUrl:
          'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      backgroudColor: const Color.fromARGB(255, 0, 20, 153)),
  SearchListModel(
      title: 'Soulfull',
      imageUrl:
          'https://i.pinimg.com/736x/0b/ba/16/0bba16d65137736c3ce02eb847b3a09d.jpg',
      backgroudColor: const Color.fromARGB(187, 255, 42, 0)),
  SearchListModel(
    title: 'Holiday',
    imageUrl:
        'https://banner2.cleanpng.com/20180325/xye/kisspng-beach-arecaceae-drawing-clip-art-beaches-5ab80b35ea50d6.7026522115220109339598.jpg',
    backgroudColor: const Color.fromARGB(255, 194, 152, 1),
  ),
  SearchListModel(
      title: 'Trending',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-esquire-inorout-ep05-jack-harlow-kd-dn-rough-v1-copy-01-00-02-55-00-still008-1584377354.jpg',
      backgroudColor: const Color.fromARGB(255, 249, 64, 255)),
  SearchListModel(
      title: 'Sleep',
      imageUrl:
          'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      backgroudColor: const Color.fromARGB(255, 0, 20, 153)),
  SearchListModel(
      title: 'Soulfull',
      imageUrl:
          'https://i.pinimg.com/736x/0b/ba/16/0bba16d65137736c3ce02eb847b3a09d.jpg',
      backgroudColor: const Color.fromARGB(187, 255, 42, 0)),
  SearchListModel(
      title: 'Sleep',
      imageUrl:
          'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      backgroudColor: const Color.fromARGB(255, 0, 20, 153)),
  SearchListModel(
      title: 'Soulfull',
      imageUrl:
          'https://i.pinimg.com/736x/0b/ba/16/0bba16d65137736c3ce02eb847b3a09d.jpg',
      backgroudColor: const Color.fromARGB(187, 255, 42, 0)),
  SearchListModel(
      title: 'Trending',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-esquire-inorout-ep05-jack-harlow-kd-dn-rough-v1-copy-01-00-02-55-00-still008-1584377354.jpg',
      backgroudColor: const Color.fromARGB(255, 249, 64, 255)),
  SearchListModel(
      title: 'Sleep',
      imageUrl:
          'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      backgroudColor: const Color.fromARGB(255, 0, 20, 153)),
  SearchListModel(
      title: 'Trending',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-esquire-inorout-ep05-jack-harlow-kd-dn-rough-v1-copy-01-00-02-55-00-still008-1584377354.jpg',
      backgroudColor: const Color.fromARGB(255, 249, 64, 255)),
  SearchListModel(
      title: 'Sleep',
      imageUrl:
          'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      backgroudColor: const Color.fromARGB(255, 0, 20, 153)),
];

List<FilterItemModel> filtersCategory = [
  FilterItemModel(
    title: 'Playlist',
  ),
  FilterItemModel(
    title: 'Artist',
  ),
  FilterItemModel(
    title: 'Podcast',
  ),
  FilterItemModel(
    title: 'Events',
  ),
  FilterItemModel(
    title: 'Books',
  ),
  FilterItemModel(
    title: 'Partys',
  ),
];
