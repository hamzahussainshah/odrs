import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'case_details_viewmodel.dart';

class CaseDetailsView extends StackedView<CaseDetailsViewModel> {
  const CaseDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CaseDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("CaseDetailsView")),
      ),
    );
  }

  @override
  CaseDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CaseDetailsViewModel();
}
