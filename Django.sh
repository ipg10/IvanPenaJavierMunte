echo "Django Examples"

# [ ! -f manage.py ] && django-admin startproject config .
# [ ! -d website ] && python manage.py startapp website

for i in $@; do
    [ $i == '-r' ] && ( ls
        python manage.py runserver )
    [ $i == '-d' ] && start http://localhost:8000
    [ $i == '-m' ] && ( ls
        python manage.py makemigrations
        python manage.py migrate --run-syncdb)
    [ $i == '-c' ] && python manage.py collectstatic
    [ $i == '-u' ] && python manage.py createsuperuser
done

[ $1 == '-all' ] && (
    python manage.py migrate
    python manage.py createsuperuser
    python manage.py makemigrations
    python manage.py migrate --run-syncdb
    python manage.py collectstatic
    start http://localhost:8000
    python manage.py runserver
)