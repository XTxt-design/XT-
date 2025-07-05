local function LoadXT_Script()
    -- 添加详细的加载状态反馈
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "XT脚本",
        Text = "开始加载脚本...",
        Duration = 2
    })
    
    wait(1)
    
    local success, err = pcall(function()
        -- 使用原始GitHub链接加载脚本
        local scriptUrl = "https://raw.githubusercontent.com/XTxt-design/XT-/refs/heads/main/XT%E8%84%9A%E6%9C%AC%E6%BA%90%E4%BB%A3%E7%A0%81.lua"
        local scriptContent = game:HttpGet(scriptUrl, true)
        
        -- 检查脚本内容是否有效
        if not scriptContent or #scriptContent < 100 then
            error("无法获取脚本内容或内容过短")
        end
        
        -- 编译并执行脚本
        local loadFunc, compileError = loadstring(scriptContent)
        if not loadFunc then
            error("脚本编译错误: "..tostring(compileError))
        end
        
        loadFunc()
    end)
    
    if not success then
        warn("[XT脚本] 加载错误: "..tostring(err))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "XT脚本错误",
            Text = "加载失败: "..tostring(err),
            Duration = 10
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "XT脚本",
            Text = "加载成功!",
            Duration = 3
        })
    end
end

-- 延迟加载确保注入器完全初始化
wait(1)
LoadXT_Script()

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "XT脚本"; Text ="载入中"; Duration = 2; })wait("3")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "XT脚本"; Text ="小t牛比"; Duration = 2; })wait("3")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "快来加入我们吧"; Text ="光用有什么用加入我们吧"; Duration = 2; })wait("3")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "XT脚本"; Text ="正在持续更新中"; Duration = 2; })

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "XT脚本"; Text ="载入成功"; Duration = 2; })

local OrionLib =loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("当前时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "XT脚本", HidePremium = false, SaveConfig = true,IntroText = "XT脚本", ConfigFolder = "XT脚本"})

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "XT脚本"; Text ="欢迎使用XT脚本"; Duration = 4; })

local about = Window:MakeTab({
    Name = "作者信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("作者: 小t")
about:AddParagraph("作者qq: 3887096395")
about:AddParagraph("qq群: 1036308477")

local about = Window:MakeTab({
    Name = "玩家信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")

local about = Window:MakeTab({
    Name = "公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("此脚本为免费缝脚本")
about:AddParagraph("不能倒卖，圈钱")
about:AddParagraph("禁止使用此脚本")
about:AddParagraph("严禁倒卖")

local Tab =Window:MakeTab({
	Name = "复制作者信息",
	Icon = "rbxassetid://3887096395",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "复制作者QQ",
	Callback = function()
     setclipboard("3887096395")
  	end
})
Tab:AddButton({
	Name = "复制QQ群",
	Callback = function()
     setclipboard("1036308477")
  	end
})
OrionLib:MakeNotification({
	Name = "XT脚本",
	Content = "欢迎使用XT脚本",
	Image = "rbxassetid://4483345998",
	Time = 2
})

local Tab = Window:MakeTab({
    Name = "通用",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "各种功能"
})
Tab:AddSlider({
	Name = "速度",
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})
Tab:AddSlider({
	Name = "跳跃高度",
	Min = 50,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})
Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})
Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})
Tab:AddButton({
	Name = "传送玩家",
	Callback = function()
      	loadstring(game:HttpGet(("https://pastebin.com/raw/YNVbeqPy")))()
  	end
})
Tab:AddButton({
	Name = "玩家进入提示",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  	end
})

Tab:AddButton({
	Name = "罚站（隐藏）",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/U27yQRxS'))()
  	end    
})
Tab:AddButton({
	Name = "飞行",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/U27yQRxS'))()
	end 
})
Tab:AddButton({
	Name = "飞车(E)(别人看到)",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
  	end    
})
Tab:AddButton({
	Name = "轰炸（封号风险）",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/%E8%BD%B0%E7%82%B8.lua"))()
    end
})
Tab:AddButton({
	Name = "最强透视",
	Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
  	end    
})
Tab:AddButton({
	Name = "XT自瞄",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
  	end    
})
Tab:AddButton({
	Name = "XT甩飞",
	Callback = function()
     loadstring(game:HttpGet'https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/11_1.txt_2024-08-08_214614.OTed.lua')()
  	end    
})
Tab:AddButton({
	Name = "防止掉线（反挂机）",
	Callback = function()
	print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
  	end
})
Tab:AddButton({
	Name = "无限跳",
    Default = false,
	Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
	end
})

Tab:AddButton({	
Name = "修改玩家碰撞箱",	
Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()
    end
})

Tab:AddButton({

	Name = "替身",

	Callback = function()

loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()

    end

})

Tab:AddButton({
	Name = "反挂机v2",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
  	end    
})

Tab:AddButton({
	Name = "铁拳",
	Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
  	end    
})

Tab:AddButton({
	Name = "阿尔宙斯自瞄",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()    
  	end    
})

Tab:AddButton({

	Name = "爬墙",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()

end

})

Tab:AddButton({
	Name = "FPS(变流畅)",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()
  	end    
})

Tab:AddButton({

	Name = "光影V4",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()

end

})

Tab:AddButton({

	Name = "让别让别人控制自己",

	Callback = function()

loadstring(game:HttpGet(('https://pastefy.ga/a7RTi4un/raw'),true))()

	end

})

Tab:AddButton({
	Name = "子弹追踪",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()
  	end    
})

Tab:AddButton({

	Name = "点击传送工具",

	Callback = function()

mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack

	end

})

Tab:AddButton({

	Name = "无敌",

	Callback = function()

local lp = game:GetService "Players".LocalPlayer

if lp.Character:FindFirstChild "Head" then

    local char = lp.Character

    char.Archivable = true

    local new = char:Clone()

    new.Parent = workspace

    lp.Character = new

    wait(2)

    local oldhum = char:FindFirstChildWhichIsA "Humanoid"

    local newhum = oldhum:Clone()

    newhum.Parent = char

    newhum.RequiresNeck = false

    oldhum.Parent = nil

    wait(2)

    lp.Character = char

    new:Destroy()

    wait(1)

    newhum:GetPropertyChangedSignal("Health"):Connect(

        function()

            if newhum.Health <= 0 then

                oldhum.Parent = lp.Character

                wait(1)

                oldhum:Destroy()

            end

        end)

    workspace.CurrentCamera.CameraSubject = char

    if char:FindFirstChild "Animate" then

        char.Animate.Disabled = true

        wait(.1)

        char.Animate.Disabled = false

    end

    lp.Character:FindFirstChild "Head":Destroy()

end

end

})

Tab:AddButton({

	Name = "死亡笔记",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()

  	end    

})

Tab:AddButton({

	Name = "透视",

	Callback = function()

     loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()

  	end    

})

Tab:AddButton({

	Name = "吸人",

	Callback = function()

     loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()

  	end    

})

Tab:AddButton({

	Name = "人物无敌（不适用）",

	Callback = function()

     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()

	end    

})

Tab:AddButton({
	Name = "踢人脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua"))()
  	end    
})

