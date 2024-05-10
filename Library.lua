local Library = {} -- Temporary name

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = RunService:IsStudio() and Player.PlayerGui or game.CoreGui
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

function Library:Validate(defaults, args)
	for i,v in pairs(defaults) do
		if args[i] == nil then
			args[i] = v
		end
	end     
	return args
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Window(args)
	-- Check if args are correct
	args = Library:Validate({
		Title = "Title"
	}, args or {})

	-- Vars 
	local This = {
		CurrentTab = nil
	}
	local Minimized = false

	-- Instancing
	local MainFrame = Instance.new("Frame")
	local MainFrameUiCorner = Instance.new("UICorner")
	local Topbar = Instance.new("Frame")
	local TopbarUiCorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local MinimizeButton = Instance.new("ImageButton")
	local CloseButton = Instance.new("ImageButton")
	local Navigation = Instance.new("Frame")
	local TemplateTabButton = Instance.new("TextButton")
	local TabButtonImage = Instance.new("ImageLabel")
	local TabButtonUiCorner = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local TabHolderUiCorner = Instance.new("UICorner")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Tabholder = Instance.new("Frame")
	local Template = Instance.new("ScrollingFrame")
	local TemplateButton = Instance.new("Frame")
	local ButtonUICorner = Instance.new("UICorner")
	local Detection = Instance.new("TextButton")
	local DetectionUICorner = Instance.new("UICorner")
	local ButtonImage = Instance.new("ImageLabel")
	local ButtonImageUiCorner = Instance.new("UICorner")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ScreenGui
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.432830364, 0, 0.449955285, 0)
	MainFrame.Size = UDim2.new(0, 535, 0, 330)

	MainFrameUiCorner.CornerRadius = UDim.new(0, 2)
	MainFrameUiCorner.Name = "MainFrameUiCorner"
	MainFrameUiCorner.Parent = MainFrame

	Topbar.Name = "Topbar"
	Topbar.Parent = MainFrame
	Topbar.BackgroundColor3 = Color3.fromRGB(22, 17, 27)
	Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BorderSizePixel = 0
	Topbar.Position = UDim2.new(-8.96257788e-08, 0, 0, 0)
	Topbar.Size = UDim2.new(0, 535, 0, 20)

	TopbarUiCorner.CornerRadius = UDim.new(0, 1)
	TopbarUiCorner.Name = "TopbarUiCorner"
	TopbarUiCorner.Parent = Topbar

	Title.Name = "Title"
	Title.Parent = Topbar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.00870001968, 0, 0, 0)
	Title.Size = UDim2.new(0.179689214, 0, 1, 0)
	Title.Font = Enum.Font.Gotham
	Title.Text = args.Title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 13.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	-- Tweens
	local minimizeTween = TweenService:Create(MainFrame, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, 18)})
	local openTween = TweenService:Create(MainFrame, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 535, 0, 330)})
	local closeTween = TweenService:Create(Topbar, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 20)})

	MinimizeButton.Name = "MinimizeButton"
	MinimizeButton.Parent = Topbar
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.BackgroundTransparency = 1.000
	MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MinimizeButton.BorderSizePixel = 0
	MinimizeButton.Position = UDim2.new(0.922571242, 0, 0, 0)
	MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
	MinimizeButton.Image = "rbxassetid://14950036748"
	MinimizeButton.ScaleType = Enum.ScaleType.Fit

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Topbar
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.961285591, 0, 0, 0)
	CloseButton.Size = UDim2.new(0, 20, 0, 20)
	CloseButton.Image = "rbxassetid://14914803223"
	CloseButton.ScaleType = Enum.ScaleType.Fit

	Navigation.Name = "Navigation"
	Navigation.Parent = MainFrame
	Navigation.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	Navigation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navigation.BorderSizePixel = 0
	Navigation.Position = UDim2.new(0, 0, 0.060606245, 0)
	Navigation.Size = UDim2.new(0.188389063, 0, 0.941919148, -1)

	TabHolderUiCorner.CornerRadius = UDim.new(0, 2)
	TabHolderUiCorner.Name = "TabHolderUiCorner"
	TabHolderUiCorner.Parent = Navigation

	TemplateTabButton.Name = "TemplateTabButton"
	TemplateTabButton.Parent = Navigation
	TemplateTabButton.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
	TemplateTabButton.BackgroundTransparency = 1.000
	TemplateTabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateTabButton.BorderSizePixel = 0
	TemplateTabButton.Size = UDim2.new(1, 0, 0.0833780989, 0)
	TemplateTabButton.Visible = false
	TemplateTabButton.Font = Enum.Font.Gotham
	TemplateTabButton.Text = "Tab"
	TemplateTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TemplateTabButton.TextSize = 14.000

	TabButtonImage.Name = "TabButtonImage"
	TabButtonImage.Parent = TemplateTabButton
	TabButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtonImage.BackgroundTransparency = 1.000
	TabButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtonImage.BorderSizePixel = 0
	TabButtonImage.Position = UDim2.new(0, 0, 0.200000003, 0)
	TabButtonImage.Size = UDim2.new(0, 20, 0, 14)
	TabButtonImage.Image = "rbxassetid://13848371774"
	TabButtonImage.ScaleType = Enum.ScaleType.Fit

	TabButtonUiCorner.CornerRadius = UDim.new(0, 2)
	TabButtonUiCorner.Name = "TabButtonUiCorner"
	TabButtonUiCorner.Parent = TemplateTabButton

	UIListLayout.Parent = Navigation
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = MainFrame
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 1.000
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Tabholder.Name = "Tabholder"
	Tabholder.Parent = MainFrame
	Tabholder.AnchorPoint = Vector2.new(0.5, 0.5)
	Tabholder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Tabholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabholder.BorderSizePixel = 0
	Tabholder.Position = UDim2.new(0.594863236, 0, 0.531818271, 0)
	Tabholder.Size = UDim2.new(0.785180867, 0, 0.875757396, 0)

	Template.Name = "Template"
	Template.Parent = Tabholder
	Template.Active = true
	Template.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Template.BorderSizePixel = 0
	Template.Size = UDim2.new(1, 0, 1, 0)
	Template.Visible = false
	Template.ScrollBarThickness = 2

	TemplateButton.Name = "TemplateButton"
	TemplateButton.Parent = Template
	TemplateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateButton.BorderSizePixel = 0
	TemplateButton.Size = UDim2.new(0, 180, 0, 30)
	TemplateButton.Visible = false

	ButtonUICorner.CornerRadius = UDim.new(0, 2)
	ButtonUICorner.Name = "ButtonUICorner"
	ButtonUICorner.Parent = TemplateButton

	Detection.Name = "Detection"
	Detection.Parent = TemplateButton
	Detection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Detection.BackgroundTransparency = 1.000
	Detection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Detection.BorderSizePixel = 0
	Detection.Size = UDim2.new(1, 0, 1, 0)
	Detection.Font = Enum.Font.Gotham
	Detection.Text = "  Button"
	Detection.TextColor3 = Color3.fromRGB(200, 200, 200)
	Detection.TextSize = 14.000
	Detection.TextXAlignment = Enum.TextXAlignment.Left

	DetectionUICorner.CornerRadius = UDim.new(0, 2)
	DetectionUICorner.Name = "DetectionUICorner"
	DetectionUICorner.Parent = Detection

	ButtonImage.Name = "ButtonImage"
	ButtonImage.Parent = TemplateButton
	ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonImage.BackgroundTransparency = 1.000
	ButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonImage.BorderSizePixel = 0
	ButtonImage.Position = UDim2.new(0.827777803, 0, 0, 0)
	ButtonImage.Size = UDim2.new(0, 31, 0, 30)
	ButtonImage.ScaleType = Enum.ScaleType.Fit

	ButtonImageUiCorner.CornerRadius = UDim.new(0, 2)
	ButtonImageUiCorner.Name = "ButtonImageUiCorner"
	ButtonImageUiCorner.Parent = ButtonImage

	MinimizeButton.Activated:Connect(function()
		Minimized = not Minimized
		if Minimized then
			for i,v in pairs(MainFrame:GetDescendants()) do
				if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("UIListLayout") and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name then
					v.Visible = false
				end
			end
			minimizeTween:Play()
		else
			for i,v in pairs(MainFrame:GetDescendants()) do
				if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("UIListLayout") and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name then
					v.Visible = true
				end
			end
			openTween:Play()
		end
	end)

	CloseButton.Activated:Connect(function()
		for i,v in pairs(MainFrame:GetDescendants()) do
			if v.Parent == Topbar then
				v:Destroy()
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end
			if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("UIListLayout") and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name then
				v:Destroy()
			end
		end
		minimizeTween:Play()

		minimizeTween.Completed:Connect(function()
			MainFrame.Transparency = 1
			for i,v in pairs(MainFrame:GetDescendants()) do
				if v.Name ~= "Topbar" and v.Parent ~= Topbar then
					v:Destroy()
				end
			end
			closeTween:Play()
			closeTween.Completed:Connect(function()
				ScreenGui:Destroy()
			end)
		end)
	end)

	MakeDraggable(Topbar, MainFrame)

	function This:Tab(args)
		args = Library:Validate({
			Text = "Tab",
			Icon = "rbxassetid://15166889857"
		}, args or {})

		local Tab = {
			Hover = false,
			Active = false
		}

		local TabButton = TemplateTabButton:Clone()
		local TabFrame = Template:Clone()
		local Icon = TabButton.TabButtonImage

		TabButton.Text = args.Text
		TabButton.Name = args.Text

		TabFrame.Name = "Tab "..args.Text
		Icon.Image = args.Icon
		Icon.Size = args.Size or UDim2.new(0, 20, 0, 14)

		TabButton.Parent = Navigation
		TabFrame.Parent = Tabholder
		TabButton.Visible = true

		function Tab:Activate()
			if not Tab.Active then
				if This.CurrentTab ~= nil then
					This.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Library:tween(TabButton, {BackgroundTransparency = .8})
				Library:tween(TabButton, {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Icon, {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				TabFrame.Visible = true

				This.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(TabButton, {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Icon, {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(TabButton, {BackgroundTransparency = 1})

				TabFrame.Visible = false
			end
		end

		TabButton.MouseEnter:Connect(function()
			Tab.Hover = true

			if not Tab.Active then
				Library:tween(TabButton, {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Icon, {ImageColor3 = Color3.fromRGB(255, 255, 255)})
			end
		end)
		TabButton.MouseLeave:Connect(function()
			Tab.Hover = false

			if not Tab.Active then
				Library:tween(TabButton, {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Icon, {ImageColor3 = Color3.fromRGB(200, 200, 200)})
			end
		end)

		TabButton.Activated:Connect(function()
			Tab:Activate()
		end)

		if This.CurrentTab == nil then
			Tab:Activate()
		end

		function Tab:Button(args)
			args = Library:Validate({
				Text = "Button",
				Callback = function() end
			}, args or {})

			local Button = {
				Hover = false,
				MouseDown = false
			}

			local RenderedButton = TemplateButton:Clone()
			RenderedButton.Parent = TabFrame 
			local Visual = RenderedButton.Detection

			Visual.Text = "  "..args.Text
			RenderedButton.Visible = true

			function Button:SetText(text)
				Visual.Text = tostring(text)
			end

			function Button:SetCallback(func)
				args.Callback = func
			end

			RenderedButton.MouseEnter:Connect(function()
				Button.Hover = true

				if not Button.MouseDown then
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)})
					Library:tween(Visual, {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			RenderedButton.MouseLeave:Connect(function()
				Button.Hover = false

				if not Button.MouseDown then
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
					Library:tween(Visual, {TextColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			UserInputService.InputBegan:Connect(function(input, gpe)	
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
					Button.MouseDown = true
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 70)})

					args.Callback()
				end
			end)

			UserInputService.InputEnded:Connect(function(input, gpe)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Button.MouseDown = false
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
				end
			end)

			return Button
		end

		function Tab:Label(args)
			args = Library:Validate({
				Text = "Button",
			}, args or {})

			local Label = {
				Hover = false,
			}

			return Label
		end

		return Tab
	end

	return This
end

return Library


--[[ :EXAMPLE
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()
    
    --Create window
    local Window = Library:Window({
        Title = "Ui Library"
    })

    --Make tabs by using the tab function
    local Tabs = {
        ["Home"] = Window:Tab({
            Text = "Home",
            Icon = "rbxassetid://13848371774"
        }),
        ["Player"] = Window:Tab({
            Text = "Player",
            Icon = ""
        }),
        ["Players"] = Window:Tab({
            Text = "Players",
            Icon = ""
        })
    }

    --For buttons labels toggles etc
    Tabs.Home:Button({
        Text = "Press me!",
        Callback = function()
            print("Pressed")
        end,
    })

    Tabs.Player:Toggle({
        Text = "Toggle me!",
        Callback = function()
            --IDK YET
        end,
    })

    Tabs.Players:Label({
        Text = "Label"
    })

    Extra funcs 

    Button:SetCallback(FUNCTION) Can be used in multiple ways heres an example
    
    [
    	local Btn1 = Tabs.Home:Button({
        	Text = "Press me!",
       	 	Callback = function()
            print("Pressed")
        	end,
    	})
    	
    	local i
		Btn1:SetCallback(function()
			i = i or 0
			i += 1
			Btn1:SetText("  Pressed "..i.." times!")
		end)
	]

    Label:SetText("Text")
    
]]
