# ToDoCoreData

Создайте приложение с использованием любого публичного api.

### Важно:

+ Создать модель для парсинга джейсона
+ Распарсить джейсон и отобразить данные на экране
+ Вынести всю работу с сетью в класс NetworkManager

### Примечание 1

Метод для парсинга джейсона должен иметь как минимум один обязательный параметр с боком замыкания. При вызове метода во вью контроллере в блоке замыкания должен возвращаться экземпляр модели (массив экземпляров), значения свойств которого нужно передать в соответствующие элементы интерфейса. Это называется асинхронной передачей данных от сетевого менеджера во вью контроллер.

### Примечание 2

Для асинхронной передачи данных и обработки ошибок при сетевых запросах можно использовать тип Result (необязательно).

Списки публичных апишек:

https://github.com/public-apis/public-apis

https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/

https://rapidapi.com/collection/list-of-free-apis



=========================================================

## URLSession

> + Знакомство с API URLSession    
> + HTTP запросы    
> + URLSessionDataTask    
> + Загрузка изображения из сети

## JSON    

> + Анатомия JSON формата    
> + Модель данных    
> + Парсинг JSON     JSONDecoder    
> + Обработка ошибок
