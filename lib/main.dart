import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/services/dio/dio_settings.dart';
import 'package:test_task/data/services/repositories/album_repository.dart';
import 'package:test_task/data/services/repositories/commetns_repository.dart';
import 'package:test_task/data/services/repositories/post_repository.dart';
import 'package:test_task/data/services/repositories/user_page_repository.dart';
import 'package:test_task/presentation/bloc%20/album_bloc/album_bloc.dart';
import 'package:test_task/presentation/bloc%20/bloc/comment_bloc.dart';
import 'package:test_task/presentation/bloc%20/posts_bloc/posts_bloc.dart';
import 'package:test_task/presentation/bloc%20/user_bloc/user_bloc.dart';
import 'package:test_task/presentation/main_page.dart';
import 'package:test_task/presentation/user_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AlbumRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => CommentsRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => UserPageRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AlbumBloc(
              repository: RepositoryProvider.of<AlbumRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => CommentBloc(
              repository: RepositoryProvider.of<CommentsRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => PostsBloc(
              repository: RepositoryProvider.of<PostRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              repository: RepositoryProvider.of<UserPageRepository>(context),
            ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test Task Application',
          home: MainPage(),
        ),
      ),
    );
  }
}
