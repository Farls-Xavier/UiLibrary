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
	Text = "Press me!",
	Callback = function()
		warn("Pressed!")
	end,
})

local i = 0

Btn1:SetCallback(function()
	i += 1
	Btn1:SetText("  Pressed "..i.." times!")
end)
