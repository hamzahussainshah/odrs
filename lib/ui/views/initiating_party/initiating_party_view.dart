import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'initiating_party_viewmodel.dart';

class InitiatingPartyView extends StackedView<InitiatingPartyViewModel> {
  const InitiatingPartyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InitiatingPartyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("InitiatingPartyView")),
      ),
    );
  }

  @override
  InitiatingPartyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InitiatingPartyViewModel();
}
