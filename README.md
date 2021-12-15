# Запуск приложения

Для того, чтобы запустить приложение, выполните следующие команды у себя в окне терминала:

* Склонируйте репозиторий с GitHub и перейдите в папку приложения:
```
git clone https://github.com/Tommyleerom/self_destructing_messages.git
cd self_destructing_messages
```

* Установите необходимые гемы приложения, указанные в файле `Gemfile`:
```
bundle install
```

* Создайте базу данных, запустите миграции для базы данных:
```
bundle exec rake db:create
bundle exec rake db:migrate
```
Приложение использует СУБД `Postgresql`. При необходимости создайте нового пользователя в СУБД для этого приложения
или измените СУБД на другую, изменив настройки файла `config/database.yml`.

* Запустите приложение:
```
bundle exec rails server
```
