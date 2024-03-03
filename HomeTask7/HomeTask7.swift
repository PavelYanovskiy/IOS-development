Задание:
1. Выбрать архитектурный паттерн. 
Переписать свой проект с друзьями, группами и фото с использованием этого паттерна.


Для проекта с друзьями, группами и фото хорошо подойдет архитектурный паттерн MVP (Model-View-Presenter) 
или MVVM (Model-View-ViewModel).
Создадим проект с использованием MVVM.
Создадим модели данных, представления и модели представления для друзей, групп и фотографий.

Модели данных (Model):
struct Friend {let name: Stringlet age: Int}
struct Group {let name: Stringlet members: [Friend]}
struct Photo {let title: Stringlet imageURL: String}

Представления (Views):
В данном примере мы не будем создавать реальные пользовательские интерфейсы, 
а просто определим классы представлений.
class FriendListView {func displayFriends(_ friends: [Friend]) {for friend in friends {print("Name: (friend.name), Age: (friend.age)")}}}
class GroupListView {func displayGroups(_ groups: [Group]) {for group in groups {print("Group Name: (group.name)")for member in group.members {print("Member: (member.name)")}}}}
class PhotoView {func displayPhoto(_ photo: Photo) {print("Title: (photo.title), ImageURL: (photo.imageURL)")}}

Модели представлений (ViewModels):
class FriendListViewModel {var friends: [Friend] = []
func fetchFriends() {
    // Загрузка списка друзей из сети
    friends = DataService.shared.fetchFriendsFromNetwork()
}
}
class GroupListViewModel {var groups: [Group] = []
func fetchGroups() {
    // Загрузка списка групп из сети
    groups = DataService.shared.fetchGroupsFromNetwork()
}
}
class PhotoViewModel {var photo: Photo
init(photo: Photo) {
    self.photo = photo
}
}

2. Провести рефакторинг кода. 
Постарайтесь сделать так, чтобы в вашем коде соблюдались основные принципы. 
Также проверьте, что у вас используются понятные названия, название классов с большой буквы, 
функций с маленькой и так далее.

Для решения задачи 2, после создания базовой структуры проекта, проведем рефакторинга кода, 
необходимо следовать основным принципам чистого кода (SOLID) и сделать его более понятным 
и поддерживаемым.

Например, можно вынести логику получения данных из ViewModel в отдельный сервис.
class DataService {static let shared = DataService()
func fetchFriendsFromNetwork() -> [Friend] {
    // Здесь должен быть код для получения списка друзей из сети
    return [Friend(name: "Mike", age: 25), Friend(name: "Jane", age: 20)]
}
func fetchGroupsFromNetwork() -> [Group] {
    // Здесь должен быть код для получения списка групп из сети
    let friend1 = Friend(name: "Mike", age: 25)
    let friend2 = Friend(name: "Jane", age: 20)

    return [Group(name: "Family", members: [friend1, friend2])]
}
}

3. Подключить SwiftLint к проекту. Избавиться от ошибок и предупреждений.

Для подключения и использования SwiftLint в проекте, нужно выполнить следующие шаги:

3.1. Установка SwiftLint:
   - Установить SwiftLint с помощью Homebrew на macOS:
   brew install swiftlint

   - Есть другие варианты установки, например через CocoaPods 
  

3.2. Добавляем SwiftLint в проект:
   - После установки, создайте конфигурационный файл .swiftlint.yml в корне
   проекта для настройки правил SwiftLint. Пример конфигурации:
     ```yaml
     disabled_rules: # Список правил, которые следует отключить
       - colon
       - force_cast
     opt_in_rules: # Список правил, которые следует явно включить (по желанию)
       - empty_count
       - unused_params
     included: # Список папок и файлов, которые надо просматривать
       - Source
       - Tests
    

3.3. Запуск SwiftLint:
   - Открываем терминал, переходим в корневую директорию проекта и выполняем команду:
     
     swiftlint

SwiftLint пройдет по проекту, оценив его на соответствие правилам и выдаст предупреждения 
или ошибки, если что-то не так.

3.4. Интеграция SwiftLint в CI/CD:
   - Чтобы автоматически проверять код SwiftLint'ом в процессе CI/CD, 
нужно добавить команду swiftlint как часть скрипта сборки.

3.5. Решение предупреждений и ошибок:
   - Исправляем предупреждения и ошибки, которые выдает SwiftLint, 
   следуя его рекомендациям и соблюдая стандарты оформления кода.



4. Покрыть свой код unit и ui-тестами.

Для написания unit-тестов в Swift мы используем XCTest framework  
Напишем простые unit тесты для проверки работы ViewModel и 
ui-тесты для проверки отображения данных на экране.

import XCTest

class ViewModelTests: XCTestCase {
func testFetchFriends() {
    let viewModel = FriendListViewModel()
    viewModel.fetchFriends()
    XCTAssertFalse(viewModel.friends.isEmpty)
}

func testFetchGroups() {
    let viewModel = GroupListViewModel()
    viewModel.fetchGroups()
    XCTAssertFalse(viewModel.groups.isEmpty)
}
}

UI-тесты:
UI-тесты позволяют проверить, что пользовательский интерфейс приложения работает корректно. 
Для этого вы можете использовать тестовые фреймворки, такие как XCTest/UI Testing.
Пример UI-теста для проверки отображения списка друзей на экране:

import XCTest

class FriendsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }

    func testFriendsListDisplayed() {
        // Проверка, что список друзей отображается на экране
        XCTAssertTrue(app.tables["friendsTableView"].exists)
    }
}
