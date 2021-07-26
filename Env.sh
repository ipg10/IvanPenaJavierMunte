echo "Environment Variable"

requirements="django environs[django] psycopg2-binary whitenoise gunicorn"

for i in $@; do
    [ "$i" == '-requirements' ] && pipenv install $requirements
    [ "$i" == '-shell' ] && pipenv shell
done
