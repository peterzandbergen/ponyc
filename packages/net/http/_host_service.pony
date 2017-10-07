use "collections"

class val _HostService is (Hashable & Equatable[_HostService])
  let scheme: String
  let host: String
  let service: String
  let factory: HandlerFactory tag

  new val create(
    scheme': String, 
    host': String, 
    service': String,
    factory': HandlerFactory tag) 
  =>
    scheme = scheme'
    host = host'
    service = service'
    factory = factory'

  fun hash(): U64 =>
    scheme.hash() 
      xor host.hash() 
      xor service.hash() 
      xor (digestof factory).hash()

  fun eq(that: _HostService box): Bool =>
    (scheme == that.scheme)
      and (host == that.host)
      and (service == that.service)
      and (factory is that.factory)
