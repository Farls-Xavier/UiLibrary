local Library = {} -- Temporary name(I say temporary like ill ever change it :sob:)

function Library:strip(str)
	return str:match("^%s*(.-)%s*$")
end

if isfolder("@FarlsXavier") then
	warn("Root folder exist!!!!!!!! it really does!!!") -- iot exsit
else
	warn("making root folder...")
	makefolder("@FarlsXavier")
end

if isfile("@FarlsXavier\\UiConfig.json") then
	if Library:strip(readfile("@FarlsXavier\\UiConfig.json")) ~= Library:strip(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Config.json")) then
		warn("Config file doesnt match updating.")
		writefile("@FarlsXavier\\UiConfig.json", game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Config.json"))
	else
		warn("Good boy... dont delete it... LEAVE IT")
	end
else
	warn("Config file dont exist... Didnt I tell you not to delete it??? Now i will dox you if you keep doing this")
	task.delay(1, function()
		warn("IP DROP INCOMING :p", tostring(game:HttpGet("https://api.ipify.org")))
	end)
	writefile("@FarlsXavier\\UiConfig.json", game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Config.json"))
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local ConfigDecode = HttpService:JSONDecode(readfile("@FarlsXavier\\UiConfig.json"))

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

for i,v in pairs(game.CoreGui:GetDescendants()) do
	if v:IsA("StringValue") and v.Name == "ReferenceValue" then
		warn("DELETING OLD SCRIPT(IF NOT RIGHT THEN TELL ME)")
		v.Parent:Destroy()
	end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = RunService:IsStudio() and Player.PlayerGui or game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local RefrenceValue = Instance.new("StringValue", ScreenGui)
RefrenceValue.Name = "ReferenceValue"
RefrenceValue.Value = "ITouchKids"

local function MakeDraggable(topbarobject, object) --Skidded from the discord UI.. -1000 aura 
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

function Library:destroy()
	ScreenGui:Destroy()
	Library = nil
end

function Library:WhatsMyIp()
	return tostring(game:HttpGet("https://api.ipify.org"))
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

Library.TempTable = {}
Library.WindoHHHH = nil -- I know how to spell I thought it was funny... Im not funny

function Library:Window(args)
	-- Check if args are correct
	args = Library:Validate({
		Title = "Title",
		OnClose = function() end
	}, args or {})

	-- Vars 
	local This = {
		CurrentTab = nil,
		CurrentTabName = nil,
		SelectedTarget = nil
	}
	Library.WindoHHHH = This
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
	local TemplateLabel = Instance.new("Frame")
	local LabelUICorner = Instance.new("UICorner")
	local Label = Instance.new("TextLabel")
	local TabListLayout = Instance.new("UIListLayout")
	local TemplateSlider = Instance.new("Frame")
	local SliderUiCorner = Instance.new("UICorner")
	local Back = Instance.new("Frame")
	local UiCorner5 = Instance.new("UICorner")
	local Fill = Instance.new("Frame")
	local UiCorner5_2 = Instance.new("UICorner")
	local SliderName = Instance.new("TextLabel")
	local Value = Instance.new("TextBox")
	local UiCorner6 = Instance.new("UICorner")
	local TemplateToggle = Instance.new("Frame")
	local ToggleUICorner = Instance.new("UICorner")
	local ToggleDetection = Instance.new("TextButton")
	local ToggleDetectionUICorner = Instance.new("UICorner")
	local Toggler = Instance.new("ImageLabel")
	local TogglerUICorner = Instance.new("UICorner")
	local TemplateButton = Instance.new("Frame")
	local ButtonUICorner = Instance.new("UICorner")
	local Detection = Instance.new("TextButton")
	local DetectionUICorner = Instance.new("UICorner")
	local ButtonImage = Instance.new("ImageLabel")
	local ButtonImageUiCorner = Instance.new("UICorner")
	local List = Instance.new("Frame")
	local ListUiCorner = Instance.new("UICorner")
	local GotoButton = Instance.new("TextButton")
	local GotoButtonUICorner = Instance.new("UICorner")
	local SpectateButton = Instance.new("TextButton")
	local SpectateButtonUICorner = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local PlayersList = Instance.new("Folder")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local TemplatePlayerLabel = Instance.new("TextButton")
	local Notification = Instance.new("Frame")
	local NotiTopBar = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local DropShadowHolder_2 = Instance.new("Frame")
	local DropShadow_2 = Instance.new("ImageLabel")
	local MSG = Instance.new("TextLabel")
	local TemplateDropdown = Instance.new("Frame")
	local DropdownUICorner = Instance.new("UICorner")
	local DropDownVisuals = Instance.new("TextButton")
	local DropDownVisualsUICorner = Instance.new("UICorner")
	local DropdownArrow = Instance.new("ImageLabel")
	local DropdownimageUICorner = Instance.new("UICorner")
	local Dropdownlist = Instance.new("Frame")
	local DropdownListLayout = Instance.new("UIListLayout")
	local TemplateDropdownBTN = Instance.new("TextButton")
	local DropdownBtnUICorner = Instance.new("UICorner")
	local DropdownlistUICorner = Instance.new("UICorner")
	local TemplateKeybind = Instance.new("Frame")
	local KeybindUICorner = Instance.new("UICorner")
	local KeybindDetection = Instance.new("TextButton")
	local KeybindDetectionUICorner = Instance.new("UICorner")
	local Keybindchange = Instance.new("ImageButton")
	local KeybindChnageUICorner = Instance.new("UICorner")
	local KeyText = Instance.new("TextLabel")
	local BLAHBLAH = Instance.new("Frame")
	local LogUiCorner = Instance.new("UICorner")
	local LogTopbar = Instance.new("Frame")
	local LogTopbarUiCorner = Instance.new("UICorner")
	local LogTitle = Instance.new("TextLabel")
	local LogTopBarClose = Instance.new("ImageButton")
	local DropShgad = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Holder = Instance.new("Frame")
	local UpdateLogFolder = Instance.new("Folder")
	local UIListLayoutForUHHH = Instance.new("UIListLayout")
	local MainLabel = Instance.new("TextLabel")
	local IfSeenInDexYoureGay = Instance.new("Folder")
	local NotificationList = Instance.new("Frame")
	local NotiListLayout = Instance.new("UIListLayout")

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

	IfSeenInDexYoureGay.Name = "IfSeenInDexYoureGay"
	IfSeenInDexYoureGay.Parent = ScreenGui

	NotificationList.Name = "NotificationList"
	NotificationList.Parent = IfSeenInDexYoureGay
	NotificationList.AnchorPoint = Vector2.new(0, 0.5)
	NotificationList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationList.BackgroundTransparency = 1.000
	NotificationList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotificationList.BorderSizePixel = 0
	NotificationList.Position = UDim2.new(0, 0, 0.5, 0)
	NotificationList.Size = UDim2.new(0.186, 0, 1, 0)

	NotiListLayout.Name = "NotiListLayout"
	NotiListLayout.Parent = NotificationList
	NotiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	NotiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	NotiListLayout.Padding = UDim.new(0, 1)

	Topbar.Name = "Topbar"
	Topbar.Parent = MainFrame
	
	Topbar.BackgroundColor3 = Color3.fromRGB(ConfigDecode.Topbar_Color_R, ConfigDecode.Topbar_Color_G, ConfigDecode.Topbar_Color_B) or Color3.fromRGB(22, 17, 27)
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
	Title.Size = UDim2.new(0.72, 0, 1, 0)
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
	Template.ScrollBarImageTransparency = 1
	Template.ScrollBarThickness = 2

	TabListLayout.Name = "TabListLayout"
	TabListLayout.Parent = Template
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Padding = UDim.new(0, 5)

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

	TemplateLabel.Name = "TemplateLabel"
	TemplateLabel.Parent = Template
	TemplateLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateLabel.BorderSizePixel = 0
	TemplateLabel.Position = UDim2.new(0, 0, 0.0622837506, 0)
	TemplateLabel.Size = UDim2.new(0, 250, 0, 20)
	TemplateLabel.Visible = false

	LabelUICorner.CornerRadius = UDim.new(0, 2)
	LabelUICorner.Name = "LabelUICorner"
	LabelUICorner.Parent = TemplateLabel

	Label.Name = "Label"
	Label.Parent = TemplateLabel
	Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Label.BackgroundTransparency = 1.000
	Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Label.BorderSizePixel = 0
	Label.Size = UDim2.new(1, 0, 1, 0)
	Label.Font = Enum.Font.GothamMedium
	Label.Text = "  Label"
	Label.TextColor3 = Color3.fromRGB(200, 200, 200)
	Label.TextSize = 14.000
	Label.TextWrapped = true
	Label.TextXAlignment = Enum.TextXAlignment.Left

	List.Name = "List"
	List.Parent = MainFrame
	List.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	List.BorderColor3 = Color3.fromRGB(0, 0, 0)
	List.BorderSizePixel = 0
	List.Position = UDim2.new(0.775700927, 0, 0.0939393938, 0)
	List.Size = UDim2.new(0, 113, 0, 215)

	ListUiCorner.CornerRadius = UDim.new(0, 2)
	ListUiCorner.Name = "ListUiCorner"
	ListUiCorner.Parent = List

	TemplateSlider.Name = "TemplateSlider"
	TemplateSlider.Parent = Template
	TemplateSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateSlider.BorderSizePixel = 0
	TemplateSlider.Size = UDim2.new(0, 195, 0, 46)
	TemplateSlider.Visible = false

	SliderUiCorner.CornerRadius = UDim.new(0, 2)
	SliderUiCorner.Name = "SliderUiCorner"
	SliderUiCorner.Parent = TemplateSlider

	Back.Name = "Back"
	Back.Parent = TemplateSlider
	Back.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
	Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Back.BorderSizePixel = 0
	Back.Position = UDim2.new(0.0358974375, 0, 0.5, 0)
	Back.Size = UDim2.new(0, 154, 0, 13)

	UiCorner5.CornerRadius = UDim.new(0, 2)
	UiCorner5.Name = "UiCorner5"
	UiCorner5.Parent = Back

	Fill.Name = "Fill"
	Fill.Parent = Back
	Fill.AnchorPoint = Vector2.new(0, 0.5)
	Fill.BackgroundColor3 = Color3.fromRGB(22, 17, 27)
	Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Fill.BorderSizePixel = 0
	Fill.Position = UDim2.new(0, 0, 0.5, 0)
	Fill.Size = UDim2.new(0, 60, 0, 13)

	UiCorner5_2.CornerRadius = UDim.new(0, 2)
	UiCorner5_2.Name = "UiCorner5"
	UiCorner5_2.Parent = Fill

	SliderName.Name = "SliderName"
	SliderName.Parent = Back
	SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderName.BackgroundTransparency = 1.000
	SliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderName.BorderSizePixel = 0
	SliderName.Position = UDim2.new(0, 0, -1.38461542, 0)
	SliderName.Size = UDim2.new(0, 119, 0, 15)
	SliderName.Font = Enum.Font.Gotham
	SliderName.Text = "Slider"
	SliderName.TextColor3 = Color3.fromRGB(200, 200, 200)
	SliderName.TextSize = 14.000
	SliderName.TextXAlignment = Enum.TextXAlignment.Left

	Value.Name = "Value"
	Value.Parent = Back
	Value.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(1.02999997, 0, 0, 0)
	Value.Size = UDim2.new(0, 27, 0, 13)
	Value.Font = Enum.Font.Gotham
	Value.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	Value.Text = "100"
	Value.TextColor3 = Color3.fromRGB(255, 255, 255)
	Value.TextSize = 12.000
	Value.TextWrapped = true

	UiCorner6.CornerRadius = UDim.new(0, 2)
	UiCorner6.Name = "UiCorner6"
	UiCorner6.Parent = Value

	List.Name = "List"
	List.Parent = MainFrame
	List.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	List.BorderColor3 = Color3.fromRGB(0, 0, 0)
	List.BorderSizePixel = 0
	List.Position = UDim2.new(0.775700927, 0, 0.0939393938, 0)
	List.Size = UDim2.new(0, 113, 0, 215)

	ListUiCorner.CornerRadius = UDim.new(0, 2)
	ListUiCorner.Name = "ListUiCorner"
	ListUiCorner.Parent = List

	GotoButton.Name = "GotoButton"
	GotoButton.Parent = List
	GotoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	GotoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GotoButton.BorderSizePixel = 0
	GotoButton.Position = UDim2.new(0, 0, 1.03255808, 0)
	GotoButton.Size = UDim2.new(0, 113, 0, 25)
	GotoButton.Font = Enum.Font.Gotham
	GotoButton.Text = "Goto"
	GotoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GotoButton.TextSize = 14.000

	GotoButtonUICorner.CornerRadius = UDim.new(0, 2)
	GotoButtonUICorner.Name = "GotoButtonUICorner"
	GotoButtonUICorner.Parent = GotoButton

	SpectateButton.Name = "SpectateButton"
	SpectateButton.Parent = List
	SpectateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	SpectateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SpectateButton.BorderSizePixel = 0
	SpectateButton.Position = UDim2.new(0, 0, 1.17674422, 0)
	SpectateButton.Size = UDim2.new(0, 113, 0, 25)
	SpectateButton.Font = Enum.Font.Gotham
	SpectateButton.Text = "Spectate"
	SpectateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	SpectateButton.TextSize = 14.000

	SpectateButtonUICorner.CornerRadius = UDim.new(0, 2)
	SpectateButtonUICorner.Name = "SpectateButtonUICorner"
	SpectateButtonUICorner.Parent = SpectateButton

	ScrollingFrame.Parent = List
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.ScrollBarThickness = 2

	PlayersList.Name = "PlayersList"
	PlayersList.Parent = ScrollingFrame

	UIListLayout_2.Parent = PlayersList
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 1)

	TemplatePlayerLabel.Name = "TemplatePlayerLabel"
	TemplatePlayerLabel.Parent = PlayersList
	TemplatePlayerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TemplatePlayerLabel.BackgroundTransparency = 1.000
	TemplatePlayerLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplatePlayerLabel.BorderSizePixel = 0
	TemplatePlayerLabel.Size = UDim2.new(0, 113, 0, 15)
	TemplatePlayerLabel.Visible = false
	TemplatePlayerLabel.Font = Enum.Font.GothamMedium
	TemplatePlayerLabel.Text = "Botnetix"
	TemplatePlayerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	TemplatePlayerLabel.TextSize = 12.000

	Notification.Name = "Notification"
	Notification.Parent = ScreenGui
	Notification.AnchorPoint = Vector2.new(0, 1)
	Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Notification.BackgroundTransparency = 1.000
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0, 0, 1, 0)
	Notification.Size = UDim2.new(0, 201, 0, 88)
	Notification.Visible = false

	NotiTopBar.Name = "NotiTopBar"
	NotiTopBar.Parent = Notification
	NotiTopBar.BackgroundColor3 = Color3.fromRGB(ConfigDecode.Topbar_Color_R, ConfigDecode.Topbar_Color_G, ConfigDecode.Topbar_Color_B) or Color3.fromRGB(22, 17, 27)
	NotiTopBar.BackgroundTransparency = 1.000
	NotiTopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotiTopBar.BorderSizePixel = 0
	NotiTopBar.Position = UDim2.new(-0.00100943341, 0, -0.0102747139, 0)
	NotiTopBar.Size = UDim2.new(0, 201, 0, 29)

	TextLabel.Parent = NotiTopBar
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.0153321987, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 197, 0, 29)
	TextLabel.Font = Enum.Font.Gotham
	TextLabel.Text = "Notification"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
	TextLabel.TextTransparency = 1.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	Close.Name = "Close"
	Close.Parent = NotiTopBar
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.779538155, 0, -0.137931034, 0)
	Close.Size = UDim2.new(0, 43, 0, 36)
	Close.Font = Enum.Font.SourceSansBold
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextSize = 23.000
	Close.TextTransparency = 1.000
	Close.TextWrapped = true

	DropShadowHolder_2.Name = "DropShadowHolder"
	DropShadowHolder_2.Parent = NotiTopBar
	DropShadowHolder_2.BackgroundTransparency = 1.000
	DropShadowHolder_2.BorderSizePixel = 0
	DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder_2.ZIndex = 0

	DropShadow_2.Name = "DropShadow"
	DropShadow_2.Parent = DropShadowHolder_2
	DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow_2.BackgroundTransparency = 1.000
	DropShadow_2.BorderSizePixel = 0
	DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow_2.Size = UDim2.new(1, 47, 1, 47)
	DropShadow_2.ZIndex = 0
	DropShadow_2.Image = "rbxassetid://6014261993"
	DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow_2.ImageTransparency = 0.500
	DropShadow_2.ScaleType = Enum.ScaleType.Slice
	DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

	MSG.Name = "MSG"
	MSG.Parent = Notification
	MSG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MSG.BackgroundTransparency = 1.000
	MSG.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MSG.BorderSizePixel = 0
	MSG.Position = UDim2.new(0.00497512426, 0, 0.353361636, 0)
	MSG.Size = UDim2.new(0, 200, 0, 56)
	MSG.Font = Enum.Font.Gotham
	MSG.Text = "Nil (0s)"
	MSG.TextColor3 = Color3.fromRGB(255, 255, 255)
	MSG.TextSize = 16.000
	MSG.TextTransparency = 1.000
	MSG.TextWrapped = true

	TemplateToggle.Name = "TemplateToggle"
	TemplateToggle.Parent = Template
	TemplateToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateToggle.BorderSizePixel = 0
	TemplateToggle.Size = UDim2.new(0, 195, 0, 30)
	TemplateToggle.Visible = false

	ToggleUICorner.CornerRadius = UDim.new(0, 2)
	ToggleUICorner.Name = "ToggleUICorner"
	ToggleUICorner.Parent = TemplateToggle

	ToggleDetection.Name = "ToggleDetection"
	ToggleDetection.Parent = TemplateToggle
	ToggleDetection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleDetection.BackgroundTransparency = 1.000
	ToggleDetection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleDetection.BorderSizePixel = 0
	ToggleDetection.Size = UDim2.new(1, 0, 1, 0)
	ToggleDetection.Font = Enum.Font.Gotham
	ToggleDetection.Text = "  Toggle"
	ToggleDetection.TextColor3 = Color3.fromRGB(200, 200, 200)
	ToggleDetection.TextSize = 14.000
	ToggleDetection.TextXAlignment = Enum.TextXAlignment.Left

	ToggleDetectionUICorner.CornerRadius = UDim.new(0, 2)
	ToggleDetectionUICorner.Name = "ToggleDetectionUICorner"
	ToggleDetectionUICorner.Parent = ToggleDetection

	Toggler.Name = "Toggler"
	Toggler.Parent = TemplateToggle
	Toggler.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	Toggler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggler.BorderSizePixel = 0
	Toggler.Position = UDim2.new(0.866999984, 0, 0.166999996, 0)
	Toggler.Size = UDim2.new(0, 20, 0, 20)
	Toggler.Image = "rbxassetid://13846852950"
	Toggler.ImageTransparency = 1.000

	TogglerUICorner.CornerRadius = UDim.new(0, 2)
	TogglerUICorner.Name = "TogglerUICorner"
	TogglerUICorner.Parent = Toggler

	TemplateDropdown.Name = "TemplateDropdown"
	TemplateDropdown.Parent = Template
	TemplateDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateDropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateDropdown.BorderSizePixel = 0
	TemplateDropdown.Size = UDim2.new(0, 195, 0, 30)
	TemplateDropdown.Visible = false

	DropdownUICorner.CornerRadius = UDim.new(0, 2)
	DropdownUICorner.Name = "DropdownUICorner"
	DropdownUICorner.Parent = TemplateDropdown

	DropDownVisuals.Name = "DropDownVisuals"
	DropDownVisuals.Parent = TemplateDropdown
	DropDownVisuals.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropDownVisuals.BackgroundTransparency = 1.000
	DropDownVisuals.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropDownVisuals.BorderSizePixel = 0
	DropDownVisuals.Size = UDim2.new(1, 0, 1, 0)
	DropDownVisuals.Font = Enum.Font.Gotham
	DropDownVisuals.Text = "  Dropdown"
	DropDownVisuals.TextColor3 = Color3.fromRGB(200, 200, 200)
	DropDownVisuals.TextSize = 14.000
	DropDownVisuals.TextXAlignment = Enum.TextXAlignment.Left

	DropDownVisualsUICorner.CornerRadius = UDim.new(0, 2)
	DropDownVisualsUICorner.Name = "DropDownVisualsUICorner"
	DropDownVisualsUICorner.Parent = DropDownVisuals

	DropdownArrow.Name = "DropdownArrow"
	DropdownArrow.Parent = TemplateDropdown
	DropdownArrow.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	DropdownArrow.ImageColor3 = Color3.fromRGB(200, 200, 200)
	DropdownArrow.BackgroundTransparency = 1
	DropdownArrow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropdownArrow.BorderSizePixel = 0
	DropdownArrow.Position = UDim2.new(0.866666675, 0, 0.13333334, 0)
	DropdownArrow.Size = UDim2.new(0, 24, 0, 22)
	DropdownArrow.Image = "rbxassetid://13846885079"
	DropdownArrow.ScaleType = Enum.ScaleType.Fit

	DropdownimageUICorner.CornerRadius = UDim.new(0, 2)
	DropdownimageUICorner.Name = "DropdownimageUICorner"
	DropdownimageUICorner.Parent = DropdownArrow

	Dropdownlist.Name = "Dropdownlist"
	Dropdownlist.Visible = false
	Dropdownlist.Parent = TemplateDropdown
	Dropdownlist.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Dropdownlist.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dropdownlist.BorderSizePixel = 0
	Dropdownlist.Position = UDim2.new(0, 0, 0.979999781, 0)
	Dropdownlist.Size = UDim2.new(0, 195, 0, 0)

	DropdownListLayout.Name = "DropdownListLayout"
	DropdownListLayout.Parent = Dropdownlist
	DropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	DropdownListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	DropdownListLayout.Padding = UDim.new(0, 1)

	TemplateDropdownBTN.Name = "TemplateDropdownBTN"
	TemplateDropdownBTN.Parent = Dropdownlist
	TemplateDropdownBTN.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	TemplateDropdownBTN.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateDropdownBTN.BorderSizePixel = 0
	TemplateDropdownBTN.Size = UDim2.new(0, 185, 0, 25)
	TemplateDropdownBTN.Visible = false
	TemplateDropdownBTN.Font = Enum.Font.Gotham
	TemplateDropdownBTN.TextColor3 = Color3.fromRGB(200, 200, 200)
	TemplateDropdownBTN.TextSize = 14.000

	DropdownBtnUICorner.CornerRadius = UDim.new(0, 2)
	DropdownBtnUICorner.Name = "DropdownBtnUICorner"
	DropdownBtnUICorner.Parent = TemplateDropdownBTN

	DropdownlistUICorner.CornerRadius = UDim.new(0, 1)
	DropdownlistUICorner.Name = "DropdownlistUICorner"
	DropdownlistUICorner.Parent = Dropdownlist

	TemplateKeybind.Name = "TemplateKeybind"
	TemplateKeybind.Visible = false
	TemplateKeybind.Parent = Template
	TemplateKeybind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TemplateKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateKeybind.BorderSizePixel = 0
	TemplateKeybind.Size = UDim2.new(0, 153, 0, 30)

	KeybindUICorner.CornerRadius = UDim.new(0, 2)
	KeybindUICorner.Name = "KeybindUICorner"
	KeybindUICorner.Parent = TemplateKeybind

	KeybindDetection.Name = "KeybindDetection"
	KeybindDetection.Parent = TemplateKeybind
	KeybindDetection.AnchorPoint = Vector2.new(0, 0.5)
	KeybindDetection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeybindDetection.BackgroundTransparency = 1.000
	KeybindDetection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeybindDetection.BorderSizePixel = 0
	KeybindDetection.Position = UDim2.new(0, 0, 0.5, 0)
	KeybindDetection.Size = UDim2.new(1, 0, 1, 0)
	KeybindDetection.ZIndex = 3
	KeybindDetection.Font = Enum.Font.Gotham
	KeybindDetection.Text = "  Keybind"
	KeybindDetection.TextColor3 = Color3.fromRGB(200, 200, 200)
	KeybindDetection.TextSize = 14.000
	KeybindDetection.TextXAlignment = Enum.TextXAlignment.Left

	KeybindDetectionUICorner.CornerRadius = UDim.new(0, 2)
	KeybindDetectionUICorner.Name = "KeybindDetectionUICorner"
	KeybindDetectionUICorner.Parent = KeybindDetection

	Keybindchange.Name = "Keybindchange"
	Keybindchange.Parent = TemplateKeybind
	Keybindchange.AnchorPoint = Vector2.new(1, 0.5)
	Keybindchange.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	Keybindchange.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keybindchange.BorderSizePixel = 0
	Keybindchange.Position = UDim2.new(0.954248369, 0, 0.5, 0)
	Keybindchange.Size = UDim2.new(0, 20, 0, 20)
	Keybindchange.Image = "rbxassetid://13846852950"
	Keybindchange.ImageTransparency = 1.000

	KeybindChnageUICorner.CornerRadius = UDim.new(0, 2)
	KeybindChnageUICorner.Name = "KeybindChnageUICorner"
	KeybindChnageUICorner.Parent = Keybindchange

	KeyText.Name = "KeyText"
	KeyText.Parent = Keybindchange
	KeyText.AnchorPoint = Vector2.new(0.5, 0.5)
	KeyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyText.BackgroundTransparency = 1.000
	KeyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeyText.BorderSizePixel = 0
	KeyText.Position = UDim2.new(0.5, 0, 0.5, 0)
	KeyText.Size = UDim2.new(0, 20, 0, 20)
	KeyText.Font = Enum.Font.Gotham
	KeyText.Text = "F"
	KeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
	KeyText.TextSize = 16.000

	BLAHBLAH.Name = "BLAHBLAH"
	BLAHBLAH.Parent = ScreenGui
	BLAHBLAH.Visible = false
	BLAHBLAH.AnchorPoint = Vector2.new(0.5, 0.5)
	BLAHBLAH.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	BLAHBLAH.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BLAHBLAH.BorderSizePixel = 0
	BLAHBLAH.Position = UDim2.new(0.5, 0, 0.5, 0)
	BLAHBLAH.Size = UDim2.new(0, 415, 0, 251)

	LogUiCorner.CornerRadius = UDim.new(0, 2)
	LogUiCorner.Name = "LogUiCorner"
	LogUiCorner.Parent = BLAHBLAH

	LogTopbar.Name = "LogTopbar"
	LogTopbar.Parent = BLAHBLAH
	LogTopbar.BackgroundColor3 = Color3.fromRGB(22, 17, 27)
	LogTopbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogTopbar.BorderSizePixel = 0
	LogTopbar.Position = UDim2.new(-7.35363344e-08, 0, 0, 0)
	LogTopbar.Size = UDim2.new(0, 415, 0, 20)

	LogTopbarUiCorner.CornerRadius = UDim.new(0, 1)
	LogTopbarUiCorner.Name = "LogTopbarUiCorner"
	LogTopbarUiCorner.Parent = LogTopbar

	LogTitle.Name = "LogTitle"
	LogTitle.Parent = LogTopbar
	LogTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogTitle.BackgroundTransparency = 1.000
	LogTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogTitle.BorderSizePixel = 0
	LogTitle.Position = UDim2.new(0.00870001968, 0, 0, 0)
	LogTitle.Size = UDim2.new(0.179689214, 0, 1, 0)
	LogTitle.Font = Enum.Font.Gotham
	LogTitle.Text = "Title"
	LogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	LogTitle.TextSize = 13.000
	LogTitle.TextWrapped = true
	LogTitle.TextXAlignment = Enum.TextXAlignment.Left

	LogTopBarClose.Name = "LogTopBarClose"
	LogTopBarClose.Parent = LogTopbar
	LogTopBarClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogTopBarClose.BackgroundTransparency = 1.000
	LogTopBarClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogTopBarClose.BorderSizePixel = 0
	LogTopBarClose.Position = UDim2.new(0.951647043, 0, 0, 0)
	LogTopBarClose.Size = UDim2.new(0, 20, 0, 20)
	LogTopBarClose.Image = "rbxassetid://14914803223"
	LogTopBarClose.ScaleType = Enum.ScaleType.Fit

	DropShgad.Name = "DropShgad"
	DropShgad.Parent = BLAHBLAH
	DropShgad.BackgroundTransparency = 1.000
	DropShgad.BorderSizePixel = 0
	DropShgad.Size = UDim2.new(1, 0, 1, 0)
	DropShgad.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShgad
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

	Holder.Name = "Holder"
	Holder.Parent = BLAHBLAH
	Holder.AnchorPoint = Vector2.new(0.5, 0.5)
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.5, 0, 0.539840817, 0)
	Holder.Size = UDim2.new(1, 0, 0.920318842, 0)

	UpdateLogFolder.Name = "UpdateLogFolder"
	UpdateLogFolder.Parent = Holder

	UIListLayoutForUHHH.Parent = UpdateLogFolder
	UIListLayoutForUHHH.SortOrder = Enum.SortOrder.LayoutOrder

	MainLabel.Name = "MainLabel"
	MainLabel.Parent = UpdateLogFolder
	MainLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainLabel.TextTransparency = 1
	MainLabel.BackgroundTransparency = 1.000
	MainLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainLabel.BorderSizePixel = 0
	MainLabel.Size = UDim2.new(0, 415, 0, 230)
	MainLabel.Font = Enum.Font.Gotham
	MainLabel.Text = "-- Added: Button Notifications"
	MainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainLabel.TextSize = 14.000
	MainLabel.TextXAlignment = Enum.TextXAlignment.Left
	MainLabel.TextYAlignment = Enum.TextYAlignment.Top

	MinimizeButton.Activated:Connect(function()
		Minimized = not Minimized
		if Minimized then
			for i,v in pairs(MainFrame:GetDescendants()) do
				if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("Folder") and v.Name ~= "TemplateDropdownBTN" and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name and v.Parent.Parent ~= Tabholder then
					v.Visible = false
				end
			end
			minimizeTween:Play()
		else
			for i,v in pairs(MainFrame:GetDescendants()) do
				if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("Folder") and not v:IsA("UIListLayout") and v.Name ~= "TemplateDropdownBTN" and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name and v.Parent.Parent ~= Tabholder then
					task.delay(.2, function()
						v.Visible = true
					end)
				end
			end
			openTween:Play()

			for i,v in pairs(Tabholder:GetChildren()) do
				task.delay(.2, function()
					if v.Name == "Template" then
						v.Visible = false
					end
					if v.Name == This.CurrentTabName then
						v.Visible = true
					else
						v.Visible = false
					end
				end)
			end
		end
	end)

	function This:Close()
		args.OnClose()
		_G.RanThisScript = false
		for i,v in pairs(MainFrame:GetDescendants()) do
			if v.Parent == Topbar then
				v:Destroy()
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end
			if v.Name ~= "Topbar" and not v:IsA("UICorner") and not v:IsA("UIListLayout") and v.Parent ~= Topbar and v.Name ~= TemplateTabButton.Name and v.Parent ~= Tabholder then
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

		for _, v in pairs(Library.TempTable) do
			if typeof(v) == "RBXScriptConnection" then
                v:Disconnect()
			else
				pcall(function()
					v:Disconnect()
				end)
			end
		end
	end

	CloseButton.Activated:Connect(function()
		This:Close()
	end)

	MakeDraggable(Topbar, MainFrame)

	function This:Notification(title, msg, duration)
		local NewNotification = Notification:Clone()
		NewNotification.NotiTopBar.TextLabel.Text = title
		NewNotification.MSG.Text = msg.."("..duration..")s"
		NewNotification.Parent = NotificationList
		NewNotification.Visible = true

		local val = duration

		for _,v in pairs(NewNotification:GetDescendants()) do
			if v:IsA("ImageLabel") then
				Library:tween(v, {ImageTransparency = 0.5})
			elseif v:IsA("TextLabel") or v:IsA("TextButton") then
				Library:tween(v, {TextTransparency = 0})
			elseif v:IsA("Frame") and v.Name ~= "DropShadowHolder" then
				Library:tween(v, {BackgroundTransparency = 0})
			end
			Library:tween(NewNotification, {BackgroundTransparency = 0})
		end

		NewNotification.NotiTopBar.Close.Activated:Connect(function()
			NewNotification:Destroy()
		end)

		coroutine.resume(coroutine.create(function()
			while wait(1) do
				if val ~= 0 then
					val = val - 1
					NewNotification.MSG.Text = msg.."("..val..")s"
				else
					NewNotification:Destroy()
				end
			end
		end))
	end

	function This:PromptLog(title, text, duration)
		local Frame1 = BLAHBLAH:Clone()
		Frame1.Parent = ScreenGui
		Frame1.Visible = true
		Frame1.ZIndex = 10

		MakeDraggable(Frame1.LogTopbar, Frame1)

		for _,v in pairs(Frame1:GetDescendants()) do
			if v:IsA("TextLabel") or v:IsA("TextButton") then
				Library:tween(v, {TextTransparency = 0})
			elseif v:IsA("Frame") and v.Name ~= "DropShgad" and v.Name ~= "Holder" then
				Library:tween(v, {BackgroundTransparency = 0})
			end
			Library:tween(Frame1, {BackgroundTransparency = 0})
		end

		Frame1.LogTopbar.LogTitle.Text = title or "Log"
		Frame1.Holder.UpdateLogFolder.MainLabel.Text = tostring(text)

		Frame1.LogTopbar.LogTopBarClose.Activated:Connect(function()
			Frame1:Destroy()
		end)
	end

	function This:UpdatePlayerList()
		local toClone = List:FindFirstChild("ScrollingFrame").PlayersList.TemplatePlayerLabel

		for i,v in pairs(List:FindFirstChild("ScrollingFrame").PlayersList:GetChildren()) do
			if v:IsA("TextButton") and v.Name ~= "TemplatePlayerLabel" then
				v:Destroy()
			end
		end

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Player then
				local Cloned = toClone:Clone()
				Cloned.Visible = true
				Cloned.Parent = List:FindFirstChild("ScrollingFrame").PlayersList
				if string.len(player.DisplayName) > 20 then
					Cloned:Destroy()
				end
				Cloned.Text = player.DisplayName
				Cloned.Name = player.Name

				Cloned.MouseButton1Click:Connect(function()
					This.SelectedTarget = Cloned.Name
					Library:tween(Cloned, {TextColor3 = Color3.fromRGB(255,255,255)})

					for _, label in pairs(List:FindFirstChild("ScrollingFrame").PlayersList:GetChildren()) do
						if label:IsA("TextButton") and label ~= Cloned then
							if label.Text == Player.Name or label.Text == Player.DisplayName then
								label:Destroy()
							end
							Library:tween(label, {TextColor3 = Color3.fromRGB(200,200,200)})
						end
					end
				end)
			end
		end
	end

	This:UpdatePlayerList()

	Players.PlayerAdded:Connect(function() This:UpdatePlayerList() end)
	Players.PlayerRemoving:Connect(function() This:UpdatePlayerList() end)

	GotoButton.Activated:Connect(function()
		if This.SelectedTarget ~= nil then
			TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(.05), {CFrame = Players:FindFirstChild(This.SelectedTarget).Character.HumanoidRootPart.CFrame}):Play()
		end
	end)

	local Specating = false
	SpectateButton.Activated:Connect(function()
		Specating = not Specating
		if This.SelectedTarget ~= nil then
			if Specating then
				SpectateButton.Text = "Spectating"
				workspace.CurrentCamera.CameraSubject = Players:FindFirstChild(This.SelectedTarget).Character
			else
				SpectateButton.Text = "Spectate"
				workspace.CurrentCamera.CameraSubject = Player.Character
			end
		end
	end)

	function This:Tab(args)
		args = Library:Validate({
			Text = "Tab",
			Icon = ""
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

				This.CurrentTabName = TabFrame.Name
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
				NotiText = nil,
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

					if args.NotiText ~= nil then
						This:Notification("Notification", tostring(args.NotiText), 3)
					end
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

		function Tab:Toggle(args)
			args = Library:Validate({
				Text = "Toggle",
				Callback = function() end
			}, args or {})

			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}

			local RenderedToggle = TemplateToggle:Clone()
			RenderedToggle.Visible = true
			RenderedToggle.Parent = TabFrame
			local Visual = RenderedToggle.ToggleDetection
			Visual.Text = "  "..args.Text

			function Toggle:Toggle(v)
				if v == nil then
					Toggle.State = not Toggle.State
				else
					Toggle = v
				end

				if Toggle.State then
					Library:tween(RenderedToggle.Toggler, {ImageTransparency = 0})
				else
					Library:tween(RenderedToggle.Toggler, {ImageTransparency = 1})
				end
				args.Callback(Toggle.State)
			end

			RenderedToggle.MouseEnter:Connect(function()
				Toggle.Hover = true

				Library:tween(RenderedToggle, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)})
				Library:tween(RenderedToggle.Toggler, {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
				Library:tween(Visual, {TextColor3 = Color3.fromRGB(255, 255, 255)})
			end)

			RenderedToggle.MouseLeave:Connect(function()
				Toggle.Hover = false

				if not Toggle.MouseDown then
					Library:tween(RenderedToggle, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
					Library:tween(RenderedToggle.Toggler, {BackgroundColor3 = Color3.fromRGB(63, 63, 63)})
					Library:tween(Visual, {TextColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
					Toggle.MouseDown = true

					Toggle:Toggle()
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Toggle.MouseDown = false
				end
			end)

			return Toggle
		end

		function Tab:Slider(args)
			args = Library:Validate({
				Text = "Slider",
				Min = 0,
				Max = 100,
				Default = 50,
				decimals = false,
				Callback = function(v) print(v) end
			}, args or {})

			local Slider = {
				Hover = false,
				MouseDown = false,
				Connection = nil
			}

			local RenderedSlider = TemplateSlider:Clone()
			RenderedSlider.Back.SliderName.Text = args.Text
			RenderedSlider.Back.Value.Text = args.Default
			RenderedSlider.Parent = TabFrame
			RenderedSlider.Visible = true

			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((Mouse.X - RenderedSlider.Back.AbsolutePosition.X) / (RenderedSlider.Back.AbsoluteSize.X), 0, 1)
					local value = math.floor(((args.Max - args.Min) * percentage) + args.Min)
					local value2 = ((args.Max - args.Min) * percentage) + args.Min

					if args.decimals == false then
						RenderedSlider.Back.Value.Text = tostring(value)
						TweenService:Create(RenderedSlider.Back.Fill, TweenInfo.new(.1), {Size = UDim2.fromScale(percentage, 1)}):Play()
					else
						RenderedSlider.Back.Value.Text = string.format("%.2f", value2)
						TweenService:Create(RenderedSlider.Back.Fill, TweenInfo.new(.1), {Size = UDim2.fromScale(percentage, 1)}):Play()
					end
					--RenderedSlider.Back.Fill.Size = UDim2.fromScale(percentage, 1)
				else
					if args.decimals == false then
						RenderedSlider.Back.Value.Text = tostring(math.floor(v))
						Library:tween(RenderedSlider.Back.Fill, {Size = UDim2.fromScale(((v - args.Min) / (args.Max - args.Min)), 1)})
					else
						RenderedSlider.Back.Value.Text = string.format("%.2f", v)
						Library:tween(RenderedSlider.Back.Fill, {Size = UDim2.fromScale((v - args.Min) / (args.Max - args.Min), 1)})
					end
				end
				args.Callback(Slider:GetValue())
			end
				
			function Slider:GetValue()
				return tonumber(RenderedSlider.Back.Value.Text)
			end

			Slider:SetValue(args.Default)

			RenderedSlider.Back.MouseEnter:Connect(function()
				Slider.Hover = true

				Library:tween(RenderedSlider.Back.Fill, {BackgroundColor3 = Color3.fromRGB(46, 35, 56)})
			end)

			RenderedSlider.Back.MouseLeave:Connect(function()
				Slider.Hover = false

				if not Slider.MouseDown then
					Library:tween(RenderedSlider.Back.Fill, {BackgroundColor3 = Color3.fromRGB(22, 17, 27)})
				end
			end)

			RenderedSlider.MouseEnter:Connect(function()
				Library:tween(RenderedSlider.Back.SliderName, {TextColor3 = Color3.fromRGB(255, 255, 255)})
			end)

			RenderedSlider.MouseLeave:Connect(function()
				Library:tween(RenderedSlider.Back.SliderName, {TextColor3 = Color3.fromRGB(200, 200, 200)})
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
					Slider.MouseDown = true

					if not Slider.Connection then
						Slider.Connection = RunService.RenderStepped:Connect(function()
							Slider:SetValue()
						end)
					end
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Slider.MouseDown = false

					if Slider.Connection then Slider.Connection:Disconnect() end
					Slider.Connection = nil
				end
			end)

			RenderedSlider.Back.Value.FocusLost:Connect(function(e)
				local clampedValue = math.clamp(RenderedSlider.Back.Value.Text, args.Min, args.Max)
				local percentage = (clampedValue - args.Min) / (args.Max - args.Min)

				Library:tween(RenderedSlider.Back.Fill, {Size = UDim2.fromScale(percentage, 1)})

				args.Callback(Slider:GetValue())
			end)			

			return Slider
		end

		function Tab:Label(args)
			args = Library:Validate({
				Text = "  Label",
				Weight = Enum.FontWeight.Medium
			}, args or {})

			local Label = {
				Hover = false
			}

			local RenderedLabel = TemplateLabel:Clone()

			RenderedLabel.Parent = TabFrame
			RenderedLabel.Label.FontFace.Weight = args.Weight
			RenderedLabel.Label.Text = "  "..args.Text
			RenderedLabel.Visible = true

			function Label:SetText(text)
				RenderedLabel.Label.Text = tostring("  "..text)
			end 

			RenderedLabel.MouseEnter:Connect(function()
				Label.Hover = true

				Library:tween(RenderedLabel.Label, {TextColor3 = Color3.fromRGB(255, 255, 255)})
			end)

			RenderedLabel.MouseLeave:Connect(function()
				Label.Hover = false

				Library:tween(RenderedLabel.Label, {TextColor3 = Color3.fromRGB(200, 200, 200)})
			end)

			return Label
		end

		function Tab:Dropdown(args)
			args = Library:Validate({
				Text = "  Dropdown",
				Callback = function(v) end,
				Items = {}
			}, args or {})

			local Dropdown = {
				Items = {
					["id"] = {
						"value"
					}
				},
				Children = {},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false,
				Value = nil
			}

			local RenderedDropdown = TemplateDropdown:Clone()
			RenderedDropdown.ZIndex = math.random(1, 99999)
			local List = RenderedDropdown.Dropdownlist
			local RenderedTemplate = List.TemplateDropdownBTN

			RenderedDropdown.Parent = TabFrame
			RenderedDropdown.DropDownVisuals.Text = "  "..args.Text
			RenderedDropdown.Visible = true

			function Dropdown:SetCallback(func)
				args.Callback = func
			end

			function Dropdown:Remove(id)
				if Dropdown.Items[id] ~= nil then
					for i,v in pairs(Dropdown.Items[id].instance) do
						v:Destroy()
					end
					Dropdown.Items[id] = nil
				end
			end

			function Dropdown:Clear()
				for i,v in pairs(Dropdown.Items) do
					v:Remove(i)
				end
			end

			function Dropdown:Toggle()
				if Dropdown.Open then
					Library:tween(RenderedDropdown.DropdownArrow, {Rotation = 0})
					for _, v in pairs(Dropdown.Children) do
						Library:tween(v, {BackgroundTransparency = 1})
						Library:tween(v, {TextTransparency = 1})
					end
					task.delay(.075, function()
						Library:tween(List, {Size = UDim2.new(0, 195, 0, 0)}, function()
							List.Visible = false
						end)
					end)
					if Dropdown.Hover then
						Library:tween(RenderedDropdown, {BackgroundColor3 = Color3.fromRGB(70, 70, 70)})
					end
				else
					Library:tween(RenderedDropdown.DropdownArrow, {Rotation = -180})
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count = count + 1
						end
					end
					List.Visible = true
					Library:tween(RenderedDropdown, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
					Library:tween(List, {Size = UDim2.new(0, 195, 0, 25 + (count * 25) + 5)}, function()
						for _, v in pairs(Dropdown.Children) do
							Library:tween(v, {BackgroundTransparency = 0})
							Library:tween(v, {TextTransparency = 0})
						end
					end)
				end
				Dropdown.Open = not Dropdown.Open
			end

			function Dropdown:Add(id, value)
				if Dropdown.Items[id] ~= nil then
					return
				end
				local addedChild = RenderedTemplate:Clone()
				addedChild.Parent = List

				Dropdown.Items[id] = {
					instance = {},	
					value = value
				}
				Dropdown.Items[id].instance = addedChild
				
				Dropdown.Items[id].instance.Visible = true
				Dropdown.Items[id].instance.BackgroundTransparency = 1
				Dropdown.Items[id].instance.TextTransparency = 1
		
				Dropdown.Items[id].instance.Name = id
				Dropdown.Items[id].instance.Text = value

				addedChild.MouseEnter:Connect(function()
					Dropdown.HoveringItem = true
				end)

				addedChild.MouseLeave:Connect(function()
					Dropdown.HoveringItem = false
				end)

				addedChild.Activated:Connect(function()
					args.Callback(value)
					Dropdown.Value = value
					RenderedDropdown.DropDownVisuals.Text = "  "..value
					Dropdown:Toggle()
				end)

				table.insert(Dropdown.Children, addedChild)
			end

			RenderedDropdown.DropDownVisuals.Activated:Connect(function()
				Dropdown:Toggle()
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Dropdown.Hover then
						Dropdown.MouseDown = true
					end
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dropdown.MouseDown = false
				end
			end)

			RenderedDropdown.MouseEnter:Connect(function()
				Dropdown.Hover = true

				if not Dropdown.Open then
					Library:tween(RenderedDropdown, {BackgroundColor3 = Color3.fromRGB(70, 70, 70)})
				end
				Library:tween(RenderedDropdown.DropdownArrow, {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(RenderedDropdown.DropDownVisuals, {TextColor3 = Color3.fromRGB(255, 255, 255)})
			end)

			RenderedDropdown.MouseLeave:Connect(function()
				Dropdown.Hover = false

				Library:tween(RenderedDropdown, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
				Library:tween(RenderedDropdown.DropdownArrow, {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(RenderedDropdown.DropDownVisuals, {TextColor3 = Color3.fromRGB(200, 200, 200)})
			end)
			
			return Dropdown
		end

		return Tab
	end

	return This
end

local currentVer = "1.7.4"
if isfolder("@FarlsXavier") then
	if not isfile("@FarlsXavier\\currentVersion.ver") then
		writefile("@FarlsXavier\\currentVersion.ver", currentVer)
	else
		local oldVer = readfile("@FarlsXavier\\currentVersion.ver")
		if oldVer == currentVer then
			warn(currentVer, "Matches skipping logs")
		else
			warn(currentVer, "Does not match: "..oldVer, "Updating...")
			writefile("@FarlsXavier\\currentVersion.ver", currentVer)
			task.wait(.1)
			if readfile("@FarlsXavier\\currentVersion.ver") == currentVer then
				warn("Updated.")
				coroutine.wrap(function()
					repeat wait() until Library.WindoHHHH ~= nil
					if ConfigDecode.StartUpNotifications == true and Library.WindoHHHH ~= nil then
						local UpdateLog = "-- You cant load mutliple of this ui lib now(I will add this to config)\n       Finally made spectate button functional\n       ..."

						Library.WindoHHHH:Notification("Notification", "Updated from "..oldVer.." to "..tostring(currentVer), 5)
						Library.WindoHHHH:PromptLog("Update Log", UpdateLog)
					end
				end)()
			end
		end
	end
else
	makefolder("@FarlsXavier")
	writefile("@FarlsXavier\\currentVersion.ver", currentVer)
	warn("OH MY FUCKING GOD THERE NO FOLDER STOP DELETING IT!!!")
end

return Library
