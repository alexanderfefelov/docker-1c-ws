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

## Как опубликовать конфигурацию?

Для публикации конфигурации запустите утилит `webinst` в контейнере:

    docker exec 1c-ws webinst ...ПАРАМЕТРЫ...

## Где мои данные?

Публикации 1С:Предприятия вы можете найти в каталоге `/var/lib/docker/volumes/1c-ws-data/_data`, конфигурационные файлы сервера Apache -- в каталоге `/var/lib/docker/volumes/1c-ws-httpd-conf/_data`.

## Как это удалить?

Удалите контейнер:

    docker rm -f 1c-ws

:fire: Удалите данные:

    docker volume rm 1c-ws-data
    docker volume rm 1c-ws-httpd-conf
