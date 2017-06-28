#!/usr/bin/env bash

cd $HOME/VenusHelper

install() {
		sudo apt-get update
		sudo apt-get upgrade
sudo apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
sudo luarocks install oauth 
sudo luarocks install redis-lua 
sudo luarocks install lua-cjson 
sudo luarocks install ansicolors 
sudo luarocks install serpent 
}

function print_logo() {
	green "                             Venus | BOT Helper v1.2                           "
	green "          Developers : @ZakariaR             |      Powerful Helper Bot        "
	green "          Channel Telegram : @VenusOfficial  |      Full BOT Helper            "
	green "                             Thanks To : @BeyondTeam                           "
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]="                             Venus | BOT Helper v1.2                           "
    txtlogo[2]="          Developers : @ZakariaR             |      Powerful Helper Bot        "
    txtlogo[3]="          Channel Telegram : @VenusOfficial  |      Full BOT Helper            "
    txtlogo[4]="                             Thanks To : @BeyondTeam                           "
    printf "\e[31m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m"
}

function venusofficial() {
	echo -e "\e[0m"
	green "                             Venus | BOT Helper v1.2                           "
	green "          Developers : @ZakariaR             |      Powerful Helper Bot        "
	white "          Channel Telegram : @VenusOfficial  |      Full BOT Hrlper            "
	white "                             Thanks To : @BeyondTeam                           "
	red   "                               Edit By : @ZakariaR                             "
	red   "                                  @VenusOfficial                               "
	echo -e "\e[0m"
}

red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	print_logo
	venusofficial
	logo_play
	install
elif [ "$1" = "update" ]; then
	logo_play
	venusofficial
	update
	exit 1
else
	print_logo
	venusofficial
	logo_play
	green "Venus Helper BOT running..."
	#sudo service redis-server restart
	lua ./bot/bot.lua
fi
