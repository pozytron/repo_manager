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
    renderHeader
    #If dir not exist
    renderAlert "TWORZĘ KATALOG...                                                                        "
    if [ ! -d "$user" ]; then
        renderDefault "TWORZĘ KATALOG $user "
        mkdir $user
    fi

    coloredEcho "mkdir or cd $user" Yellow
    cd $user
    shortSleep
    renderHeader
    renderAlert "POBIERAM FORK...                                                                         "
    # timeout 10 echo " NEXT >> "
    coloredEcho "git pull or git clone" Blue
    coloredEcho "$user/$repoName" Blue
    #Clone if is not exist or pull if exist
    if [ ! -d "$repoName" ]; then
        git clone https://github.com/$user/$repoName.git

    else
        cd $repoName
        git pull
    fi
    mediumSleep
    s
    # cd $repoName
    renderHeader
    renderAlert "INSTALUJĘ NPM'em...                                                                       "
    npm i

    mediumSleep
    cd ..
    renderHeader
    renderSuccess "GOTOWE !!!                                                                               "
    cd ..
    shortSleep
done

# Koniec :)
renderFooter
renderSuccess "                                                                                         "
