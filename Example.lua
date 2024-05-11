local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()

local Window = Library:Window({
	Title = "Ui library"
})

local Tabs = {
	["Test"] = Window:Tab({
		Text = "Test", Icon = "" -- rbxassetid://1234567890
	})
}

local Btn1 = Tabs.Test:Button({
	Text = "Refresh Playerlist",
	Callback = function()
		Window:UpdatePlayerList()
	end,
})
