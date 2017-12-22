# docker-1c-ws

    DO NOT USE
    WORK IN PROGRESS

## Что это?

docker-1c-ws -- это веб-сервер (Apache 2.4) для 1С:Предприятия в контейнере Docker.

## Как это установить?

Для установки и начального запуска получите дистрибутив сервера 1С:Предприятия: https://users.v8.1c.ru/ -> Скачать обновления -> Технологическая платформа 8.3 -> ВЕРСИЯ -> Cервер 1С:Предприятия (64-bit) для DEB-based Linux-систем -> Скачать дистрибутив

Клонируйте репозиторий:

    git clone https://github.com/alexanderfefelov/docker-1c-ws.git

Скопируйте deb-файлы дистрибутива сервера 1С:Предприятия в каталог `docker-1c-ws` и затем выполните команды:

    cd docker-1c-ws
    ./build.sh
    ./run.sh

## Как остановить/запустить/перезапустить контейнер?

Для управления контейнером используйте команды:

    docker stop 1c-ws
    docker start 1c-ws
    docker restart 1c-ws

## Как создать/удалить публикацию?

Для создания/удаления публикации запустите утилиту `webinst` в контейнере:

    docker exec 1c-ws webinst -publish -apache24 ...ДРУГИЕ ПАРАМЕТРЫ... -confPath /usr/local/apache2/conf/httpd.conf

или

    docker exec 1c-ws webinst -delete -apache24 ...ДРУГИЕ ПАРАМЕТРЫ... -confPath /usr/local/apache2/conf/httpd.conf

При этом физический каталог следует указывать внутри каталога `/data`, например `/data/demo`.

Если для публикации необходимо использовать vrd-файл, например `demo.vrd`, скопируйте его в каталог `/var/lib/docker/volumes/1c-ws-data/_data`. После этого вы можете указать путь к нему в качестве параметра утилиты `webinst` в виде `/data/demo.vrd`.

## Где мои данные?

Публикации 1С:Предприятия вы можете найти в каталоге `/var/lib/docker/volumes/1c-ws-data/_data`, конфигурационные файлы сервера Apache -- в каталоге `/var/lib/docker/volumes/1c-ws-httpd-conf/_data`.

## Как это удалить?

Удалите контейнер:

    docker rm -f 1c-ws

:fire: Удалите данные:

    docker volume rm 1c-ws-data
    docker volume rm 1c-ws-httpd-conf
