enum RequestState {
  empty,
  loading,
  loaded,
  error,
  refreshing,
  moreFetching,
  noMoreData
}

enum RequestStatePagnation {
  Uninitialized,
  Refreshing,
  Initial_Fetching,
  More_Fetching,
  Fetched,
  No_More_Data,
  Error
}
