import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/theme/app_text_styles.dart';
import 'package:test_task/presentation/user_page.dart';

import 'bloc /user_bloc/user_bloc.dart';
import 'theme/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      GetUsersEvent(),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorText),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is UserSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.model.length,
              separatorBuilder: (_, __) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                final user = state.model[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          userModel: user,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: AppColors.gray,
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      horizontalTitleGap: 8,
                      title: Text(
                        user.username ?? '',
                        style: AppTextStyles.title,
                      ),
                      subtitle: Text(
                        user.name ?? '',
                        style: AppTextStyles.subtitle,
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
