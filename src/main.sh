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
        renderError "MUSISZ WYBRAĆ LICZBĘ Z ZAKRESU OD 1 DO ${#repos[@]}"
        continue

        ;;
    *)
        break
        ;;
    esac

done

#If everything is ok
repoName=${currentGroup}_${repo}
renderError "SSSSSSS"
mkdir ${currentGroup}
cd ${currentGroup}

for user in "${users[@]}"; do
    renderHeader
    #If dir not exist
    if [ ! -d "$user" ]; then
        # echo -e "${On_Blue} Making directory ${bg_selected} $user ${Color_Off}"
        renderDefault "TWORZĘ KATALOG $user "
        mkdir $user
    fi
    # echo -e "${On_Blue} Entering directory ${bg_selected} $user ${Color_Off}"
    renderDefault "PRZECHODZĘ DO KATALOGU $user "
    cd $user

    #Clone if is not exist or pull if exist
    if [ ! -d "$repoName" ]; then
        git clone https://github.com/$user/$repoName.git
    else
        cd $repoName
        renderDefault "POBIERAM $repoName ... OD $user"
        git pull

        npm i
        renderAlert "INSTALUJĘ NPM'em..."
        cd ..
        renderSuccess "GOTOWE !!!"
    fi
    cd ..
done

# Koniec :)
renderFooter
renderSuccess "                                                                                         "