Tab:AddButton({

	Name = "隐身(E)",

	Callback = function()

	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()

  	end    

})

Tab:AddButton({

	Name = "电脑键盘",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

  	end    

})

Tab:AddTextbox({

	Name = "跳跃高度",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end	 

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

	end

})

Tab:AddToggle({

	Name = "穿墙",

	Default = false,

	Callback = function(Value)

		if Value then

		    Noclip = true

		    Stepped = game.RunService.Stepped:Connect(function()

			    if Noclip == true then

				    for a, b in pairs(game.Workspace:GetChildren()) do

                        if b.Name == game.Players.LocalPlayer.Name then

                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do

                                if v:IsA("BasePart") then

                                    v.CanCollide = false

                                end

                            end

                        end

                    end

			    else

				    Stepped:Disconnect()

			    end

		    end)

	    else

		    Noclip = false

	    end

	end

})

Tab:AddToggle({

	Name = "夜视",

	Default = false,

	Callback = function(Value)

		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

	end

})

Tab:AddButton({

	Name = "鼠标（手机非常不建议用）",

	Callback = function()

loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()

	end

})

Tab:AddButton({

	Name = "跟踪玩家",

	Callback = function()

      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()

  	end

})

Tab:AddButton({

	Name = "伪名说话",

	Callback = function()

loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()

	end 

})

Tab:AddButton({

	Name = "踏空行走",

	Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()

	end

})

Tab:AddButton({

	Name = "透视",

	Callback = function()

loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()

	end 

})

Tab:AddButton({

	Name = "转圈（使用此项关闭移位锁）",

	Callback = function()

      	loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()

  	end

})

Tab:AddButton({
	
Name = "通用ESP",	

Callback = function()	

loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()	

    end

})

Tab:AddButton({  

Name = "娱乐蓝屏(还需要手动开启)(大退关闭)", 

Callback = function()   

loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 

   end

})

Tab:AddButton({

	Name = "隐身(E)",

	Callback = function()

	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()

  	end    

})

Tab:AddButton({

    Name="紫砂",

    Callback=function()

        game.Players.LocalPlayer.Character.Humanoid.Health=0

    end

})


local Tab = Window:MakeTab({
	Name = "特殊脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({  
    Name = "上帝模式(免疫)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
	end
})

Tab:AddButton({  
    Name = "游戏通行证(跑酷游戏)",
	Callback = function()
	for _,v in pairs(game:GetDescendants()) do
if v.ClassName == "RemoteEvent" then
if v.Parent.Name == "WeaponsRemotes" or v.Parent.Name == "VipRemotes" or v.Parent.Name == "Remotes" then
v:FireServer()
end
end
end
     end
})

Tab:AddButton({
	Name = "模仿者脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/THEMIMICNEWMOBILEUINOTBETA/main/README.md"))()
	end    
})

Tab:AddButton({
	Name = "画质脚本",
	Callback = function()
	 loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
  	end    
})

Tab:AddButton({
	Name = "FE动作",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()
  	end    
})

Tab:AddButton({
	Name = "走路甩人",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
  	end    
})

Tab:AddButton({
	Name = "NA管理员",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
	end
})

Tab:AddButton({
    Name="电脑键盘",
    Callback=function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xSsDaMg2"))()
    end
})

Tab:AddButton({
    Name="FE幽灵中心",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})


Tab:AddButton({
	Name = "声音播放器",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/GEianeKX"))()
end
})

Tab:AddButton({
	Name = "铁拳打飞人",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
end
})

Tab:AddButton({
	Name = "蜘蛛侠爬墙配合键盘脚本按C爬墙",
	Callback = function()
loadstring(game:HttpGet(('https://pastebin.com/raw/2X0hKUgq'),true))()
	end
})

local Tab = Window:MakeTab({
	Name = "FE脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "C00lgui",
	Callback = function()
     loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
  	end    
})

Tab:AddButton({
	Name = "1x1x1x1",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
  	end    
})

Tab:AddButton({
	Name = "变玩家（R6）",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
  	end    
})
Tab:AddButton({
	Name = "动画中心",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
  	end    
})

local Tab = Window:MakeTab({

	Name = "自然灾害",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false
	
})

Tab:AddButton({

	Name = "自然灾害①",	
	
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()	
	
	end

})

