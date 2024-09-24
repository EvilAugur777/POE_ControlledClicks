; Переменные для хранения координат и целевого цвета пикселя
PixelX := 0
PixelY := 0
DesiredColor := 0xE7B477  ; Цвет пикселя в формате RGB

; Переменные для управления макросом
toggle := false
searchMode := false

; Горячая клавиша для активации макроса и начала цикличных кликов ЛКМ
$F3::
    if (!PixelX or !PixelY)
    {
        ToolTip, Please find the pixel first with F4
        Sleep, 1500
        ToolTip  ; Убираем подсказку с экрана
        return
    }
    
    toggle := true
    ToolTip, Macro enabled and clicking...
    SetTimer, AutoClick, 100  ; Запускаем таймер для автокликов
    Sleep, 1000
    ToolTip  ; Убираем подсказку с экрана
return

; Горячая клавиша для остановки макроса
$F2::
    toggle := false
    SetTimer, AutoClick, Off  ; Отключаем таймер для автокликов
    ToolTip, Macro disabled
    Sleep, 1000
    ToolTip  ; Убираем подсказку с экрана
return

; Начать поиск пикселя с нажатием F4
$F4::
    ToolTip, Searching for pixel color 0xE7B477...
    searchMode := true
    SetTimer, CheckPixelColor, 100  ; Запускаем таймер для проверки цвета каждые 100 мс
return

; Таймер для поиска цвета пикселя
CheckPixelColor:
    if (!searchMode)
    {
        SetTimer, CheckPixelColor, Off
        return
    }

    ; Получаем текущие координаты курсора
    MouseGetPos, MouseX, MouseY

    ; Получаем цвет пикселя под курсором
    PixelGetColor, color, %MouseX%, %MouseY%, RGB

    ; Отображаем текущий цвет под курсором
    ToolTip, Current color: %color% at X:%MouseX% Y:%MouseY%

    ; Если цвет совпадает с целевым
    if (color = DesiredColor)
    {
        ; Сохраняем координаты пикселя
        PixelX := MouseX
        PixelY := MouseY

        ; Сообщение о нахождении цвета и координат
        ToolTip, Found pixel with color 0xE7B477! X: %PixelX% Y: %PixelY%
        Sleep, 1500  ; Задержка, чтобы пользователь мог увидеть сообщение

        ; Останавливаем поиск пикселя
        searchMode := false
        SetTimer, CheckPixelColor, Off
        ToolTip, Pixel position saved. Press F3 to start macro.
        Sleep, 1000
        ToolTip  ; Убираем подсказку с экрана
        return
    }
return

; Таймер для автокликов ЛКМ с проверкой цвета
AutoClick:
    if (!toggle)
    {
        SetTimer, AutoClick, Off
        return
    }

    ; Получаем цвет пикселя в сохранённых координатах
    PixelGetColor, currentColor, %PixelX%, %PixelY%, RGB

    ; Проверяем, совпадает ли текущий цвет с целевым и зажатие ЛКМ
    if (GetKeyState("LButton", "P") && currentColor = DesiredColor)
    {
        ToolTip, Color matched! Stopping clicks...
        toggle := false  ; Останавливаем автоклики
        SetTimer, AutoClick, Off  ; Отключаем таймер
        Sleep, 1500
        ToolTip
        return
    } else {
        ; Если цвет не совпадает и ЛКМ зажат, выполняем клик ЛКМ
        if (GetKeyState("LButton", "P"))
        {
            Click
            Random, randDelay, 50, 200
            SetTimer, AutoClick, %randDelay%
        }
    }
return

; Разрешаем использовать другие клавиши вместе с ЛКМ
~*Shift::return   ; Разрешить зажимать Shift
~*Ctrl::return    ; Разрешить зажимать Ctrl
~*Alt::return     ; Разрешить зажимать Alt
~*CapsLock::return  ; Разрешить зажимать Caps Lock
~*RButton::return  ; Разрешить зажимать ПКМ (правая кнопка мыши)
