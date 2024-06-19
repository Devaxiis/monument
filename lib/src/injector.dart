import 'package:monumentuz/library.dart';



late final OrderRepository repo;
late final UserRepository repository;

Future<void> serviceLocator() async {
  final db = await LocalDataSourceImpl.init;
  repository = UserRepositoryImpl(network: GetNetwork());
  repo = OrderRepositoryImpl(dataSource: LocalDataSourceImpl(db:db ));
}