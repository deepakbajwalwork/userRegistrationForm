import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:registerform/view_model/user_vm.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: UserViewModel(),
  ),
];
