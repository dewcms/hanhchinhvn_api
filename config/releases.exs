import Config

config :hanhchinhvn_api, HanhchinhvnApiWeb.Endpoint,
  http: [:inet6, port: 5000],
  url: [port: 5000],
  server: true,
  check_origin: false

# check_origin: ["//*.dew.vn", "//localhost", "//*.dew.test", "//dewcms"]