Tab:AddButton({

	Name = "自然灾害②",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()	
	
	end
			
})

Tab:AddButton({

	Name = "自然灾害③",

	Callback = function()
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
	
	    end

})

local Tab = Window:MakeTab({

	Name = "力量传奇",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({
    Name="修改力量",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

Tab:AddButton({
	Name = "力量传奇Muscle Legend",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
  	end    
})

Tab:AddButton({
    Name="力量传奇",
    Callback=function()
        loadstring(game:GetObjects("rbxassetid://10048914323")[1].Source)()
    end
})

Tab:AddButton({

	Name = "杯脚本",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/llcq"))()

    end

})

Tab:AddButton({
	Name = "力量传奇speed hub x",
	Callback = function()
     loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Muscle-Legends"))()
  	end    
})

Tab:AddButton({
	Name = "力量传奇Muscle Legend",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
  	end    
})

Tab:AddButton({
    Name = "北约中心",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/USA868/114514-55-646-114514-88-61518-618-840-1018-634-10-4949-3457578401-615/main/Protected-36.lua"))()
    end
})

Tab:AddButton({

	Name = "剑客V4(需要加群组)",

	Callback = function()

jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/JianKeCX/JianKeV4/main/ChuXia')))()

    end

})

Tab:AddButton({
	
	Name = "V.G Hub",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/littlegui/main/MuscleLegends"))()	
	
	end
	
})

Tab:AddButton({
Name = "绿",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/Esw6YQKR"))()
   end
})

Tab:AddButton({
    Name = "XCS，卡密a",
    Callback = function()
    getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})


local Section = Tab:AddSection({
	Name = "传送位置"
})

Tab:AddButton({
	Name = "传送到出生点",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
  	end    
})
 
Tab:AddButton({
	Name = "传送到冰霜健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
  	end    
})
 
Tab:AddButton({
	Name = "传送到神话健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
  	end    
})

Tab:AddButton({
	Name = "传送到永恒健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
  	end    
})

Tab:AddButton({
	Name = "传送到传说健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
  	end    
})

Tab:AddButton({
	Name = "传送到肌肉之王健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
  	end    
})

Tab:AddButton({
	Name = "传送到安全岛",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
  	end    
})

Tab:AddButton({
	Name = "传送到幸运抽奖区域",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
  	end    
})

local Tab = Window:MakeTab({
    Name = "灭霸模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
      Name = "出生/复活的地方",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,153,-20)
      end
    })
Tab:AddButton({
      Name = "刷碎片/铸造的地方",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20,115,-695)
      end
   })
Tab:AddButton({
      Name = "商店/升级武器的地方",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28,1061,1590)
      end
    })
Tab:AddButton({
      Name = "时间宝石的位置",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(444.5,117,443.5)
      end
    })
Tab:AddButton({
      Name = "空间宝石的位置",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-412,73,-444)
      end
    })
Tab:AddButton({
      Name = "现实宝石的位置",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-420,13,690)
      end
    })
Tab:AddButton({
      Name = "能量宝石怪的位置（建议开夜视）",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(433,55,-326)
      end
    })
Tab:AddButton({
      Name = "灭霸模拟器快速自杀",
      Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99999,-4985,99999)
      end
    })

