abstract class GenericService<T> {
  T findOne(int id);
  List<T> findAll();
  bool save(T value);
  T save2(T value);
  bool delete(int id);
}
