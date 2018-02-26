# Blog

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

* Official website: http://www.phoenixframework.org/
* Guides: http://phoenixframework.org/docs/overview
* Docs: https://hexdocs.pm/phoenix
* Mailing list: http://groups.google.com/group/phoenix-talk
* Source: https://github.com/phoenixframework/phoenix

## How the project is built

### Create the project

```elixir
mix phx.new phx-api-starter --no-html --no-brunch --app blog
```

### Generate Account context with user modules

```elixir
mix phx.gen.json Accounts User users \
    email:string \
    first_name:string \
    last_name:string \
    password_hash:string \
    is_admin:boolean \
    email_verified:boolean
```

### Generate Blog context with blog and comment modules

```elixir
mix phx.gen.json Blog Post posts title:string body:text user_id:references:users
```

### Generate comment modules and add to blog context

```elixir
mix phx.gen.json Blog comment comments body:text post_id:references:posts
```