local Tab = Window:MakeTab({
	Name = "忍者传奇",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

autoswing = false
function swinging()
    spawn(
        function()
            while autoswing == true do
                task.wait()
                game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
                if not autoswing then
                    break
                end
            end
        end
    )
end
autosell = false
function selling()
    spawn(
        function()
            while autosell == true do
                task.wait(.01)
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                    wait(.1)
                    game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                        game.Workspace.Part.CFrame
                    if not autosell then
                        break
                    end
                end
            end
        end
    )
end
autosellmax = false
function maxsell()
    spawn(
        function()
            while autosellmax == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                        task.wait()
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                            game.Workspace.Part.CFrame
                    end
                end
                if not autosellmax then
                    break
                end
            end
        end
    )
end
autobuyswords = false
function buyswords()
    spawn(
        function()
            while autobuyswords == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllSwords"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyswords then
                    break
                end
            end
        end
    )
end
autobuybelts = false
function buybelts()
    spawn(
        function()
            while autobuybelts == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllBelts"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuybelts then
                    break
                end
            end
        end
    )
end
autobuyranks = false
function buyranks()
    spawn(
        function()
            while autobuyranks == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyRank"
                    local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
                    end
                end
                if not autobuyranks then
                    break
                end
            end
        end
    )
end
autobuyskill = false
function buyskill()
    spawn(
        function()
            while autobuyskill == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllSkills"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyskill then
                    break
                end
            end
        end
    )
end
autobuyshurikens = false
function buyshurikens()
    spawn(
        function()
            while autobuyshurikens == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllShurikens"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyshurikens then
                    break
                end
            end
        end
    )
end

local Section = Tab:AddSection({
	Name = "自动挥舞/售卖"
})

Tab:AddToggle(
    {
        Name = "自动挥舞",
        Default = false,
        Callback = function(x)
            autoswing = x
            if autoswing then
                swinging()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动售卖",
        Default = false,
        Callback = function(x)
            autosell = x
            if autosell then
                selling()
            end
        end
    }
)
    
Tab:AddToggle(
    {
        Name = "存满了自动售卖",
        Default = false,
        Callback = function(x)
            autosellmax = x
            if autosellmax then
                maxsell()
            end
        end
    }
)

local Section = Tab:AddSection({
	Name = "自动购买功能"
})

Tab:AddToggle(
    {
        Name = "自动购买剑",
        Default = false,
        Callback = function(x)
            autobuyswords = x
            if autobuyswords then
                buyswords()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买腰带",
        Default = false,
        Callback = function(x)
            autobuybelts = x
            if autobuybelts then
                buybelts()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买称号",
        Default = false,
        Callback = function(x)
            autobuyranks = x
            if autobuyranks then
                buyranks()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买忍术",
        Default = false,
        Callback = function(x)
            autobuyskill = x
            if autobuyskill then
                buyskill()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买",
        Default = false,
        Callback = function(x)
            autobuyshurikens = x
            if autobuyshurikens then
                buyshurikens()
            end
        end
    }
)

Tab:AddButton(
    {
        Name = "解锁所有岛",
        Callback = function()
            for _, v in next, game.workspace.islandUnlockParts:GetChildren() do
                if v then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame
                    wait(.5)
                end
            end
        end
    }
)

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({

	Name = "忍者传奇①",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/5repo/main/script4.lua"))()

    end

})

Tab:AddButton({
	
	Name = "忍者传奇②",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/zerpqe/script/main/NinjaLegends.lua"))()		
	
	end

})

Tab:AddButton({
	
	Name = "忍者传奇③",	
	
	Callback = function()
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/Ninja-Legenos.exe.lua"))()
	
	end

})

local Tab = Window:MakeTab({

	Name = "BF",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false
	
})

Tab:AddButton({
	
	Name = "自动刷级",	
	
	Callback = function()
	
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()	
	
	end

})

Tab:AddButton({
	
	Name = "汉化版",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
	
	end

})

Tab:AddButton({
	
	Name = "BF③",	
	
	Callback = function()
	
loadstring(game:HttpGet('https://rawscripts.net/raw/UPDATE-16-Blox-Fruits-Nub-V1-Hub-4583'))()
	
	end

})

Tab:AddButton({
	
	Name = "Zen Hub",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
	
	end	
	
})

local Tab = Window:MakeTab({
	Name = "伐木大亨",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "白",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A822.lua", true))()
  end
})

Tab:AddButton({
	Name = "超强",
	Callback = function()
	loadstring(game:HttpGet"https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx")()
  	end
})

local Section = Tab:AddSection({	Name = "传送地点"})                                      Tab:AddButton({Name = "火木",      Callback = function()              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1615.8934326171875, 622.9998779296875, 1086.1234130859375)               end                                    })                                                                              Tab:AddButton({                  Name = "画室",                 Callback = function()                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5241.55810546875, -166.00003051757812, 709.5656127929688)                end                                    })                                                                Tab:AddButton({                  Name = "幻影木",              Callback = function()             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.28166198730469, -213.13137817382812, -1357.8018798828125)              end                                   })                                                                Tab:AddButton({                 Name = "木材反斗城",            Callback = function()             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(252.31906127929688, 2.9999992847442627, 56.9854850769043)                  end                                   })                                                                               Tab:AddButton({                 Name = "冰木",                  Callback = function()              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1522.8817138671875, 412.3657531738281, 3277.71826171875)                     end                                    })                                                                Tab:AddButton({                  Name = "椰子木",                Callback = function()              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2615.709228515625, -5.899986743927002, -21.30138397216797)                  end                                     })                                             

local Tab = Window:MakeTab({

	Name = "极速传奇",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({

	Name = "青",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()

    end

})

Tab:AddButton({

	Name = "剑客V4(需要加群组)",

	Callback = function()

jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/JianKeCX/JianKeV4/main/ChuXia')))()

    end

})

Tab:AddButton({
	
	Name = "Boa",	
	
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat', true))()
	
	end

})

Tab:AddButton({
	
	Name = "汉化（改数值）",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/egMXJcwB", true))()
	
	end
	
})

Tab:AddButton({
	Name = "开启卡宠",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/uR6azdQQ"))()
	end
})

Tab:AddButton({
	Name = "自动重生和自动刷等级",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/T9wTL150"))()        
  	end    
})

local Section = Tab:AddSection({
	Name = "传送位置"
})

Tab:AddButton({
	Name = "出生岛",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9682.98828125, 58.87917709350586, 3099.033935546875)      
  	end    
})

Tab:AddButton({
	Name = "白雪城",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9676.138671875, 58.87917709350586, 3782.69384765625)   
  	end    
})

Tab:AddButton({
	Name = "熔岩城",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11054.96875, 216.83917236328125, 4898.62841796875)       
  	end    
})

Tab:AddButton({
	Name = "传奇公路",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13098.87109375, 216.83917236328125, 5907.6279296875)    
  	end    
})
	
