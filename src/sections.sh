function renderHeader(){
    # echo -n "Enter a name:"
    # read NAME
    # echo "Your name is:" $NAME

    renderInfo    "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    renderInfo    "       POZYTRON BASH TOOL            Based on Beniamin script     "
    renderInfo    "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    renderAlert   " TO JEST ALERT                                                    "
    renderError   " TO JEST ERROR                                                   "
    renderSuccess " TO JEST OK :)                                                    "
}
function renderFooter(){
    renderInfo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    renderInfo "        ZAKOŃCZONO SKRYPT                 Dzięki, pozytron        "
    renderInfo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}
function renderSection(){
    renderInfo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    renderInfo "$1"
    renderInfo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}