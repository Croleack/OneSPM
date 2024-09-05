# OneSPM (iOS)

<!--BEGIN_DESCRIPTION-->
OneSPM - представляет собой мини-приложения для определения ip адреса пользователя
<!--END_DESCRIPTION-->

## Установка и интеграция

1. Для установки выполните следующие действия:

Добавьте пакет в зависимости вашего проекта, перейдя в файл проекта на вкладке «Зависимости пакета» и щелкнув значок «плюс».

<img width="1404" alt="1" src="https://github.com/user-attachments/assets/d9851761-e879-4f0f-aa6d-0646f6325798">


2. В открывшемся окне введите ссылку на Git-репозиторий, где находится SDK. Слева вы увидите значок пакета, выберите «До следующей основной версии» в поле «Правило зависимостей» и укажите текущую версию пакета как «1.0.7». После этого нажмите кнопку «Добавить пакет», и вы увидите всплывающее окно с информацией о статусе пакета.

<img width="1090" alt="2" src="https://github.com/user-attachments/assets/5c1b0e89-4aeb-4f08-b5d2-c1709a3386f2">

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
 <img width="504" alt="Снимок экрана 2024-09-05 в 18 47 43" src="https://github.com/user-attachments/assets/39a80cec-7e98-4aa0-b062-f5170ebfa960">
<img width="275" alt="Снимок экрана 2024-09-05 в 18 47 17" src="https://github.com/user-attachments/assets/991ac67c-65e1-4126-b713-9aeb4e1f2fa8">