local Tab = Window:MakeTab({
	Name = "兵工厂",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddButton({
    Name = "兵工厂①",
    Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
    end
})

Tab:AddButton({
    Name = "兵工厂②",
    Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
    end
})

local Tab = Window:MakeTab({
	Name = "索尔的RNG",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "索尔的RNG①",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
  	end
})

Tab:AddButton({
	Name = "hoho(需卡密)",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
  	end
})

Tab:AddButton({
	Name = "索尔的RNG③(需卡密)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/upd/main/rng"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "鲨口求生2",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddDropdown({
	Name = "免费船只",
	Default = "1",
	Options = {"DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine",  "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)
game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end
})

Tab:AddButton({
	Name = "杀鲨鱼",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end
})

local Tab = Window:MakeTab({
	Name = "监狱人生",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Moon Hub",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/Gae7YC84"))();
  	end    
})

Tab:AddButton({
	Name = "新菜单",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()
  	end    
})

Tab:AddButton({
	Name = "v1",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({
	Name = "监狱人生①",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/De4aYHDY"))()
  	end
})

Tab:AddButton({
  Name = "监狱人生②",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua"))()
  end
})

Tab:AddButton({
	Name = "手里剑秒杀",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/jian"))()
  	end
})

Tab:AddButton({
	Name = "杀死全部（新版重复杀）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/jianyu2"))()
  	end
}) 

Tab:AddButton({
	Name = "变成钢铁侠",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
  	end    
})

Tab:AddButton({
	Name = "变成死神",
	Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
  	end    
})

Tab:AddButton({
	Name = "无敌模式（别人可见）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/jianyu4"))()
  	end
})

Tab:AddButton({
	Name = "手拿电锯",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/jianyu3", true))()
  	end
})

Tab:AddButton({
	Name = "变车模型",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/bianche"))()
  	end
})

local Section = Tab:AddSection({
	Name = "传送"
})
local Section = Tab:AddSection({
	Name = "传送位置"
})

Tab:AddButton({
	Name = "警卫室",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
  	end
})

Tab:AddButton({
	Name = "监狱室内",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
  	end
})

Tab:AddButton({
	Name = "罪犯复活点",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
  	end
})

Tab:AddButton({
	Name = "监狱室外",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
  	end
})

local Tab = Window:MakeTab({
	Name = "造船寻宝",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})



local Section = Tab:AddSection({
	Name = "功能"
})

Tab:AddButton({
	Name = "复制别人的船",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
  	end    
})

Tab:AddButton({
	Name = "自动刷金条",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/zaochuan1"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "法宝模拟器",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({

	Name = "法宝模拟器①",

	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/zhanghuihuihuil/Script/main/%E6%B3%95%E5%AE%9D%E6%A8%A1%E6%8B%9F%E5%99%A8%E6%B1%89%E5%8C%96'))()
	end
})
Tab:AddButton({

	Name = "法宝模拟器②",

	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/9bGpv4H3/raw"))()
	end
})

local Section = Tab:AddSection({
	Name = "功能"
})

Tab:AddButton({
	Name = "法宝自动刷（任何地方）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/fabao"))()
  	end
})

local Tab = Window:MakeTab({

	Name = "最强战场",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "最强战场①",

	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()

    end

})

