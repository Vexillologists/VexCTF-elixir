defmodule VexCTF.Web.Router do
  use Plug.Router
  require EEx

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: [
      "application/json",
      "application/x-www-form-urlencoded",
      "multipart/form-data",
      "multipart/mixed",
      "application/graphql"
    ],
    json_decoder: Jason
  )
  plug(VexCTF.Web.ResolverLink)

  plug(:put_secure_browser_headers)
  plug(:match)
  plug(:dispatch)

  forward("/graphql",
    to: Absinthe.Plug,
    init_opts: [
      schema: VexCTF.Web.Schema
    ]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [
      schema: VexCTF.Web.Schema,
      interface: Application.compile_env(:vexctf_web, [:graphiql, :interface], :playground),
      default_url:
        Application.compile_env(
          :vexctf_web,
          [:graphiql, :default_url],
          "http://localhost:8080/graphql"
        ),
      default_headers: %{
        "X-CSRF-Token" => Plug.CSRFProtection.get_csrf_token()
      }
    ]
  )

  plug(Plug.Static,
    at: "/",
    from: :vexctf_web,
    gzip: false
  )

  match _ do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(404, render_404(conn))
  end

  defp put_secure_browser_headers(conn, _opts) do
    merge_resp_headers(conn, [
      {"x-frame-options", "SAMEORIGIN"},
      {"x-xss-protection", "1; mode=block"},
      {"x-content-type-options", "nosniff"},
      {"x-download-options", "noopen"},
      {"x-permitted-cross-domain-policies", "none"},
      {"cross-origin-window-policy", "deny"}
    ])
  end

  EEx.function_from_file(:defp, :render_404, "priv/templates/404.eex", [:conn])
end
