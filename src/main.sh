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
