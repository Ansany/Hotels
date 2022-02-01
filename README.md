# Hotels

## Проект в данный момент находится в работе
<img width="222" alt="HotelMain" src="https://user-images.githubusercontent.com/68674699/151939464-29e5b20d-b18b-4296-821e-89184c253862.png">

 ## О проекте
 - Проект Hotels - бронирование отелей.
 - Список отелей с возможностью просмотра детальной информации о них 
 
 ## Что будет
 - Сортировка списка отелей по количеству свободных номеров и отдаленности от центра города
 - Возможность бронирования отеля
 - Отображение отеля на карте
 
 ## Что используется
 - MVP (+Router - для навигации, +Configurator - для сборки модулей)
 - Adapter - для построения TableView
 - Kingfisher (загрузка и кэширование изображений) - реализован в NetworkLayer
 - SnapKit
 
 ## Структура проекта
  - Application - запуск приложения
  - Modules - экраны (HotelsListViewController, HotelDetailsViewController), Configurator, Router
  - Library - содержит extentions, customViews, assets (в группе CustomViews находятся кастомные ячейки для tableView)
  - Model - модели данных (не разделённые на entity/entry)
  - Services - Сервисный слой, работа с запросами в интернет. (URLService, NetWorkLayer)
 
