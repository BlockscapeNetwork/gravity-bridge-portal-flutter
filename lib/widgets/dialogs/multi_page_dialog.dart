// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/utils.dart';

import '../../generated/l10n.dart';
import '../../services/themedata_service.dart';

final multiPageDialogProvider =
    StateNotifierProvider<MultiPageDialogNotifier, MultiPageDialogState>(
  (ref) => MultiPageDialogNotifier(),
);

class MultiPageDialogState {
  final int pageIndex;
  final bool showCloseButton;
  final bool showBackButton;

  MultiPageDialogState({
    this.pageIndex = 0,
    this.showBackButton = false,
    this.showCloseButton = true,
  });

  MultiPageDialogState copyWith({
    final int? pageIndex,
    final bool? showCloseButton,
    final bool? showBackButton,
  }) {
    return MultiPageDialogState(
      pageIndex: pageIndex ?? this.pageIndex,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      showBackButton: showBackButton ?? this.showBackButton,
    );
  }
}

class MultiPageDialogNotifier extends StateNotifier<MultiPageDialogState> {
  // ignore: unused_field
  static const String _logPrefix = "MultiPageNotifier";
  MultiPageDialogNotifier() : super(MultiPageDialogState());

  Future<void> showMultiPageDialog({
    required BuildContext context,
    required List<String> pageTitles,
    required List<Widget> pageContents,
  }) {
    assert(pageTitles.length >= 2 && pageTitles.length == pageContents.length);
    state = MultiPageDialogState();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => MultiPageDialog(
        pageTitles: pageTitles,
        pageContents: pageContents,
      ),
    );
  }

  void _jumpBy({
    required final int pages,
  }) {
    final newPageIndex = state.pageIndex + pages;
    final newShowBackButton = newPageIndex > 0;
    state = state.copyWith(
      pageIndex: newPageIndex,
      showBackButton: newShowBackButton,
    );
  }

  void nextPage() => _jumpBy(pages: 1);
  void previosPage() => _jumpBy(pages: -1);

  void setShowBackButton(final bool value) {
    state = state.copyWith(showBackButton: value);
  }

  void setShowCloseButton(final bool value) {
    state = state.copyWith(showCloseButton: value);
  }
}

class MultiPageDialog extends ConsumerStatefulWidget {
  final List<String> pageTitles;
  final List<Widget> pageContents;

  const MultiPageDialog({
    Key? key,
    required this.pageTitles,
    required this.pageContents,
  }) : super(key: key);

  @override
  ConsumerState<MultiPageDialog> createState() => _MultiPageDialogState();
}

class _MultiPageDialogState extends ConsumerState<MultiPageDialog>
    with TickerProviderStateMixin {
  // ignore: unused_field
  static const String _logPrefix = "MultiPageDialog";
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.pageContents.length,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      multiPageDialogProvider.select((value) => value.pageIndex),
      (int? previousIndex, int nextIndex) {
        if (previousIndex != nextIndex) {
          _tabController.index = nextIndex;
        }
      },
    );

    final List<Widget> tabChildren = [];
    for (int i = 0; i < widget.pageTitles.length; i++) {
      tabChildren.add(
        _getDialog(
          ref: ref,
          title: widget.pageTitles[i],
          content: widget.pageContents[i],
          showBackButton: i > 0,
        ),
      );
    }

    return Dialog(
      insetPadding: isMobile(context)
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.symmetric(horizontal: Sizes.padding16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.radius)),
      child: SizedBox(
        width: isMobile(context) ? double.infinity : Sizes.desktopDialogWidth,
        height: Sizes.dialogHeight,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: tabChildren,
        ),
      ),
    );
  }

  Widget _getDialog({
    required final WidgetRef ref,
    required final String title,
    required final Widget content,
    final bool showBackButton = false,
  }) {
    return Column(
      children: [
        _DialogHeader(title: title),
        Expanded(child: content),
      ],
    );
  }
}

class _DialogHeader extends ConsumerWidget {
  final String title;
  const _DialogHeader({required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showBackButton = ref
        .watch(multiPageDialogProvider.select((value) => value.showBackButton));
    final showCloseButton = ref.watch(
        multiPageDialogProvider.select((value) => value.showCloseButton));

    return Padding(
      padding: const EdgeInsets.fromLTRB(6.0, 18.0, 12.0, 12.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showCloseButton)
            Positioned(
              right: 0,
              child: IconButton(
                splashRadius: Sizes.buttonSplashRadius,
                icon: ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsClose,
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: Sizes.iconSizeMedium,
                  height: Sizes.iconSizeMedium,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          if (showBackButton)
            Positioned(
              left: 0,
              child: IconButton(
                tooltip: S.current.BACK,
                splashRadius: Sizes.buttonSplashRadius,
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: ImageNetworkOrAssetWidget(
                    svgAssetAsString: true,
                    imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: Sizes.iconSizeLarge,
                    height: Sizes.iconSizeLarge,
                  ),
                ),
                onPressed: () {
                  ref.read(multiPageDialogProvider.notifier).previosPage();
                },
              ),
            ),
        ],
      ),
    );
  }
}
