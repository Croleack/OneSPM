# OneSPM (iOS)

<!--BEGIN_DESCRIPTION-->
OneSPM - представляет собой мини-приложения для определения ip адреса пользователя
<!--END_DESCRIPTION-->

## Установка и интеграция

1. Для установки выполните следующие действия:

Добавьте пакет в зависимости вашего проекта, перейдя в файл проекта на вкладке «Зависимости пакета» и щелкнув значок «плюс».

    ![](.github/images/1.png)

2. В открывшемся окне введите ссылку на Git-репозиторий, где находится SDK. Слева вы увидите значок пакета, выберите «До следующей основной версии» в поле «Правило зависимостей» и укажите текущую версию пакета как «1.0.6». После этого нажмите кнопку «Добавить пакет», и вы увидите всплывающее окно с информацией о статусе пакета.

    ![](.github/images/2.png)

3. После успешного добавления пакета в ваш проект вы увидите пакеты и зависимости CurrencyPackage, используемые для работы с SDK, в иерархии вашего проекта.

4. Добавив пакет, вы можете увидеть его составные части, а именно View и ViewController доступной для использования, ниже представлен код, позволяющий продемонстировать работоспособность спм:

```swift
import UIKit
import CurrencyPackage
import FastPackage

enum MiniAppType {
    case fastViewController
    case currencyViewController

    func getView() -> UIView {
        switch self {
        case .fastViewController:
            return FirstMiniAppView()
        case .currencyViewController:
            return CurrencyView()
        }
    }

    func getViewController() -> UIViewController {
        switch self {
        case .fastViewController:
            return PlayViewController()
        case .currencyViewController:
            return CurrencyViewController()
        }
    }
}
```

5. Примеры демонстрирующие как выглядит мини-приложение 
    ![](.github/images/4.png)
        ![](.github/images/5.png)
            ![](.github/images/6.png)
