# FLASHCARDS

Тестовое задание


* Ruby version: 2.7.3

* Database creation: rake db:setup

* Database initialization: rake db:migrate

* Deployment instructions: rails s

## Ход выполнения

1. rails new flashcards  (создание приложения)
2. rake db:create (создание базы данных)
3. rails generate controller home index (создание основного контроллера)
4. rails generate scaffold Card name:string description:string level:integer lock_to:datetime attempts:integer (генерация ресурса карточек)
5. rails db:migrate (правка файла миграции и запуск миграции)
6. настроил валидации и скоупы в моделe Card
7. по-правил экшены в контроллере карточек, удалил лишнее и добавил логику
8. по-правил роуты
9. по-правил и почистил вьюшки, с учетом логики
10. добавил лэйаут для показа карточки со стилями и логикой на вьюхе в JS  
11. залил на github


