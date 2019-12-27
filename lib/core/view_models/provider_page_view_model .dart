import 'package:servplatform/core/enums/view_state.dart';
import 'package:servplatform/core/exceptions/repository_exception.dart';
import 'package:servplatform/core/models/provider_page/provider_page.dart';
import 'package:servplatform/core/repositories/provider_pages_repository/provider_pages_repository.dart';
import 'package:servplatform/core/view_models/base_view_model.dart';
import 'package:servplatform/locator.dart';

class ProviderPageViewModel extends BaseViewModel {
  final _providerPagesRepository = locator<ProviderPagesRepository>();

  List<ProviderPage> _providerPages = [];
  List<ProviderPage> get providerPages => _providerPages;

  Future<void> init() async {
    setState(ViewState.Busy);
    try {
      final fetchedProviderPages = await _providerPagesRepository.fetchProviderPages();
      _providerPages = fetchedProviderPages.take(5).toList();
    } on RepositoryException {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }
}
