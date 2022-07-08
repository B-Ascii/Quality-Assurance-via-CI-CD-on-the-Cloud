if [ $# -eq 0 ]
  then
    echo "Arguments were not supplied"
    exit
fi

if sam build; then
        echo "Success! Build completed"
else
        echo "Failed to build"
        exit
fi

git pull

git add --all

git commit -m "$1"

git push 

echo "Launch locally?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sam local start-api --port 8080; break;;
        No ) exit;;
    esac
done

