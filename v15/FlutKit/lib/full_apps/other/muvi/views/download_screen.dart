import 'package:flutkit/full_apps/other/muvi/controllers/download_controller.dart';
import 'package:flutkit/full_apps/other/muvi/models/download_movie.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_progress_bar.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DownloadController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = DownloadController();
  }

  List<Widget> _buildDownloadMovieList() {
    List<Widget> list = [];
    for (DownloadMovie downloadMovie in controller.downloadMovies!) {
      list.add(_buildSingleDownloadMovie(downloadMovie));
      list.add(MySpacing.height(20));
    }
    return list;
  }

  Widget _buildSingleDownloadMovie(DownloadMovie downloadMovie) {
    return MyContainer(
      borderRadiusAll: 4,
      child: Row(
        children: [
          MyContainer(
            height: 80,
            width: 80,
            paddingAll: 0,
            borderRadiusAll: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(downloadMovie.movie.image),
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.width(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyMedium(
                downloadMovie.movie.name,
                fontWeight: 600,
              ),
              MySpacing.height(4),
              MyText.labelMedium(downloadMovie.movie.production),
              MySpacing.height(6),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          MyText.bodySmall(
                            '${downloadMovie.downloadedSize}MB',
                            color: customTheme.muviPrimary,
                          ),
                          MySpacing.width(48),
                          MyText.bodySmall(
                            '${downloadMovie.totalSize}MB',
                            color: customTheme.muviPrimary,
                          ),
                        ],
                      ),
                      MySpacing.height(2),
                      MyProgressBar(
                        height: 2,
                        activeColor: customTheme.muviPrimary,
                        inactiveColor:
                            theme.colorScheme.onBackground.withAlpha(30),
                        progress: (downloadMovie.downloadedSize /
                            downloadMovie.totalSize),
                        width: MediaQuery.of(context).size.width - 224,
                      ),
                    ],
                  ),
                  MySpacing.width(12),
                  Icon(
                    Icons.pause_circle_outline,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  MySpacing.width(8),
                  Icon(
                    Icons.more_vert,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(
        init: controller,
        tag: 'download_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Container(
          margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: MyText.titleMedium(
            'Downloads',
            fontWeight: 600,
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: MySpacing.x(20),
          child: Column(
            children: _buildDownloadMovieList(),
          ),
        ),
      );
    }
  }
}
