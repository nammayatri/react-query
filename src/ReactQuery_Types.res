type query
type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type retryValue<'queryError>
type retryDelayValue<'queryError>
type queryDataKeyOrFilterValue<'queryKey>
type placeholderDataValue
type fetchMeta

type queryFunctionContext<'queryKey, 'pageParam> = {
  queryKey: 'queryKey,
  pageParam: 'pageParam,
}

type retryParam<'error> = [#bool(bool) | #number(int) | #fn((int, 'error) => bool)]
type retryDelayParam<'error> = [#number(int) | #fn((int, 'error) => int)]
type time = [#number(int) | #infinity]
type refetchInterval = [#bool(bool) | #number(int)]
type boolOrAlways = [#bool(bool) | #always]
type notifyOnChangeProps = [#array(array<string>) | #all]

type infiniteData<'queryData> = {
  pages: array<'queryData>,
  pageParams: array<int>,
}

type queryStatus = [#pending | #success | #error]

type queryState<'queryData, 'queryError> = {
  data: option<'queryData>,
  dataUpdateCount: int,
  dataUpdatedAt: int,
  error: Js.Nullable.t<'queryError>,
  errorUpdateCount: int,
  errorUpdatedAt: int,
  fetchFailureCount: int,
  fetchMeta: fetchMeta,
  isFetching: bool,
  isInvalidated: bool,
  isPaused: bool,
  status: queryStatus,
}

type placeholderData<'queryData, 'queryResult> = [
  | #data('queryData)
  | #function(unit => option<'queryResult>)
]

type queryFilter<'queryKey> = {
  exact?: bool,
  @as("type") type_?: [#active | #inactive | #all],
  stale?: bool,
  fetching?: bool,
  predicate?: query => bool,
  queryKey?: 'queryKey,
}

type queryDataKeyOrFilter<'queryKey> = [#keys('queryKey) | #filters(queryFilter<'queryKey>)]

type refetchOptions = {
  throwOnError: bool,
  cancelRefetch: bool,
}

type queryType<'queryData, 'queryKey, 'queryError> = {
  queryKey: array<'queryKey>,
  state: queryState<'queryData, 'queryError>,
  isFetchingOptimistic?: bool,
}
