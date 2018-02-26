.PHONY: \
	clean \
	db-reset \
	reset-dev \
	seed

##################################################################
#### Variables
##################################################################

ELIXIR_VERSION=1.6.1
# Get version from mix.exs
PROJECT_VERSION=$(shell echo `awk '/version: \"(.*)\"/{ print $2 }' ./mix.exs  | cut -d '"' -f2`)
DEV_DATABASE=$(shell echo `awk '/database: \"(.*)\"/{ print $2 }' ./config/dev.exs  | cut -d '"' -f2`)

##################################################################
#### Development Commands
##################################################################

seed:
	mix run priv/repo/seeds.exs

db-reset:
	psql -c 'DROP DATABASE $(DEV_DATABASE)' | true  # true will ignore the error if db dont exists and continue
	mix ecto.create
	mix ecto.migrate

reset-dev: db-reset seed

clean:
	rm -rf deps
	rm -rf _build/dev
	rm -rf _build/prod

##################################################################
#### Migration
##################################################################

##################################################################
#### Deployment
##################################################################
