import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'court_form_viewmodel.dart';

class CourtFormView extends StackedView<CourtFormViewModel> {
  const CourtFormView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CourtFormViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("CourtFormView")),
      ),
    );
  }

  @override
  CourtFormViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourtFormViewModel();
}
