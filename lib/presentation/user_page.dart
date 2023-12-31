import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/models/album_model.dart';
import 'package:test_task/data/models/album_model_with_photos.dart';
import 'package:test_task/data/models/post_model.dart';
import 'package:test_task/presentation/bloc%20/album_bloc/album_bloc.dart';
import 'package:test_task/presentation/bloc%20/posts_bloc/posts_bloc.dart';
import 'package:test_task/presentation/post_detail_page.dart';
import 'package:test_task/presentation/shared_widgets/album_card.dart';
import 'package:test_task/presentation/shared_widgets/loader.dart';
import 'package:test_task/presentation/shared_widgets/post_card.dart';
import 'package:test_task/presentation/theme/app_colors.dart';
import 'package:test_task/presentation/theme/app_text_styles.dart';
import '../data/models/user_model.dart';
import 'album_detail_page.dart';
import 'all_albums_page.dart';
import 'all_posts_page.dart';

class UserPage extends StatefulWidget {
  final UserModel userModel;
  const UserPage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(
      GetUsersPostsEvent(id: widget.userModel.id ?? 0),
    );

    BlocProvider.of<AlbumBloc>(context).add(
      GetUsersAlbums(id: widget.userModel.id ?? 0),
    );
  }

  List<PostModel> posts = [];

  List<AlbumModelWithPhotos> albums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.userModel.name ?? ''),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PostsBloc, PostsState>(
            listener: (context, state) {
              if (state is PostsSuccessState) {
                posts = state.model;
                setState(() {});
              }
            },
          ),
          BlocListener<AlbumBloc, AlbumState>(
            listener: (context, state) {
              if (state is UsersAlbumsSuccessState) {
                albums = state.model;
                setState(() {});
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: //${widget.userModel.name}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Email: ${widget.userModel.email}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Phone: ${widget.userModel.phone}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Website: ${widget.userModel.website}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Working Company',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 7),
              Text(
                'Name: ${widget.userModel.company?.name}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 7),
              Text(
                'BS: ${widget.userModel.company?.bs}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 7),
              Text(
                "Catch phase: '${widget.userModel.company?.catchPhrase}'",
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Address',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 7),
              Text(
                'City: ${widget.userModel.address?.city}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 7),
              Text(
                'Street: ${widget.userModel.address?.street}',
                style: AppTextStyles.bodyTextStyle,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'User Posts',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllPostsPage(
                            user: widget.userModel,
                            posts: posts,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_right_alt_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              ListView.separated(
                itemCount: posts.length > 3 ? 3 : posts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailPage(
                            post: post,
                          ),
                        ),
                      );
                    },
                    child: PostCard(
                      post: post,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'User Albums',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllAlbumsPage(
                            user: widget.userModel,
                            albums: albums,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_right_alt_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              ListView.separated(
                itemCount: albums.length > 3 ? 3 : albums.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailPage(
                            album: album,
                          ),
                        ),
                      );
                    },
                    child: AlbumCard(
                      album: album,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
