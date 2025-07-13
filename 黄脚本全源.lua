-- 别做了

-- 白名单系统配置（已添加7079287947和7534842829）
local WHITELIST = {
    [8515693093] = true, -- 作者ID
    [6039062907] = true,
    [8080735686] = true,
    [7079287947] = true, -- 新增白名单ID
    [7534842829] = true  -- 新增白名单ID
    -- 可继续添加白名单ID
}

-- 加载Orion库
local OrionLib
local success, err = pcall(function()
    OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
end)
if not success or not OrionLib then
    warn("Orion库加载失败: " .. (err or "未知错误"))
    return
end

-- 服务与变量初始化
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- 白名单验证
if not WHITELIST[player.UserId] then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "未授权访问",
            Text = "您的ID不在白名单中",
            Duration = 5,
            Icon = "rbxassetid://9108657181"
        })
    end)
    local RestrictWindow = OrionLib:MakeWindow({
        Name = "访问受限",
        Theme = "Dark",
        Icon = "rbxassetid://9108657181"
    })
    local InfoTab = RestrictWindow:MakeTab({Name = "权限不足"})
    InfoTab:AddParagraph("提示", "请联系管理员添加白名单")
    InfoTab:AddParagraph("您的ID", tostring(player.UserId))
    OrionLib:Init()
    return
end

-- 工具函数：创建圆角
local function makeRound(obj, radius)
    if obj and obj:IsA("GuiObject") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = radius or UDim.new(0.5, 0)
        corner.Parent = obj
    end
end

-- 创建主窗口
local Window = OrionLib:MakeWindow({
    Name = "新黄脚本",
    SaveConfig = true,
    IntroText = "新黄脚本 - 功能加载完成",
    Theme = "FlatBlue",
    Icon = "rbxassetid://4483345998"
})

-- 欢迎通知
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "新黄脚本",
        Text = "欢迎使用，功能已就绪",
        Duration = 4,
        Icon = "rbxassetid://4483345998"
    })
end)

-- 作者信息标签页
local AuthorTab = Window:MakeTab({Name = "作者信息", Icon = "rbxassetid://4483345998"})
AuthorTab:AddParagraph("作者", "小黄")
AuthorTab:AddParagraph("作者QQ", "1357377308")
AuthorTab:AddParagraph("QQ群", "543121803")

-- 圆形按钮生成器
local function addRoundButton(tab, config)
    local btn = tab:AddButton(config)
    if btn.Instance and btn.Instance:IsA("GuiButton") then
        btn.Instance.Size = UDim2.new(0, 120, 0, 36)
        makeRound(btn.Instance)
        
        local hover = Instance.new("UIScale")
        hover.Scale = 1
        hover.Parent = btn.Instance
        
        local enterConn = btn.Instance.MouseEnter:Connect(function() hover.Scale = 1.05 end)
        local leaveConn = btn.Instance.MouseLeave:Connect(function() hover.Scale = 1 end)
        
        btn.Instance.AncestryChanged:Connect(function(_, parent)
            if not parent then
                enterConn:Disconnect()
                leaveConn:Disconnect()
            end
        end)
    end
    return btn
end

-- 作者信息页按钮
addRoundButton(AuthorTab, {
    Name = "复制作者QQ",
    Callback = function()
        if setclipboard then
            setclipboard("1357377308")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(70, 130, 255)
})

addRoundButton(AuthorTab, {
    Name = "复制QQ群",
    Callback = function()
        if setclipboard then
            setclipboard("543121803")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ群已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(100, 200, 100)
})

-- 玩家信息标签页
local PlayerTab = Window:MakeTab({Name = "玩家信息", Icon = "rbxassetid://4483345998"})
local executorName = "未知"
pcall(function() executorName = identifyexecutor() or "未知" end)

PlayerTab:AddParagraph("用户名", player.Name)
PlayerTab:AddParagraph("用户ID", tostring(player.UserId))
PlayerTab:AddParagraph("注入器", executorName)
PlayerTab:AddParagraph("服务器ID", tostring(game.GameId))
PlayerTab:AddParagraph("白名单状态", "<font color='green'>已授权</font>")

-- 玩家功能标签页
local FunctionTab = Window:MakeTab({Name = "玩家功能", Icon = "rbxassetid://4483345998"})

-- 文本框配置函数
local function addSettingTextbox(tab, config)
    tab:AddTextbox({
        Name = config.Name,
        Callback = function(Value)
            local num = tonumber(Value)
            if not num or num <= 0 then
                return OrionLib:MakeNotification({Name = "错误", Content = "请输入正数", Time = 2})
            end
            local success, err = pcall(config.Callback, num)
            if not success then
                OrionLib:MakeNotification({Name = "错误", Content = "设置失败: " .. err, Time = 2})
            end
        end
    })
