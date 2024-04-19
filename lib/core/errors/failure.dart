abstract class Failure {
  const Failure({
    this.message = "Something Went Wrong, Please Try Again",
    this.trace,
  });

  final String message;
  final StackTrace? trace;

}
