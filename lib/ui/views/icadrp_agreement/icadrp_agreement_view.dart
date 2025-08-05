import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'icadrp_agreement_viewmodel.dart';

class IcadrpAgreementView extends StackedView<IcadrpAgreementViewModel> {
  const IcadrpAgreementView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IcadrpAgreementViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("IcadrpAgreementView")),
      ),
    );
  }

  @override
  IcadrpAgreementViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IcadrpAgreementViewModel();
}
