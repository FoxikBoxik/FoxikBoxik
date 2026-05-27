local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем интерфейс (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NoticeGui"
screenGui.IgnoreGuiInset = true -- Растягиваем на весь экран, игнорируя верхнюю панель
screenGui.Parent = playerGui

-- Создаем текстовую метку
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Черный фон
textLabel.BackgroundTransparency = 0.3 -- Немного прозрачный фон (от 0 до 1)
textLabel.TextColor3 = Color3.new(1, 0, 0) -- Красный цвет текста
textLabel.TextScaled = true -- Автоматический размер текста
textLabel.Font = Enum.Font.Creepster -- Жуткий шрифт
textLabel.Text = "ВАС ЗАМЕТИЛИ!"
textLabel.Parent = screenGui

-- Функция для обработки нажатия клавиш
local function onInputBegan(input, gameProcessed)
	-- Игнорируем, если игрок пишет в чат
	if gameProcessed then return end

	-- Проверяем, нажата ли F4
	if input.KeyCode == Enum.KeyCode.F4 then
		screenGui:Destroy() -- Удаляем GUI
		-- script:Destroy() -- Раскомментируй эту строку, если хочешь, чтобы скрипт тоже удалился после нажатия
	end
end

-- Подключаем функцию к событию нажатия
UserInputService.InputBegan:Connect(onInputBegan)
