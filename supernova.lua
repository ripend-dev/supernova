--[[
	Private KAH Script
	-----------------------------
	Created by: @Ripend
	Profile: dev
]]--

-- [ScriptInfo] --
local ScriptInfo = {
	VERSION = 'v0.1',
	PROFILE = 'free',
	RANK = 'User'
}
local SCRIPT_DEBUG = false

-- [Services] --
local ts = game:GetService("TweenService")
local rs = game:GetService("RunService")
local xs = game:GetService("TextService")
local players = game:GetService("Players")

-- [External: Color API] --
loadstring(game:HttpGet("https://pastebin.com/raw/jEDjp9Cw"))()

-- [External: i68] --
loadstring(game:HttpGet("https://pastebin.com/raw/mL9UAiYi"))()

-- [Global Variables] --
local prefix = "<"
local whitelist = {players.LocalPlayer.Name}
local blacklist = {'jhjssikeksms'}

local vgwhitelist = {players.LocalPlayer.Name, 'Di33le2'}
local agwhitelist = {}

local display_fallback = true

-- [Private Variables] --
local active = {
	perm = false,
	anticrash = false,
	mute = false,
	sbx = false,
	loopgrab = false,
	fixvelocity = false,
	clicktp = false,
	ark = false,
	gspin = false,
	sax = false,
	plag = false
}

local glob = {
	hue = 0
}

a = "🙏"
b = "😎"
c = "☠️"
d = "😞"
e = "😺"
f = "😱"
g = "😃"
h = "🥺"
i = "🥱"
j = "😭"
k = "💢"
l = "💯"
m = "😳"
n = "😖"
o = "😲"
p = "😮"
q = "🤣"
r = "😯"
s = "🤯"
t = "🤠"
u = "😂"
v = "🧐"
w = "😕"
x = "😟"
y = ","
z = "😥"
A = "的"
B = "一"
C = "是"
D = "不"
E = "了"
F = "人"
G = "我"
H = "在"
I = "有"
J = "他"
K = "这"
L = "为"
M = "之"
N = "大"
O = "来"
P = "以"
Q = "个"
R = "中"
S = "上"
T = "们"
U = "到"
V = "说"
W = "国"
X = "和"
Y = "地"
Z = "也"

convert = function(str)
	return str:gsub("[%a]", {
		a = a, b = b, c = c, d = d, e = e, f = f, g = g, h = h, i = i, j = j, k = k,
		l = l, m = m, n = n, o = o, p = p, q = q, r = r, s = s, t = t, u = u, v = v,
		w = w, x = x, y = y, z = z,
		A = A, B = B, C = C, D = D, E = E, F = F, G = G, H = H, I = I, J = J, K = K,
		L = L, M = M, N = N, O = O, P = P, Q = Q, R = R, S = S, T = T, U = U, V = V,
		W = W, X = X, Y = Y, Z = Z
	})
end

unconvert = function(str)
	return str:gsub("[%z\128-\255\194-\244][\128-\191]*", {
		[a] = "a", [b] = "b", [c] = "c", [d] = "d", [e] = "e", [f] = "f", [g] = "g",
		[h] = "h", [i] = "i", [j] = "j", [k] = "k", [l] = "l", [m] = "m", [n] = "n",
		[o] = "o", [p] = "p", [q] = "q", [r] = "r", [s] = "s", [t] = "t", [u] = "u",
		[v] = "v", [w] = "w", [x] = "x", [y] = "y", [z] = "z",
		[A] = "A", [B] = "B", [C] = "C", [D] = "D", [E] = "E", [F] = "F", [G] = "G",
		[H] = "H", [I] = "I", [J] = "J", [K] = "K", [L] = "L", [M] = "M", [N] = "N",
		[O] = "O", [P] = "P", [Q] = "Q", [R] = "R", [S] = "S", [T] = "T", [U] = "U",
		[V] = "V", [W] = "W", [X] = "X", [Y] = "Y", [Z] = "Z"
	})
end

local gears = {
	['railgun'] = 79446473,
	['fish'] = 46360920,
	['bucket'] = 18474459,
	['ivory'] = 108158379,
	['tripmine'] = 11999247,
	['tnt'] = 12562495,
	['piano'] = 113299590,
	['airstrike'] = 88885539,
	['saxophone'] = 2620523077,
	['bike'] = 477911027,
	['detonator'] = 74385399,
	['hippo'] = 1178843200,
	['treehouse'] = 119917513,
	['omega'] = 287426148,
	['redraygun'] = 106064447
}

-- game.Workspace.FallenPartsDestroyHeight = 0/0

local lp = players.LocalPlayer
local chatbar = lp:WaitForChild("PlayerGui").Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
chatbar.ZIndex = 10

local sel = {}
local ms = lp:GetMouse()

local gui = Instance.new("ScreenGui")
gui.Name = "NotifyGui"
gui.Parent = lp:WaitForChild("PlayerGui", 10)
	
local autocomplete = Instance.new("TextLabel")
autocomplete.Parent = chatbar
autocomplete.BackgroundTransparency = 1
autocomplete.TextXAlignment = Enum.TextXAlignment.Left
autocomplete.Size = UDim2.new(1, 0, 1, 0)
autocomplete.Name = "Autocomplete"
autocomplete.Font = chatbar.Font
autocomplete.FontSize = chatbar.FontSize
autocomplete.TextColor3 = Color3.fromHSV(1, 0, 0.3)
autocomplete.Position = UDim2.new(0, 0, 0, 0)
autocomplete.Text = ""

local _game = game.Workspace.Terrain._Game
local admin = _game.Admin
local regen = admin:FindFirstChild("Regen")
local pads = admin:FindFirstChild("Pads")

local tparts = {}
local tactive = false

local personns = false

local btools = {
	hammer = {
		equipped = false,
		highlight = nil,
		prevent = false
	},
	move = {
		equipped = false,
		debounce = false,
		dragger = nil,
		offset = -1,
		highlight = nil
	},
	clone = {
		highlight = nil,
		equipped = false
	},
	resize = {
	    highlight = nil,
	    equipped = false,
	    previousDistance = 0
	},
	preview = {},
	parts = {},
	idx = 1,
	ready = false,
	nextpos = CFrame.new(Vector3.new(0, 0, 0)),
	active = false,
	targets = {},
	saved = {},
	slot2 = {}
}

btools.rempreview = function(r)
	for i, v in pairs(btools.preview) do
		if v.Name == r then
			table.remove(btools.preview, i)
			return
		end
	end
end

