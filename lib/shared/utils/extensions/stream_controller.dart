// import 'dart:async';

// extension TryOnStreamController on StreamController {
//   ///Try any function and add errors to the stream<br>
//   ///**Does not return the result**
//   Future<void> errorToStream(FutureOr Function() func) {
//     return Future.value(func()).catchError(
//       (e, stack) => sink.addError(e, stack),
//     );
//   }

//   ///Try any function, add errors to the stream and **rethrow**
//   Future<T> errorToStreamRethrow<T>(FutureOr<T> Function() func) {
//     return Future<T>.value(func())
//       ..catchError(
//         (e, stack) {
//           sink.addError(e, stack);
//         },
//       );
//   }
// }
