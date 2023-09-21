#!/usr/bin/env bash

export UI_HTTP_PORT=8080
export HEROES_PORT=8081
export VILLAINS_PORT=8082
export FIGHTS_PORT=8083


function setUiEnv() {
  export DEBUG_PORT=5005
  export APP_PORT=${UI_HTTP_PORT}
}

function setHeroesEnv() {
  export DEBUG_PORT=5007
  export APP_PORT=${HEROES_PORT}
  export DB_USER=superman
  export DB_PWD=superman
  export DB_HOST=localhost
  export DB_SCHEMA=heroes_database
  export CORS_ORIGINS="/.*/"
  export CORS_METHODS="GET,POST,DELETE"
}

function setVillainsEnv() {
  export DEBUG_PORT=5006
  export APP_PORT=${VILLAINS_PORT}
  export DB_USER=suberbad
  export DB_PWD=suberbad
  export DB_HOST=suberbad
  export DB_SCHEMA=villains_database
  export CORS_ORIGINS="/.*/"
  export CORS_METHODS="GET,POST,DELETE"
}

function setFightsEnv() {
  export DEBUG_PORT=5008
  export APP_PORT=${FIGHTS_PORT}
  export HERO_HOST=localhost
  export VILLAIN_HOST=localhost
  export DB_USER=superfight
  export DB_PWD=superfight
  export DB_HOST=localhost
  export DB_SCHEMA=fights
  export CORS_ORIGINS="/.*/"
  export CORS_METHODS="GET,POST,DELETE"
}

function setStatisticsEnv() {
  export DEBUG_PORT=5009
}

function startDevMode() {
  quarkus dev -Dquarkus.analytics.disabled=true -Dmaven.repo.local=/home/user/.m2/repository -Dquarkus.http.host=0.0.0.0 -Dmaven.test.skip -Ddebug=${DEBUG_PORT}
}

for i in "$@"
do
  case $i in
    --ui)
      setUiEnv
      startDevMode
    ;;
    --heroes)
      setHeroesEnv
      startDevMode
    ;;
    --villains)
      setVillainsEnv
      startDevMode
    ;;
    --fights)
      setFightsEnv
      startDevMode
    ;;
    --statistics)
      setStatisticsEnv
      startDevMode
    ;;
  esac
done