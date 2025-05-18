# flutter_dio

A new Flutter project to demonstrate the Dio package usage.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Interceptor Chain Explanation

This project demonstrates the use of Dio interceptors, highlighting the difference between `InterceptorsWrapper` and `QueuedInterceptorsWrapper`.

**Interceptor Chain Flow:**

1.  **Interceptor1 (`InterceptorsWrapper`):**
    *   Logs entry.
    *   **Action:** Introduces a 1-second asynchronous delay.
    *   Logs completion and proceeds.
    *   ***Behavior with Parallel Calls:*** If two requests (e.g., PAR-1, PAR-2 from `getCitiesInParallel()`) arrive, both will enter this interceptor's `onRequest` handler nearly simultaneously. Their 1-second delays will run concurrently.

2.  **QueuedInterceptor2 (`QueuedInterceptorsWrapper`):**
    *   Logs entry with "...queueing for sequential processing..."
    *   **Action:** Introduces a 2-second asynchronous delay.
    *   Logs completion with "...Sequential processing completed..." and proceeds.
    *   ***Behavior with Parallel Calls:***
        *   If PAR-1 enters, it starts its 2-second delay.
        *   If PAR-2 arrives while PAR-1 is in its delay, PAR-2's `onRequest` in *this specific interceptor* will **wait**. It will not start its 2-second delay until PAR-1 has finished its 2-second delay *and* its `onRequest` handler in `QueuedInterceptor2` has called `handler.next()`.
        *   Processing through `QueuedInterceptor2.onRequest` is strictly sequential. The same logic applies to `onResponse` and `onError` within this interceptor.

3.  **Interceptor3 (`InterceptorsWrapper`):**
    *   Logs entry.
    *   **Action:** Synchronously adds API key, language, and unit parameters to the request.
    *   Proceeds.

4.  **`LogInterceptor`:**
    *   Standard Dio interceptor.
    *   **Action:** Logs detailed information about the outgoing request and the incoming response.

5.  **(Network Call to OpenWeatherMap API)**

6.  **Response/Error Handling (in reverse order for `onResponse`/`onError`):**
    *   `LogInterceptor` logs the response/error.
    *   **Interceptor3 (`InterceptorsWrapper`):** Logs entry for `onResponse`.
    *   **QueuedInterceptor2 (`QueuedInterceptorsWrapper`):** Logs entry for `onResponse`/`onError`, performs its 2-second delay *sequentially*, logs completion, and proceeds.
    *   **Interceptor1 (`InterceptorsWrapper`):** Logs entry for `onResponse`.
    *   **Error-Specific Interceptor (`InterceptorsWrapper`):** If an error occurs and isn't handled/resolved by `QueuedInterceptor2`, this shows a "Network error!" Snackbar with a retry option.

**Key Difference: `InterceptorsWrapper` vs. `QueuedInterceptorsWrapper`**

*   **`InterceptorsWrapper` (Interceptor1 and Interceptor3):**
    *   **Concurrency:** Handlers (`onRequest`, `onResponse`, `onError`) for different requests can execute concurrently. Asynchronous operations within these handlers for multiple requests run in parallel.
    *   **Use Cases:** General logging, simple header/parameter manipulation, transformations safe for concurrent execution.

*   **`QueuedInterceptorsWrapper` (QueuedInterceptor2):**
    *   **Concurrency:** No concurrency for handlers of the same type (e.g., all `onRequest` are queued). One request must fully complete its `onRequest` logic (including `await`s before `handler.next()`) before the next request's `onRequest` begins in this interceptor. The same applies independently to `onResponse` and `onError` handlers.
    *   **Use Cases:** For critical operations that require strict sequencing, such as token refresh processes or maintaining exclusive access to a shared resource while modifying requests or responses.

This explanation, combined with the console logs (which include timestamps and request IDs like "PAR-1", "SEQ-1"), helps in understanding the execution flow.


Execution logs for Sequential calls

### 2 APIs ([SEQ-1] and [SEQ-2]) called in sequence
onRequest chain:
``` yaml
21.925 [SEQ-1] onRequest: Interceptor1 - Entered
22.931 [SEQ-1] onRequest: Interceptor1 - Completed, calling next()
22.933 [SEQ-1] onRequest: QueuedInterceptor2 - Entered, queueing for sequential processing...
24.936 [SEQ-1] onRequest: QueuedInterceptor2 - Sequential processing completed, calling next()
24.938 [SEQ-1] onRequest: Interceptor3 - Entered
27.887 [SEQ-2] onRequest: Interceptor1 - Entered
28.889 [SEQ-2] onRequest: Interceptor1 - Completed, calling next()
28.889 [SEQ-2] onRequest: QueuedInterceptor2 - Entered, queueing for sequential processing...
30.892 [SEQ-2] onRequest: QueuedInterceptor2 - Sequential processing completed, calling next()
30.893 [SEQ-2] onRequest: Interceptor3 - Entered
```

onResponse chain:
``` yaml
25.869 [SEQ-1] onResponse: Interceptor1 - Entered
25.871 [SEQ-1] onResponse: QueuedInterceptor2 - Entered, queueing for sequential processing...
27.874 [SEQ-1] onResponse: QueuedInterceptor2 - Sequential processing completed, calling next()
27.875 [SEQ-1] onResponse: Interceptor3 - Entered
31.683 [SEQ-2] onResponse: Interceptor1 - Entered
31.684 [SEQ-2] onResponse: QueuedInterceptor2 - Entered, queueing for sequential processing...
33.686 [SEQ-2] onResponse: QueuedInterceptor2 - Sequential processing completed, calling next()
33.686 [SEQ-2] onResponse: Interceptor3 - Entered
```


### 2 APIs ([PAR-1] and [PAR-2]) called in parallel
onRequest chain:
``` yaml
28.177 [PAR-1] onRequest: Interceptor1 - Entered
28.179 [PAR-2] onRequest: Interceptor1 - Entered
29.183 [PAR-1] onRequest: Interceptor1 - Completed, calling next()
29.183 [PAR-2] onRequest: Interceptor1 - Completed, calling next()
29.184 [PAR-1] onRequest: QueuedInterceptor2 - Entered, queueing for sequential processing...
31.186 [PAR-1] onRequest: QueuedInterceptor2 - Sequential processing completed, calling next()
31.187 [PAR-2] onRequest: QueuedInterceptor2 - Entered, queueing for sequential processing...
31.187 [PAR-1] onRequest: Interceptor3 - Entered
33.189 [PAR-2] onRequest: QueuedInterceptor2 - Sequential processing completed, calling next()
33.190 [PAR-2] onRequest: Interceptor3 - Entered
```

onResponse chain:
``` yaml
32.300 [PAR-1] onResponse: Interceptor1 - Entered
32.300 [PAR-1] onResponse: QueuedInterceptor2 - Entered, queueing for sequential processing...
33.506 [PAR-2] onResponse: Interceptor1 - Entered
34.302 [PAR-1] onResponse: QueuedInterceptor2 - Sequential processing completed, calling next()
34.302 [PAR-2] onResponse: QueuedInterceptor2 - Entered, queueing for sequential processing...
34.303 [PAR-1] onResponse: Interceptor3 - Entered
36.305 [PAR-2] onResponse: QueuedInterceptor2 - Sequential processing completed, calling next()
36.306 [PAR-2] onResponse: Interceptor3 - Entered
```
