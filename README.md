# Hotels

## Проект в данный момент находится в работе
<img width="291" alt="HotelsMain" src="https://user-images.githubusercontent.com/68674699/152143753-1dfd0aaa-28e8-4f37-9def-a47d11ca8ae1.png">

 ## О проекте
 - Проект Hotels - бронирование отелей.
 - Список отелей с возможностью просмотра детальной информации о них 
 
 ## Что будет
 - Сортировка списка отелей по количеству свободных номеров и отдаленности от центра города
 - Выбор города
 - Возможность бронирования отеля (Firebase)
 - Добавление отеля в избранное (CoreData)
 - Отображение отеля на карте
 
 ## Что используется
 - Сервис данных https://github.com/Ansany/JsonDB/tree/main/Hotels
 - MVP (+Router - для навигации, +Configurator - для сборки модулей)
 - Kingfisher (загрузка и кэширование изображений) - реализован в NetworkLayer
 - SnapKit
 - CoreData
 
 ## Структура проекта
  - Application - запуск приложения
  - Modules - экраны (HotelsListViewController, HotelDetailsViewController), Configurator, Router
  - Library - содержит extentions, customViews, assets (в группе CustomViews находятся кастомные ячейки для tableView)
  - Model - модели данных (не разделённые на entity/entry)
  - Services - Сервисный слой, работа с запросами в интернет. (URLService, NetWorkLayer)
 