btools.makepreview = function(size, pos)
	local i = Instance.new("Part")
	i.CFrame = pos
	i.Size = size
	i.Name = "PreviewPart"..tostring(#btools.preview+1)
	i.Parent = workspace
	table.insert(btools.preview, i)
end

local last = {}

local commands = {}
local connections = {}
local notistrike = {
	armed = false,
	engaged = false,
	strikes = 0
}

local spam = {
	active = false,
	cmds = {}
}

local vis = {
	parts = {},
	radius = 8,
	amount = 8,
	paint = "hue",
	mode = 1,
	size = "1/2/4",
	speed = 0.01,
	sensitivity = 0.04,
	orbiter = lp,
	paints = {},
	modes = {},
	angle = 0,
	active = false,
	queue = false
}

local rkick = {
	active = false,
	target = '',
	time = 0
}

local _angle = 0

-- [Functions] --
vis.modes[1] = function()
	for i, v in pairs(vis.parts) do
		if not v or v.Parent == nil then
			execcmd('revis')
			return
		end
		coroutine.wrap(function()
		    local angle = i * ((2 * math.pi) / #vis.parts) + vis.angle
		    local x, z = getxz(angle, vis.radius)
		    
		    local cframe = (vis.orbiter.Character.HumanoidRootPart.CFrame * CFrame.new(x, 0, z)).p
		    local lookAt = vis.orbiter.Character.HumanoidRootPart.Position
		    
		    movepart(v, CFrame.new(cframe, lookAt))
		end)()
	end
end

vis.paints['hue'] = function()
	for i, v in pairs(vis.parts) do
		colorAPI.color(v, Color3.fromHSV(glob.hue, 1, 1))
	end
end

vis.paints['reactive'] = function()
	for i, v in pairs(vis.parts) do
        if _game.Folder:FindFirstChild("Sound") then
            colorAPI.color(v, v.Color:Lerp(Color3.fromRGB(_game.Folder.Sound, 128, 128), 0.1))
        end
	end
end

function generate_execute()
	local execute = Instance.new("Tool")
	execute.TextureId = "http://www.roblox.com/asset/?id=19701348"
	execute.Name = "ExecuteParts"
	execute.RequiresHandle = false
	execute.ToolTip = "Execute"
	execute.Parent = lp.Backpack
	
	execute.Activated:Connect(function()
	    btools.active = not btools.active
	    if not btools.active then
            err("Stopped btools. Click again to re-build")
            return
	    end
		local start = tick()
		log("Creating "..tostring(#btools.preview).." parts. Estimated time: "..tostring(#btools.preview*25).."ms")
		btools.targets = {}
		for _, v in pairs(btools.preview) do
            task.wait(0.025)
            v.Transparency = 0.75
            v.Color = Color3.new(0, 1, 0)
			btools.nextpos = v.CFrame
			btools.ready = true
			rchat("part/"..tostring(v.Size.X).."/"..tostring(v.Size.Y).."/"..tostring(v.Size.Z))
			repeat task.wait() until btools.ready == false
		end
		log("Done! in "..tostring(math.round((tick()-start)*1000)).."ms")
		for _, v in pairs(btools.preview) do
            v:Destroy()
		end
        btools.preview = {}
	end)
end

function generate_clone()
	local clone = Instance.new("Tool")
	clone.TextureId = "rbxassetid://844384404"
	clone.Name = "ClonePart"
	clone.RequiresHandle = false
	clone.ToolTip = "Clone parts"
	clone.Parent = lp.Backpack
	
	local highlight = Instance.new("SelectionBox")
	highlight.Visible = false
	highlight.Color3 = Color3.new(0, 1, 0)
	highlight.Parent = clone
	btools.clone.highlight = highlight
	
	clone.Equipped:Connect(function()
		btools.clone.equipped = true
	end)

	clone.Activated:Connect(function()
		if ms.Target and string.sub(ms.Target.Name, 1, 11) == "PreviewPart" then
			btools.makepreview(ms.Target.Size, ms.Target.CFrame)
		end
	end)
	
	clone.Unequipped:Connect(function()
		btools.clone.equipped = false
		btools.clone.highlight.Visible = false
		btools.clone.highlight.Parent = clone
	end)
end

function generate_resize()
	local resize = Instance.new("Tool")
	resize.TextureId = "rbxasset://icons/resize.png"
	resize.Name = "ResizePart"
	resize.RequiresHandle = false
	resize.ToolTip = "Resize parts"
	resize.Parent = lp.Backpack
	
	local highlight = Instance.new("SelectionBox")
	highlight.Color3 = Color3.fromRGB(0, 143, 156)
	highlight.Parent = lp.PlayerGui
	btools.resize.highlight = highlight
	
	local handles = Instance.new("Handles")
	handles.Color = BrickColor.new("Bright bluish green")
	handles.Adornee = nil
	handles.MouseDrag:Connect(function(normal, distance)
        if btools.resize.handles.Adornee then
            local size = btools.resize.handles.Adornee.Size
            if size.X > 10 or size.Y > 10 or size.Z > 10 then
                local x = math.clamp(size.X, 0, 10)
                local y = math.clamp(size.Y, 0, 10)
                local z = math.clamp(size.Z, 0, 10)
                btools.resize.handles.Adornee.Size = Vector3.new(x, y, z)
                btools.resize.handles.Color = BrickColor.new("Bright red")
                btools.resize.highlight.Color3 = Color3.fromRGB(196, 40, 28)
                return
            else
                btools.resize.handles.Color = BrickColor.new("Bright bluish green")
                btools.resize.highlight.Color3 = Color3.fromRGB(0, 143, 156)
            end
    		local delta = distance - btools.resize.previousDistance 
    		if math.abs(delta) >= btools.resize.handles.Adornee.ResizeIncrement then
    			local sizeDelta = math.floor(delta / btools.resize.handles.Adornee.ResizeIncrement + 0.5) * btools.resize.handles.Adornee.ResizeIncrement
    			if btools.resize.handles.Adornee:Resize(normal, sizeDelta) then
    				btools.resize.previousDistance = distance
    			end
    		end
    	end
    end)
	handles.MouseButton1Down:Connect(function()
        btools.resize.previousDistance = 0
    end)
	handles.Parent = lp.PlayerGui
	btools.resize.handles = handles
	
	resize.Equipped:Connect(function()
		btools.resize.equipped = true
		resize.TextureId = "rbxasset://icons/resize_sel.png"
	end)
	
	resize.Unequipped:Connect(function()
		btools.resize.equipped = false
		btools.resize.highlight.Adornee = nil
		btools.resize.handles.Adornee = nil
		resize.TextureId = "rbxasset://icons/resize.png"
	end)
end

function generate_spart()
	local spart = Instance.new("Tool")
	spart.TextureId = "http://www.roblox.com/asset?id=179628862"
	spart.Name = "SpawnPart"
	spart.RequiresHandle = false
	spart.ToolTip = "Spawn parts"
	spart.Parent = lp.Backpack
	
	spart.Activated:Connect(function()
		btools.makepreview(Vector3.new(1, 2, 5), lp.Character.Head.CFrame)
	end)
end

function generate_move()
	local move = Instance.new("Tool")
	move.Name = "MovePart"
	move.RequiresHandle = false
	move.TextureId = "rbxasset://icons/freemove.png"
	move.ToolTip = "Move parts"
	move.Parent = lp.Backpack
	
	local highlight = Instance.new("SelectionBox")
	highlight.Visible = false
	highlight.Color3 = Color3.new(1, 1, 0)
	highlight.Parent = move
	btools.move.highlight = highlight
	
	move.Equipped:Connect(function()
		btools.move.equipped = true
		ms.Icon ="rbxasset://textures\\GrabCursor.png"
	end)
	
	move.Unequipped:Connect(function()
		btools.move.equipped = false
		ms.Icon = ""
		btools.move.highlight.Visible = false
		btools.move.highlight.Parent = move
	end)
end

function generate_hammer()
	local hammer = Instance.new("Tool")
	hammer.Name = "Hammer"
	hammer.RequiresHandle = false
	hammer.TextureId = "rbxasset://Textures/Hammer.png"
	hammer.ToolTip = "Destroy parts"
	hammer.Parent = lp.Backpack
	
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://3636967384"
	sound.Parent = hammer
	
	local highlight = Instance.new("SelectionBox")
	highlight.Visible = false
	highlight.Color3 = Color3.new(1, 0, 0)
	highlight.Parent = hammer
	btools.hammer.highlight = highlight
	
	hammer.Equipped:Connect(function()
		ms.Icon = "rbxasset://textures\\HammerCursor.png"
		btools.hammer.equipped = true
	end)
	
	hammer.Activated:Connect(function()
		if not ms.Target or string.sub(ms.Target.Name, 1, 11) ~= "PreviewPart" then
			return
		end
		btools.hammer.highlight.Visible = false
		btools.hammer.highlight.Parent = hammer
		btools.hammer.prevent = true
		task.wait()
		coroutine.wrap(function()
			ms.Icon = "rbxasset://textures\\HammerDownCursor.png"
			btools.rempreview(ms.Target.Name)
			sound:Play()
			local explosion = Instance.new("Explosion")
			explosion.Position = ms.Target.Position
			explosion.BlastRadius = 0
			explosion.BlastPressure = 0
			explosion.Visible = true
			explosion.Parent = workspace
			ms.Target:Destroy()
			task.wait(0.3)
			ms.Icon = "rbxasset://textures\\HammerCursor.png"
			explosion:Destroy()
		end)()
		btools.hammer.prevent = false
	end)
	
	hammer.Unequipped:Connect(function()
		ms.Icon = ""
		btools.hammer.equipped = false
		btools.hammer.highlight.Visible = false
		btools.hammer.highlight.Parent = hammer
	end)
end

function log(msg, duration)
	local dur = duration or 5
	coroutine.wrap(function()
		for _, oldNotif in pairs(gui:GetChildren()) do
			local twinfo = TweenInfo.new(0.15)
			ts:Create(oldNotif, twinfo, {Position = oldNotif.Position - UDim2.new(0,0,0, oldNotif.Size.Y.Offset + 20)}):Play()
		end
		local twinfo = TweenInfo.new(0.15)
		local newNotif = Instance.new("TextLabel", gui)
		newNotif.Text = msg
		newNotif.TextTransparency = 1
		newNotif.Size = UDim2.new(1, 0, 0.05, 0)
		newNotif.AnchorPoint = Vector2.new(1, 1)
		newNotif.Position = UDim2.new(1,-10,1,-10)
		newNotif.BackgroundTransparency = 1
		newNotif.TextColor3 = Color3.new(0.95, 0.95, 0.95)
		newNotif.Font = Enum.Font.GothamBold
		newNotif.TextScaled = false
		newNotif.TextSize = 16
		newNotif.RichText = true
		ts:Create(newNotif, twinfo, {TextTransparency = 0, Position = UDim2.new(1,-10,0.925,-10)}):Play()
		task.wait(dur)
		ts:Create(newNotif, twinfo, {TextTransparency = 1, Position = newNotif.Position - UDim2.new(0,0,0, newNotif.Size.Y.Offset + 10)}):Play()
		task.wait(0.15)
		newNotif:Destroy()
	end)()
end

function getxz(angle, radius)
	local x = math.cos(angle) * radius
	local z = math.sin(angle) * radius
	return x, z
end

function err(msg, duration)
	local dur = duration or 5
	coroutine.wrap(function()
		for _, oldNotif in pairs(gui:GetChildren()) do
			local twinfo = TweenInfo.new(0.15)
			ts:Create(oldNotif, twinfo, {Position = oldNotif.Position - UDim2.new(0,0,0, oldNotif.Size.Y.Offset + 20)}):Play()
		end
		local twinfo = TweenInfo.new(0.15)
		local newNotif = Instance.new("TextLabel", gui)
		newNotif.Text = msg
		newNotif.TextTransparency = 1
		newNotif.Size = UDim2.new(1, 0, 0.05, 0)
		newNotif.AnchorPoint = Vector2.new(1, 1)
		newNotif.Position = UDim2.new(1,-10,1,-10)
		newNotif.BackgroundTransparency = 1
		newNotif.TextColor3 = Color3.new(0.95, 0.05, 0.05)
		newNotif.Font = Enum.Font.GothamBold
		newNotif.TextScaled = false
		newNotif.TextSize = 16
		newNotif.RichText = true
		ts:Create(newNotif, twinfo, {TextTransparency = 0, Position = UDim2.new(1,-10,0.925,-10)}):Play()
		task.wait(dur)
		ts:Create(newNotif, twinfo, {TextTransparency = 1, Position = newNotif.Position - UDim2.new(0,0,0, newNotif.Size.Y.Offset + 10)}):Play()
		task.wait(0.15)
		newNotif:Destroy()
	end)()
end

function hookgui()
	gui = Instance.new("ScreenGui")
	gui.Name = "NotifyGui"
	gui.Parent = lp:WaitForChild("PlayerGui", 10)
		
	autocomplete = Instance.new("TextLabel")
	autocomplete.Parent = chatbar
	autocomplete.BackgroundTransparency = 1
	autocomplete.TextXAlignment = Enum.TextXAlignment.Left
	autocomplete.Size = UDim2.new(1, 0, 1, 0)
	autocomplete.Name = "Autocomplete"
	autocomplete.Font = chatbar.Font
	autocomplete.FontSize = chatbar.FontSize
	autocomplete.TextColor3 = Color3.fromHSV(1, 0, 0.3)
	autocomplete.Position = UDim2.new(0, 0, 0, 0)
	autocomplete.Text = ""
end


function fixall()
	rchat("gear me 00000000000000000018474459")
	task.wait(1)
	lp.Character.Humanoid:EquipTool(lp.Backpack.PaintBucket)
	task.wait(0.50)
	coroutine.wrap(function()
		colorAPI.colorHouse({
			wallsC = colorAPI.transformToColor3(BrickColor.new("Brick yellow")),
			baseC = colorAPI.transformToColor3(BrickColor.new("Bright green")),
			roofC = colorAPI.transformToColor3(BrickColor.new("Bright red")),
			WANDDC = colorAPI.transformToColor3(BrickColor.new("Dark orange")),
			stairsC = colorAPI.transformToColor3(BrickColor.new("Dark stone grey")),
			floorC = colorAPI.transformToColor3(BrickColor.new("Medium blue")),
			rooftsC = colorAPI.transformToColor3(BrickColor.new("Reddish brown")),
			chiC = colorAPI.transformToColor3(BrickColor.new("Sand red"))
		})
	end)()
	task.spawn(function()
		colorAPI.colorBuildingBricks({
			DarkStoneGrey = colorAPI.transformToColor3(BrickColor.new("Dark stone grey")),
			DeepBlue = colorAPI.transformToColor3(BrickColor.new("Deep blue")),
			NY = colorAPI.transformToColor3(BrickColor.new("New Yeller")),
			IW = colorAPI.transformToColor3(BrickColor.new("Institutional white")),
			LimeGreen = colorAPI.transformToColor3(BrickColor.new("Lime green")),
			MSG = colorAPI.transformToColor3(BrickColor.new("Medium Stone grey")),
			RB = colorAPI.transformToColor3(BrickColor.new("Really black")),
			TP = colorAPI.transformToColor3(BrickColor.new("Toothpaste")),
			RR = colorAPI.transformToColor3(BrickColor.new("Really red"))
		})
	end)
	colorAPI.color(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], colorAPI.transformToColor3(BrickColor.new("Bright green")))
	spawn(function()
		colorAPI.colorObbyBox(colorAPI.transformToColor3(BrickColor.new("Teal")))
	end)
	spawn(function()
		colorAPI.colorObbyBricks(colorAPI.transformToColor3(BrickColor.new("Really red")))
	end)
	spawn(function()
		colorAPI.colorAdminDivs(colorAPI.transformToColor3(BrickColor.new("Dark stone grey")))
	end)
	spawn(function()
		colorAPI.colorPads(colorAPI.transformToColor3(BrickColor.new("Bright green")))
	end)
	task.wait(0.6)
	rchat("ungear 000000000000000000000000000000000000000000000000000000000 me "..math.random(99999))
end

function paintall(r, g, b)	
	rchat("gear me 00000000000000000018474459")
	local c = Color3.fromRGB(r, g, b)
	wait(1)
	lp.Character.Humanoid:EquipTool(lp.Backpack.PaintBucket)
	wait(0.50)
	coroutine.wrap(function()
	colorAPI.colorHouse({
			wallsC = c,
			baseC = c,
			roofC = c,
			WANDDC = c,
			stairsC = c,
			floorC = c,
			rooftsC = c,
			chiC = c
		})
	end)()
	task.spawn(function()
		colorAPI.colorBuildingBricks({
			DarkStoneGrey = c,
			DeepBlue = c,
			NY = c,
			IW = c,
			LimeGreen = c,
			MSG = c,
			RB = c,
			TP = c,
			RR = c
		})
	end)
	colorAPI.color(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], c)
	spawn(function()
		colorAPI.colorObbyBox(c)
	end)
	spawn(function()
		colorAPI.colorObbyBricks(c)
	end)
	spawn(function()
		colorAPI.colorAdminDivs(c)
	end)
	spawn(function()
		colorAPI.colorPads(c)
	end)
	task.wait(0.6)
	rchat("ungear 000000000000000000000000000000000000000000000000000000000 me "..math.random(99999))
end

function movepart(part, new)
	if not part then return end
	if part.ReceiveAge ~= 0 then return end
	part.Velocity = Vector3.new(0, 31, 0)
	--part.CanCollide = false
	part.Anchored = true
	part.CFrame = part.CFrame:Lerp(new, 0.2)
	task.wait()
	part.Anchored = false
end

function prepare()
    workspace.Gravity = 0
    for _, v in pairs(workspace:GetDescendants()) do
        if v.ClassName == "Part" then
            v.CanCollide = false
        end
    end
end

function finish()
    workspace.Gravity = 196.19999
    for _, v in pairs(workspace:GetDescendants()) do
        if v.ClassName == "Part" then
            v.CanCollide = true
        end
    end
end

function attach(target)
    prepare()
    local cf = lp.Character.HumanoidRootPart
    local looping = true
    coroutine.wrap(function()
        while true do
            task.wait()
            lp.Character['Humanoid']:ChangeState(11)
            cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)
            if not looping then break end
        end
    end)()
    coroutine.wrap(function() while looping do task.wait(.095) rchat('unpunish me') end end)()
    task.wait(0.1)
    looping = false
    finish()
end

function bypass(r)
	local letters = string.split(r, '')
	for i, v in pairs(letters) do
		rchat('h '..[[

















]]..string.rep(' ',math.ceil(i*2.8))..v..[[










]])
	end
end

function notice(msg)
	if personns then
		rchat([[h/ 



]]..msg..[[




]])
	else
		rchat([[h 



]]..msg..[[




]])
	end
end

function notify(plr, r)
	if plr == "" then return end
	if notistrike.engaged then return end
	if personns then rchat("pm/"..plr.."/"..tostring(r))
				else rchat("pm "..plr.." "..tostring(r)) end
	if not notistrike.armed then
		task.spawn(function()
			notistrike.armed = true
			task.wait(7)
			notistrike.armed = false
			notistrike.strikes = 0
		end)
	else
		notistrike.strikes += 1
		if notistrike.strikes >= 7 then
			notistrike.engaged = true
			task.spawn(function()
				task.wait(10)
				notistrike.engaged = false
				notistrike.armed = false
				notistrike.strikes = 0
			end)
		end
	end
end

function checkchat()
	if chatbar:IsFocused() and string.len(chatbar.Text) > 1 then
		if string.sub(chatbar.Text, 1, string.len(prefix)) == prefix then
            for k, v in pairs(commands) do
                if string.sub(chatbar.Text, string.len(prefix)+1) == string.sub(k, 1, string.len(chatbar.Text)-1) then
                    autocomplete.Text = prefix..k
                    break
                else
                    autocomplete.Text = ""
                end
            end
        else
            autocomplete.Text = ""
        end
	else
		autocomplete.Text = ""
	end
end

function findplr(plr)
	if not plr then return end
	if plr == "@" then return lp end
	if plr == "$" then return players:GetPlayers()[math.random(1, #players:GetPlayers())] end
	if plr == "notme" then
		local f = nil
		repeat f = players:GetPlayers()[math.random(1, #players:GetPlayers())] until f ~= lp
		return f
	end
	for _, v in pairs(players:GetPlayers()) do
		if string.lower(string.sub(v.Name, 1, string.len(plr))) == string.lower(plr) then
			return v
		end
	end
	for _, v in pairs(players:GetPlayers()) do
		if string.lower(string.sub(v.DisplayName, 1, string.len(plr))) == string.lower(plr) then
			return v
		end
	end
	return nil
end

function rchat(msg)
	local text = chatbar.Text
	chatbar:SetTextFromInput(msg)
	players:Chat(msg)
	chatbar:SetTextFromInput(text)
end

function ownsgp(userid, gamepassid)
    local s,res = pcall(game:GetService("MarketplaceService").UserOwnsGamePassAsync,game:GetService("MarketplaceService"),userid,gamepassid)
    if not s then
        res = false
    end
    return res
end

function reg()
	if regen then fireclickdetector(regen.ClickDetector, 0) end
end

function execcmd(name, args)
	if not name then return end
	local arg = args or ''
	for k, v in pairs(commands) do
		if k:lower() == name:lower() or v.aliases and table.find(v.aliases, name:lower()) then
			v.command(arg)
			return
		end
	end
	err("E001: execcmd() no command was found")
end

if SCRIPT_LOADED and not SCRIPT_DEBUG then
	err("Script is already running!")
	coroutine.yield(0)
end

if not game:IsLoaded() then
	print("[SCRIPT] waiting for game to load...")
	game.Loaded:Wait()
end

if ownsgp(lp.UserId, 35748) then
	personns = true
end

-- [Commands] --
commands = {
	['exit'] = {
		description = "Exits and disables the script",
		command = function()
			for _, v in pairs(connections) do
				v:Disconnect()
			end
			log("Disconnected")
			autocomplete:Destroy()
			pcall(function() getgenv().SCRIPT_LOADED = false end)
			coroutine.yield(0)
		end
	},
	['getpad'] = {
		description = "Fire touchinterest on a pad",
		command = function()
			if not firetouchinterest then
				err("E002: Your executor is missing the firetouchinterest() function")
				return
			end
			if not pads then
				err("Pads couldn't be found")
				return
			end
			
			if pads:FindFirstChild(lp.Name.."'s admin") then
				return
			end
			
			local free = pads:FindFirstChild("Touch to get admin")
			if free then
				coroutine.wrap(function()
					firetouchinterest(lp.Character:WaitForChild("Head"), free.Head, 0)
					firetouchinterest(lp.Character:WaitForChild("Head"), free.Head, 1)
				end)()
			else
				if regen then
					fireclickdetector(regen.ClickDetector, 0)
					local strike = 0
					repeat task.wait(); strike += 1 until pads:FindFirstChild("Touch to get admin") or strike >= 300
					
					if strike >= 300 then
						err("Couldn't get a pad because none is left and strike was hit")
						return
					end
					
					coroutine.wrap(function()
						local pad = pads:FindFirstChild("Touch to get admin")
						firetouchinterest(lp.Character:WaitForChild("Head"), pad.Head, 0)
						firetouchinterest(lp.Character:WaitForChild("Head"), pad.Head, 1)
					end)()
				else
					err("Couldn't get a pad because none is left and regen couldn't be found")
					return
				end
			end
		end,
		aliases = {'gp'}
	},
	['perm'] = {
		description = "Automatically takes a pad for you",
		command = function()
			if not firetouchinterest then
				err("E002: Your executor is missing the firetouchinterest() function")
				return
			end
			if not pads then
				err("Pads couldn't be found")
				return
			end
			active.perm = not active.perm
			log("Perm: "..tostring(active.perm))
		end
	},
	['rejoin'] = {
		description = "Rejoin the server",
		command = function()
			log("Rejoining the server...")
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
		end,
		aliases = {'rj', 'rej'}
	},
	['house'] = {
		description = "Teleports you to the house",
		command = function()
			lp.Character:MoveTo(Vector3.new(-28.6829948, 8.2299995, 66.4913253))
		end,
		aliases = {'th'}
	},
	['firecd'] = {
		description = "Call fireclickdetector() on regen",
		command = function()
			if not fireclickdetector then
				err("E003: Your executor is missing the fireclickdetector() function")
			end
			reg()
		end,
		aliases = {'reg', 'fire'}
	},
	['scol'] = {
		description = "Switch obby wall collisions",
		command = function()
			local box = _game.Workspace:FindFirstChild("Obby Box")
			if not box then
				err("Obby box not found")
				return
			end
			for _, v in pairs(box:GetChildren()) do
				v.CanCollide = not v.CanCollide
			end
			log("Switched obby wall collisions")
		end
	},
	['rok'] = {
		description = "RemoveObbyKill",
		command = function()
			if not _game.Workspace:FindFirstChild("Obby") then
				err("No obby found")
				return
			end
			for _, v in pairs(_game.Workspace.Obby:GetChildren()) do
				local ti = v:FindFirstChild("TouchInterest")
				if ti then ti:Destroy() end
			end
			log("Removed obby kill")
		end,
		aliases = {'nok'}
	},
	['antirk'] = {
		description = "Turn on/off anti rocket kick",
		command = function()
			active.ark = not active.ark
			log("ARK: "..tostring(active.ark))
		end
	},
	['shop'] = {
		description = "Hop into the next server",
		command = function()
			local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
			for _, s in pairs(servers.data) do
				if s.playing ~= s.maxPlayers and s.id ~= game.JobId then
					log("Joining a server with "..tostring(s.playing).." players...")
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id)
					break
				end
			end
		end
	},
	['anticrash'] = {
		description = "Turns on/off anticrash",
		command = function()
			active.anticrash = not active.anticrash
			log("Anticrash: "..tostring(active.anticrash))
			for _, v in pairs(players:GetPlayers()) do
				if v.Character:FindFirstChild("VampireVanquisher") and not table.find(vgwhitelist, v.Name) or v.Backpack:FindFirstChild("VampireVanquisher") and not table.find(vgwhitelist, v.Name) or v.Character:FindFirstChild("Emerald Knights of the Seventh Sanctum Sword and Shield") and not table.find(vgwhitelist, v.Name) or v.Backpack:FindFirstChild("Emerald Knights of the Seventh Sanctum Sword and Shield") and not table.find(vgwhitelist, v.Name) then
					if personns then rchat("ungear/ANTICRASH "..string.rep(" ",150)..plr.Name)
								else rchat("ungear ANTICRASH "..string.rep(" ",150)..plr.Name) end
					notify(plr.Name, 'VampireVanquisher is blacklisted in this server')
				end
			end
		end
	},
	['vgwl'] = {
		description = "Adds someone to the vg whitelist",
		command = function(r)
			local plr = findplr(r)
			if not plr then err("Error: no player found for "..r); return end
			if table.find(vgwhitelist, plr.Name) then err("Error: player is already whitelisted"); return end
			table.insert(vgwhitelist, plr.Name)
			log("VampireGear whitelisted "..plr.Name)
		end
	},
	['unvgwl'] = {
		description = "Removes someone from the vg whitelist",
		command = function(r)
			local plr = findplr(r)
			if not plr then err("Error: no player found for "..r); return end
			if not table.find(vgwhitelist, plr.Name) then err("Error: player is not whitelisted"); return end
			table.remove(vgwhitelist, table.find(vgwhitelist, plr.Name))
			log("Removed VampireGear whitelist from "..plr.Name)
		end
	},
	['blacklist'] = {
		description = "Adds someone to the blacklist",
		command = function(r)
			local plr = findplr(r)
			if not plr then err("Error: no player found for "..r); return end
			if table.find(blacklist, plr.Name) then err("Error: player is already whitelisted"); return end
			table.insert(blacklist, plr.Name)
			rchat("respawn "..plr.Name)
			rchat("skydive "..plr.Name)
			rchat("punish "..plr.Name)
			rchat("blind "..plr.Name)
			execcmd('firecd')
			notify(plr.Name, "You have been blacklisted")
			log("Blacklisted "..plr.Name)
		end,
		aliases = {'bl'}
	},
	['unblacklist'] = {
		description = "Removes someone from the blacklist",
		command = function(r)
			local plr = findplr(r)
			if not plr then err("Error: no player found for "..r); return end
			if not table.find(blacklist, plr.Name) then err("Error: player is not blacklisted"); return end
			table.remove(blacklist, table.find(blacklist, plr.Name))
			rchat("respawn "..plr.Name)
			log("Removed blacklist from "..plr.Name)
		end,
		aliases = {'unbl'}
	},
	['repeat'] = {
		description = "Repeat a command multiple times",
		command = function(r)
			local split = string.split(r, "|")
			local args = {}
			
			for _, a in pairs(split) do
				local t = string.gsub(a, '^%s*(.-)%s*$', '%1')
				table.insert(args, t)
			end
			
			if #args == 1 then
				for i = 1, 200 do
					rchat(args[1])
				end
			elseif #args == 2 then
				if not tonumber(args[2]) then err("Error: Malformed number"); return end
				for i = 1, tonumber(args[2]) do
					rchat(args[1])
				end
			else
				err("Error: Unsupported argument count for repeat")
				return
			end
		end,
		aliases = {'rep'}
	},
	['srepeat'] = {
		description = "Same as "..prefix.."repeat but slower to avoid rate limit",
		command = function(r)
			local split = string.split(r, "|")
			local args = {}
			
			for _, a in pairs(split) do
				local t = string.gsub(a, '^%s*(.-)%s*$', '%1')
				table.insert(args, t)
			end
			
			if #args == 1 then
				for i = 1, 200 do
					rchat(args[1])
					task.wait()
				end
			elseif #args == 2 then
				if not tonumber(args[2]) then err("Error: Malformed number"); return end
				for i = 1, tonumber(args[2]) do
					rchat(args[1])
					task.wait()
				end
			else
				err("Error: Unsupported argument count for repeat")
				return
			end
		end,
		aliases = {'srep'}
	},
	['rgear'] = {
		description = "Gives you (or someone else) a random gear",
		command = function(r)
			local args = string.split(r, " ")
			if #args == 0 then
				last = {}
				local v = i68.gears[math.random(1, #i68.gears)]
				rchat("gear me "..v)
				last = {v}
				return
			elseif #args == 1 then
				if tonumber(args[1]) then
					last = {}
					for i = 1, tonumber(args[1]) do
						local v = i68.gears[math.random(1, #i68.gears)]
						rchat("gear me "..v)
						table.insert(last, v)
					end
					log("Gave yourself "..args[1].." random gears")
					return
				else
					local plr = findplr(args[1])
					if not plr then
						err("Error: Malformed number/no player found")
						return
					end
					rchat("gear "..plr.Name.." "..i68.gears[math.random(1, #i68.gears)])
					log("Gave "..plr.Name.." "..args[1].." 1 random gear")
					return
				end
			elseif #args == 2 then
				local target = findplr(args[1])
				local amount = tonumber(args[2])
				if not target or not amount then
					err("Error: Malformed number/no player found")
					return
				end
				last = {}
				for i = 1, amount do
					local v = i68.gears[math.random(1, #i68.gears)]
					rchat("gear "..target.Name.." "..v)
					table.insert(last, v)
				end
				log("Gave "..target.Name.." "..args[2].." random gears")
				return
			end
		end
	},
	['pause'] = {
		description = "Pause playing music",
		command = function()
			notice("Paused")
			for _, v in pairs(_game.Folder:GetChildren()) do
				if v:IsA("Sound") and v.Playing then
					v.Playing = false
				end
			end
		end
	},
	['play'] = {
		description = "Continue playing music",
		command = function()
			notice("Playing")
			for _, v in pairs(_game.Folder:GetChildren()) do
				if v:IsA("Sound") and not v.Playing then
					v.Playing = true
				end
			end
		end
	},
	['mute'] = {
		description = "Prevent players from playing music",
		command = function()
			active.mute = not active.mute
			if not active.mute then
				log("Music has now been enabled")
				for _, v in pairs(_game.Folder:GetChildren()) do
					if v:IsA("Sound") and v.Playing then
						v.Playing = true
					end
				end
				return
			end
			log("Music has been disabled")
		end
	},
	['cmds'] = {
		description = "View a list of commands",
		command = function()
			print("List of available commands:")
			print(string.rep("-",64))
			local i = 1
			for k, v in pairs(commands) do
				local desc = v.description or "No description provided"
				print("["..tostring(i).."] "..string.upper(k)..": "..desc)
				i += 1
			end
			print(string.rep("-",64))
			log("Press F9 or say /console to view commands")
		end,
		aliases = {'viewcmds'}
	},
	['to'] = {
		description = "Teleports you to a player",
		command = function(r)
			local notme = false
			if r == "notme" then notme = true end
			local b = {'others', 'friends', 'all', 'admins'}
			local t = findplr(r)
			if not t and not table.find(b, r) then err("Error: No player found"); return end
			if table.find(b, r) then
				rchat("tp me "..r)
				return
			else
				if notme then
					rchat("tp me notme "..string.rep(" ",150)..t.Name)
				else
					rchat("tp me "..t.Name)
				end
			end
		end
	},
	['bring'] = {
		description = "Teleports someone to you",
		command = function(r)
			local notme = false
			if r == "notme" then notme = true end
			local b = {'others', 'friends', 'all', 'admins'}
			local t = findplr(r)
			if not t and not table.find(b, r) then err("Error: No player found"); return end
			if table.find(b, r) then
				rchat("tp "..r.." me")
				return
			else
				if notme then
					rchat("tp "..string.rep(" ",150)..t.Name.." me")
				else
					rchat("tp "..t.Name.." me")
				end
			end
		end
	},
	['fgear'] = {
		description = "Find a gear using API",
		command = function(r)
			local uri = "https://catalog.roblox.com/v1/search/items/details?category=11&subcategory=5&keyword="..r
			local json = game:HttpGet(uri)
			local data = game:GetService("HttpService"):JSONDecode(json).data
			rchat("ff "..json)
			
			if #data == 0 then
				err("Error: Found "..tostring(#data).." gears")
				return
			elseif #data == 1 then
				log("Found 1 gear ("..tostring(data[1].id)..")")
				rchat("gear me "..tostring(data[1].id))
				return
			else
				log("Found "..tostring(#data).." gears")
			end
			
			sel = {}
			for _, v in pairs(data) do
				game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
					Text = v.name..": "..tostring(v.id),
					Color = Color3.new(1, 1, 0)
				})
				table.insert(sel, v.id)
			end
			
			log("Say "..prefix.."sel (n) to select a gear")
		end
	},
	['sel'] = {
		description = "Select from "..prefix.."fgear",
		command = function(rr)
			local args = string.split(rr, " ")
			if #args == 0 then err("No arguments supplied"); return end
			local r = args[1]
			local p = args[2]
			local plr = "me"
			local temp = nil
			if p then temp = findplr(p) end
			if temp then plr = temp.Name end
			if #sel > 1 then
				if not tonumber(r) then
					err("Error: Malformed number")
					return
				end
				if tonumber(r) > #sel then
					err("Error: out of bounds")
					return
				end
				rchat("gear "..plr.." "..tostring(sel[tonumber(r)]))
			end
		end
	},
	['lastgear'] = {
		description = "Give yourself the last gear from "..prefix.."rgear",
		command = function(r)
			if r == "" or not r then
				for _, v in pairs(last) do
					rchat("gear me "..v)
				end
			else
				local plr = findplr(r)
				if not plr then err("Error: no player found"); return end
				for _, v in pairs(last) do
					rchat("gear "..plr.Name.." "..v)
				end
			end
		end
	},
	['gtools'] = {
		description = "Get tools of player",
		command = function(target)
			if target == "" then
				err("Error: no player specified")
				return
			end
			local plr = findplr(target)
			if not plr then
				err("Error: no player found")
				return
			end
			local childs = plr.Backpack:GetChildren()
			local tool = plr.Character:FindFirstChildWhichIsA("Tool")
			if tool then table.insert(childs, tool) end
			local i = "Tools of "..plr.Name..": "
			for x, v in pairs(childs) do
				if x ~= #childs then
					i = i..v.Name..", "
				else
					i = i..v.Name
				end
			end
			log(i)
		end
	},
	['mfix'] = {
		description = "Fix painted map",
		command = function()
			fixall()
			log("Cleaning the color")
		end
	},
	['attach'] = {
		description = "Attach to something",
		command = function()
			log("Waiting for input")
			active.attach = not active.attach
		end
	},
	['fixgrav'] = {
		description = "Fix gravity from attach",
		command = function()
			finish()
			log("Fixed gravity")
		end
	},
	['save'] = {
		description = "Save someone",
		command = function(r)
			local plr = findplr(r)
			if not plr then err("Error: no player found"); return end
			rchat("respawn "..plr.Name)
			rchat("tp "..plr.Name.." me")
		end
	},
	['tnt'] = {
		description = "Gives you/someone else a TNT",
		command = function(r)
			if r == "" then
				rchat("gear me 12562495")
			else
				local plr = findplr(r)
				if plr then
					rchat("gear "..plr.Name.." 12562495")
				else
					rchat("gear "..r.." 12562495")
				end
			end
		end
	},
	['sbx'] = {
		description = "Take multiple gears at once",
		command = function()
			active.sbx = false
			for _, v in pairs(lp.Backpack:GetChildren()) do
				v.Parent = lp.Character
				v.GripForward = Vector3.new(math.random(1,15),math.random(1,15),math.random(1,15))
				v.GripPos = Vector3.new(math.random(1,15),math.random(1,15),math.random(1,15))
				v.GripRight = Vector3.new(math.random(1,15),math.random(1,15),math.random(1,15))
				v.GripUp = Vector3.new(math.random(-15,-1),math.random(-15,-1),math.random(-15,-1))
			end
			local tool = lp.Character:FindFirstChildWhichIsA("Tool")
			tool:GetPropertyChangedSignal("Parent"):Connect(function()
				if not tool or tool.Parent == nil or tool.Parent ~= lp.Character then
					active.sbx = false
				end
			end)
			active.sbx = true
		end
	},
	['circle'] = {
		description = "Create a gear circle",
		command = function()
			active.sbx = false
			for l, v in pairs(lp.Backpack:GetChildren()) do
				v.Parent = lp.Character
				local angle = l * ((2 * math.pi) / #lp.Backpack:GetChildren())
				local x, z = getxz(angle, 10)
				local cframe = CFrame.new(x, 0, z).p
				v.GripPos = cframe
			end
			local tool = lp.Character:FindFirstChildWhichIsA("Tool")
			tool:GetPropertyChangedSignal("Parent"):Connect(function()
				if not tool or tool.Parent == nil or tool.Parent ~= lp.Character then
					active.sbx = false
				end
			end)
			active.sbx = true
		end
	},
	['railgun'] = {
		description = "Gives you/someone else a railgun",
		command = function(r)
			if r == "" then
				rchat("gear me 79446473")
			else
				local plr = findplr(r)
				if plr then
					rchat("gear "..plr.Name.." 79446473")
				else
					rchat("gear "..r.." 79446473")
				end
			end
		end
	},
	['crail'] = {
		description = "Create a circle of railguns around a player and shoot them",
		command = function(r)
			if not findplr(r) then
				err("Error: no player found")
				return
			end
			local plr = findplr(r)
			log("Performing crail on "..plr.Name)
			local start = tick()
			for i = 1, 50 do
				rchat("gear me 79446473")
			end
			rchat("gear me 18474459")
			rchat("invis "..string.rep(" ",50).." me")  
			rchat("speed "..plr.Name.." -")
			task.wait(1)
			local old = lp.Character.HumanoidRootPart.CFrame
			prepare()
			lp.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 15, 0))
			for l, v in pairs(lp.Backpack:GetChildren()) do
				if v.Name ~= "Railgun" then continue end
				v.Parent = lp.Character
				local angle = l * ((2 * math.pi) / 50)
				local x, z = getxz(angle, 20)
				local cframe = CFrame.new(x, 0, z).p
				v.GripPos = cframe
			end
			task.wait(1)
			for l, v in pairs(lp.Character:GetChildren()) do
				if v:IsA("Tool") and v.Name == "Railgun" then
					v.Click:FireServer(plr.Character.HumanoidRootPart.Position)
					task.wait()
				end
			end
			finish()
			lp.Character.HumanoidRootPart.CFrame = old
			rchat("vis "..string.rep(" ",50).." me")
			log("Finished in "..tostring(math.round((start-tick())*1000)).."ms")
			lp.Character:WaitForChild("Humanoid"):EquipTool(lp.Backpack:FindFirstChild("PaintBucket"))
			repeat
				for _, v in pairs(workspace:GetChildren()) do
					if v.Name == "Rail" or v.Name == "Effect" then
						coroutine.wrap(function()
							local Arguments =
        					{
            					["Part"] = v,
            					["Color"] = Color3.fromHSV(glob.hue, 1, 1)
        					}
        					lp.Character.PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Arguments)
        				end)()
					end
				end
				task.wait(0.045)
			until not workspace:FindFirstChild("Effect")
			rchat("ungear me")
		end
	},
	['lua'] = {
		description = "Execute lua",
		command = function(r)
			loadstring(r)()
		end
	},
	['visedit'] = {
		description = "Edit settings for the visualizer",
		command = function(r)
			local avail = {'sensitivity', 'size', 'amount', 'radius', 'speed', 'orbiter', 'mode', 'paint'}
			local args = string.split(r, ' ')
			if string.sub('sensitivity', 1, string.len(args[1])) == args[1] then
				if not tonumber(args[2]) then
					err("VisEdit: malformed number")
					return
				end
				vis.sensitivity = tonumber(args[2])
				log("VisEdit: set sensitivity to "..args[2])
			elseif string.sub('size', 1, string.len(args[1])) == args[1] then
				local p = string.split(args[2], '/')
				if #p ~= 3 then
					err("VisEdit: invalid argument count")
					return
				end
				vis.size = args[2]
				log("VisEdit: set size to "..args[2])
			elseif string.sub('amount', 1, string.len(args[1])) == args[1] then
				if not tonumber(args[2]) then
					err("VisEdit: malformed number")
					return
				end
				vis.amount = tonumber(args[2])
				log("VisEdit: set amount to "..args[2])
			elseif string.sub('radius', 1, string.len(args[1])) == args[1] then
				if not tonumber(args[2]) then
					err("VisEdit: malformed number")
					return
				end
				vis.radius = tonumber(args[2])
				log("VisEdit: set radius to "..args[2])
			elseif string.sub('speed', 1, string.len(args[1])) == args[1] then
				if not tonumber(args[2]) then
					err("VisEdit: malformed number")
					return
				end
				vis.speed = tonumber(args[2])
				log("VisEdit: set speed to "..args[2])
			elseif string.sub('orbiter', 1, string.len(args[1])) == args[1] then
				if not findplr(args[2]) then
					err("VisEdit: no player found")
					return
				end
				vis.orbiter = findplr(args[2])
				log("VisEdit: set orbiter to "..findplr(args[2]).Name)
			elseif string.sub('mode', 1, string.len(args[1])) == args[1] then
				if not tonumber(args[2]) then
					err("VisEdit: malformed number")
					return
				end
				if not vis.modes[tonumber(2)] then
					err("VisEdit: out of bounds")
					return
				end
				vis.mode = tonumber(args[2])
				log("VisEdit: set mode to "..args[2])
			elseif string.sub('paint', 1, string.len(args[1])) == args[1] then
				if not vis.paints[args[2]] then
					err("VisEdit: no existing paintmode")
					return
				end
				vis.paint = args[2]
				log("VisEdit: set paint to "..args[2])
			end
		end
	},
	['vis'] = {
		description = "Create a sound visualizer",
		command = function()
			if vis.active then
				err("Say "..prefix.."novis to destroy the visualizer")
				return
			end
			if vis.queue then
				vis.queue = false
				return
			end
			vis.queue = true
			for i = 1, vis.amount do
				rchat("part/"..vis.size)
				task.wait(0.05)
			end
			rchat("gear me 18474459")
			log("Actived visualizer")
		end
	},
	['revis'] = {
		description = "Recreate the sound visualizer",
		command = function()
			vis.active = false
			vis.queue = true
			vis.parts = {}
			for i = 1, vis.amount do
				rchat("part/"..vis.size)
				task.wait(0.05)
			end
			if not lp.Backpack:FindFirstChild("PaintBucket") and not lp.Character:FindFirstChild("PaintBucket") then
                rchat("gear me 18474459")
            end
		end
	},
    ['roboarm'] = {
        description = "Gives the client roboarm",
        command = function()
            rchat("gear me 0000000000000000035366215")
        end
    },
	['novis'] = {
		description = "Destroy the sound visualizer",
		command = function()
			vis.active = false
			vis.queue = false
			vis.parts = {}
			log("Destroyed the visualizer")
		end
	},
	['vgcrash'] = {
        description = "Crash using vampire gear",
        command = function()
            rchat("gear me 0000000000000000000000000000094794847")
			repeat task.wait() until lp.Backpack:FindFirstChild("VampireVanquisher")
			lp.Character:WaitForChild("Humanoid"):EquipTool(lp.Backpack:FindFirstChild("VampireVanquisher"))
			repeat task.wait() until lp.Character:FindFirstChild("VampireVanquisher")
			rchat("undog me me me me me me me me me me me")
			rchat("undog me me me me me me me me me me me")
			rchat("undog me me me me me me me me me me me")
			rchat("undog me me me me me me me me me me me")
			rchat("undog me me me me me me me me me me me")
        end,
        aliases = {'vgc'}
	},
	['nobtools'] = {
        description = "Cleanup after btools",
        command = function()
            for _, v in pairs(btools.preview) do
                v:Destroy()
            end
            btools = {
                hammer = {
                	equipped = false,
            	    highlight = nil,
        	        prevent = false
    	        },
	            move = {
                	equipped = false,
                    debounce = false,
                    dragger = nil,
	                offset = -1,
	                highlight = nil
                },
                clone = {
                    highlight = nil,
                    equipped = false
	            },
                resize = {
        	        highlight = nil,
        	        equipped = false,
        	        previousDistance = 0
        	    },
                preview = {},
                parts = {},
                idx = 1,
                ready = false,
                nextpos = CFrame.new(Vector3.new(0, 0, 0)),
                active = false,
                targets = {},
                saved = btools.saved,
                slot2 = btools.slot2
            }
            btools.rempreview = function(r)
        		for i, v in pairs(btools.preview) do
        			if v.Name == r then
        				table.remove(btools.preview, i)
        				return
        			end
    			end
    		end
    	    btools.makepreview = function(size, pos)
	        	local i = Instance.new("Part")
        		i.CFrame = pos
        		i.Size = size
        		i.Name = "PreviewPart"..tostring(#btools.preview+1)
        		i.Parent = workspace
        		table.insert(btools.preview, i)
        	end
            for _, v in pairs(lp.Backpack:GetChildren()) do
                v:Destroy()
            end
            local t = lp.Character:FindFirstChildWhichIsA("Tool")
            if t then t:Destroy() end
            log("Cleaned up after btools")
        end
	},
	['btools'] = {
        description = "Gives your SS btools",
        command = function()
            generate_move()
            generate_resize()
            generate_clone()
            generate_hammer()
            generate_spart()
            generate_execute()
        end
	},
	['dex'] = {
        description = "Dex",
        command = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
        end
	},
	['iy'] = {
        description = "Infinite Yield",
        command = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
	},
	['cheatblox'] = {
        description = "Cheatblox",
        command = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptingStefan/CheatBlox/main/srs.lua'))()
        end
	},
	['fish'] = {
        description = "Fish",
        command = function(r)
            if r == "" then
				rchat("gear me 46360920")
			else
				local plr = findplr(r)
				if plr then
					rchat("gear "..plr.Name.." 46360920")
				else
					rchat("gear "..r.." 46360920")
				end
			end
        end
	},
	['steal'] = {
		description = "Steal a gear from someone",
		command = function(r)
			local plr = findplr(r)
			if not plr then
				err("No player found")
				return
			end
			rchat("gear me 25162389")
			repeat task.wait() until lp.Backpack:FindFirstChild("BlueBucket")
			lp.Character:WaitForChild("Humanoid"):EquipTool(lp.Backpack:FindFirstChild("BlueBucket"))
			task.wait()
			--local old = lp.Character.HumanoidRootPart.CFrame
			--lp.Character.HumanoidRootPart.CFrame = 
			local t = plr.Character:FindFirstChildWhichIsA("Tool")
			if not t then err("Player has no tool equipped"); return end
			coroutine.wrap(function()
				firetouchinterest(lp.Character:FindFirstChild("BlueBucket").Handle, plr.Character.HumanoidRootPart, 0)
				task.wait()
				firetouchinterest(lp.Character:FindFirstChild("BlueBucket").Handle, plr.Character.HumanoidRootPart, 1)
			end)()
			local strike = 0
			repeat task.wait(); strike += 1 until workspace:FindFirstChild(t.Name) or strike >= 600
			if strike >= 600 then
				err("Something went wrong")
				return
			end
			task.wait(0.15)
			coroutine.wrap(function()
				firetouchinterest(lp.Character:WaitForChild("Left Leg"), t.Handle, 0)
				task.wait()
				firetouchinterest(lp.Character:WaitForChild("Left Leg"), t.Handle, 1)
			end)()
			--workspace:FindFirstChild(t.Name).Handle.CFrame = lp.Character.HumanoidRootPart.CFrame
		end
	},
	['savebt'] = {
        description = "Save a build from btools",
        command = function()
            if #btools.preview == 0 then
                err("Error: nothing built")
                return
            end
            btools.saved = btools.preview
            log("Saved a build with "..tostring(#btools.preview).." parts")
        end
	},
	['loadbt'] = {
        description = "Load a build from btools",
        command = function()
            if #btools.saved == 0 then
                err("Error: nothing saved")
                return
            end
            btools.active = true
            local start = tick()
		    log("Loading "..tostring(#btools.saved).." parts. Estimated time: "..tostring(math.round(#btools.saved*250)).."ms")
		    btools.targets = {}
		    for _, v in pairs(btools.saved) do
                task.wait(0.025)
		    	btools.nextpos = v.CFrame
			    btools.ready = true
    			rchat("part/"..tostring(v.Size.X).."/"..tostring(v.Size.Y).."/"..tostring(v.Size.Z))
	    		repeat task.wait() until btools.ready == false
    		end
	    	log("Done! in "..tostring(math.round((tick()-start)*1000)).."ms")
        end
	},
	['ss2'] = {
        description = prefix.."savebt but in case of unexpected deletion",
        command = function()
            if #btools.slot2 == 0 then
                err("E012: You don't have permissions to execute this command")
                return
            end
            log("Saved from backup!")
            btools.saved = btools.slot2
            btools.slot2 = {}
        end
	},
	['loopgrab'] = {
		description = "Turns on/off loopgrab",
		command = function()
			active.loopgrab = not active.loopgrab
			log("Loopgrab: "..tostring(active.loopgrab))
		end,
		aliases = {'lg'}
	},
	['fixvelocity'] = {
		description = "Fix velocity of whatever you click on",
		command = function()
			log("Waiting for input")
			active.fixvelocity = true
		end,
		aliases = {'fixvel'}
	},
	['clicktp'] = {
		description = "Teleports you where you click",
		command = function()
			active.clicktp = not active.clicktp
			log("ClickTP: "..tostring(active.clicktp))
		end
	},
	['hint'] = {
		description = 'Bypassed hint?',
		command = function(r)
			bypass(r)
		end
	},
	['rkick'] = {
		description = "Rocket-kick someone (personn's admin only)",
		command = function(r)
			if not personns then err('Error: you need personns admin for this command'); return end
			if rkick.active and r == '' then
				finish()
				rkick.active = false
				rkick.target = ''
				rkick.time = 0
				log('Stopped rkick')
				return
			end
			rkick.active = false
			local plr = findplr(r)
			if not plr then
				err('Error: no player found')
				return
			end
			rkick.target = plr.Name
			rkick.time = tick()
			rkick.active = true
			active.ark = true
			task.wait()
			rchat('respawn '..plr.Name)
			task.wait(0.5)
			rchat('speed '..plr.Name..' -')
			--rchat('freeze '..plr.Name)
			task.wait(0.1)
			--plr.Character:FindFirstChild('ice'):Destroy()
			log('Rocket-kicking '..rkick.target)
			local j = 0
			coroutine.wrap(function()
				while rkick.active do
					if plr.Character:FindFirstChild('HumanoidRootPart') and lp.Character:FindFirstChild('HumanoidRootPart') then
						lp.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.85) * CFrame.fromEulerAnglesXYZ(0, math.rad(180+j), 0)
					end
					task.spawn(function()
						rchat('rocket/'..string.rep('me/',50))
						rchat('rocket/'..string.rep(plr.Name..'/',50))
						task.wait()
					end)
					j += 0.5
					if j >= 8 then j*=-1 end
					task.wait()
				end
			end)()
		end
	},
	['toggle'] = {
		description = 'Toggle states on/off',
		command = function(r)
			local args = string.split(r, ' ')
			local function cvt(s) if s then return 'on' else return 'off' end end
			active[args[1]:lower()]=((args[2]or cvt(not active[args[1]:lower()])):lower()=='on')
			log(args[1]:lower()..': '..tostring(active[args[1]:lower()]))
		end
	},
	['give'] = {
		description = 'Give predefined gears to someone',
		command = function(r)
			if not r or r == '' then return end
			local args = string.split(r, ' ')
			if not args[1] or not args[2] then err('Error: invalid argument count (2+ required)') return end
			local tgear = args[#args]
			table.remove(args, #args)
			local targets = args
			local gear = gears[tgear]
			print(gear)
			print(tgear)
			if gear == nil then err('Error: no gear found'); return end
			for _, v in pairs(targets) do
				if v == 'others' or v == 'all' or v == 'random' or v == 'friends' or v == 'admins' then
					rchat('gear '..v..' '..gear)
					continue
				end
				local plr = findplr(v)
				if plr then
					rchat('gear '..plr.Name..' '..gear)
				end
			end
		end
	},
	['airstrike'] = {
		description = 'Send a horde of airstrikes on someone',
		command = function(r)
			local plr = findplr(r)
			if not plr then
				err('Error: no player found')
				return
			end
			for i = 1, 128 do
				rchat('gear me 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088885539')
				task.wait()
			end
			task.wait(.1)
			for _, v in pairs(lp.Backpack:GetChildren()) do
				if v.Name == 'Tactical Airstrike' then
					v.Parent = lp.Character
				end
			end
			task.wait(0.3)
			rchat('speed '..plr.Name..' -')
			local v1 = plr.Character.HumanoidRootPart.CFrame.p
			for _, v in pairs(lp.Character:GetChildren()) do
				if v:IsA('Tool') and v.Name == 'Tactical Airstrike' then
					v.OnMouseClick:FireServer(v1 + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
				end
			end
		end
	},
	['rail'] = {
		description = 'Railgun someone',
		command = function(r)
			local plr = findplr(r)
			if not plr then
				err('Error: no player found')
				return
			end
			if not lp.Backpack:FindFirstChild('Railgun') or not lp.Character:FindFirstChild('Railgun') then
				for i = 1, 256 do
					rchat('gear me 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000079446473')
					task.wait()
				end
			end
			task.wait(.1)
			for _, v in pairs(lp.Backpack:GetChildren()) do
				if v.Name == 'Railgun' then
					v.Parent = lp.Character
				end
			end
			task.wait(0.3)
			for _, v in pairs(lp.Character:GetChildren()) do
				if v:IsA('Tool') and v.Name == 'Railgun' then
					v.Click:FireServer(plr.Character.HumanoidRootPart.CFrame.p)
					task.wait()
				end
			end
		end
	},
	['hchat'] = {
		description = 'Hacker chat',
		command = function(r)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("三"..convert(r), "All")
		end
	},
	['sax'] = {
		description = "Lag the server using inflatable saxophone",
		command = function()
			if active.sax then
				active.sax = false
				return
			end
			for i = 1, 256 do
				rchat('gear me 2620523077')
				task.wait()
			end
			task.wait(.2)
			execcmd('circle')
			task.wait(.6)
			active.sax = true
			coroutine.wrap(function()
				while active.sax do
					for _, v in pairs(lp.Character:GetChildren()) do
						if v:IsA('Tool') and v.Name == 'InflatableSaxophone' then
							v:Activate()
						end
					end
					task.wait()
				end
			end)()
		end
	},
	['fcrash'] = {
		description = 'Freeze crash',
		command = function()
			log('WARNING: Experimental crash')
			rchat('respawn all')
			rchat('blind all')
			execcmd('loopgrab')
			rchat('music 401117743')
			for i = 1, 500 do
				rchat('freeze '..string.rep('all ', 100))
			end
			for i = 1, 100 do
				rchat('clone all all all')
			end
			rchat('removeclones')
			log('Finished')
		end
	},
	['spam'] = {
		description = 'Spams a command',
		command = function(r)
			if spam.active then
				spam.active = false
				return
			end

			local split = string.split(r, "|")
			local args = {}
			
			for _, a in pairs(split) do
				local t = string.gsub(a, '^%s*(.-)%s*$', '%1')
				table.insert(args, t)
			end

			spam.cmds = args
			spam.active = true

			coroutine.wrap(function()
				while spam.active do
					for _, v in pairs(spam.cmds) do
						rchat(v)
						task.wait()
					end
				end
			end)()
		end,
		aliases = {'s'}
	},
	['plag'] = {
		description = 'Plag',
		command = function()
			if active.plag then
				active.plag = false
				return
			end
			rchat('gear me '..string.rep('0',500)..'83704154')
			repeat task.wait() until lp.Backpack:FindFirstChildWhichIsA('Tool')
			local tool = lp.Backpack:FindFirstChildWhichIsA('Tool')
			active.plag = not active.plag
			coroutine.wrap(function()
				while active.plag do
					task.spawn(function()
                        for i = 1, 30 do
                            tool.Parent = lp.Character
                            tool.Parent = lp.Backpack
                        end
                    end)
					task.wait()
				end
			end)()
		end
	},
	['ftools'] = {
		description = 'Fling tools',
		command = function(r)
			if r == '' or not r then
				rchat('gear me 74385399')
				rchat('gear me 111876831')
				rchat('gear me 148791414')
			else
				local plr = findplr(r)
				if not plr then err('Error: no player found'); return end
				rchat('gear '..plr.Name..' 74385399')
				rchat('gear '..plr.Name..' 111876831')
				rchat('gear '..plr.Name..' 148791414')
			end
		end
	},
	['wfling'] = {
		description = 'Weld fling. uses '..prefix..'ftools',
		command = function(r)
			local plr = findplr(r)
			if not plr then err('Error: no player found'); return end
			rchat('speed '..plr.Name.." -")
			execcmd('ftools')
			task.wait(.3)
			lp.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.75) * CFrame.fromEulerAnglesXYZ(0, 0, 0)
			task.wait(.4)
			local detonator = lp.Backpack:FindFirstChild('RemoteExplosiveDetonator')
			detonator.Parent = lp.Character
			local v1 = "Activate"
			local v2 = plr.Character['Right Arm'].CFrame.p
			local event = detonator.RemoteEvent
			event:FireServer(v1, v2)
			task.wait(.3)
			local april = lp.Backpack:FindFirstChild('April Showers')
			detonator.Parent = lp.Backpack
			april.Parent = lp.Character
			task.wait(.3)
			local v1 = plr.Character['Left Arm'].CFrame.p
			local event = april.ClientInput
			event:FireServer(v1)
			task.wait(.435)
			april.Parent = lp.Backpack
			local pi = lp.Backpack:FindFirstChild('PiTable')
			pi.Parent = lp.Character
			pi:Activate()
			task.wait(.4)
		end
	},
	['path'] = {
		description = 'Gives you a path tool',
		command = function()
			local tool = Instance.new('Tool')
			tool.Name = 'Path'
			tool.RequiresHandle = false
			tool.Parent = lp.Backpack
			
			local activate = false
			local equipped = false
			
			tool.Activated:Connect(function()
				activate = true
				print('activate')
			end)

			tool.Deactivated:Connect(function()
				activate = false
				print('not activate')
			end)
			
			tool.Equipped:Connect(function()
				equipped = true
				tactive = true
				print('equipped')
				coroutine.wrap(function()
					while equipped do
						print('equ')
						if active and ms.Hit then
							print('iiomq')
							if not lp.Character:FindFirstChild('HumanoidRootPart') then break end
							rchat('part/6/2/10')
						end
						task.wait()
					end
				end)()
			end)
			
			tool.Unequipped:Connect(function()
				equipped = false
				tactive = false
			end)
		end
	}
}

-- [Patch] --
function patch(plr)
	if not plr then return end
	connections[plr.Name.."_Chatted"] = plr.Chatted:Connect(function(msg)
		if not table.find(whitelist, plr.Name) and plr.UserId ~= lp.UserId or string.sub(msg, 1, string.len(prefix)) ~= prefix then
			return
		end
		
		local args = string.split(msg, " ")
		local cmd = string.sub(args[1], string.len(prefix)+1)
		local rest = string.sub(msg, string.len(cmd)+string.len(prefix)+2)
		
		for k, v in pairs(commands) do
			if k == cmd:lower() or v.aliases and table.find(v.aliases, cmd:lower()) then
				v.command(rest)
			end
		end
	end)
end

function evtsys(plr)
	local humanoid = plr.Character:WaitForChild("Humanoid")
	humanoid.DisplayName = ("%s\n(@%s)"):format(plr.DisplayName, plr.Name)
	humanoid.NameOcclusion = 0
	
	if table.find(blacklist, plr.Name) then
		rchat("skydive "..plr.Name)
		rchat("punish "..plr.Name)
		rchat("blind "..plr.Name)
		notify(plr.Name, "You have been blacklisted")
	end
	
	if plr.UserId == lp.UserId then
		hookgui()
		for _, v in pairs(btools.preview) do
            v:Destroy()
		end
        if #btools.preview > 0 then
            btools.slot2 = btools.preview
            log("Btools were unexpectedly destroyed. If you want to save your previous build, say "..prefix.."ss2")
        end
        btools = {
        	hammer = {
        		equipped = false,
        		highlight = nil,
        		prevent = false
        	},
        	move = {
        		equipped = false,
        		debounce = false,
        		dragger = nil,
        		offset = -1,
        		highlight = nil
        	},
        	clone = {
        		highlight = nil,
        		equipped = false
        	},
        	resize = {
        	    highlight = nil,
        	    equipped = false,
        	    previousDistance = 0
        	},
        	preview = {},
        	parts = {},
        	idx = 1,
        	ready = false,
        	nextpos = CFrame.new(Vector3.new(0, 0, 0)),
        	active = false,
        	targets = {},
        	saved = btools.saved,
        	slot2 = btools.slot2
        }
        btools.rempreview = function(r)
        	for i, v in pairs(btools.preview) do
        		if v.Name == r then
        			table.remove(btools.preview, i)
        			return
        		end
        	end
        end
        
        btools.makepreview = function(size, pos)
        	local i = Instance.new("Part")
        	i.CFrame = pos
        	i.Size = size
        	i.Name = "PreviewPart"..tostring(#btools.preview+1)
        	i.Parent = workspace
        	table.insert(btools.preview, i)
        end
    end
	
	connections[plr.Name.."_CharacterChildAdded"] = plr.Character.ChildAdded:Connect(function(i)
		if active.anticrash and not table.find(vgwhitelist, plr.Name) and i.Name == "VampireVanquisher" or active.anticrash and not table.find(vgwhitelist, plr.Name) and i.Name == "Emerald Knights of the Seventh Sanctum Sword and Shield" then
			if personns then rchat("ungear/ANTICRASH "..string.rep(" ",150)..plr.Name)
						else rchat("ungear ANTICRASH "..string.rep(" ",150)..plr.Name) end
			notify(plr.Name, 'VampireVanquisher is blacklisted in this server')
		end
	end)
	
	connections[plr.Name.."_BackpackChildAdded"] = plr.Backpack.ChildAdded:Connect(function(i)
		if active.anticrash and not table.find(vgwhitelist, plr.Name) and i.Name == "VampireVanquisher" or active.anticrash and not table.find(vgwhitelist, plr.Name) and i.Name == "Emerald Knights of the Seventh Sanctum Sword and Shield" then
			if personns then rchat("ungear/ANTICRASH "..string.rep(" ",150)..plr.Name)
						else rchat("ungear ANTICRASH "..string.rep(" ",150)..plr.Name) end
			notify(plr.Name, 'VampireVanquisher is blacklisted in this server')
		end
	end)
	
	connections[plr.Name.."_ParentChanged"] = plr.Character:GetPropertyChangedSignal("Parent"):Connect(function()
		if table.find(blacklist, plr.Name) and plr.Character.Parent ~= game.Lighting then
			rchat("skydive "..plr.Name)
			rchat("punish "..plr.Name)
			rchat("blind "..plr.Name)
			notify(plr.Name, "You have been blacklisted")
		end
	end)
	
	--[[if not table.find(whitelist, plr.Name) and table.find(rpunish, plr.Name) then
		task.wait()
		rchat("punish "..plr.Name)
	end

    if plr.Name == lp.Name then
        for _, v in pairs(btools.preview) do
            v:Destroy()
        end
        btools = {
        	hammer = {
        		equipped = false,
        		highlight = nil,
        		prevent = false
        	},
        	move = {
        		equipped = false,
        		debounce = false,
        		dragger = nil,
        		offset = -1,
        		highlight = nil
        	},
        	clone = {
        		highlight = nil,
        		equipped = false
        	},
        	resize = {
        	    highlight = nil,
        	    equipped = false,
        	    previousDistance = 0
        	},
        	preview = {},
        	parts = {},
        	idx = 1,
        	ready = false,
        	nextpos = CFrame.new(Vector3.new(0, 0, 0)),
        	active = false,
        	targets = {}
        }
        btools.rempreview = function(r)
        	for i, v in pairs(btools.preview) do
        		if v.Name == r then
        			table.remove(btools.preview, i)
        			return
        		end
        	end
        end
        
        -- 37821008
        
        btools.makepreview = function(size, pos)
        	local i = Instance.new("Part")
        	-- i.Anchored = true
        	-- i.CanCollide = false
        	i.CFrame = pos
        	i.Size = size
        	i.Name = "PreviewPart"..tostring(#btools.preview+1)
        	i.Parent = workspace
        	table.insert(btools.preview, i)
        end
    end
	connections[plr.Name.."_BackpackChildAdded"] = plr.Backpack.ChildAdded:Connect(function(i)
		if active.nogears and not table.find(agwhitelist, plr.Name) then
			if personns then
				rchat("ungear/ANTIGEAR "..string.rep(" ",500)..plr.Name)
			else
				rchat("ungear ANTIGEAR "..string.rep(" ",500)..plr.Name)
			end
			notify(plr.Name, "Anti-gear is enabled")
		end
		if active.novgcrash and not table.find(vgwhitelist, plr.Name) then
			local ekoss = plr.Backpack:FindFirstChild("Emerald Knights of the Seventh Sanctum Sword and Shield")
			local vg = plr.Backpack:FindFirstChild("VampireVanquisher")
			if ekoss or vg then
				if personns then
					rchat("ungear/ANTICRASH "..string.rep(" ",50)..plr.Name)
				else
					rchat("ungear ANTICRASH "..string.rep(" ",50)..plr.Name)
				end
				if ekoss then
					notify(plr.Name, "EKoSS Sword And Shield is blacklisted in this server")
				else
					notify(plr.Name, "VampireVanquisher is blacklisted in this server")
				end
				warning("Prevented "..plr.Name.." from crashing")
			end
		end
	end)
	
	connections[plr.Name.."_CharChildAdded"] = plr.Character.ChildAdded:Connect(function(i)
		if active.nofreze and table.find(whitelist, plr.Name) and plr.Character:FindFirstChild("ice") then
			rchat("thaw "..plr.Name)
		end
		if active.nodog and table.find(whitelist, plr.Name) and plr.Character:FindFirstChild("Addon") then
			rchat("undog "..plr.Name)
		end
	end)
	
	connections[plr.Name.."_Died"] = plr.Character:WaitForChild("Humanoid").Died:Connect(function()
		if active.nokill and table.find(whitelist, plr.Name) then
			rchat("reset "..plr.Name)
			rchat("god "..plr.Name)
		end
	end)
	
	connections[plr.Name.."_ParentChanged"] = plr.Character:GetPropertyChangedSignal("Parent"):Connect(function()
		if not table.find(whitelist, plr.Name) and table.find(rpunish, plr.Name) then
			task.wait()
			rchat("punish "..plr.Name)
		end
		if active.nopunish and plr.Character.Parent == game.Lighting and table.find(whitelist, plr.Name) then
			rchat("unpunish "..plr.Name)
		end
	end)
	
	if plr.Name == lp.Name then
		connections[plr.Name.."_DescendantAdded"] = plr.Character.DescendantAdded:Connect(function(i)
			if active.nosetgrav and i.Name == "BodyForce" then
				local root = lp.Character.HumanoidRootPart
				local bcf = root.CFrame
				i.Force = Vector3.new(0, 0, 0)
				repeat task.wait() until i == nil
				root.CFrame = bcf
			end
		end)
	end
	
	task.spawn(function()
		connections[plr.Name.."_Torso"] = plr.Character:WaitForChild("Torso").ChildAdded:Connect(function(i)
			if active.noattach then
				if plr.Character:FindFirstChild("Rocket") or plr.Character:FindFirstChild("Addon") then return end
				if plr.Character.Torso:FindFirstChild("Weld") or plr.Character.Torso:FindFirstChild("Snap") then
					if not table.find(whitelist, plr.Name) then
						warning("Prevented "..plr.Name.." from welding")
						rchat("reset "..plr.Name)
						notify(plr.Name, "Anti-attach is enabled")
					end
				end
			end
		end)
	end)
	]]--
end

-- [Startup] --
for _, v in pairs(players:GetPlayers()) do
	patch(v)
	evtsys(v)
	
	v.CharacterAdded:Connect(function()
		evtsys(v)
	end)
end

connections['PlayerAdded'] = players.PlayerAdded:Connect(function(plr)
	patch(plr)
	
	plr.CharacterAdded:Connect(function(ch)
		evtsys(plr)
	end)
end)

if prefix == "" then log("Say viewcmds in-game to view a list of commands") else log("Say "..prefix.."cmds in-game to view a list of commands!") end

pcall(function() getgenv().SCRIPT_LOADED = true end)

task.spawn(function()
	-- execcmd('allantis')
	execcmd('rok')
	execcmd('scol')
	execcmd('anticrash')
end)

-- [Events] --
connections['PreRender'] = rs.PreRender:Connect(function()
	checkchat()
	if active.ark then
		for _, v in pairs(players:GetPlayers()) do
			for _, p in pairs(v.Character:GetChildren()) do
				if p.Name == "Rocket" then p:Destroy() end
			end
		end
	end
	if active.loopgrab then
        for _, pad in pairs(pads:GetChildren()) do
            coroutine.wrap(function()
                firetouchinterest(lp.Character:WaitForChild("Head"), pad.Head, 0)
                firetouchinterest(lp.Character:WaitForChild("Head"), pad.Head, 1)
            end)()
        end
	end
	if active.perm then
		coroutine.wrap(function() execcmd('getpad') end)()
	end
	if vis.active then
		vis.modes[vis.mode]()
		vis.angle += vis.speed
		if _game.Folder:FindFirstChild("Sound") then
			vis.radius = math.clamp(_game.Folder.Sound.PlaybackLoudness * vis.sensitivity, 4, 100)
		end
	end
	if active.mute then
		local v = _game.Folder:FindFirstChild("Sound")
		if v then
			v.Playing = false
		end
	end
	if btools.active then
        for _, v in pairs(btools.targets) do
            coroutine.wrap(function()
                movepart(v.Part, v.CFrame)
            end)()
        end
	end
	if btools.hammer.equipped and btools.hammer.highlight and not btools.hammer.prevent then
		if ms.Target and string.sub(ms.Target.Name, 1, 11) == "PreviewPart" then
			btools.hammer.highlight.Visible = true
			btools.hammer.highlight.Adornee = ms.Target
			btools.hammer.highlight.Parent = ms.Target
		else
			btools.hammer.highlight.Visible = false
		end
    end
	if btools.move.equipped and btools.move.highlight then
		if ms.Target and string.sub(ms.Target.Name, 1, 11) == "PreviewPart" then
			btools.move.highlight.Visible = true
			btools.move.highlight.Adornee = ms.Target
			btools.move.highlight.Parent = ms.Target
		else
			btools.move.highlight.Visible = false
		end
	end
	if btools.clone.equipped and btools.clone.highlight then
		if ms.Target and string.sub(ms.Target.Name, 1, 11) == "PreviewPart" then
			btools.clone.highlight.Visible = true
			btools.clone.highlight.Adornee = ms.Target
			btools.clone.highlight.Parent = ms.Target
		else
			btools.clone.highlight.Visible = false
		end
	end
	if tactive then
		for _, v in pairs(tparts) do
			coroutine.resume(coroutine.create(function()
				movepart(v.Part, v.CFrame)
				v.Velocity = v.Velocity
			end))
		end
	end
	glob.hue += 0.004
	if glob.hue > 1 then glob.hue = 0 end
end)

connections['PlayerRemoving'] = players.PlayerRemoving:Connect(function(plr)
	if rkick.active and plr.Name:lower() == rkick.target:lower() then
		log('Successfully kicked '..plr.Name..' in '..tostring(math.round((tick()-rkick.time)*1000))..'ms')
		rkick.active = false
		rkick.target = ''
		rkick.time = 0
		finish()
	end
end)

connections['Button1Down'] = ms.Button1Down:Connect(function()
	if btools.resize.equipped then
        if ms.Target == nil or ms.Target.Locked then
    		btools.resize.highlight.Adornee = nil
    		btools.resize.handles.Adornee = nil
    	else
    		btools.resize.highlight.Adornee = ms.Target
    		btools.resize.handles.Adornee = ms.Target
    		btools.resize.handles.Faces = ms.Target.ResizeableFaces
    	end
    end
    if btools.move.equipped then
		if btools.move.debounce == false and ms.Target and ms.Target.Position then
			btools.move.debounce = true
			ms.Icon = "rbxasset://textures/GrabRotateCursor.png"
			-- ms.Target:BreakJoints()
			btools.move.offset = ms.Hit.p - ms.Target.Position
			btools.move.dragger = Instance.new("Dragger")
			pcall(function() btools.move.dragger:MouseDown(ms.Target, Vector3.new(0, 0, 0), {ms.Target}) end)
			task.wait()
			btools.move.debounce = false
		end
	end
	if active.attach and ms.Target then
		active.attach = false
		attach(ms.Target)
		log("Attaching to "..ms.Target.Name)
	end
	if active.fixvelocity then
		if ms.Target then
			active.fixvelocity = false
			ms.Target.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			log("Fixed velocity of "..ms.Target.Name)
		end
	end
	if active.sbx then
		for _, v in pairs(lp.Character:GetChildren()) do
			if v:IsA("Tool") then
				if v.Name == "Railgun" then
					v.Click:FireServer(ms.Hit.Position)
				elseif v.Name == "FreezeRay" then
					v.FireServer:FireServer(ms.Hit.Position)
				else
					v:Activate()
				end
			end
		end
	end
	if active.clicktp and ms.Hit and lp.Character:FindFirstChild("HumanoidRootPart") then
		lp.Character:MoveTo(ms.Hit.p)
	end
end)

connections['Button1Up'] = ms.Button1Up:Connect(function()
    if btools.move.equipped then
		ms.Icon ="rbxasset://textures\\GrabCursor.png"
		if btools.move.dragger then
			pcall(function() btools.move.dragger:MouseUp() end)
		end
	end
end)

connections['MouseMove'] = ms.Move:Connect(function()
    if btools.move.dragger then
		local pos1 = ms.UnitRay.Origin
		local pos2 = ((ms.Hit.p-btools.move.offset) - workspace.CurrentCamera.CFrame.p).unit*300
		local ray = Ray.new(pos1,pos2)
		pcall(function() btools.move.dragger:MouseMove(ray) end)
	end
end)

connections['KeyDown'] = ms.KeyDown:Connect(function(key)
    if btools.move.equipped and btools.move.dragger then
		key = key:lower()
		if key == 'r' then
			btools.move.dragger:AxisRotate(Enum.Axis.Z)
		elseif key == 't' then
			btools.move.dragger:AxisRotate(Enum.Axis.X)
		end
	end
end)

connections['PreSim'] = rs.PreSimulation:Connect(function()
	if active.gspin then
		local thread = coroutine.create(function()
			for _, v in pairs(lp.Character:GetChildren()) do
				if v:IsA('Tool') then
					v.Parent = lp.Backpack
				end
			end
			for l, v in pairs(lp.Backpack:GetChildren()) do
				local angle = l * ((2 * math.pi) / #lp.Backpack:GetChildren()) + _angle
				local x, z = getxz(angle, 10)
				local cframe = CFrame.new(x, 0, z).p
				v.GripPos = cframe
				v.Parent = lp.Character
			end
		end)
		coroutine.resume(thread)
	end
	_angle += 0.05
end)

connections['FolderChildAdded'] = _game.Folder.ChildAdded:Connect(function(i)
	if vis.queue and i.Name == "Part" then
		table.insert(vis.parts, i)
		if #vis.parts == vis.amount then
			vis.queue = false
			vis.active = true
			coroutine.wrap(function()
                while vis.active do
                    vis.paints[vis.paint]()
                    task.wait(0.045)
                end
            end)()
		end
	end
	if btools.active and btools.ready and i.Name == "Part" then
        table.insert(btools.targets, {Part=i, CFrame=btools.nextpos})
        btools.ready = false
    end
    if tactive and ms.Hit and i.Name == "Part" then
    	table.insert(tparts, {
			Velocity = ms.Hit.LookVector*0,
			CFrame = CFrame.new(lp.Character.HumanoidRootPart.Position-Vector3.new(0,4,0),ms.Hit.p),
			Part = i
		})
		local pos = #tparts
		task.spawn(function()
			task.wait(5)
			table.remove(tparts, pos)
			i:Destroy()
		end)
    end
end)

connections['ScrollerChildAdded'] = lp.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:Connect(function(msg)
    wait(1)
    local message = msg.TextLabel.Text
    if message:match("三") then
        msg.TextLabel.TextColor3 = Color3.new(1, 0.85098, 0)
        message = unconvert(message:gsub("三", ""))
        msg.TextLabel.Text = message
    end
end)

connections['WorkspaceChildAdded'] = workspace.ChildAdded:Connect(function()
	for _, i in pairs(workspace:GetChildren()) do
		if i.Name == 'Part' and i:FindFirstChild('chord') then
			i:Destroy()
		end
	end
end)

if game:GetService('CoreGui'):FindFirstChild("BubbleChat") then
	connections['BubbleChat'] = game:GetService('CoreGui').BubbleChat.DescendantAdded:Connect(function(bubble)
		task.wait(1)
		if bubble:IsA("TextLabel") then
			if bubble.Text:match("三") then
				bubble.Parent.BackgroundColor3 = Color3.new(1, 0.85098, 0)
				bubble.Text = unconvert(bubble.Text:gsub("三", ""))
			end
		end
	end)
end
