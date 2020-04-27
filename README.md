# Buffett List

## Setup
On a machine with [Docker Compose](https://docs.docker.com/compose/) installed, complete the following steps.

1. Clone this repository (`git clone git://github.com/landongrindheim/buffett_list.git`)
2. Change into the project directory (`cd buffett_list`)
3. Run `docker-compose up -d`

After issuing these commands, you'll have a development/test container up and running. In order to do anything useful, you'll need to [create the development and test databases](#create/migrate-the-database).


## Environment Variables
To create the test/development databases, you'll need to create a `.env` file with the following contents:
```bash
POSTGRES_USER=my_user
POSTGRES_PASSWORD=my_password
```
And a `.env.#{environment}` file for each environment with the following contents:
```bash
DATABASE_URL="postgresql://my_user:my_password@database/buffett_list_#{environment}"
SERVE_STATIC_ASSETS=true
WEB_SESSIONS_SECRET="my session string (generate using instructions below)"
```
**Note:** to generate the value for `WEB_SESSIONS_SECRET`, [inside the container](#running-commands-inside-the-container) run `hanami generate secret web`

## Running commands in the container
In order to run commands in the container, issue the following:

```bash
% docker exec -it web bash
```

This will give you a shell prompt, from which you can interact with the application in the test/development environments.


## Create/migrate the Database
Then create (and migrate) the development and test databases:

```bash
% hanami db prepare
% HANAMI_ENV=test hanami db prepare
```


## Tests
How to run tests:

From within the `web` container:

```bash
% rspec
```


## Console
How to run the development console:

From within the `web` container:

```bash
% hanami console
```


## Development server
How to run the development server:

From within the `web` container:

```bash
% hanami server
```
