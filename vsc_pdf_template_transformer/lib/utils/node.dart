class Node<T> {
  final T value;
  final List<Node<T>> children;
  Node(this.value, this.children);
}