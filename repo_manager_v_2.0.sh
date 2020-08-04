#!/usr/bin/env bash

#!/bin/bash
# Reset
Color_Off='\033[0m' # Text Reset

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;37m'  # White

# Bold
BBlack='\033[1;30m'  # Black
BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'   # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'   # Cyan
BWhite='\033[1;37m'  # White

# Underline
UBlack='\033[4;30m'  # Black
URed='\033[4;31m'    # Red
UGreen='\033[4;32m'  # Green
UYellow='\033[4;33m' # Yellow
UBlue='\033[4;34m'   # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'   # Cyan
UWhite='\033[4;37m'  # White

# Background
On_Black='\033[40m'  # Black
On_Red='\033[41m'    # Red
On_Green='\033[42m'  # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'   # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'   # Cyan
On_White='\033[47m'  # White

# High Intensity
IBlack='\033[0;90m'  # Black
IRed='\033[0;91m'    # Red
IGreen='\033[0;92m'  # Green
IYellow='\033[0;93m' # Yellow
IBlue='\033[0;94m'   # Blue
IPurple='\033[0;95m' # Purple
ICyan='\033[0;96m'   # Cyan
IWhite='\033[0;97m'  # White

# Bold High Intensity
BIBlack='\033[1;90m'  # Black
BIRed='\033[1;91m'    # Red
BIGreen='\033[1;92m'  # Green
BIYellow='\033[1;93m' # Yellow
BIBlue='\033[1;94m'   # Blue
BIPurple='\033[1;95m' # Purple
BICyan='\033[1;96m'   # Cyan
BIWhite='\033[1;97m'  # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'  # Black
On_IRed='\033[0;101m'    # Red
On_IGreen='\033[0;102m'  # Green
On_IYellow='\033[0;103m' # Yellow
On_IBlue='\033[0;104m'   # Blue
On_IPurple='\033[0;105m' # Purple
On_ICyan='\033[0;106m'   # Cyan
On_IWhite='\033[0;107m'  # White

function coloredEcho() {
    local exp=$1
    local color=$2
    if ! [[ $color =~ '^[0-9]$' ]]; then
        case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white | *) color=7 ;; # white or invalid color
        esac
    fi
    tput setaf $color
    echo $exp
    tput sgr0
}

# forks would require url:
# `https://github.com/{user}/{currentGroup}_{repo}`

# Github logins
users=(AnnaWolska SlawomirJurak MaciejMajchrzak cerassus garryCold kamilkrysiak MiloszDziadosz mkazimie jarmatys piotrgra RafalDoranczyk KatBotkowska tomzdu Vladek23 ZWasilonek pielarz)
# users=(YaNusH tomaSh jesika brajan12)

# List of repo names
repos=("REPO_1" "REPO_2" "FSB_O_Exam" "QUIT")

# Group signature
currentGroup="WAR_FSB_O_05"
# currentGroup="GROUP_EXAM_REPO_01"

function renderIntro() {
    # echo -n "Enter a name:"
    # read NAME
    # echo "Your name is:" $NAME
    clear
    renderLine
    renderInfo "       REPO MANAGER                                                Hack away! :)         "
    renderLine
    renderDefault " TO JEST OK :)                                                                          "
    renderAlert " TO JEST ALERT                                                                           "
    renderError " TO JEST ERROR                                                                          "
    renderSuccess " TO JEST SUKCES :)                                                                       "

}
function renderHeader() {
    # echo -n "Enter a name:"
    # read NAME
    # echo "Your name is:" $NAME
    clear
    renderLine
    renderInfo "REPO DLA: $1                                         "
    renderLine
}
function renderFooter() {
    renderLine
    renderInfo "        ZAKOŃCZONO SKRYPT                                        Dzięki, pozytron        "
    renderLine
}
function renderSection() {
    renderLine
    renderInfo "$1"
    renderLine
}
function renderLine() {
    renderInfo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}
