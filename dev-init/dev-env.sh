#!/usr/bin/env bash

JAVA_HOME="/etc/alternatives/jre_17"
UI_HTTP_PORT=8080
HEROES_PORT=8081
VILLAINS_PORT=8082
FIGHTS_PORT=8083


function setUiEnv() {

}

function setHeroesEnv() {
  DEBUG_PORT=5007
  APP_PORT=${HEROES_PORT}
  DB_USER=superman
  DB_PWD=superman
  DB_HOST=localhost
  DB_SCHEMA=heroes_database
  CORS_ORIGINS="/.*/"
  CORS_METHODS="GET,POST,DELETE"
}

function setVillainsEnv() {
  DEBUG_PORT=5006
  APP_PORT=${VILLAINS_PORT}
  DB_USER=suberbad
  DB_PWD=suberbad
  DB_HOST=suberbad
  DB_SCHEMA=villains_database
  CORS_ORIGINS="/.*/"
  CORS_METHODS="GET,POST,DELETE"
}

function setFightsEnv() {
  DEBUG_PORT=5008
  APP_PORT=${FIGHTS_PORT}
  HERO_HOST=localhost
  VILLAIN_HOST=localhost
  DB_USER=superfight
  DB_PWD=superfight
  DB_HOST=localhost
  DB_SCHEMA=fights
  CORS_ORIGINS="/.*/"
  CORS_METHODS="GET,POST,DELETE"
}

function setStatisticsEnv() {
    
}

function startDevMode() {
  quarkus dev -Dquarkus.analytics.disabled=false -Dmaven.repo.local=/home/user/.m2/repository -Dquarkus.http.host=0.0.0.0 -Dmaven.test.skip -Ddebug=${DEBUG_PORT}
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