end

-- 移动设置
addSettingTextbox(FunctionTab, {
    Name = "跳跃高度",
    Callback = function(num)
        local humanoid = player.Character:WaitForChild("Humanoid", 5)
        humanoid.JumpPower = num
    end
})

addSettingTextbox(FunctionTab, {
    Name = "移动速度",
    Callback = function(num)
        local humanoid = player.Character:WaitForChild("Humanoid", 5)
        humanoid.WalkSpeed = num
    end
})

-- 夜视模式
FunctionTab:AddToggle({
    Name = "夜视模式",
    Default = false,
    Callback = function(enabled)
        Lighting.Ambient = enabled and Color3.new(0.5, 0.5, 0.5) or Color3.new(0, 0, 0)
        Lighting.Brightness = enabled and 2 or 1
    end,
    Color = Color3.fromRGB(255, 165, 0)
})

-- 脚本中心标签页
local ScriptCenterTab = Window:MakeTab({Name = "脚本中心", Icon = "rbxassetid://4483346000"})

-- 原有加载按钮：皮脚本
addRoundButton(ScriptCenterTab, {
    Name = "加载皮脚本",
    Callback = function()
        OrionLib:MakeNotification({Name = "提示", Content = "正在加载...", Time = 3})
        task.spawn(function()
            local success, err = pcall(function()
                getgenv().XiaoPi = "皮脚本QQ群1002100032"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua", true))()
            end)
            if success then
                OrionLib:MakeNotification({Name = "成功", Content = "加载完成", Time = 3})
            else
                OrionLib:MakeNotification({Name = "失败", Content = "错误: " .. err, Time = 3})
            end
        end)
    end,
    Color = Color3.fromRGB(123, 104, 238)
})

-- 导管中心
addRoundButton(ScriptCenterTab, {
    Name = "加载导管中心",
    Callback = function()
        OrionLib:MakeNotification({Name = "提示", Content = "正在加载导管中心...", Time = 3})
        task.spawn(function()
            local success, err = pcall(function()
                loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
            end)
            if success then
                OrionLib:MakeNotification({Name = "成功", Content = "导管中心加载完成", Time = 3})
            else
                OrionLib:MakeNotification({Name = "失败", Content = "错误: " .. err, Time = 3})
            end
        end)
    end,
    Color = Color3.fromRGB(255, 99, 71)
})

-- 落叶中心
addRoundButton(ScriptCenterTab, {
    Name = "加载落叶中心",
    Callback = function()
        OrionLib:MakeNotification({Name = "提示", Content = "正在加载落叶中心...", Time = 3})
        task.spawn(function()
            local success, err = pcall(function()
                getgenv().LS = "落叶中心"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
            end)
            if success then
                OrionLib:MakeNotification({Name = "成功", Content = "落叶中心加载完成", Time = 3})
            else
                OrionLib:MakeNotification({Name = "失败", Content = "错误: " .. err, Time = 3})
            end
        end)
    end,
    Color = Color3.fromRGB(139, 69, 19)
})

-- 鬼脚本
addRoundButton(ScriptCenterTab, {
    Name = "加载鬼脚本",
    Callback = function()
        OrionLib:MakeNotification({Name = "提示", Content = "正在加载鬼脚本...", Time = 3})
        task.spawn(function()
            local success, err = pcall(function()
                Ghost_Script = "作者_鬼"
                Ghost_Script = "交流群858895377"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Ghost-Gui-888/Ghost-Script/refs/heads/main/QQ858895377"))()
            end)
            if success then
                OrionLib:MakeNotification({Name = "成功", Content = "鬼脚本加载完成", Time = 3})
            else
                OrionLib:MakeNotification({Name = "失败", Content = "错误: " .. err, Time = 3})
            end
        end)
    end,
    Color = Color3.fromRGB(50, 50, 50)
})

-- 初始化界面
OrionLib:Init()

-- 样式优化
task.delay(0.3, function()
    local mainFrame = Window.Instance:FindFirstChild("MainFrame", true)
    if mainFrame then
        makeRound(mainFrame, UDim.new(0.08, 0))
    end
end)

-- 清理函数
local function cleanUp()
    if Window and Window.Instance then
        Window.Instance:Destroy()
    end
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.Brightness = 1
end

-- 玩家离开时清理
Players.PlayerRemoving:Connect(function(leavingPlayer)
    if leavingPlayer == player then
        cleanUp()
    end
end)