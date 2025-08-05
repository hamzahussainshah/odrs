import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'mediator_details_viewmodel.dart';

class MediatorDetailsView extends StackedView<MediatorDetailsViewModel> {
  const MediatorDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MediatorDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("MediatorDetailsView")),
      ),
    );
  }

  @override
  MediatorDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MediatorDetailsViewModel();
}
