
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
# check if group catalog exists if not, create
if [ ! -d "$currentGroup" ]; then
        coloredEcho "mkdir $currentGroup" Yellow
        mkdir $currentGroup
    fi

for user in "${users[@]}"; do
# Go into currentGroup catalog
cd ${currentGroup}
    renderHeader $user
    #If dir not exist
    renderInfo "TWORZĘ KATALOG...                                                                        "
    renderLine
# check if user catalog exists if not, create
    if [ ! -d "$user" ]; then
        coloredEcho "mkdir $repoName" Yellow
        mkdir $user
    fi
    # enter user catalog
    cd $user
    pwd
    shortSleep
    renderSuccess "GOTOWE !!!                                                                               "
    shortSleep
    renderHeader $user
    renderInfo "POBIERAM FORK...                                                                         "
    renderLine
    # timeout 10 echo " NEXT >> "
    # coloredEcho "git pull or git clone" Blue
    coloredEcho "$user/$repoName" Blue

    pwd
    # Clone if catalog with repo not exist or pull if exist
    if [ ! -d "$repoName" ]; then
    coloredEcho "git clone" Blue
        git clone https://github.com/$user/$repoName.git

    else
    coloredEcho "git pull" Blue
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
