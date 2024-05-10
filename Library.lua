local Library = {} -- Temporary name

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")

    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            object.Position = pos
        end

        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position

                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )

        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )

        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end

    function Library:Window(title)
        -- Vars 
        local Minimized = false

        -- Instancing
        local MainFrame = Instance.new("Frame")
        local MainFrameUiCorner = Instance.new("UICorner")
        local Topbar = Instance.new("Frame")
        local TopbarUiCorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local MinimizeButton = Instance.new("ImageButton")
        local CloseButton = Instance.new("ImageButton")

        MainFrame.Name = "MainFrame"
        MainFrame.Parent = ScreenGui
        MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        MainFrame.BorderSizePixel = 0
        MainFrame.Position = UDim2.new(0.499802828, 0, 0.499356478, 0)
        MainFrame.Size = UDim2.new(0, 681, 0, 396)

        MainFrameUiCorner.CornerRadius = UDim.new(0, 2)
        MainFrameUiCorner.Name = "MainFrameUiCorner"
        MainFrameUiCorner.Parent = MainFrame

        Topbar.Name = "Topbar"
        Topbar.Parent = MainFrame
        Topbar.BackgroundColor3 = Color3.fromRGB(22, 17, 27)
        Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Topbar.BorderSizePixel = 0
        Topbar.Position = UDim2.new(-8.96257788e-08, 0, 0, 0)
        Topbar.Size = UDim2.new(0, 681, 0, 20)

        TopbarUiCorner.CornerRadius = UDim.new(0, 1)
        TopbarUiCorner.Name = "TopbarUiCorner"
        TopbarUiCorner.Parent = Topbar

        Title.Name = "Title"
        Title.Parent = Topbar
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0.00870000012, 0, 0, 0)
        Title.Size = UDim2.new(0.110132165, 0, 1, 0)
        Title.Font = Enum.Font.Gotham
        Title.Text = "Title"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 13.000
        Title.TextWrapped = true
        Title.TextXAlignment = Enum.TextXAlignment.Left

        -- Tweens
        local minimizeTween = TweenService:Create(MainFrame, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, 18)})
        local openTween = TweenService:Create(MainFrame, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 681, 0, 396)})
        local closeTween = TweenService:Create(MainFrame, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, 18)})

        MinimizeButton.Name = "MinimizeButton"
        MinimizeButton.Parent = Topbar
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MinimizeButton.BackgroundTransparency = 1.000
        MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        MinimizeButton.BorderSizePixel = 0
        MinimizeButton.Position = UDim2.new(0.941262841, 0, 0, 0)
        MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
        MinimizeButton.Image = "rbxassetid://14950036748"
        MinimizeButton.ScaleType = Enum.ScaleType.Fit
        MinimizeButton.Activated:Connect(function()
            Minimized = not Minimized
            if Minimized then
                minimizeTween:Play()
                else
                    openTween:Play()
            end
        end)

        CloseButton.Name = "CloseButton"
        CloseButton.Parent = Topbar
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.BackgroundTransparency = 1.000
        CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        CloseButton.BorderSizePixel = 0
        CloseButton.Position = UDim2.new(0.970631421, 0, 0, 0)
        CloseButton.Size = UDim2.new(0, 20, 0, 20)
        CloseButton.Image = "rbxassetid://14914803223"
        CloseButton.ScaleType = Enum.ScaleType.Fit
        CloseButton.Activated:Connect(function()
            closeTween:Play()
            closeTween.Completed:Connect(function()
                ScreenGui:Destroy()
            end)
        end)

        MakeDraggable(Topbar, MainFrame)
    end

return Library
