import Config

config :hanhchinhvn_api, HanhchinhvnApiWeb.Endpoint,
  http: [:inet6, port: 4000],
  url: [port: 4000],
  server: true,
  check_origin: false

# check_origin: ["//*.dew.vn", "//localhost", "//*.dew.test", "//dewcms"]
