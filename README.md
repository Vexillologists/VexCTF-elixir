# VexCTF Elixir

VexCTF Elixir is an officially maintained implementation of [the VexCTF spec], implemented using [Absinthe] (a [GraphQL] server), [Plug] (an HTTP server), and [Ecto] (a database client, specifically using [PostgreSQL] for this implementation).

For more information on Elixir, see [its website][Elixir].

[the VexCTF spec]: https://github.com/Vexillologists/VexCTF-spec/
[Absinthe]: https://absinthe-graphql.org/
[Plug]: https://github.com/elixir-plug/plug/
[Ecto]: https://github.com/elixir-ecto/ecto/
[GraphQL]: https://graphql.org/
[PostgreSQL]: https://postgresql.org/
[Elixir]: https://elixir-lang.org

## Building

You will need the following installed:
- Erlang (tested on Erlang/OTP 23)
- Elixir (tested on Elixir 1.11.0)
- Mix (commonly packaged with Elixir itself, tested on Mix 1.11.0)

```bash
# Clone the repository
$ git clone https://github.com/Vexillologists/VexCTF-elixir
# Download dependencies
$ mix deps.get
# Build VexCTF Elixir
$ mix compile
```

## Commands

```bash
# Test VexCTF Elixir
$ mix test
# Run VexCTF Elixir (dev mode)
$ mix run --no-halt
# Or, run in dev mode inside IEx (interactive Elixir)
$ iex -S mix
# Or, run in production mode
$ MIX_ENV=prod mix run --no-halt
# Generate docs
$ mix docs
# Lint code
$ mix credo
# Format code
$ mix format
```

## Configuration

Configuration is located in `config/*.exs`.

Here's an explanation of the files:
- `config.exs`: Compile-time config
  - `dev/config.exs`: Compile-time config for dev mode
  - `prod/config.exs`: Compile-time config for prod mode
  - `prod/config.secret.exs`: Compile-time config for prod mode, containing
    secrets
  - `test/config.exs`: Compile-time config for test mode
- `runtime.exs`: Runtime config (does not contain per-environment
  configurations as that's not allowed in Elixir)

The configuration files specific to an environment override the general
configuration.

As many values are put into runtime configuration as possible, but those who
cannot or it does not make sense to are put into compile-time config.