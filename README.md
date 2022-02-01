# Hotels

## Проект в данный момент находится в работе
<img width="395" alt="HotelMain" src="https://user-images.githubusercontent.com/68674699/151939254-4f45084f-01c6-4042-bce7-8ade9fe1f5a4.png">
 
 ## Структура проекта
  - Application - запуск приложения
  - Modules - экраны (HotelsListViewController, HotelDetailsViewController), Configurator, Router
  - Library - содержит extentions, customViews, assets (в группе CustomViews находятся кастомные ячейки для tableView)
  - Model - модели данных (не разделённые на entity/entry)
  - Services - Сервисный слой, работа с запросами в интернет. (URLService, NetWorkLayer)
  
 ## Pods
  - Kingfisher (загрузка и кэширование изображений) - реализован в NetworkLayer
  - SnapKit
  
