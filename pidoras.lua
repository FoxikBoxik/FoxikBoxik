local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем интерфейс (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DetectionGui"
screenGui.IgnoreGuiInset = true -- На весь экран
screenGui.DisplayOrder = 999 -- Поверх всего
screenGui.Parent = playerGui

-- Создаем мигающий фон
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0) -- Начинаем с черного
background.BorderSizePixel = 0
background.Parent = screenGui

-- Основной текст «ВАС ЗАМЕТИЛИ!»
local mainText = Instance.new("TextLabel")
mainText.Size = UDim2.new(0.8, 0, 0.3, 0)
mainText.Position = UDim2.new(0.1, 0, 0.3, 0)
mainText.BackgroundTransparency = 1
mainText.TextColor3 = Color3.new(1, 0, 0) -- Ярко-красный
mainText.TextScaled = true
mainText.Font = Enum.Font.Creepster -- Жуткий шрифт
mainText.Text = "ВАС ЗАМЕТИЛИ!"
mainText.TextStrokeTransparency = 0 -- Добавляем обводку для читаемости
mainText.TextStrokeColor3 = Color3.new(0, 0, 0)
mainText.Parent = background

-- Подзаголовок «ЧИТЕР!»
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(0.4, 0, 0.1, 0)
subText.Position = UDim2.new(0.3, 0, 0.55, 0)
subText.BackgroundTransparency = 1
subText.TextColor3 = Color3.new(1, 1, 1) -- Белый
subText.TextScaled = true
subText.Font = Enum.Font.SourceSansBold
subText.Text = "ЧИТЕР!"
subText.Parent = background

-- Инструкция по закрытию
local hintText = Instance.new("TextLabel")
hintText.Size = UDim2.new(1, 0, 0.05, 0)
hintText.Position = UDim2.new(0, 0, 0.92, 0)
hintText.BackgroundTransparency = 1
hintText.TextColor3 = Color3.new(0.7, 0.7, 0.7)
hintText.TextScaled = true
hintText.Font = Enum.Font.SourceSans
hintText.Text = "Нажми F4, чтобы убрать"
hintText.Parent = background

-- Логика мигания фона (белый <-> черный)
local isWhite = false
local lastSwitch = tick()
local FLASH_SPEED = 0.1 -- Скорость мигания (в секундах)

local flashConnection
flashConnection = RunService.Heartbeat:Connect(function()
	if not screenGui.Parent then -- Если GUI удален, отключаем цикл
		flashConnection:Disconnect()
		return
	end

	if tick() - lastSwitch >= FLASH_SPEED then
		isWhite = not isWhite
		if isWhite then
			background.BackgroundColor3 = Color3.new(1, 1, 1) -- Белый
		else
			background.BackgroundColor3 = Color3.new(0, 0, 0) -- Черный
		end
		lastSwitch = tick()
	end
end)

-- Функция для закрытия по F4
local function onInputBegan(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F4 then
		screenGui:Destroy()
	end
end

UserInputService.InputBegan:Connect(onInputBegan)
```http://googleusercontent.com/image_generation_content/173