Tab:AddButton({

	Name = "最强战场②",

	Callback = function()	
	
loadstring(Game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tsbscripts/main/Main"))()

    end

})

Tab:AddButton({

	Name = "最强战场③",

	Callback = function()
	
loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()

    end

})	

local Tab = Window:MakeTab({
  Name = "DOORS脚本",
  Icon = "rbxassetid://7734068321",
  PremiumOnly = false
})

Tab:AddButton({

	Name = "最强汉化",

	Callback = function()

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()

    end

})

Tab:AddButton({
    Name="ms要白名单",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua'))()
    end
})

Tab:AddButton({
	Name = "不要白名单MSDOORS2.4.0",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/mstudio45/MSDOORS/7bd97c2d956a775d683c2d7973d79715b30998ea/MSDOORS/Moonsec.lua'))()
  	end
})

Tab:AddButton({
    Name="云doors",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()
    end
})
Tab:AddButton({

	Name = "剑客V4",

	Callback = function()

jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/JianKeCX/JianKeV4/main/ChuXia')))()

    end

})

Tab:AddButton({
	
	Name = "最强",	
	
	Callback = function()
	
loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
	
	end

})

Tab:AddButton({

	Name = "Darkrai",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
	
	end

})

Tab:AddButton({

	Name = "RP变怪（别人看不见）",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
	
	end
			
})

Tab:AddButton({
  Name = "门绘图显示",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/doors1"))()
  end
})
Tab:AddButton({
	Name = "DOORS变身脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end
}) 

Tab:AddButton({
	Name = "Rooms自动行走",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
end
})

Tab:AddButton({
	Name = "吸铁石",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()
end
})

Tab:AddButton({	
Name = "夜视仪",
	Callback = function() 
  _G.UpdateStars = false -- stars disappear after picking up a book/breaker pole | false: a little lag

    loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
end
})    

Tab:AddButton({
  Name = "DOORS低回拉穿墙",
  Callback = function()
    loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()
  end
})
Tab:AddButton({
  Name = "剪刀",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
  end
})
Tab:AddButton({
  Name = "骷髅钥匙",
  Callback = function ()
    local item = game:GetObjects("rbxassetid://11697889137")[1]item.Parent = game.Players.LocalPlayer.Backpack
  end
})

Tab:AddButton({
	Name = "神圣炸弹",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/HolyGrenadeByNerd.lua"))()
    end
})

Tab:AddButton({
	Name = "能量罐）",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
    end
})   

Tab:AddButton({
	Name = "紫色手电筒（在电梯购买东西的时候使用）",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight"))()
end
})  

Tab:AddButton({
	Name = "手电筒（没电会有bug）",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Normal%20Flashlight"))()
end
})      

Tab:AddButton({
  Name = "极端模式",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gNybFb2Z"))()
  end
})
Tab:AddButton({
  Name = "微山",
  Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
  end
})
Tab:AddButton({
  Name = "DOORS多脚本",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/07P53fFE"))()
  end
})

local Tab = Window:MakeTab({
  Name = "DOORS娱乐十字架(只对自己召唤的怪有用)",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

Tab:AddButton({
  Name = "刷怪菜单",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
  end
})

Tab:AddButton({
  Name = "耶稣十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()
  end
})

Tab:AddButton({
  Name = "紫光十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()
  end
})

Tab:AddButton({
  Name = "万圣节十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()
  end
})

Tab:AddButton({
  Name = "普通十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()
  end
})

local Tab = Window:MakeTab({

	Name = "地下城任务",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({
	Name = "地下城任务①",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/StepBroFurious/Script/main/FuriousFall.lua"))()
  	end    
})

Tab:AddButton({
	Name = "地下城任务②",
	Callback = function()
     loadstring(game:HttpGet("https://gist.githubusercontent.com/hngamingroblox/659adbebad6a9b3a07527e5f7e446d66/raw"))()   
  	end    
})


local Tab = Window:MakeTab({

	Name = "死亡球",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})
Tab:AddButton({

	Name = "死亡球①",

	Callback = function()
	loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua",true))()
	end
})
Tab:AddButton({

	Name = "死亡球②",

	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Ball1/main/Death"))()
	end
})

local Tab = Window:MakeTab({

	Name = "骨折VI",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false
	
})

Tab:AddButton({
	
	Name = "骨折VI①",	
	
	Callback = function()
	
loadstring(game:HttpGet('https://pastebin.com/raw/5rEAVmcC'))()	
	
	end
		      
})

Tab:AddButton({

	Name = "骨折VI②",

	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingResources/GamingResources-Script-Hub/main/Key%20System", true))()

    end

})	

local Tab = Window:MakeTab({

	Name = "巴掌模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "巴掌模拟器①",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()

    end

})

Tab:AddButton({

	Name = "巴掌模拟器②",

	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()

    end

})

Tab:AddButton({

	Name = "巴掌模拟器③",

	Callback = function()	
loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()

    end

})

local Tab = Window:MakeTab({

	Name = "刀刃球",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "VectorHub",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MB*PC.lua"))() 	
	
	end

})

Tab:AddButton({

	Name = "刀刃球②",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Prymoric/Alaxus-Refinement-/main/Alaxus%20Blade%20Ball",true))()	

    end
    
})

Tab:AddButton({

	Name = "刀刃球③",

	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()

    end

})	

Tab:AddButton({

	Name = "crazzy hub",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/kmmwhocare/Crazzy-Hub/main/Blade%20Ball"))()
	
	end			

})

local Tab = Window:MakeTab({

	Name = "俄亥俄州",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false
	
})

Tab:AddButton({

	Name = "俄亥俄州脚本",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed",true))()
	
	end

})

Tab:AddButton({

	Name = "俄亥俄州指令王",	
	
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
	
	end
					
})

Tab:AddButton({
   Name = "俄亥俄州1",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/nb/main/jm1051.lua"))()
   end
})

Tab:AddButton({
    Name = "指令脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
    end
})

Tab:AddLabel("指令如下（聊天框输入）")
Tab:AddLabel("透开-透关 ---透视")
Tab:AddLabel("追踪开-追踪关 ---子弹追踪")
Tab:AddLabel("收钱开-收钱关 ---收集钱包")
Tab:AddLabel("收物开-收物关 ---收集物品")
Tab:AddLabel("抢取款机开-抢取款机关")
Tab:AddLabel("抢银行开-抢银行关")
Tab:AddLabel("穿墙开-穿墙关")
Tab:AddLabel("拳击光环开-拳击光环关")


Tab:AddButton({

	Name = "俄亥俄州推荐脚本",

	Callback = function()
	
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\115\99\114\105\112\116\115\46\118\105\115\117\114\117\115\46\100\101\118\47\111\104\105\111\47\115\111\117\114\99\101"))()

    end

})

Tab:AddButton({

	Name = "物品tp自动拾取",

	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mstir16/legocheats/main/archive/Ohio./script.lua"))()

    end

})	
			
local Tab = Window:MakeTab({

	Name = "其他游戏",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "模仿者",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/obfloadstringmainmimic/main/README.md", true))()

    end

})

Tab:AddButton({

	Name = "战斗勇士",

	Callback = function()

loadstring(game:HttpGet("https://projecthook.xyz/scripts/free.lua"))()

    end

})

Tab:AddButton({

	Name = "战斗勇士英文",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))();

    end

})

Tab:AddButton({

	Name = "火箭",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "只因剑",

	Callback = function()

  loadstring(game:HttpGet(('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'),true))()

    end

})

local Tab = Window:MakeTab({

	Name = "各类脚本",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "青风",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,116,53,87,75,53,72,48,72})end)())))("青风脚本")

    end

})

Tab:AddButton({
	Name = "落叶中心",
	Callback = function()
     getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
  	end    
})

Tab:AddButton({
	Name = "云脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/VIP/main/%E4%BA%91%E8%84%9A%E6%9C%AC/UNIVERSAL%20VERSION.LUA", true))()
  	end    
})

Tab:AddButton({

	Name = "静新",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()

    end

})

Tab:AddButton({

	Name = "北极",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()

    end

})

Tab:AddButton({

	Name = "SF",

	Callback = function()

SF_V7 = "作者_神罚"SheFa = "QQ群637340150"loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()

    end

})

Tab:AddButton({

	Name = "导管中心",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()

    end

})

Tab:AddButton({

	Name = "忍",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,52,81,74,109,75,50,99,72})end)())))()

    end

})

Tab:AddButton({

	Name = "剑客Ⅴ4",

	Callback = function()

jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/JianKeCX/JianKeV4/main/ChuXia')))()

    end

})

Tab:AddButton({

	Name = "脚本中心",

	Callback = function()

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()

    end

})

Tab:AddButton({

	Name = "鸭",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()

    end

})

Tab:AddButton({

	Name = "水下世界",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()

    end

})

Tab:AddButton({

	Name = "QB",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,69,49,54,76,51,90,106})end)())))()

    end

})

Tab:AddButton({

	Name = "神光",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()

    end

})

Tab:AddButton({

	Name = "秋",

	Callback = function()

local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,83,56,53,55,57,54,48,47,45,47,109,97,105,110,47,37,69,55,37,65,55,37,56,66,37,67,50,37,66,55,37,69,56,37,56,55,37,65,65,37,69,53,37,56,56,37,66,54,37,69,56,37,56,52,37,57,65,37,69,54,37,57,67,37,65,67,37,69,54,37,57,54,37,66,48,37,69,54,37,66,65,37,57,48,37,69,55,37,65,48,37,56,49,46,116,120,116})end)()))}
loadstring(game:HttpGet(SCC_CharPool[1]))()

    end

})

