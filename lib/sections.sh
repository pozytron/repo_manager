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
