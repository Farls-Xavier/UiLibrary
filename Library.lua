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

    function Library:Window(text)
        local MainFrame = Instance.new("Frame")
        local MainFrameUiCorner = Instance.new("UICorner")
        local Topbar = Instance.new("Frame")
        local TopbarUiCorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")

        MainFrame.Name = "MainFrame"
        MainFrame.Parent = ScreenGui
        MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        MainFrame.BorderSizePixel = 0
        MainFrame.Position = UDim2.new(0.5, 0, 0.488023967, 0)
        MainFrame.Size = UDim2.new(0.394495428, 0, 0.389221549, 0)

        MainFrameUiCorner.CornerRadius = UDim.new(0, 2)
        MainFrameUiCorner.Name = "MainFrameUiCorner"
        MainFrameUiCorner.Parent = MainFrame

        Topbar.Name = "Topbar"
        Topbar.Parent = MainFrame
        Topbar.BackgroundColor3 = Color3.fromRGB(22, 17, 27)
        Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Topbar.BorderSizePixel = 0
        Topbar.Size = UDim2.new(0.99999994, 0, 0.0660839081, 0)

        TopbarUiCorner.CornerRadius = UDim.new(0, 2)
        TopbarUiCorner.Name = "TopbarUiCorner"
        TopbarUiCorner.Parent = Topbar

        Title.Name = "Title"
        Title.Parent = Topbar
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title.BorderSizePixel = 0
        Title.Size = UDim2.new(0.109302327, 0, 1, 0)
        Title.Font = Enum.Font.Gotham
        Title.Text = text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 14.000

        MakeDraggable(Topbar, MainFrame)
    end

return Library