Tab:AddButton({

	Name = "云",

	Callback = function()

_G.Clouduilib = "白灰脚作者小云，加载出十几秒"loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/%E7%99%BD%E7%81%B0%E8%84%9A%E6%9C%ACbeta.lua", true))()

    end

})

Tab:AddButton({

	Name = "XC",

	Callback = function()

getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()

    end

})

Tab:AddButton({

	Name = "青",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/cyq78/raw'))()

    end

})

Tab:AddButton({

	Name = "星火",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9319/%E6%98%9F%E7%81%AB%E4%BA%A4%E8%BE%89%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81.lua?sign=pw1GHDb-tSJH25rTcTo_QPhzJBe73nf7djKDL1vQN1M%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "鱼",

	Callback = function()

getgenv().FISH = "鱼脚本群:851686462"loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\101\108\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\72\119\81\77\82\90\68\69\34\41\41\40\41")("鱼脚本")

    end

})

Tab:AddButton({

	Name = "皇",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "空情",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8628/%E9%9D%99?sign=uxlt7ravTFmP3TZLNgN7zImLHxJWhH93SEbKgFA_PRc%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "霖溺",

	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~LNINIGGD"))()
	
	end
	
})

Tab:AddButton({

	Name = "浮萍中心",

	Callback = function()
	loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\69\55\97\57\84\56\65\109\34\41\40\41\10")()
	
	end
	
})
	
	local Tab = Window:MakeTab({

	Name = "蜂群模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "霖溺简易汉化",

	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~HHAKKJA"))()
	end
})

Tab:AddButton({

	Name = "蜂群模拟器①",

	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~HHAKKSS"))()
	end
})

Tab:AddButton({

	Name = "蜂群模拟器②自动收集",

	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/max0mind/lua/main/loader.lua'))()
	end
})

local Tab = Window:MakeTab({

	Name = "小偷模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "小偷模拟器①",

	Callback = function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/adrician/Thief-Simulator---GUI/main/Thief%20sim.lua"),true))()
	end
})

local Tab = Window:MakeTab({

	Name = "寻宝模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "寻宝模拟器①",
	
	Callback = function()
	loadstring(game:HttpGet("http://void-scripts.com/Scripts/treasureHuntSim.lua"))()
	end
})

local Tab = Window:MakeTab({

	Name = "内脏与黑火药",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "内脏与黑火药①",

	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~KSKKS"))()
	end
})

Tab:AddButton({

	Name = "内脏与黑火药②",

	Callback = function()
	loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()
	end
})

local Tab = Window:MakeTab({

	Name = "餐厅大亨",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "餐厅大亨无限资金",

	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~zkzkzisKAKAKK"))()
	end
})

Tab:AddButton({

	Name = "餐厅大亨①",

	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/toosiwhip/snake-hub/main/restaurant-tycoon-2.lua"))()
	end
})

Tab:AddButton({

	Name = "餐厅大亨②",

	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/Ppqt0Gib/raw"))()
	end
})

local Tab = Window:MakeTab({

     Name = "黑暗欺骗",
     
     Icon = "rbxassetid://4483345998",
     
     PremiumOnly = false
     
})

Tab:AddButton({

    Name = "黑暗欺骗自动通关",
    
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/9kn-1/Dark/main/Auto.lua"))()
    end
}) 
      
local Tab = Window:MakeTab({

     Name = "造船寻宝",
     
     Icon = "rbxassetid://4483345998",
     
     PremiumOnly = false
     
})

Tab:AddButton({
  Name = "复制别人的船",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()---https://discord.gg/HjNaYs6AnV discord
  end
})

Tab:AddButton({
  Name = "造船寻宝1",
  Callback = function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/urmomjklol69/GoldFarmBabft/main/GoldFarm.lua'),true))()
    end
})

Tab:AddButton({
  Name = "造船寻宝2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/novakoolhub/Scripts/main/Scripts/NovBoat.lua"))()
  end
})

Tab:AddButton({
	Name = "自动刷金条",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr",true))()
  	end
})

Tab:AddButton({
	Name = "工具包（可破别人团队模式空气墙）",
	Callback = function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()	
  	end
})