function renderScreen() {
    clear
    #  Renderuję nagłówek skryptu
    # renderHeader
    renderSection " SYGNATURA GRUPY: $currentGroup                                                           "
}

function renderInfo() {
    # function get's
    # $1 text
    echo -e "$Black $On_Purple $1 ${Color_Off}                                                                      "
    # -e [kolorTekstu] [kolorTła] [Tekst] [parametr Text Reset ]
}
function renderDefault() {
    # function get's
    # $1 text
    echo -e "$BWhite $On_IBlue $1  ${Color_Off}                                                                      "
    # -e [kolorTekstu] [kolorTła] [Tekst] [parametr Text Reset ]
}
function renderAlert() {
    # function get's
    # $1 text
    echo -e "$BBlack $On_Yellow $1 ${Color_Off}                                                                      "
    # -e [kolorTekstu] [kolorTła] [Tekst] [parametr Text Reset ]
}
function renderError() {
    # function get's
    # $1 text
    echo -e "${BWhite} $On_IRed $1  ${Color_Off}                                                     "
    # -e [kolorTekstu] [kolorTła] [Tekst] [parametr Text Reset ]
}
function renderSuccess() {
    # function get's
    # $1 text
    echo -e "$BBlack $On_Green $1 ${Color_Off}                                                                      "
    # -e [kolorTekstu] [kolorTła] [Tekst] [parametr Text Reset ]
}

function main() {

  # Set Sleep to some value to see each step
  # Set Sleep to 0 to gain max speed :)
  function shortSleep() {
      sleep 2
  }
  function mediumSleep() {
      sleep 4
  }
  #  Renderuję nagłówek skryptu
  renderIntro
  
  #select what's going to happen
  renderSection "WYBIERZ REPO DO KLONOWANIA:                                                              "
  
  select repo in "${repos[@]}"; do
      case "$repo" in
      "Zakończ!")
          exit 1
          break
          ;;
      "")
          renderError "MUSISZ WYBRAĆ LICZBĘ Z ZAKRESU OD 1 DO ${#repos[@]}                  "
          continue
  
          ;;
      *)
          break
          ;;
      esac
  
  done
  cd repos
  
  #If everything is ok
  repoName=${currentGroup}_${repo}
  mkdir ${currentGroup}
  cd ${currentGroup}
  
  for user in "${users[@]}"; do
      renderHeader $user
      #If dir not exist
      renderInfo "TWORZĘ KATALOG...                                                                        "
      renderLine
      if [ ! -d "$user" ]; then
          coloredEcho "mkdir $repoName" Yellow
          mkdir $user
      fi
  
      coloredEcho "mkdir or cd $user" Yellow
      cd $user
      pwd
      shortSleep
      renderSuccess "GOTOWE !!!                                                                               "
      shortSleep
      renderHeader $user
      renderInfo "POBIERAM FORK...                                                                         "
      renderLine
      # timeout 10 echo " NEXT >> "
      coloredEcho "git pull or git clone" Blue
      coloredEcho "$user/$repoName" Blue
      #Clone if is not exist or pull if exist
      pwd
      if [ ! -d "$repoName" ]; then
          git clone https://github.com/$user/$repoName.git
  
      else
          git pull
      fi
      mediumSleep
      renderSuccess "GOTOWE !!!                                                                               "
      shortSleep
  
      cd $repoName
      renderHeader $user
      renderInfo "INSTALUJĘ NPM'em...                                                                       "
      renderLine
      coloredEcho "npm install" Green
      npm i
      pwd
      mediumSleep
      renderSuccess "GOTOWE !!!                                                                               "
      shortSleep
      cd ..
      renderHeader $user
      renderLine
      renderSuccess "GOTOWE !!!                                                                               "
      coloredEcho "$user/$repoName GOTOWE !!!" Green
      cd ..
      cd ..
      shortSleep
  done
  
  # Koniec :)
  renderFooter
  renderSuccess "                                                                                         "

}

main $@
