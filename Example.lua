local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()

--[[
Alright for a simple start you obviously need to reference the library like done above(line 1)
]]

--[[
Now, we will make a window so we can see everything wowza.

So for the window there is 2 arguments
    1. Title it is a string and its exactly what you think it makes the title of the window what this is
    2. OnClose is a function and as it sounds whenever you close the ui it runs that function!!!!! usage will be below
]]


local Window = Library:Window({
	Title = "Ui Library",
	OnClose = function()
	    print("Closed the ui")
	end
}) -- Make the name whatever 

--[[ WINDOW FUNCTIONS ]]--

--Window:Close() 0 Arguments Closes the Window.

--Window:Notification() 3 Arguments Prompts a notification in the bottom left.
--[[ Notification args
Title:String
Message:String
Duration:Int IN SECONDS
]]--

Window:Notification("Title", "This is a notification", 5)

--Window:UpdatePlayerList() 0 Arguments Updates the player list on the right side of the Window.

--Window:Tab() 2 Arguments Makes a new tab and makes a new button on the left side navigation. FOR TABS i would make a table ill show an example below
--[[ Tab args
Text:String
Icon:String -- rbxassetid://1234567890
]]--

local Tabs = {
  ["Tab1"] = Window:Tab({Text = "Tab 1", Icon = "rbxassetid//IDNUMBERHERE"}) -- For more add comma and do this again
}

-- Or don't make a table and do this

local Tab2 = Window:Tab({Text = "Tab 2", Icon = "rbxassetid//IDNUMBERHERE"})

--[[ TAB FUNCTIONS ]]--

--Tab:Activate() 0 Arguments Don't use this

--Tab:Deactivate() 0 Arguments Don't use this

--Tab:Button() 2 Arguments This will make a button in your Tab you called this function on
--[[ Button args
Text:String
Callback:Function
]]--

Tab:Button({
   Text = "Click me!"
   Callback = function()
       print("Pressed")
   end
})

--[[ BUTTON FUNCTIONS ]]--
--Button:SetText() 1 Argument Sets the buttons text to the argument of the function
--Button:SetCallback() 1 Argument Replaces the callback with the argument of the function
