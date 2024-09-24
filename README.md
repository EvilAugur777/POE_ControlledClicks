# POE_ControlledClicks

| Hotkey | Description |
| --- | --- |
| F2 | Disable |
| F3 | Enable |
| F4 | Scan mode |

## English

Assumed usage scenario:
1) Run the script using AutoHotkey (AHK)
2) Enter any search string in the search bar, which will successfully find an item in the desired location in the inventory, causing a frame to appear
3) Press F4 to enter scan mode
4) Move the cursor to the frame, and if found, a notification will appear, and the script will remember the frame's boundaries
5) After finding the frame, the script will automatically switch to F2 mode
6) Enter the desired search string
7) Press F3 to activate the script
8) Take the desired sphere with the Shift key held down

Script behavior:
When the left mouse button is held down, the script will generate clicks until the frame becomes active again (corresponding to the search results). After finding the search results, the left mouse button will remain held down, and in POE, the click will be confirmed by releasing the left mouse button. To avoid an extra click on the item, release the left mouse button next to the item. Automatic release is not implemented intentionally to avoid violating game rules by performing a single action.

## Русский

Предполагаемый сценарий использования:
1) Запустить скрипт при помощи AHK
2) В поиск ввести любую строку, которая благополучно найдет предмет в необходимом месте сундука для появления рамки
3) Нажать f4, чтобы перейти в режим сканирования
4) Навести курсор на рамку, при удачном нахождении отобразится уведомление, а скрипт запомнит границы рамки
5) После нахождения рамки скрипт сам переключается в режим f2
6) Задать в поиск необходимую строку
7) При нажатии f3 скрипт активируется
8) Взять нужную сферу с зажатым Shift

Поведение скрипта:
Активированный скрипт при зажатом ЛКМ генерирует клики до тех пор, пока рамка снова не станет активной (соответствующей результатам поиска). После нахождения результатов поиска ЛКМ остается зажатым, а в POE клик подтверждается отжатием левой кнопки мыши поэтому чтобы не вызвать лишний клик по предмету - отожмите ЛКМ мимо предмета. Автоматическое отжатие в скрипте не реализовано намеренно, чтобы не нарушать правила игры по выполнению единственного действия.
