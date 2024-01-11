## Part 1. Готовый докер
- Взять официальный докер образ с nginx и выкачать его при помощи `docker pull`
- Проверить наличие докер образа через `docker images`
![all](/src/images/1.1.PNG)<br>
- Запустить докер образ через `docker run -d nginx`
- Проверить, что образ запустился через `docker ps`
![all](/src/images/1.2.PNG)<br>
- Посмотреть информацию о контейнере через `docker inspect 92c7da0a7ba6`, где "92c7da0a7ba6" ID контейнера
    1. Размер контейнера:
    ![all](/src/images/1.3.PNG)<br>
    2. Cписок портов:
    ![all](/src/images/1.4.PNG)<br>
    3. IP контейнера:
    ![all](/src/images/1.5.PNG)<br>

- Остановить докер образ через `docker stop 92c7da0a7ba6` и проверить, что образ остановился через `docker ps`
![all](/src/images/1.6.PNG)<br>
- Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду `run -d -p 80:443 nginx`
![all](/src/images/1.7.PNG)<br>
- Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx
![all](/src/images/1.8.PNG)<br>
- Перезапустить докер контейнер через `docker restart Carmink_lons`, где "Carmink_lons" ID контейнера и проверяем, что докер запустился
![all](/src/images/1.9.PNG)<br>

## Part 2. Операции с контейнером
- Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду `exec -it Carmink_lons sh`, где "-it" интерактивный режим, а "Carmink_lons" это имя контейнера
![all](/src/images/2.1.PNG)<br>
- Копируем файл nginx.conf на локальный компьютер с помощью команды `docker cp Carmink_lons:[путь до файла] /home/hostname`
![all](/src/images/2.2.PNG)<br>
- Настроить в нем по пути /status отдачу страницы статуса сервера nginx
![all](/src/images/2.3.PNG)<br>
- Скопировать файл nginx.conf внутрь докер образа через команду `docker cp nginx.conf Carmink_lons: /etc/nginx/`
![all](/src/images/2.4.PNG)<br>
- Сохраняем и перезапускаем nginx внутри докер образа через команду exec и проверяем что по адресу localhost:80/status отдается страничка со статусом сервера nginx
![all](/src/images/2.5.PNG)<br>
- Экспортировать контейнер в файл container.tar через команду `docker export Carmink_lons > container.tar` и останавливаем его
![all](/src/images/2.6.PNG)<br>
- Удалить образ через `docker rmi -f nginx`, не удаляя перед этим контейнеры, а затем удалаем контейнер с помощью команды `docker rm Carmink_lons`
![all](/src/images/2.7.PNG)<br>
- Импортировать контейнер обратно через команду `docker import container.tar nginx:latest` и запустить его 
![all](/src/images/2.8.PNG)<br>
- Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx
![all](/src/images/2.9.PNG)<br>

## Part 3. Мини веб-сервер
-  Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!
![all](/src/images/3.1.PNG)<br>
- Запустить написанный мини сервер через spawn-fcgi на порту 8080
![all](/src/images/3.2.PNG)<br>
- Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
![all](/src/images/3.3.PNG)<br>
- Проверить, что в браузере по localhost:81 отдается написанная вами страничка
![all](/src/images/3.4.PNG)<br>

## Part 4. Свой докер
### Написать свой докер образ, который:
- собирает исходники мини сервера на FastCgi 
- запускает его на 8080 порту
- копирует внутрь образа написанный ./nginx/nginx.conf
- запускает nginx.
![all](/src/images/4.1.PNG)<br>
![all](/src/images/4.2.PNG)<br>

- Собрать написанный докер образ через `docker build -t main:latest`
![all](/src/images/4.3.PNG)<br>
- Проверить через `docker images`, что все собралось корректно и запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине
![all](/src/images/4.4.PNG)<br>
- Проверить, что по localhost:80 доступна страничка написанного мини сервера
![all](/src/images/4.5.PNG)<br>
Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx
![all](/src/images/4.6.PNG)<br>
- Перезапускаем образ и проверяем, что теперь по localhost:80/status отдается страничка со статусом nginx
![all](/src/images/4.7.PNG)<br>
## Part 5. Dockle
- Просканировать образ из предыдущего задания через `dockle main`
![all](/src/images/5.1.PNG)<br>
- Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений
![all](/src/images/5.2.PNG)<br>
- Исправленый докер файл
![all](/src/images/5.3.PNG)<br>
 