local Tab = Window:MakeTab({
	Name = "鲨口求生2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddDropdown({
	Name = "免费船只",
	Default = "1",
	Options = {"DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine",  "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)
game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end
})

Tab:AddButton({
	Name = "杀鲨鱼",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end
})

local Tab = Window:MakeTab({

	Name = "进击的僵尸",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

  Name = "自瞄",

  Callback = function ()

loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()

  end

})

Tab:AddButton({

  Name = "测试中",

  Callback = function ()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Zombie%20Attack", true))()

  end

})

local Tab = Window:MakeTab({
	Name = "越狱",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "自瞄",
  Callback = function ()
loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
  end

})

Tab:AddButton({

  Name = "青",
  Callback = function ()
loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
  end

})

Tab:AddButton({
  Name = "自动抢劫",
  Callback = function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/free"))()
  end
})

local Tab = Window:MakeTab({
	Name = "破坏模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})  

Tab:AddButton({
   Name = "破坏模拟器1",
   Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()  
   end
})

local Tab = Window:MakeTab({
	Name = "杀手与警长",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
   Name = "杀手与警长秒杀",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
   end
})

local Tab = Window:MakeTab({
    Name = "汽车经销商大亨",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
  Name = "会覆盖",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/Car%20Dealership%20Tycoon.lua"))()
  end
})

Tab:AddButton({
  Name = "汽车经销商大亨2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()
   end
})

local Tab = Window:MakeTab({
    Name = "兵工厂",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
  Name = "兵工厂1",
  Callback = function()
  loadstring(game:HttpGet("https://pastefy.app/2YdrWHxV/raw"))()
  end
})

local Tab = Window:MakeTab({
    Name = "巴掌大战",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "巴掌大战1",
    Callback = function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
    end
})

local Tab = Window:MakeTab({
    Name = "巴掌模拟器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
  Name = "巴掌模拟器，作者龙叔",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))()
  end
})

Tab:AddLabel("指令如下（聊天框输入）")
Tab:AddLabel("透视")
Tab:AddLabel("自动击打")
Tab:AddLabel("击打光环")
Tab:AddLabel("防死神速度")
Tab:AddLabel("防推飞")
Tab:AddLabel("防击飞")
Tab:AddLabel("踏空")

Tab:AddButton({
    Name = "指令脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))()
    end
})

Tab:AddLabel("指令如下（聊天框输入）")
Tab:AddLabel("透视-自动击打-击打光环-踏空")
Tab:AddLabel("防击飞-防推飞-防死神-速度")
Tab:AddLabel("关-无敌开-无敌关-全开-全关")
Tab:AddLabel("全开功能有:防编辑，防毒液，防黑洞，防死神")
Tab:AddLabel("防雷神，防rob，防秒杀手套，管理员预警，防踢")

Tab:AddButton({
                  Name = "巴掌光环",
                  Default = false,
                  Callback = function(bool)
getgenv().SlapAura = bool
            if bool == true then
                while getgenv().SlapAura do
                    task.wait(.005)
                        pcall(function()
                        for Index, Player in next, game.Players:GetPlayers() do
                            if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("entered") then
                                if Player.Character:FindFirstChild("Head") then
                                if Player.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player.Character:FindFirstChild("rock") == nil then 
                                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                                    if 25 >= Magnitude then
                                        shared.gloveHits[getGlove()]:FireServer(Player.Character:WaitForChild("Head"))
                                end
                                    end
                            end
                                end
                        end
                        end
                    end)
                end
            end
end
                })

Tab:AddButton({
    Name = "脚本1",
	Callback = function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
	end
})

Tab:AddButton({  
    Name = "脚本2(hub)",
	Callback = function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheScriptMaster1/ScriptMaster-Hub/main/scriptmasterhub.lua')))()
	end
})


local Tab = Window:MakeTab({
	Name = "超级足球联赛",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
   Name = "超级足球联赛1",
   Callback = function()
   loadstring(game:HttpGet"https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/neo")() 
   end
})


local Tab = Window:MakeTab({
	Name = "彩虹朋友",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "彩虹朋友1",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow'))()
	end
})

Tab:AddButton({
    Name="彩虹朋友2",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Sempiller/RainbowTool/main/Turkish.lua'))();
    end
})

Tab:AddButton({
	Name = "彩虹朋友3",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "摊位世界",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "摊位世界自动开宝箱",
	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/7WqUwjmp/raw")()
	end
})
	
	local Tab = Window:MakeTab({
	Name = "河北唐县",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "河北唐县自动刷钱",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoyi-boop/-/refs/heads/main/tangxianxianmian.lua",true))()
	end
})

local Tab = Window:MakeTab({
	Name = "监狱人生",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
	end
})

Tab:AddButton({
	Name = "变车模型",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/bianche"))()
  	end
})

Tab:AddButton({
	Name = "变死神（有惊喜仅自己可见）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/sb"))()    
  	end
})
Tab:AddButton({
	Name = "变钢铁侠（有惊喜别人能看见）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/sb2"))()
  	end
})
Tab:AddButton({
	Name = "手里剑（秒杀）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/jian"))()
  	end
})
en
Tab:AddButton({
	Name = "杀死全部（新版重复杀）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/shasi"))()
  	end
})
Tab:AddButton({
	Name = "无敌模式（别人可见）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/wudi"))()
  	end
})
Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

local Section = Tab:AddSection({
	Name = "传送位置"
})
Tab:AddButton({
	Name = "警卫室",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
  	end
})
Tab:AddButton({
	Name = "监狱室内",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
  	end
})
Tab:AddButton({
	Name = "罪犯复活点",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
  	end
})
Tab:AddButton({
	Name = "监狱室外",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
  	end
})

local Tab = Window:MakeTab({
    Name = "速度传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
	Name = "极速传奇",
	Callback = function()		loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
	end
})
 Tab:AddButton({
	Name = "自动卡宠",
	Callback = function()
	wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,304,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="自动卡宠脚本"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,304,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,304,0,21)_b.Font=Enum.Font.Arial;_b.Text="无"
_b.TextColor3=Color3.new(1,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377379,0)
ab.Size=UDim2.new(0,304,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="自动卡宠:已开启 "
ab.TextColor3=Color3.new(1,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="You went idle and ROBLOX tried to kick you but we reflected it!"wait(2)ab.Text="Script Re-Enabled"end)
  	end
})

local Tab = Window:MakeTab({
	Name = "一路向西",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "防摔",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040712770")[1].Source)()
	end
})
Tab:AddButton({
	Name = "防套",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040719318")[1].Source)()
	end
})
Tab:AddButton({
	Name = "范围",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040722920")[1].Source)()
	end
})
Tab:AddButton({
	Name = "无后座，无限，超级",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040701935")[1].Source)()
	end
})

local Tab = Window:MakeTab({
	Name = "宠物X",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "云宠物",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/T34M-V0ID/cloud-hub/main/cloud"))()
	end
})
