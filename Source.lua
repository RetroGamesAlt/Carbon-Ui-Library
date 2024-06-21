local UILibrary = {}

function UILibrary:CreateWindow(windowText)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = screenGui

    local Ui = Instance.new("UICorner", mainFrame)    
    Ui.CornerRadius = UDim2.new(0,20)

    local topTextLabel = Instance.new("TextLabel")
    topTextLabel.Size = UDim2.new(1, 0, 0, 30)
    topTextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    topTextLabel.Text = windowText
    topTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    topTextLabel.Parent = mainFrame

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, -30) -- Set height to be same as mainFrame minus 30
    scrollFrame.Position = UDim2.new(0, 0, 0, 30) -- Position below the topTextLabel
    scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 10
    scrollFrame.Parent = mainFrame

    self.scrollFrame = scrollFrame
    self.elementYPosition = 0
end

function UILibrary:AddTextLabel(text)
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 30)
    textLabel.Position = UDim2.new(0, 0, 0, self.elementYPosition)
    textLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Parent = self.scrollFrame

    self.elementYPosition = self.elementYPosition + 30
end

function UILibrary:AddButton(text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, self.elementYPosition)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = self.scrollFrame

    local buttonCorner = Instance.new("UICorner", button)

    buttonCorner.CornerRadius = UDim.new(0, 50)

    button.MouseButton1Click:Connect(callback)

    self.elementYPosition = self.elementYPosition + 30
end

function UILibrary:AddTextBox(placeholderText)
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 0, 30)
    textBox.Position = UDim2.new(0, 0, 0, self.elementYPosition)
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textBox.Text = placeholderText
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Parent = self.scrollFrame

      local textBoxCorner = Instance.new("UICorner", textBox)
    textBoxCorner.CornerRadius = UDim.new(0, 50)

    self.elementYPosition = self.elementYPosition + 30

    return textBox
end

return UILibrary
