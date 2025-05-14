--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/RIOTV2

    @name RIOT V2
    @author Proton Utilities

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local ROA_Id = {
    UniverseId = {
        113491250,
        2132866904,
    },
}

local Push = function(File)
    local Actor = getactors and getactors()[1]

    if
        Actor and (ROA_Id.PlaceId and table.find(ROA_Id.PlaceId, game.PlaceId))
        or (ROA_Id.UniverseId and table.find(ROA_Id.UniverseId, game.GameId))
    then
        return run_on_actor(Actor, File)
    else
        return loadstring(File)()
    end
end

Push([====[
        getgenv().RIOT = {
            BUILD = 'Release',
            VERSION = 'v' or 'v0.0.0'
        }

        local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
        end return a.cache[b].c end}do function a.a()local b={}function b.Clone(c)local
        d=typeof(c)if d=='function'and(clonefunc or clonefunction)then return(clonefunc
        or clonefunction)(c),true end if d=='Instance'and(cloneref or clonereference)
        then return(cloneref or clonereference)(c),true end if d~='table'then return c,
        false end local function e(f,g)if g and g[f]then return g[f]end local h,i=g or{}
        ,{}h[f]=i for j,k in next,f do i[e(j,h)]=e(k,h)end local j=(getrawmetatable or
        getmetatable)(f)if j then(setrawmetatable or setmetatable)(i,e(j,h))end return i
        end return e(c),true end b.ProtectGui=function(c)local d=cloneref and cloneref(
        game)or game local e,f=pcall(function()c.Parent=gethui and gethui()or cloneref
        and cloneref(d:GetService'CoreGui')or d:GetService'CoreGui'end)return e and c or
        error('Failed to protect GUI: '..tostring(f))end b.ProtectGui=newcclosure and
        newcclosure(b.ProtectGui)or b.ProtectGui b.SecureService=function(c)local d=
        cloneref and cloneref(game)or game local e,f=pcall(function()return cloneref and
        cloneref(d:GetService(c))or d:GetService(c)end)return e and f or error(
        'Unable to retrieve service: '..c)end b.SecureService=newcclosure and
        newcclosure(b.SecureService)or b.SecureService function b.GetPlayer()local c,d=
        pcall(function()return(b.SecureService'Players')end)return c and(d).LocalPlayer
        or nil end function b.GetCharacter(c)local d,e=pcall(function()return c and c.
        Character or nil end)return d and e or nil end function b.GetHumanoid(c)local d,
        e=pcall(function()local d=b.GetCharacter(c)return d and d:FindFirstChildOfClass
        'Humanoid'or nil end)return d and e or nil end return b end function a.b()local
        b=a.load'a'local c,d,e=b.SecureService,{Components={},Assets={DefaultImage=
        'rbxassetid://134552883719543',ShieldCheck='rbxassetid://72905476505849',Shield=
        'rbxassetid://125424227377940',Archive='rbxassetid://86530498402003',Folder=
        'rbxassetid://134156031333431',Bolt='rbxassetid://99791134265440',Globe=
        'rbxassetid://132856339478739',Computer='rbxassetid://136037119434947',Settings=
        'rbxassetid://71732494649961'},Colors={SystemDarkRed=Color3.fromRGB(104,29,29)}}
        ,{folder='Riot',unloaded=false,localPlayer=nil,camera=nil,gui=nil,overlay=nil,
        dropdownFrames={},notifSystem={totalOffset=0,notifications=nil,uIpadding=nil,
        notifInstances={}},tabSystem={tabInstances={},tabIndex=0,currentTab=nil,
        currentContent=nil},KeyMap_Spec={[Enum.UserInputType.MouseButton1]='VK_LBUTTON',
        [Enum.UserInputType.MouseButton2]='VK_RBUTTON',[Enum.UserInputType.MouseButton3]
        ='VK_MBUTTON',[Enum.KeyCode.Return]='VK_RETURN',[Enum.KeyCode.CapsLock]=
        'VK_CAPITAL',[Enum.KeyCode.PageUp]='VK_PRIOR',[Enum.KeyCode.PageDown]='VK_NEXT',
        [Enum.KeyCode.Escape]='VK_ESCAPE',[Enum.KeyCode.Backspace]='VK_BACK',[Enum.
        KeyCode.Space]='VK_SPACE'}}local f={_players=c'Players',_runService=c
        'RunService',_userInputService=c'UserInputService',_tweenService=c'TweenService'
        ,_workspace=c'Workspace'}local g={tween=function(g,h,i)return f._tweenService:
        Create(g,h,i)end,callback=function(g,...)local h={...}task.spawn(function()g(
        table.unpack(h))end)end,parseKeyCode=function(g)if e.KeyMap_Spec[g]then return e
        .KeyMap_Spec[g]end if g.Name then return'VK_'..g.Name:upper()end return
        'VK_UNKNOWN'end,secureGui=function(g)local h=b.ProtectGui(Instance.new
        'ScreenGui')for i,j in pairs(g)do if i~='Parent'then pcall(function()h[i]=j end)
        end end return h end,mouseInFrame=function(g)local h,i,j=f._userInputService:
        GetMouseLocation(),g.AbsolutePosition,g.AbsoluteSize return h.X>=i.X and h.X<=i.
        X+j.X and h.Y>=i.Y and h.Y<=i.Y+j.Y end,makeDraggable=function(g,h)assert(g,
        'Expected a base frame for makeDraggable')h=h or g local i,j,k,l=false local m=
        function(m)local n=m.Position-j g.Position=UDim2.new(k.X.Scale,k.X.Offset+n.X,k.
        Y.Scale,k.Y.Offset+n.Y)end h.InputBegan:Connect(function(n)if n.UserInputType==
        Enum.UserInputType.MouseButton1 or n.UserInputType==Enum.UserInputType.Touch
        then i=true j=n.Position k=g.Position n.Changed:Connect(function()if n.
        UserInputState==Enum.UserInputState.End then i=false end end)end end)h.
        InputChanged:Connect(function(n)if n.UserInputType==Enum.UserInputType.
        MouseMovement or n.UserInputType==Enum.UserInputType.Touch then l=n end end)f.
        _userInputService.InputChanged:Connect(function(n)if i and n==l and g.Visible
        then m(n)end end)end,subParser={None=function(g)return g end,Numeric=function(g)
        return g:gsub('%D','')end,Alphabetic=function(g)return g:gsub('[^a-zA-Z ]','')
        end,Alphanumeric=function(g)return g:gsub('[^a-zA-Z0-9]','')end,FloatNumeric=
        function(g)return g:gsub('[^-%.%d]',''):gsub('^(%-?)0+','%1'):gsub('(%-?)%.',
        '%10.'):gsub('(%..*)%.','%1'):gsub('(%-.)','%1')end,Mathematic=function(g)g=g:
        gsub('[^%d%.%+%-%*/%^%%%(%)]','')local h,i=function(h)local i,j={},''for k in h:
        gmatch'.'do if k:match'[%d%.]'then j=j..k else if j~=''then table.insert(i,j)j=
        ''end table.insert(i,k)end end if j~=''then table.insert(i,j)end return i end,{[
        '+']=1,['-']=1,['*']=2,['/']=2,['%']=2,['^']=3}local j,k=function(j)local k,l={}
        ,{}for m,n in ipairs(j)do if tonumber(n)then table.insert(k,n)elseif n=='('then
        table.insert(l,n)elseif n==')'then while#l>0 and l[#l]~='('do table.insert(k,
        table.remove(l))end table.remove(l)else while#l>0 and i[l[#l] ]and i[l[#l] ]>=i[
        n]do table.insert(k,table.remove(l))end table.insert(l,n)end end while#l>0 do
        table.insert(k,table.remove(l))end return k end,function(j)local k={}for l,m in
        ipairs(j)do if tonumber(m)then table.insert(k,tonumber(m))else local n,o=table.
        remove(k),table.remove(k)if not o or not n then return g end if m=='+'then table
        .insert(k,o+n)elseif m=='-'then table.insert(k,o-n)elseif m=='*'then table.
        insert(k,o*n)elseif m=='/'then table.insert(k,o/n)elseif m=='%'then table.
        insert(k,o%n)elseif m=='^'then table.insert(k,o^n)end end end return tostring(k[
        1]or g)end return k(j(h(g)))end}}function CreateSection(h,i,j)local k,l={
        Settings=i},Instance.new'Frame'l.Name='Section'l.AutomaticSize=Enum.
        AutomaticSize.Y l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
        BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
        l.Size=UDim2.fromScale(1,0)local m=Instance.new'TextButton'm.Name='Leading'm.
        AutoButtonColor=false m.AutomaticSize=Enum.AutomaticSize.Y m.BackgroundColor3=
        Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.BorderColor3=Color3.
        fromRGB(0,0,0)m.BorderSizePixel=0 m.LayoutOrder=-1 m.Selectable=false m.Size=
        UDim2.fromScale(1,0)m.Text=''local n=Instance.new'TextLabel'n.Name='Name'n.
        AutomaticSize=Enum.AutomaticSize.XY n.BackgroundColor3=Color3.fromRGB(255,255,
        255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.
        BorderSizePixel=0 n.FontFace=Font.new('rbxassetid://16658237174',Enum.FontWeight
        .Bold,Enum.FontStyle.Normal)n.LayoutOrder=1 n.Position=UDim2.fromOffset(28,0)n.
        RichText=true n.TextColor3=Color3.fromRGB(225,225,225)n.TextSize=20 n.
        TextWrapped=true n.TextXAlignment=Enum.TextXAlignment.Left n.Parent=m local o=
        Instance.new'ImageButton'o.Name='Chevron'o.AnchorPoint=Vector2.new(0,0.5)o.
        AutoButtonColor=false o.BackgroundColor3=Color3.fromRGB(30,34,47)o.
        BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0
        o.Image='rbxassetid://77136690433593'o.LayoutOrder=1 o.Position=UDim2.fromScale(
        0,0.5)o.Selectable=false o.Active=false o.Interactable=false o.Size=UDim2.
        fromOffset(18,18)o.Parent=m m.Parent=l local p=Instance.new'Frame'p.Name=
        'Trailing'p.BackgroundColor3=Color3.fromRGB(255,255,255)p.BackgroundTransparency
        =1 p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.ClipsDescendants=
        true p.Size=UDim2.fromScale(1,0)local q=Instance.new'UIListLayout'q.Name=
        'UIListLayout'q.Padding=UDim.new(0,10)q.SortOrder=Enum.SortOrder.LayoutOrder q.
        Parent=p local r=Instance.new'UIPadding'r.Name='UIPadding'r.PaddingLeft=UDim.
        new(0,12)r.Parent=p local s=Instance.new'Folder's.Name='Folder'local t=Instance.
        new'Frame't.Name='Frame't.AnchorPoint=Vector2.new(0,1)t.BackgroundColor3=Color3.
        fromRGB(30,30,30)t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.
        Position=UDim2.new(0,-12,1,0)t.Size=UDim2.new(0,1,1,0)t.Parent=s s.Parent=p p.
        Parent=l local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.Padding=UDim.
        new(0,10)u.SortOrder=Enum.SortOrder.LayoutOrder u.Parent=l local v=Instance.new
        'UIPadding'v.Name='UIPadding'v.PaddingBottom=UDim.new(0,8)v.PaddingTop=UDim.new(
        0,8)v.Parent=l l.Parent=h local w=function(w)if w then local x,y={},0 for z,A in
        pairs(p:GetChildren())do if A:IsA'GuiObject'and A.Visible then table.insert(x,A)
        y+=A.AbsoluteSize.Y end end if#x>1 then y+=(#x-1)*q.Padding.Offset end g.tween(p
        ,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size=UDim2.new(1,0,0,y)}):Play()g.
        tween(o,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Rotation=-180}):Play()else g.
        tween(p,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size=UDim2.new(1,0,0,0)}):
        Play()g.tween(o,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Rotation=0}):Play()
        end end m.MouseButton1Click:Connect(function()k.Settings.Opened=not k.Settings.
        Opened w(k.Settings.Opened)end)local x=function(x)if not x:IsA'GuiObject'then
        return end x:GetPropertyChangedSignal'Visible':Connect(function()if k.Settings.
        Opened then w(true)end end)x:GetPropertyChangedSignal'AbsoluteSize':Connect(
        function()if k.Settings.Opened then w(true)end end)end for y,z in pairs(p:
        GetChildren())do x(z)end p.ChildAdded:Connect(function(y)x(y)if k.Settings.
        Opened then w(true)end end)p.ChildRemoved:Connect(function()if k.Settings.Opened
        then w(true)end end)function k:UpdateSettings(y)if y.Visible~=nil then k.
        Settings.Visible=y.Visible l.Visible=y.Visible end if y.Opened~=nil then k.
        Settings.Opened=y.Opened w(y.Opened)end if y.Name then k.Settings.Name=y.Name n.
        Text=y.Name end end if k.Settings.Closed==nil then k.Settings.Closed=true end k:
        UpdateSettings(k.Settings)if j then d.Components[j]=k end k.Content=p
        injectComponents(k)return k end function CreateButton(h,i,j)local k={Settings=i}
        assert(k.Settings.Name and type(k.Settings.Name)=='string',
        'Missing button name or wrong type')local l=Instance.new'Frame'l.AutomaticSize=
        Enum.AutomaticSize.Y l.BackgroundColor3=k.Settings.Color or Color3.fromRGB(30,30
        ,30)l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0 l.Size=UDim2.new(1,0
        ,0,40)l.Visible=k.Settings.Visible==nil and true or k.Settings.Visible l.Parent=
        h local m=Instance.new'UICorner'm.CornerRadius=UDim.new(0,5)m.Parent=l local n=
        Instance.new'TextButton'n.AutoButtonColor=false n.AutomaticSize=Enum.
        AutomaticSize.Y n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
        BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0
        n.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.
        FontStyle.Normal)n.RichText=true n.Size=UDim2.new(1,0,0,40)n.Text=k.Settings.
        Name n.TextColor3=Color3.fromRGB(156,156,156)n.TextSize=15 n.TextWrapped=true n.
        TextXAlignment=Enum.TextXAlignment.Center local o=Instance.new'UIPadding'o.
        PaddingBottom=UDim.new(0,12)o.PaddingLeft=UDim.new(0,15)o.PaddingRight=UDim.new(
        0,15)o.PaddingTop=UDim.new(0,12)o.Parent=n n.Parent=l function k:UpdateSettings(
        p)if p.Name then k.Settings.Name=p.Name n.Text=p.Name end if p.Color then k.
        Settings.Color=p.Color l.BackgroundColor3=p.Color end if p.Callback then k.
        Settings.Callback=p.Callback end if p.Visible~=nil then k.Settings.Visible=p.
        Visible l.Visible=p.Visible end return k end local p=Instance.new'Frame'p.
        BackgroundColor3=Color3.fromRGB(30,30,30)p.BorderColor3=Color3.fromRGB(0,0,0)p.
        BorderSizePixel=0 p.Size=UDim2.new(1,0,0,1)p.Parent=h function k:Continue()p.
        Visible=false return k end function k:End()p.Visible=true return k end local q=
        function()if k.Settings.Callback then g.callback(k.Settings.Callback)end end n.
        MouseButton1Click:Connect(q)if j then d.Components[j]=k end return k:End()end
        function CreateToggle(h,i,j)local k={Settings=i,Type='Toggle'}assert(k.Settings.
        Name and type(k.Settings.Name)=='string','Missing name or wrong type')local l=
        Instance.new'Frame'l.AutomaticSize=Enum.AutomaticSize.Y l.BackgroundColor3=
        Color3.fromRGB(255,255,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.
        fromRGB(0,0,0)l.BorderSizePixel=0 l.Size=UDim2.fromScale(1,0)l.Parent=h l.
        Visible=k.Settings.Visible==nil and true or k.Settings.Visible local m=Instance.
        new'Frame'm.AutomaticSize=Enum.AutomaticSize.Y m.BackgroundColor3=Color3.
        fromRGB(255,255,255)m.BackgroundTransparency=1 m.BorderColor3=Color3.fromRGB(0,0
        ,0)m.BorderSizePixel=0 m.Size=UDim2.new(1,-50,0,33)local n=Instance.new
        'TextLabel'n.AutomaticSize=Enum.AutomaticSize.XY n.BackgroundColor3=Color3.
        fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0
        ,0)n.BorderSizePixel=0 n.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)n.RichText=true n.TextColor3=Color3.
        fromRGB(225,225,225)n.TextSize=16 n.TextWrapped=true n.TextXAlignment=Enum.
        TextXAlignment.Left n.Parent=m n.Text=k.Settings.Name local o=Instance.new
        'UIListLayout'o.Name='UIListLayout'o.Padding=UDim.new(0,5)o.SortOrder=Enum.
        SortOrder.LayoutOrder o.VerticalAlignment=Enum.VerticalAlignment.Center o.Parent
        =m local p=Instance.new'TextLabel'p.AutomaticSize=Enum.AutomaticSize.XY p.
        BackgroundColor3=Color3.fromRGB(255,255,255)p.BackgroundTransparency=1 p.
        BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)p.
        LayoutOrder=1 p.RichText=true p.Text=k.Settings.Description or''p.TextColor3=
        Color3.fromRGB(80,80,80)p.TextSize=12 p.TextWrapped=true p.TextXAlignment=Enum.
        TextXAlignment.Left p.Parent=m p.Visible=k.Settings.Description and true or
        false m.Parent=l local q=Instance.new'ImageLabel'q.AnchorPoint=Vector2.new(1,0.5
        )q.BackgroundColor3=Color3.fromRGB(37,37,46)q.BackgroundTransparency=1 q.
        BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0 q.Image=
        'rbxassetid://86699956318312'q.ImageColor3=Color3.fromRGB(33,36,45)q.Position=
        UDim2.fromScale(1,0.5)q.Size=UDim2.fromOffset(35,10)local r=Instance.new
        'UIPadding'r.Name='ToggleUIPadding'r.PaddingBottom=UDim.new(0,1)r.PaddingLeft=
        UDim.new(0,-8)r.PaddingTop=UDim.new(0,1)r.Parent=q local s=Instance.new
        'ImageLabel's.AnchorPoint=Vector2.new(1,0.5)s.BackgroundColor3=Color3.fromRGB(30
        ,34,47)s.BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.
        BorderSizePixel=0 s.Image='rbxassetid://83379579183005's.ImageColor3=Color3.
        fromRGB(156,156,156)s.Position=UDim2.fromScale(0.5,0.5)s.Size=UDim2.fromOffset(
        14,14)s.Parent=q q.Parent=l local t=Instance.new'UIPadding't.PaddingBottom=UDim.
        new(0,8)t.PaddingTop=UDim.new(0,8)t.Parent=l local u=Instance.new'TextButton'u.
        AutoButtonColor=false u.BackgroundTransparency=1 u.Size=UDim2.fromScale(1,1)u.
        Text=''u.Parent=l k.Settings.State=k.Settings.State or false local v=function()g
        .tween(s,TweenInfo.new(0.2,Enum.EasingStyle.Exponential),{Position=UDim2.
        fromScale(k.Settings.State and 1 or 0.5,0.5),ImageColor3=k.Settings.State and
        Color3.fromRGB(138,193,227)or Color3.fromRGB(156,156,156)}):Play()if k.Settings.
        Callback then g.callback(k.Settings.Callback,k,k.Settings.State)end end u.
        MouseButton1Click:Connect(function()k.Settings.State=not k.Settings.State v()end
        )function k:UpdateSettings(w)if w.Name then k.Settings.Name=w.Name n.Text=w.Name
        end if w.Description~=nil then k.Settings.Description=w.Description p.Text=w.
        Description or''p.Visible=w.Description and true or false end if w.State~=nil
        then k.Settings.State=w.State v()end if w.Callback then k.Settings.Callback=w.
        Callback end if w.Visible~=nil then k.Settings.Visible=w.Visible l.Visible=w.
        Visible end end local w=Instance.new'Frame'w.BackgroundColor3=Color3.fromRGB(30,
        30,30)w.BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=0 w.Size=UDim2.new(1
        ,0,0,1)w.Parent=h function k:Continue()w.Visible=false return k end function k:
        End()w.Visible=true return k end v()if j then d.Components[j]=k end k.Content=h
        injectComponents(k,'Colorpicker')return k:End()end function CreateSlider(h,i,j)
        local k={Settings=i,Type='Slider'}assert(k.Settings.Name and type(k.Settings.
        Name)=='string','Missing name or wrong type')assert(k.Settings.Value and type(k.
        Settings.Value)=='number','Missing value or wrong type')assert(k.Settings.
        Minimum and type(k.Settings.Minimum)=='number','Missing minimum or wrong type')
        assert(k.Settings.Maximum and type(k.Settings.Maximum)=='number',
        'Missing maximum or wrong type')assert(k.Settings.Minimum<=k.Settings.Maximum,
        'Minimum should be less than Maximum')assert(k.Settings.Maximum>=k.Settings.
        Minimum,'Maximum should be greater than Minimum')local l=Instance.new'Frame'l.
        AutomaticSize=Enum.AutomaticSize.Y l.BackgroundColor3=Color3.fromRGB(255,255,255
        )l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.
        BorderSizePixel=0 l.Size=UDim2.fromScale(1,0)l.Visible=k.Settings.Visible==nil
        and true or k.Settings.Visible l.Parent=h local m=Instance.new'UIPadding'm.
        PaddingBottom=UDim.new(0,8)m.PaddingTop=UDim.new(0,8)m.Parent=l local n=Instance
        .new'Frame'n.AutomaticSize=Enum.AutomaticSize.Y n.BackgroundColor3=Color3.
        fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0
        ,0)n.BorderSizePixel=0 n.Size=UDim2.fromScale(1,0)local o=Instance.new'Frame'o.
        AnchorPoint=Vector2.new(1,0.5)o.AutomaticSize=Enum.AutomaticSize.XY o.
        BackgroundColor3=Color3.fromRGB(255,255,255)o.BackgroundTransparency=1 o.
        BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.LayoutOrder=1 o.Position
        =UDim2.fromScale(1,0.5)local p=Instance.new'ImageLabel'p.AnchorPoint=Vector2.
        new(1,0.5)p.BackgroundColor3=Color3.fromRGB(30,34,47)p.BackgroundTransparency=1
        p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.Image=
        'rbxassetid://82545477110166'p.ImageColor3=Color3.fromRGB(150,150,150)p.Position
        =UDim2.fromScale(1,0.5)p.Size=UDim2.fromOffset(20,20)p.Parent=o local q=Instance
        .new'UIListLayout'q.FillDirection=Enum.FillDirection.Horizontal q.
        HorizontalAlignment=Enum.HorizontalAlignment.Right q.Padding=UDim.new(0,6)q.
        SortOrder=Enum.SortOrder.LayoutOrder q.VerticalAlignment=Enum.VerticalAlignment.
        Center q.Parent=o local r=Instance.new'TextLabel'r.AnchorPoint=Vector2.new(0,0.5
        )r.AutomaticSize=Enum.AutomaticSize.XY r.BackgroundColor3=Color3.fromRGB(255,255
        ,255)r.BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.
        BorderSizePixel=0 r.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
        .SemiBold,Enum.FontStyle.Normal)r.LayoutOrder=1 r.Position=UDim2.fromScale(0,0.5
        )r.RichText=true r.Text='0'r.TextColor3=Color3.fromRGB(150,150,150)r.TextSize=16
        r.TextWrapped=true r.TextXAlignment=Enum.TextXAlignment.Left r.Parent=o o.Parent
        =n local s=Instance.new'Frame's.AutomaticSize=Enum.AutomaticSize.Y s.
        BackgroundColor3=Color3.fromRGB(255,255,255)s.BackgroundTransparency=1 s.
        BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.Size=UDim2.new(1,-80,0,0
        )local t=Instance.new'TextLabel't.AutomaticSize=Enum.AutomaticSize.XY t.
        BackgroundColor3=Color3.fromRGB(255,255,255)t.BackgroundTransparency=1 t.
        BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)t.
        RichText=true t.Text=k.Settings.Name t.TextColor3=Color3.fromRGB(225,225,225)t.
        TextSize=16 t.TextWrapped=true t.TextXAlignment=Enum.TextXAlignment.Left t.
        Parent=s local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.Padding=UDim.
        new(0,5)u.SortOrder=Enum.SortOrder.LayoutOrder u.VerticalAlignment=Enum.
        VerticalAlignment.Center u.Parent=s local v=Instance.new'TextLabel'v.
        AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=Color3.fromRGB(255,255,
        255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0,0)v.
        BorderSizePixel=0 v.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
        .SemiBold,Enum.FontStyle.Normal)v.LayoutOrder=1 v.RichText=true v.Text=k.
        Settings.Description or''v.TextColor3=Color3.fromRGB(80,80,80)v.TextSize=12 v.
        TextWrapped=true v.TextXAlignment=Enum.TextXAlignment.Left v.Parent=s v.Visible=
        k.Settings.Description and true or false s.Parent=n local w=Instance.new
        'UIListLayout'w.Name='UIListLayout'w.FillDirection=Enum.FillDirection.Horizontal
        w.HorizontalAlignment=Enum.HorizontalAlignment.Center w.HorizontalFlex=Enum.
        UIFlexAlignment.Fill w.Padding=UDim.new(0,5)w.SortOrder=Enum.SortOrder.
        LayoutOrder w.VerticalAlignment=Enum.VerticalAlignment.Center w.Parent=n n.
        Parent=l local x=Instance.new'UIListLayout'x.Name='UIListLayout'x.Padding=UDim.
        new(0,15)x.SortOrder=Enum.SortOrder.LayoutOrder x.Parent=l local y=Instance.new
        'TextButton'y.BackgroundColor3=Color3.fromRGB(37,37,46)y.BorderColor3=Color3.
        fromRGB(0,0,0)y.BorderSizePixel=0 y.Size=UDim2.new(1,0,0,10)y.Text=''y.
        AutoButtonColor=false y.LayoutOrder=1 local z=Instance.new'UICorner'z.Name=
        'UICorner'z.CornerRadius=UDim.new(0,15)z.Parent=y local A=Instance.new'Frame'A.
        BackgroundColor3=Color3.fromRGB(138,193,227)A.BorderColor3=Color3.fromRGB(0,0,0)
        A.BorderSizePixel=0 A.Size=UDim2.new(0,0,0,10)local B=Instance.new'UICorner'B.
        Name='UICorner'B.CornerRadius=UDim.new(0,15)B.Parent=A local C=Instance.new
        'ImageLabel'C.AnchorPoint=Vector2.new(0.5,0.5)C.BackgroundColor3=Color3.fromRGB(
        255,255,255)C.BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.
        BorderSizePixel=0 C.Image='rbxassetid://127947626656649'C.ImageColor3=Color3.
        fromRGB(20,20,20)C.Position=UDim2.fromScale(1,0.5)C.Size=UDim2.fromOffset(26,20)
        C.ZIndex=2 local D=Instance.new'ImageLabel'D.AnchorPoint=Vector2.new(0.5,0.5)D.
        BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=1 D.
        BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Image=
        'rbxassetid://98639906538385'D.ImageColor3=Color3.fromRGB(225,225,225)D.Position
        =UDim2.fromScale(0.5,0.5)D.Size=UDim2.fromOffset(18,18)D.Parent=C C.Parent=y A.
        Parent=y y.Parent=l local E=function()local E,F,G=10,10,y.AbsoluteSize.X local H
        ,I,J=G-(E+F),k.Settings.Minimum,k.Settings.Maximum local K=k.Settings.Value or(I
        +J)/2 local L,M=(K-I)/(J-I),C.AbsoluteSize.X/2 A.Size=UDim2.new(0,H*L,0,10)C.
        Position=UDim2.new(0,E+(H*L),0.5,0)local N=tonumber(string.format('%.'..(k.
        Settings.Precision or 0)..'f',K))local O=k.Settings.Filter and k.Settings.
        Filter(N,I,J)r.Text=O or N end local F,G=function(F)local G,H,I,J=10,10,F.
        Position.X,D.AbsoluteSize.X/2 local K,L,M=I-(J*0.5),y.AbsolutePosition.X+G,y.
        AbsoluteSize.X-(G+H)K=math.clamp(K-L,0,M)local N=K/M N=k.Settings.Minimum+N*(k.
        Settings.Maximum-k.Settings.Minimum)local O=k.Settings.Step or 0 k.Settings.
        Value=O>0 and math.round(N/O)*O or N E()if k.Settings.Callback then g.callback(k
        .Settings.Callback,k,k.Settings.Value)end end,false local H=function(H)if H.
        UserInputType==Enum.UserInputType.MouseButton1 then G=true F(H)if k.Settings.
        inputChanged then g.callback(k.Settings.inputChanged,k,k.Settings.Value,G)end
        end end y.InputBegan:Connect(H)y.InputEnded:Connect(function(I)if I.
        UserInputType==Enum.UserInputType.MouseButton1 then G=false if k.Settings.
        inputChanged then g.callback(k.Settings.inputChanged,k,k.Settings.Value,G)end
        end end)y:GetPropertyChangedSignal'AbsoluteSize':Connect(E)E()f.
        _userInputService.InputChanged:Connect(function(I)if G and I.UserInputType==Enum
        .UserInputType.MouseMovement then F(I)end end)function k:UpdateSettings(I)if I.
        Visible~=nil then k.Settings.Visible=I.Visible l.Visible=I.Visible end if I.Name
        then k.Settings.Name=I.Name t.Text=I.Name end if I.Description~=nil then k.
        Settings.Description=I.Description v.Text=I.Description or''v.Visible=I.
        Description and true or false end if I.Minimum then k.Settings.Minimum=I.Minimum
        end if I.Maximum then k.Settings.Maximum=I.Maximum end if I.Step~=nil then k.
        Settings.Step=I.Step end if I.Precision~=nil then k.Settings.Precision=I.
        Precision end if I.Filter then k.Settings.Filter=I.Filter end if I.Callback then
        k.Settings.Callback=I.Callback end if I.inputChanged then k.Settings.
        inputChanged=I.inputChanged end if I.Value then local J,K=k.Settings.Minimum,k.
        Settings.Maximum local L,M=math.clamp(I.Value,J,K),k.Settings.Step or 0 if M>0
        then L=math.round(L/M)*M end k.Settings.Value=L task.defer(function()if y.
        AbsoluteSize.X==0 then y:GetPropertyChangedSignal'AbsoluteSize':Wait()end E()if
        k.Settings.Callback then g.callback(k.Settings.Callback,k,k.Settings.Value)end
        end)end end local I=Instance.new'Frame'I.BackgroundColor3=Color3.fromRGB(30,30,
        30)I.BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.Size=UDim2.new(1,0,
        0,1)I.Parent=h function k:Continue()I.Visible=false return k end function k:End(
        )I.Visible=true return k end k:UpdateSettings(k.Settings)if j then d.Components[
        j]=k end return k:End()end function CreateInput(h,i,j)local k,l={Settings=i,Type
        ='Input'},Instance.new'Frame'l.BackgroundColor3=Color3.fromRGB(30,30,30)l.
        BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0 l.Size=UDim2.new(1,0,0,40)
        l.Visible=k.Settings.Visible==nil and true or k.Settings.Visible l.Parent=h
        local m=Instance.new'UICorner'm.CornerRadius=UDim.new(0,5)m.Parent=l local n=
        Instance.new'UIListLayout'n.FillDirection=Enum.FillDirection.Horizontal n.
        Padding=UDim.new(0,15)n.SortOrder=Enum.SortOrder.LayoutOrder n.VerticalAlignment
        =Enum.VerticalAlignment.Center n.Parent=l local o=Instance.new'UIPadding'o.
        PaddingLeft=UDim.new(0,15)o.Parent=l local p=Instance.new'TextBox'p.AnchorPoint=
        Vector2.new(0,0.5)p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
        BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0
        p.ClearTextOnFocus=false p.ClipsDescendants=true p.CursorPosition=-1 p.FontFace=
        Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
        Normal)p.LayoutOrder=1 p.PlaceholderColor3=Color3.fromRGB(120,120,120)p.
        PlaceholderText=k.Settings.Placeholder or'...'p.Size=UDim2.new(1,-50,1,0)p.Text=
        k.Settings.Text or''p.TextColor3=Color3.fromRGB(156,156,156)p.TextSize=15 p.
        TextXAlignment=Enum.TextXAlignment.Left p.Parent=l local q=Instance.new
        'ImageLabel'q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
        BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0
        q.Image='rbxassetid://98129527229953'q.ImageColor3=Color3.fromRGB(156,156,156)q.
        Size=UDim2.fromOffset(20,20)q.Parent=l p.FocusLost:Connect(function()if k.
        Settings.CharacterSub=='Mathematic'then p.Text=g.subParser[k.Settings.
        CharacterSub](p.Text)end if k.Settings.Callback then g.callback(k.Settings.
        Callback,k,p.Text)end end)p:GetPropertyChangedSignal'Text':Connect(function()if
        k.Settings.CharacterSub and k.Settings.CharacterSub~='Mathematic'and g.subParser
        [k.Settings.CharacterSub]then p.Text=g.subParser[k.Settings.CharacterSub](p.Text
        )elseif type(k.Settings.CharacterSub)=='function'then p.Text=k.Settings.
        CharacterSub(p.Text)end if k.Settings.CharacterLimit then if string.len(p.Text)>
        k.Settings.CharacterLimit then p.Text=string.sub(p.Text,1,k.Settings.
        CharacterLimit)end end k.Settings.Text=p.Text if k.Settings.onTextChanged then g
        .callback(k.Settings.onTextChanged,k,p.Text)end end)function k:UpdateSettings(r)
        if r.Text then k.Settings.Text=r.Text p.Text=r.Text if k.Settings.Callback then
        g.callback(k.Settings.Callback,k,p.Text)end end if r.Placeholder then k.Settings
        .Placeholder=r.Placeholder p.PlaceholderText=r.Placeholder end if r.Callback
        then k.Settings.Callback=r.Callback end if r.onTextChanged then k.Settings.
        onTextChanged=r.onTextChanged end if r.Visible~=nil then k.Settings.Visible=r.
        Visible l.Visible=r.Visible end end local r=Instance.new'Frame'r.
        BackgroundColor3=Color3.fromRGB(30,30,30)r.BorderColor3=Color3.fromRGB(0,0,0)r.
        BorderSizePixel=0 r.Size=UDim2.new(1,0,0,1)r.Parent=h function k:Continue()r.
        Visible=false return k end function k:End()r.Visible=true return k end k:
        UpdateSettings(k.Settings)if j then d.Components[j]=k end return k:End()end
        function CreateMultiInput(h,i,j)local k,l={Settings=i,Type='MultiInput'},
        Instance.new'Frame'l.BackgroundColor3=Color3.fromRGB(30,30,30)l.
        BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
        l.Size=UDim2.new(1,0,0,40)l.Parent=h local m=Instance.new'UIListLayout'm.
        FillDirection=Enum.FillDirection.Horizontal m.HorizontalFlex=Enum.
        UIFlexAlignment.Fill m.Padding=UDim.new(0,5)m.SortOrder=Enum.SortOrder.
        LayoutOrder m.VerticalAlignment=Enum.VerticalAlignment.Center m.Parent=l local n
        ={}for o,p in ipairs(k.Settings.Inputs)do local q=Instance.new'TextBox'q.
        BackgroundColor3=Color3.fromRGB(30,30,30)q.BorderColor3=Color3.fromRGB(0,0,0)q.
        BorderSizePixel=0 q.ClearTextOnFocus=false q.ClipsDescendants=true q.FontFace=
        Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
        Normal)q.LayoutOrder=1 q.PlaceholderColor3=Color3.fromRGB(120,120,120)q.
        PlaceholderText=p.Placeholder or'...'q.Size=UDim2.fromScale(1,1)q.Text=p.Text or
        ''q.TextColor3=Color3.fromRGB(156,156,156)q.TextSize=15 q.TextXAlignment=Enum.
        TextXAlignment.Left q.Parent=l n[o]={inputBox=q}local r=Instance.new'UIPadding'r
        .PaddingLeft=UDim.new(0,10)r.PaddingRight=UDim.new(0,10)r.Parent=q local s=
        Instance.new'UICorner's.CornerRadius=UDim.new(0,5)s.Parent=q local t=p.
        CharacterSub or'None'q.FocusLost:Connect(function()if k.Settings.Callback then g
        .callback(k.Settings.Callback,k,o,q.Text)end end)q:GetPropertyChangedSignal
        'Text':Connect(function()if t and type(t)=='string'and g.subParser[t]then q.Text
        =g.subParser[t](q.Text)elseif t and type(t)=='function'then q.Text=p.
        CharacterSub(q.Text)end if p.CharacterLimit then if string.len(q.Text)>p.
        CharacterLimit then q.Text=string.sub(q.Text,1,p.CharacterLimit)end end p.Text=q
        .Text if k.Settings.onTextChanged then g.callback(k.Settings.onTextChanged,k,o,q
        .Text)end end)end function k:UpdateSettings(o,p)local q,r=k.Settings.Inputs[o],n
        [o]if q and r then if p.Text~=nil then q.Text=p.Text r.inputBox.Text=p.Text if k
        .Settings.Callback then g.callback(k.Settings.Callback,k,o,p.Text)end end if p.
        Placeholder~=nil then q.Placeholder=p.Placeholder r.inputBox.PlaceholderText=p.
        Placeholder end end if p.Callback~=nil then k.Settings.Callback=p.Callback end
        if p.onTextChanged~=nil then k.Settings.onTextChanged=p.onTextChanged end if p.
        Visible~=nil then k.Settings.Visible=p.Visible l.Visible=p.Visible end end local
        o=Instance.new'Frame'o.BackgroundColor3=Color3.fromRGB(30,30,30)o.BorderColor3=
        Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.Size=UDim2.new(1,0,0,1)o.Parent=h
        function k:Continue()o.Visible=false return k end function k:End()o.Visible=true
        return k end for p,q in pairs(k.Settings.Inputs)do k:UpdateSettings(p,q)end if j
        then d.Components[j]=k end return k:End()end function CreateDropdown(h,i,j)local
        k={Settings=i,Type='Dropdown'}assert(k.Settings.Name and type(k.Settings.Name)==
        'string','Missing name or wrong type')local l=Instance.new'Frame'l.AutomaticSize
        =Enum.AutomaticSize.Y l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
        BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
        l.Size=UDim2.fromScale(1,0)l.Parent=h local m=Instance.new'UIPadding'm.
        PaddingBottom=UDim.new(0,8)m.PaddingTop=UDim.new(0,8)m.Parent=l local n=Instance
        .new'UIListLayout'n.Padding=UDim.new(0,15)n.SortOrder=Enum.SortOrder.LayoutOrder
        n.Parent=l local o=Instance.new'TextButton'o.AutoButtonColor=false o.
        AutomaticSize=Enum.AutomaticSize.Y o.BackgroundColor3=Color3.fromRGB(30,30,30)o.
        BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.ClipsDescendants=true o.
        FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Bold,Enum.FontStyle
        .Normal)o.LayoutOrder=1 o.Position=UDim2.fromScale(0,0.16)o.Size=UDim2.new(1,0,0
        ,40)o.Text=''o.TextColor3=Color3.fromRGB(156,156,156)o.TextSize=15 o.
        TextXAlignment=Enum.TextXAlignment.Left o.TextYAlignment=Enum.TextYAlignment.Top
        local p=Instance.new'UIPadding'p.PaddingBottom=UDim.new(0,10)p.PaddingLeft=UDim.
        new(0,15)p.PaddingRight=UDim.new(0,15)p.PaddingTop=UDim.new(0,10)p.Parent=o
        local q=Instance.new'UICorner'q.CornerRadius=UDim.new(0,5)q.Parent=o local r=
        Instance.new'Frame'r.AutomaticSize=Enum.AutomaticSize.Y r.BackgroundColor3=
        Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.BorderColor3=Color3.
        fromRGB(0,0,0)r.BorderSizePixel=0 r.Size=UDim2.fromScale(1,0)local s=Instance.
        new'ImageLabel's.AnchorPoint=Vector2.new(1,0.5)s.BackgroundColor3=Color3.
        fromRGB(30,34,47)s.BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)
        s.BorderSizePixel=0 s.Image='rbxassetid://77136690433593's.ImageColor3=Color3.
        fromRGB(150,150,150)s.LayoutOrder=1 s.Position=UDim2.fromScale(1,0.5)s.Size=
        UDim2.fromOffset(18,18)s.Parent=r local t=Instance.new'TextLabel't.AutomaticSize
        =Enum.AutomaticSize.Y t.BackgroundColor3=Color3.fromRGB(255,255,255)t.
        BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0
        t.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.
        FontStyle.Normal)t.RichText=true t.Size=UDim2.new(1,-35,0,20)t.Text='...'t.
        TextColor3=Color3.fromRGB(156,156,156)t.TextSize=15 t.TextWrapped=true t.
        TextXAlignment=Enum.TextXAlignment.Left t.Parent=r r.Parent=o o.Parent=l local u
        =Instance.new'Frame'u.AutomaticSize=Enum.AutomaticSize.Y u.BackgroundColor3=
        Color3.fromRGB(255,255,255)u.BackgroundTransparency=1 u.BorderColor3=Color3.
        fromRGB(0,0,0)u.BorderSizePixel=0 u.Size=UDim2.new(1,0,0,33)local v=Instance.new
        'TextLabel'v.AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=Color3.
        fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0
        ,0)v.BorderSizePixel=0 v.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)v.RichText=true v.Text='Name'v.
        TextColor3=Color3.fromRGB(225,225,225)v.TextSize=16 v.TextWrapped=true v.
        TextXAlignment=Enum.TextXAlignment.Left v.Parent=u local w=Instance.new
        'UIListLayout'w.Padding=UDim.new(0,5)w.SortOrder=Enum.SortOrder.LayoutOrder w.
        VerticalAlignment=Enum.VerticalAlignment.Center w.Parent=u local x=Instance.new
        'TextLabel'x.AutomaticSize=Enum.AutomaticSize.XY x.BackgroundColor3=Color3.
        fromRGB(255,255,255)x.BackgroundTransparency=1 x.BorderColor3=Color3.fromRGB(0,0
        ,0)x.BorderSizePixel=0 x.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)x.LayoutOrder=1 x.RichText=true x.Text
        ='description'x.TextColor3=Color3.fromRGB(80,80,80)x.TextSize=12 x.TextWrapped=
        true x.TextXAlignment=Enum.TextXAlignment.Left x.Parent=u x.Visible=k.Settings.
        Description and true or false u.Parent=l local y=Instance.new'Frame'y.Name=
        'dropdownFrame'y.BackgroundColor3=Color3.fromRGB(30,30,30)y.BorderColor3=Color3.
        fromRGB(0,0,0)y.BorderSizePixel=0 y.Size=UDim2.fromOffset(350,150)local z=
        Instance.new'ScrollingFrame'z.Name='dropdownContent'z.Active=true z.
        AutomaticCanvasSize=Enum.AutomaticSize.Y z.BackgroundColor3=Color3.fromRGB(30,30
        ,30)z.BackgroundTransparency=1 z.BorderColor3=Color3.fromRGB(0,0,0)z.
        BorderSizePixel=0 z.CanvasSize=UDim2.new()z.ScrollBarImageTransparency=0.7 z.
        ScrollBarThickness=3 z.Size=UDim2.fromScale(1,1)local A=Instance.new
        'UIListLayout'A.Name='UIListLayout'A.SortOrder=Enum.SortOrder.LayoutOrder A.
        Parent=z local B=Instance.new'UIPadding'B.Name='UIPadding'B.PaddingRight=UDim.
        new(0,15)B.Parent=z z.Parent=y local C=Instance.new'UIPadding'C.Name='UIPadding'
        C.PaddingBottom=UDim.new(0,10)C.PaddingLeft=UDim.new(0,15)C.PaddingTop=UDim.new(
        0,3)C.Parent=y local D=Instance.new'UICorner'D.Name='UICorner'D.CornerRadius=
        UDim.new(0,5)D.Parent=y local E,F,G,H,I,J=false,false,false,{},{},{Selected=
        Color3.fromRGB(225,225,225),Unselected=Color3.fromRGB(156,156,156)}table.insert(
        e.dropdownFrames,y)local K=function(K)local L,M='...',{}for N,O in ipairs(H)do
        local P=I[O].Text table.insert(M,P)end if#M==1 then L=M[1]elseif#M>1 then L=
        table.concat(M,', ')end t.Text=L k.Settings.Value=M if K and k.Settings.Callback
        then g.callback(k.Settings.Callback,k,M)end end local L=function(L)local M,N=k.
        Settings.Limit,k.Settings.Minimum or 0 if table.find(H,L)then if#H-1<N then
        return end table.remove(H,table.find(H,L))g.tween(I[L],TweenInfo.new(0.1,Enum.
        EasingStyle.Sine),{TextColor3=J.Unselected}):Play()else if M and#H>=M then local
        O=table.remove(H,1)g.tween(I[O],TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
        TextColor3=J.Unselected}):Play()end table.insert(H,L)g.tween(I[L],TweenInfo.new(
        0.1,Enum.EasingStyle.Sine),{TextColor3=J.Selected}):Play()end K(true)end local M
        ,N=function(M)for N,O in ipairs(M)do local P=Instance.new'TextButton'P.Name=
        'Button'P.AutoButtonColor=false P.AutomaticSize=Enum.AutomaticSize.Y P.
        BackgroundTransparency=1 P.BorderSizePixel=0 P.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)P.
        RichText=true P.Size=UDim2.fromScale(1,0)P.Text=O P.TextColor3=Color3.fromRGB(
        156,156,156)P.TextSize=15 P.TextWrapped=true P.TextXAlignment=Enum.
        TextXAlignment.Left P.Parent=z P.LayoutOrder=N local Q=Instance.new'UIPadding'Q.
        Name='UIPadding'Q.PaddingBottom=UDim.new(0,15)Q.PaddingTop=UDim.new(0,15)Q.
        Parent=P P.MouseButton1Click:Connect(function()L(O)end)I[O]=P end end,function()
        y.Position=UDim2.new(0,o.AbsolutePosition.X,0,o.AbsolutePosition.Y+(o.
        AbsoluteSize.Y*2)+25)end local O=function()if G then return end G=true if F then
        g.tween(s,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=0}):Play()local O=g
        .tween(y,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(o.
        AbsoluteSize.X,0)})O:Play()O.Completed:Wait()y.Parent=nil F=false else g.tween(s
        ,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=180}):Play()for O,P in
        pairs(e.dropdownFrames)do if P==y then P.Size=UDim2.fromOffset(o.AbsoluteSize.X,
        0)P.Parent=e.gui g.tween(P,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.
        fromOffset(o.AbsoluteSize.X,150)}):Play()N()else local Q=g.tween(P,TweenInfo.
        new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(o.AbsoluteSize.X,0)})Q.
        Completed:Connect(function()P.Parent=nil end)Q:Play()end end F=true end G=false
        end o.MouseButton1Click:Connect(O)o:GetPropertyChangedSignal'AbsolutePosition':
        Connect(N)o:GetPropertyChangedSignal'AbsoluteSize':Connect(N)y.MouseEnter:
        Connect(function()E=true end)y.MouseLeave:Connect(function()E=false end)f.
        _userInputService.InputBegan:Connect(function(P)if P.UserInputType==Enum.
        UserInputType.MouseButton1 and not E and y.Parent then O()end end)function k:
        Insert(P)M(P)end function k:Remove(P)for Q,R in ipairs(P)do for S=#k.Settings.
        Options,1,-1 do if k.Settings.Options[S]==R then table.remove(k.Settings.Options
        ,S)end end if I[R]then I[R]:Destroy()I[R]=nil end for S=#H,1,-1 do if H[S]==R
        then table.remove(H,S)end end K()end end function k:UpdateSettings(P)if P.
        Visible~=nil then l=P.Visible end if P.Name then k.Settings.Name=P.Name v.Text=P
        .Name end if P.Description~=nil then k.Settings.Description=P.Description x.Text
        =P.Description or''x.Visible=P.Description and true or false end if P.Limit~=nil
        then k.Settings.Limit=P.Limit end if P.Minimum then k.Settings.Minimum=P.Minimum
        end if P.Callback then k.Settings.Callback=P.Callback end if P.Options then k.
        Settings.Options=P.Options for Q,R in pairs(I)do R:Destroy()end I={}M(P.Options)
        end if P.Value~=nil then if type(P.Value)=='string'then L(P.Value)elseif type(P.
        Value)=='table'then for Q,R in pairs(P.Value)do L(R)end end end end local P=
        Instance.new'Frame'P.BackgroundColor3=Color3.fromRGB(30,30,30)P.BorderColor3=
        Color3.fromRGB(0,0,0)P.BorderSizePixel=0 P.Size=UDim2.new(1,0,0,1)P.Parent=h
        function k:Continue()P.Visible=false return k end function k:End()P.Visible=true
        return k end k:UpdateSettings(k.Settings)if j then d.Components[j]=k end return
        k:End()end function CreateColorpicker(h,i,j)local k,l={Settings=i,Type=
        'Colorpicker'},Instance.new'Frame'l.Name='Colorpicker'l.AutomaticSize=Enum.
        AutomaticSize.Y l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
        BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
        l.Size=UDim2.fromScale(1,0)local o=Instance.new'UIPadding'o.Name='UIPadding'o.
        PaddingBottom=UDim.new(0,8)o.PaddingTop=UDim.new(0,8)o.Parent=l local r=Instance
        .new'Frame'r.Name='ElementInfo'r.AutomaticSize=Enum.AutomaticSize.Y r.
        BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
        BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.Size=UDim2.fromScale(1,0
        )local s=Instance.new'Frame's.Name='Info's.AutomaticSize=Enum.AutomaticSize.Y s.
        BackgroundColor3=Color3.fromRGB(255,255,255)s.BackgroundTransparency=1 s.
        BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.Size=UDim2.new(1,-80,0,0
        )local t=Instance.new'TextLabel't.Name='Name't.AutomaticSize=Enum.AutomaticSize.
        XY t.BackgroundColor3=Color3.fromRGB(255,255,255)t.BackgroundTransparency=1 t.
        BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)t.
        RichText=true t.Text='Name't.TextColor3=Color3.fromRGB(225,225,225)t.TextSize=16
        t.TextWrapped=true t.TextXAlignment=Enum.TextXAlignment.Left t.Parent=s t.
        Visible=false local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.Padding=
        UDim.new(0,5)u.SortOrder=Enum.SortOrder.LayoutOrder u.VerticalAlignment=Enum.
        VerticalAlignment.Center u.Parent=s local v=Instance.new'TextLabel'v.Name=
        'Description'v.AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=Color3.
        fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0
        ,0)v.BorderSizePixel=0 v.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)v.LayoutOrder=1 v.RichText=true v.Text
        ='Description'v.TextColor3=Color3.fromRGB(80,80,80)v.TextSize=12 v.TextWrapped=
        true v.TextXAlignment=Enum.TextXAlignment.Left v.Parent=s v.Visible=false s.
        Parent=r r.Parent=l local w=Instance.new'UIListLayout'w.Name='UIListLayout'w.
        Padding=UDim.new(0,15)w.SortOrder=Enum.SortOrder.LayoutOrder w.Parent=l local x=
        Instance.new'Frame'x.Name='PickerColors'x.AutomaticSize=Enum.AutomaticSize.Y x.
        BackgroundColor3=Color3.fromRGB(255,255,255)x.BackgroundTransparency=1 x.
        BorderColor3=Color3.fromRGB(0,0,0)x.BorderSizePixel=0 x.LayoutOrder=1 x.Size=
        UDim2.fromScale(1,0)local y=Instance.new'Frame'y.Name='SuggestedColors'y.
        AutomaticSize=Enum.AutomaticSize.Y y.BackgroundColor3=Color3.fromRGB(255,255,255
        )y.BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0,0)y.
        BorderSizePixel=0 y.Size=UDim2.fromScale(0.7,0)local z=Instance.new
        'UIListLayout'z.Name='UIListLayout'z.FillDirection=Enum.FillDirection.Horizontal
        z.Padding=UDim.new(0,8)z.SortOrder=Enum.SortOrder.LayoutOrder z.Parent=y y.
        Parent=x local A=Instance.new'Frame'A.Name='CustomColor'A.AnchorPoint=Vector2.
        new(1,0)A.AutomaticSize=Enum.AutomaticSize.Y A.BackgroundColor3=Color3.fromRGB(
        255,255,255)A.BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.
        BorderSizePixel=0 A.Position=UDim2.fromScale(1,0)A.Size=UDim2.fromScale(0.3,0)
        local B=Instance.new'UIListLayout'B.Name='UIListLayout'B.FillDirection=Enum.
        FillDirection.Horizontal B.HorizontalAlignment=Enum.HorizontalAlignment.Right B.
        Padding=UDim.new(0,8)B.SortOrder=Enum.SortOrder.LayoutOrder B.VerticalAlignment=
        Enum.VerticalAlignment.Center B.Parent=A local C=Instance.new'TextLabel'C.Name=
        'Name'C.AutomaticSize=Enum.AutomaticSize.XY C.BackgroundColor3=Color3.fromRGB(
        255,255,255)C.BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.
        BorderSizePixel=0 C.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
        .SemiBold,Enum.FontStyle.Normal)C.Text='Custom'C.TextColor3=Color3.fromRGB(200,
        200,200)C.TextSize=13 C.TextWrapped=true C.TextXAlignment=Enum.TextXAlignment.
        Left C.Parent=A local D=Instance.new'ImageButton'D.Name='SuggestionColor'D.
        BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=1 D.
        BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Image=
        'rbxassetid://79776444663640'D.ImageColor3=Color3.fromRGB(33,182,244)D.
        LayoutOrder=1 D.Size=UDim2.fromOffset(15,15)local E=Instance.new'ImageLabel'E.
        Name='Transparency'E.BackgroundColor3=Color3.fromRGB(255,255,255)E.
        BackgroundTransparency=1 E.BorderColor3=Color3.fromRGB(0,0,0)E.BorderSizePixel=0
        E.Image='rbxassetid://101467502072089'E.ImageTransparency=1 E.Size=UDim2.
        fromScale(1,1)E.Parent=D D.Parent=A A.Parent=x x.Parent=l l.Parent=h local F=
        Instance.new'Frame'F.Name='ColorpickerInput'F.AutomaticSize=Enum.AutomaticSize.X
        F.BackgroundColor3=Color3.fromRGB(30,30,30)F.BorderColor3=Color3.fromRGB(0,0,0)F
        .BorderSizePixel=0 F.Position=UDim2.fromScale(0.272,0.732)F.Size=UDim2.
        fromOffset(0,40)F.Visible=false F.Parent=e.gui local G=Instance.new'UICorner'G.
        Name='UICorner'G.CornerRadius=UDim.new(0,5)G.Parent=F local H=Instance.new
        'UIListLayout'H.Name='UIListLayout'H.FillDirection=Enum.FillDirection.Horizontal
        H.Padding=UDim.new(0,10)H.SortOrder=Enum.SortOrder.LayoutOrder H.
        VerticalAlignment=Enum.VerticalAlignment.Center H.Parent=F local I=Instance.new
        'ImageLabel'I.Name='Icon'I.BackgroundColor3=Color3.fromRGB(255,255,255)I.
        BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0
        I.Image='rbxassetid://88238578565569'I.ImageColor3=Color3.fromRGB(156,156,156)I.
        Size=UDim2.fromOffset(20,20)I.Parent=F local J=Instance.new'UIPadding'J.Name=
        'UIPadding'J.PaddingLeft=UDim.new(0,15)J.PaddingRight=UDim.new(0,10)J.Parent=F
        local K=Instance.new'Frame'K.Name='Inputs'K.AutomaticSize=Enum.AutomaticSize.X K
        .BackgroundColor3=Color3.fromRGB(255,255,255)K.BackgroundTransparency=1 K.
        BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0 K.Size=UDim2.fromScale(0,1
        )local L=Instance.new'TextBox'L.Name='Alpha'L.AutomaticSize=Enum.AutomaticSize.X
        L.BackgroundColor3=Color3.fromRGB(30,30,30)L.BorderColor3=Color3.fromRGB(0,0,0)L
        .BorderSizePixel=0 L.ClearTextOnFocus=false L.ClipsDescendants=true L.
        CursorPosition=-1 L.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
        .SemiBold,Enum.FontStyle.Normal)L.LayoutOrder=6 L.PlaceholderColor3=Color3.
        fromRGB(120,120,120)L.PlaceholderText='Alpha'L.Size=UDim2.fromScale(0,1)L.Text=
        '255'L.TextColor3=Color3.fromRGB(156,156,156)L.TextSize=15 L.TextXAlignment=Enum
        .TextXAlignment.Left local M=Instance.new'UICorner'M.Name='UICorner'M.
        CornerRadius=UDim.new(0,5)M.Parent=L local N=Instance.new'UIPadding'N.Name=
        'UIPadding'N.PaddingLeft=UDim.new(0,8)N.PaddingRight=UDim.new(0,8)N.Parent=L L.
        Parent=K local O=Instance.new'TextBox'O.Name='Red'O.AutomaticSize=Enum.
        AutomaticSize.X O.BackgroundColor3=Color3.fromRGB(30,30,30)O.BorderColor3=Color3
        .fromRGB(0,0,0)O.BorderSizePixel=0 O.ClearTextOnFocus=false O.ClipsDescendants=
        true O.CursorPosition=-1 O.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)O.PlaceholderColor3=Color3.fromRGB(120
        ,120,120)O.PlaceholderText='Red'O.Size=UDim2.fromScale(0,1)O.Text='255'O.
        TextColor3=Color3.fromRGB(156,156,156)O.TextSize=15 O.TextXAlignment=Enum.
        TextXAlignment.Left local P=Instance.new'UICorner'P.Name='UICorner'P.
        CornerRadius=UDim.new(0,5)P.Parent=O local Q=Instance.new'UIPadding'Q.Name=
        'UIPadding'Q.PaddingLeft=UDim.new(0,8)Q.PaddingRight=UDim.new(0,8)Q.Parent=O O.
        Parent=K local R=Instance.new'TextBox'R.Name='Blue'R.AutomaticSize=Enum.
        AutomaticSize.X R.BackgroundColor3=Color3.fromRGB(30,30,30)R.BorderColor3=Color3
        .fromRGB(0,0,0)R.BorderSizePixel=0 R.ClearTextOnFocus=false R.ClipsDescendants=
        true R.CursorPosition=-1 R.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)R.LayoutOrder=4 R.PlaceholderColor3=
        Color3.fromRGB(120,120,120)R.PlaceholderText='Blue'R.Size=UDim2.fromScale(0,1)R.
        Text='255'R.TextColor3=Color3.fromRGB(156,156,156)R.TextSize=15 R.TextXAlignment
        =Enum.TextXAlignment.Left local S=Instance.new'UICorner'S.Name='UICorner'S.
        CornerRadius=UDim.new(0,5)S.Parent=R local T=Instance.new'UIPadding'T.Name=
        'UIPadding'T.PaddingLeft=UDim.new(0,8)T.PaddingRight=UDim.new(0,8)T.Parent=R R.
        Parent=K local U=Instance.new'TextBox'U.Name='Green'U.AutomaticSize=Enum.
        AutomaticSize.X U.BackgroundColor3=Color3.fromRGB(30,30,30)U.BorderColor3=Color3
        .fromRGB(0,0,0)U.BorderSizePixel=0 U.ClearTextOnFocus=false U.ClipsDescendants=
        true U.CursorPosition=-1 U.FontFace=Font.new('rbxassetid://12187365364',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)U.LayoutOrder=2 U.PlaceholderColor3=
        Color3.fromRGB(120,120,120)U.PlaceholderText='Green'U.Size=UDim2.fromScale(0,1)U
        .Text='255'U.TextColor3=Color3.fromRGB(156,156,156)U.TextSize=15 U.
        TextXAlignment=Enum.TextXAlignment.Left local V=Instance.new'UICorner'V.Name=
        'UICorner'V.CornerRadius=UDim.new(0,5)V.Parent=U local W=Instance.new'UIPadding'
        W.Name='UIPadding'W.PaddingLeft=UDim.new(0,8)W.PaddingRight=UDim.new(0,8)W.
        Parent=U U.Parent=K local X=Instance.new'UIListLayout'X.Name='UIListLayout'X.
        FillDirection=Enum.FillDirection.Horizontal X.SortOrder=Enum.SortOrder.
        LayoutOrder X.VerticalAlignment=Enum.VerticalAlignment.Center X.Parent=K K.
        Parent=F function k:SetColor(Y,Z)local _=1-(Z or 0)k.Settings.Color=Y k.Settings
        .Transparency=_ local aa,ab,ac,ad=math.round(Y.R*255),math.round(Y.G*255),math.
        round(Y.B*255),math.round((1-_)*255)O.Text=tostring(aa)U.Text=tostring(ab)R.Text
        =tostring(ac)L.Text=tostring(ad)D.ImageColor3=Y E.ImageTransparency=1-_ if k.
        Settings.Callback then g.callback(k.Settings.Callback,k,Y,_)end return k end
        local aa=function()local aa,ab=D.AbsolutePosition,D.AbsoluteSize local ac,ad=aa.
        X+ab.X,aa.Y+(ab.Y*2)+F.AbsoluteSize.Y F.Position=UDim2.fromOffset(ac,ad)end aa()
        D:GetPropertyChangedSignal'AbsolutePosition':Connect(aa)D.MouseButton1Click:
        Connect(function()F.Visible=not F.Visible end)local ab=function()local ab,ac,ad,
        Y=tonumber(O.Text),tonumber(U.Text),tonumber(R.Text),tonumber(L.Text)ab=ab and
        math.clamp(ab,0,255)or(k.Settings.Color.R*255)ac=ac and math.clamp(ac,0,255)or(k
        .Settings.Color.G*255)ad=ad and math.clamp(ad,0,255)or(k.Settings.Color.B*255)Y=
        Y and math.clamp(Y,0,255)or(1-k.Settings.Transparency)*255 local Z,_=Color3.
        fromRGB(ab,ac,ad),Y/255 k:SetColor(Z,_)end for ac,ad in pairs(K:GetChildren())do
        if ad:IsA'TextBox'then ad.FocusLost:Connect(function(Y)if Y then ab()end end)end
        end local ac=false F.MouseEnter:Connect(function()ac=true end)F.MouseLeave:
        Connect(function()ac=false end)f._userInputService.InputBegan:Connect(function(
        ad)if ad.UserInputType==Enum.UserInputType.MouseButton1 and not ac and F.Visible
        then F.Visible=false end end)function k:UpdateSettings(ad)ad=ad or{}if ad.
        Visible~=nil then k.Settings.Visible=ad.Visible l.Visible=ad.Visible end if ad.
        Name then k.Settings.Name=ad.Name t.Text=ad.Name t.Visible=ad.Name and true or
        false end if ad.Description then k.Settings.Description=ad.Description v.Text=ad
        .Description or''v.Visible=ad.Description and true or false end if ad.
        AlphaEnabled~=nil then k.Settings.AlphaEnabled=ad.AlphaEnabled L.Visible=ad.
        AlphaEnabled end if ad.Color then k:SetColor(ad.Color[1],1-(ad.Color[2]or 0))end
        if ad.SuggestionColors then k.Settings.SuggestionColors=ad.SuggestionColors for
        Y,Z in ipairs(y:GetChildren())do if Z:IsA'GuiObject'then Z:Destroy()end end for
        Y,Z in ipairs(ad.SuggestionColors)do local _,ae,af=Z[1],Z[2]or 0,Instance.new
        'ImageButton'af.Name='SuggestionColor'af.BackgroundTransparency=1 af.
        BorderSizePixel=0 af.Image='rbxassetid://79776444663640'af.ImageColor3=_ af.Size
        =UDim2.fromOffset(15,15)af.LayoutOrder=Y local ag=Instance.new'ImageLabel'ag.
        Name='Transparency'ag.BackgroundTransparency=1 ag.BorderSizePixel=0 ag.Image=
        'rbxassetid://101467502072089'ag.ImageTransparency=1-ae ag.Size=UDim2.fromScale(
        1,1)ag.Parent=af af.MouseButton1Click:Connect(function()k:SetColor(_,1-ae)end)af
        .Parent=y end end if not ad.Name and not ad.Description then r.Visible=false o.
        PaddingTop=UDim.new(0,0)elseif not ad.Name and ad.Description then o.PaddingTop=
        UDim.new(0,-5)else r.Visible=true o.PaddingTop=UDim.new(0,8)end end k:
        UpdateSettings(k.Settings)local ad=Instance.new'Frame'ad.BackgroundColor3=Color3
        .fromRGB(30,30,30)ad.BorderColor3=Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.
        Size=UDim2.new(1,0,0,1)ad.Parent=h function k:Continue()ad.Visible=false return
        k end function k:End()ad.Visible=true return k end if j then d.Components[j]=k
        end k.Content=h injectComponents(k,'Colorpicker')return k:End()end function
        CreateKeybind(aa,ab,ac)local ad,ae={Settings=ab,Type='Keybind'},Instance.new
        'Frame'ae.AutomaticSize=Enum.AutomaticSize.Y ae.BackgroundColor3=Color3.fromRGB(
        0,0,0)ae.BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.
        BorderSizePixel=0 ae.Size=UDim2.fromScale(1,0)ae.Visible=ad.Settings.Visible==
        nil and true or ad.Settings.Visible ae.Parent=aa local af=Instance.new
        'TextButton'af.AutoButtonColor=false af.AutomaticSize=Enum.AutomaticSize.Y af.
        BackgroundColor3=Color3.fromRGB(30,30,30)af.BorderColor3=Color3.fromRGB(0,0,0)af
        .BorderSizePixel=0 af.FontFace=Font.new
        'rbxasset://fonts/families/SourceSansPro.json'af.Size=UDim2.new(1,0,0,40)af.Text
        =''af.TextColor3=Color3.fromRGB(0,0,0)af.TextSize=14 local ag=Instance.new
        'TextLabel'ag.AnchorPoint=Vector2.new(0,0.5)ag.AutomaticSize=Enum.AutomaticSize.
        XY ag.BackgroundColor3=Color3.fromRGB(255,255,255)ag.BackgroundTransparency=1 ag
        .BorderColor3=Color3.fromRGB(0,0,0)ag.BorderSizePixel=0 ag.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ag.
        LayoutOrder=1 ag.Position=UDim2.fromScale(0,0.5)ag.TextColor3=Color3.fromRGB(156
        ,156,156)ag.TextSize=15 ag.TextWrapped=true ag.TextXAlignment=Enum.
        TextXAlignment.Left ag.Text='Unbinded'local h=Instance.new'UIPadding'h.
        PaddingBottom=UDim.new(0,10)h.PaddingRight=UDim.new(0,50)h.PaddingTop=UDim.new(0
        ,10)h.Parent=ag ag.Parent=af local i=Instance.new'UIPadding'i.PaddingLeft=UDim.
        new(0,15)i.Parent=af local j=Instance.new'UIListLayout'j.FillDirection=Enum.
        FillDirection.Horizontal j.Padding=UDim.new(0,15)j.SortOrder=Enum.SortOrder.
        LayoutOrder j.VerticalAlignment=Enum.VerticalAlignment.Center j.Parent=af local
        k=Instance.new'ImageLabel'k.BackgroundColor3=Color3.fromRGB(255,255,255)k.
        BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0,0)k.BorderSizePixel=0
        k.Image='rbxassetid://94052787260057'k.ImageColor3=Color3.fromRGB(156,156,156)k.
        Size=UDim2.fromOffset(20,20)k.Parent=af local l=Instance.new'UICorner'l.
        CornerRadius=UDim.new(0,5)l.Parent=af af.Parent=ae local o,r,s={Selected=Color3.
        fromRGB(225,225,225),Unselected=Color3.fromRGB(156,156,156)},false,function(o)if
        o then k.Visible=false ag.Text='Press a key'ag.Size=UDim2.fromScale(1,0)ag.
        TextXAlignment=Enum.TextXAlignment.Center h.PaddingRight=UDim.new(0,15)af.Active
        =false af.Interactable=false elseif o==false then k.Visible=true ag.Size=UDim2.
        fromScale(0,0)ag.TextXAlignment=Enum.TextXAlignment.Left h.PaddingRight=UDim.
        new(0,50)af.Active=true af.Interactable=true else k.Visible=true ag.Text=
        'Unbinded'ag.Size=UDim2.fromScale(0,0)ag.TextXAlignment=Enum.TextXAlignment.Left
        h.PaddingRight=UDim.new(0,50)af.Active=true af.Interactable=true end end if ad.
        Settings.Bind then s(false)if ad.Settings.Bind.EnumType==Enum.KeyCode then ag.
        Text=g.parseKeyCode(ad.Settings.Bind)elseif ad.Settings.Bind==Enum.UserInputType
        .MouseButton1 or ad.Settings.Bind==Enum.UserInputType.MouseButton2 then ag.Text=
        g.parseKeyCode(ad.Settings.Bind)end else s(nil)end ae.MouseEnter:Connect(
        function()g.tween(k,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageColor3=o.
        Selected}):Play()g.tween(ag,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3
        =o.Selected}):Play()end)ae.MouseLeave:Connect(function()g.tween(k,TweenInfo.new(
        0.1,Enum.EasingStyle.Sine),{ImageColor3=o.Unselected}):Play()g.tween(ag,
        TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=o.Unselected}):Play()end)af
        .InputEnded:Connect(function(t)if t.UserInputType==Enum.UserInputType.
        MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then r=true s(true)end
        end)f._userInputService.InputBegan:Connect(function(t,u)if r and not u and not(
        ad.Settings.Blacklist and(table.find(ad.Settings.Blacklist,t.KeyCode)or table.
        find(ad.Settings.Blacklist,t.UserInputType)))then if t.UserInputType==Enum.
        UserInputType.Keyboard then ad.Settings.Bind=t.KeyCode ag.Text=g.parseKeyCode(t.
        KeyCode)s(false)if ad.Settings.onChanged then g.callback(ad.Settings.onChanged,
        ad,ad.Settings.Bind)end r=false elseif t.UserInputType==Enum.UserInputType.
        MouseButton1 or t.UserInputType==Enum.UserInputType.MouseButton2 then ad.
        Settings.Bind=t.UserInputType ag.Text=g.parseKeyCode(t.UserInputType)s(false)if
        ad.Settings.onChanged then g.callback(ad.Settings.onChanged,ad,ad.Settings.Bind)
        end r=false end end end)f._userInputService.InputBegan:Connect(function(t,u)if
        not r then if t.KeyCode==ad.Settings.Bind or t.UserInputType==ad.Settings.Bind
        then if ad.Settings.Callback then g.callback(ad.Settings.Callback,ad,u)end if ad
        .Settings.onHeld then g.callback(ad.Settings.onHeld,ad,true,u)end end end end)f.
        _userInputService.InputEnded:Connect(function(t,u)if not r and(t.KeyCode==ad.
        Settings.Bind or t.UserInputType==ad.Settings.Bind)then if ad.Settings.onHeld
        then g.callback(ad.Settings.onHeld,ad,false,u)end end end)function ad:
        UpdateSettings(t)if t.Visible~=nil then ad.Settings.Visible=t.Visible ae.Visible
        =t.Visible end if t.Bind then ad.Settings.Bind=t.Bind s(false)if ad.Settings.
        Bind.EnumType==Enum.KeyCode then ag.Text=g.parseKeyCode(ad.Settings.Bind)elseif
        ad.Settings.Bind==Enum.UserInputType.MouseButton1 or ad.Settings.Bind==Enum.
        UserInputType.MouseButton2 then ag.Text=g.parseKeyCode(ad.Settings.Bind)end if t
        .Callback then g.callback(ad.Settings.Callback,ad,false)end end if t.Callback
        then ad.Settings.Callback=t.Callback end if t.onHeld then ad.Settings.onHeld=t.
        onHeld end if t.onChanged then ad.Settings.onChanged=t.onChanged end end local t
        =Instance.new'Frame't.BackgroundColor3=Color3.fromRGB(30,30,30)t.BorderColor3=
        Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.Size=UDim2.new(1,0,0,1)t.Parent=aa
        function ad:Continue()t.Visible=false return ad end function ad:End()t.Visible=
        true return ad end ad:UpdateSettings(ad.Settings)if ac then d.Components[ac]=ad
        end return ad:End()end function CreateDivider(aa,ab,ac)local ad,ae={Settings=ab}
        ,Instance.new'Frame'ae.BackgroundColor3=Color3.fromRGB(30,30,30)ae.BorderColor3=
        Color3.fromRGB(0,0,0)ae.BorderSizePixel=0 ae.Size=UDim2.new(1,0,0,1)ae.Parent=aa
        ae.Visible=ad.Settings and(ad.Settings.Visible==nil and true or ad.Settings.
        Visible)or true function ad:UpdateSettings(af)if af.Visible~=nil then ad.
        Settings.Visible=af.Visible ae.Visible=af.Visible end end if ac then d.
        Components[ac]=ad end return ad end local aa={Section=CreateSection,Button=
        CreateButton,Toggle=CreateToggle,Keybind=CreateKeybind,Dropdown=CreateDropdown,
        Colorpicker=CreateColorpicker,MultiInput=CreateMultiInput,Input=CreateInput,
        Slider=CreateSlider,Divider=CreateDivider}function injectComponents(ab,ac)for ad
        ,ae in pairs(aa)do if ac and ad==ac then ab[ad]=function(af,...)return ae(af.
        Content,...)end break else ab[ad]=function(af,...)return ae(af.Content,...)end
        end end end function d:Window(ab)local ac={Settings=ab}assert(ac.Settings.Title
        and type(ac.Settings.Title)=='string','Missing window title or wrong type')ac.
        Settings.Keybind=ac.Settings.Keybind or Enum.KeyCode.RightControl e.winKeybind=
        ac.Settings.Keybind local ad=Instance.new'ImageLabel'ad.BackgroundColor3=Color3.
        fromRGB(17,17,17)ad.BorderColor3=Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.
        ClipsDescendants=true ad.Image='rbxassetid://17365187482'ad.ImageTransparency=
        0.96 ad.ScaleType=Enum.ScaleType.Tile ad.Size=UDim2.fromOffset(400,672)ad.
        TileSize=UDim2.fromOffset(500,325)local ae=Instance.new'Frame'ae.AutomaticSize=
        Enum.AutomaticSize.XY ae.BackgroundColor3=Color3.fromRGB(255,255,255)ae.
        BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.BorderSizePixel
        =0 local af=Instance.new'TextLabel'af.AutomaticSize=Enum.AutomaticSize.XY af.
        BackgroundColor3=Color3.fromRGB(255,255,255)af.BackgroundTransparency=1 af.
        BorderColor3=Color3.fromRGB(0,0,0)af.BorderSizePixel=0 af.FontFace=Font.new(
        'rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.FontStyle.Normal)af.
        RichText=true af.Text=ac.Settings.Title af.TextColor3=Color3.fromRGB(255,255,255
        )af.TextSize=35 af.TextWrapped=true af.TextXAlignment=Enum.TextXAlignment.Left
        af.Parent=ae local ag=Instance.new'UIPadding'ag.PaddingLeft=UDim.new(0,25)ag.
        PaddingRight=UDim.new(0,25)ag.Parent=ae local h=Instance.new'Frame'h.AnchorPoint
        =Vector2.new(0,1)h.BackgroundColor3=Color3.fromRGB(255,255,255)h.
        BackgroundTransparency=0.9 h.BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel
        =0 h.Position=UDim2.new(0,0,1,10)h.Size=UDim2.new(0.95,0,0,1)local i=Instance.
        new'Frame'i.BackgroundColor3=Color3.fromRGB(185,228,255)i.BorderColor3=Color3.
        fromRGB(0,0,0)i.BorderSizePixel=0 i.Size=UDim2.new(0.5,0,0,1)i.Parent=h h.Parent
        =ae local j=Instance.new'UIListLayout'j.Padding=UDim.new(0,10)j.SortOrder=Enum.
        SortOrder.LayoutOrder j.VerticalAlignment=Enum.VerticalAlignment.Center j.Parent
        =ae ae.Parent=ad local k=Instance.new'UICorner'k.CornerRadius=UDim.new(0,15)k.
        Parent=ad local l=Instance.new'UIPadding'l.PaddingBottom=UDim.new(0,25)l.
        PaddingTop=UDim.new(0,25)l.Parent=ad local o=Instance.new'Frame'o.AnchorPoint=
        Vector2.new(0,1)o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
        BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0
        o.ClipsDescendants=true o.LayoutOrder=1 o.Position=UDim2.fromScale(0,1)o.Size=
        UDim2.new(1,0,1,-55)local r=Instance.new'ScrollingFrame'r.Active=true r.
        AutomaticCanvasSize=Enum.AutomaticSize.X r.AutomaticSize=Enum.AutomaticSize.Y r.
        BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
        BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.CanvasSize=UDim2.new()r.
        ScrollBarImageTransparency=1 r.ScrollBarThickness=0 r.ScrollingDirection=Enum.
        ScrollingDirection.X r.Size=UDim2.fromScale(1,0)local s=Instance.new
        'UIListLayout's.FillDirection=Enum.FillDirection.Horizontal s.Padding=UDim.new(0
        ,10)s.SortOrder=Enum.SortOrder.LayoutOrder s.Parent=r local t=Instance.new
        'UIPadding't.PaddingBottom=UDim.new(0,10)t.PaddingLeft=UDim.new(0,26)t.
        PaddingRight=UDim.new(0,26)t.PaddingTop=UDim.new(0,1)t.Parent=r r.Parent=o local
        u=Instance.new'UIListLayout'u.Padding=UDim.new(0,25)u.SortOrder=Enum.SortOrder.
        LayoutOrder u.Parent=o local v=Instance.new'Frame'v.BackgroundColor3=Color3.
        fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0
        ,0)v.BorderSizePixel=0 v.Size=UDim2.new(1,0,1,-104)v.Parent=o o.Parent=ad local
        w=Instance.new'UIListLayout'w.Padding=UDim.new(0,30)w.SortOrder=Enum.SortOrder.
        LayoutOrder w.Parent=ad ad.Parent=e.overlay local x=Instance.new'UIPadding'x.
        PaddingBottom=UDim.new(0,15)x.PaddingLeft=UDim.new(0,15)x.PaddingRight=UDim.new(
        0,15)x.PaddingTop=UDim.new(0,15)x.Parent=e.overlay local y=Instance.new
        'ImageLabel'y.BackgroundColor3=Color3.fromRGB(17,17,17)y.BorderColor3=Color3.
        fromRGB(0,0,0)y.BorderSizePixel=0 y.ClipsDescendants=true y.Image=
        'rbxassetid://17365187482'y.ImageTransparency=0.96 y.ScaleType=Enum.ScaleType.
        Tile y.Size=UDim2.fromOffset(400,570)y.TileSize=UDim2.fromOffset(500,325)y.
        Visible=false y.ZIndex=0 y.Position=UDim2.fromOffset(ad.AbsoluteSize.X+15,0)
        local z=Instance.new'UICorner'z.CornerRadius=UDim.new(0,15)z.Parent=y local A=
        Instance.new'UIPadding'A.PaddingBottom=UDim.new(0,25)A.PaddingLeft=UDim.new(0,25
        )A.PaddingRight=UDim.new(0,15)A.PaddingTop=UDim.new(0,20)A.Parent=y local B=
        Instance.new'Frame'B.AutomaticSize=Enum.AutomaticSize.XY B.BackgroundColor3=
        Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B.BorderColor3=Color3.
        fromRGB(0,0,0)B.BorderSizePixel=0 local C=Instance.new'TextLabel'C.AutomaticSize
        =Enum.AutomaticSize.XY C.BackgroundColor3=Color3.fromRGB(255,255,255)C.
        BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0
        C.FontFace=Font.new('rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.
        FontStyle.Normal)C.Text='Visual Preview'C.TextColor3=Color3.fromRGB(255,255,255)
        C.TextSize=30 C.TextWrapped=true C.TextXAlignment=Enum.TextXAlignment.Left C.
        Parent=B local D=Instance.new'Frame'D.AnchorPoint=Vector2.new(0,1)D.
        BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=0.9 D.
        BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Position=UDim2.new(0,0,1
        ,10)D.Size=UDim2.new(0.95,0,0,1)local E=Instance.new'Frame'E.BackgroundColor3=
        Color3.fromRGB(185,228,255)E.BorderColor3=Color3.fromRGB(0,0,0)E.BorderSizePixel
        =0 E.Size=UDim2.new(0.5,0,0,1)E.Parent=D D.Parent=B B.Parent=y local F=Instance.
        new'UIListLayout'F.Padding=UDim.new(0,40)F.SortOrder=Enum.SortOrder.LayoutOrder
        F.Parent=y local G=Instance.new'Frame'G.AnchorPoint=Vector2.new(0,1)G.
        BackgroundColor3=Color3.fromRGB(255,255,255)G.BackgroundTransparency=1 G.
        BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0 G.LayoutOrder=1 G.Position
        =UDim2.fromScale(0,1)G.Size=UDim2.new(1,0,1,-70)local H=Instance.new'Frame'H.
        BackgroundColor3=Color3.fromRGB(255,255,255)H.BackgroundTransparency=1 H.
        BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0 H.LayoutOrder=1 H.Size=
        UDim2.new(1,0,1,-18)local I=Instance.new'Frame'I.AnchorPoint=Vector2.new(1,0)I.
        BackgroundColor3=Color3.fromRGB(58,161,47)I.BorderColor3=Color3.fromRGB(0,0,0)I.
        BorderSizePixel=0 I.Position=UDim2.fromOffset(-10,0)I.Size=UDim2.new(0,12,1,0)I.
        Visible=false I.Parent=H local J=Instance.new'Frame'J.AnchorPoint=Vector2.new(
        0.5,1)J.BackgroundColor3=Color3.fromRGB(15,15,15)J.BorderColor3=Color3.fromRGB(0
        ,0,0)J.BorderSizePixel=0 J.LayoutOrder=1 J.Position=UDim2.fromScale(0.5,1)J.Size
        =UDim2.fromScale(1,1)local K=Instance.new'Frame'K.BackgroundColor3=Color3.
        fromRGB(255,255,255)K.BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0
        ,0)K.BorderSizePixel=0 K.Size=UDim2.fromScale(1,1)K.Visible=false K.ZIndex=2
        local L=Instance.new'Frame'L.BackgroundColor3=Color3.fromRGB(255,255,255)L.
        BorderColor3=Color3.fromRGB(0,0,0)L.BorderSizePixel=0 L.Size=UDim2.fromOffset(2,
        30)L.Parent=K local M=Instance.new'Frame'M.BackgroundColor3=Color3.fromRGB(255,
        255,255)M.BorderColor3=Color3.fromRGB(0,0,0)M.BorderSizePixel=0 M.Size=UDim2.
        fromOffset(30,2)M.Parent=K local N=Instance.new'Frame'N.AnchorPoint=Vector2.new(
        0,1)N.BackgroundColor3=Color3.fromRGB(255,255,255)N.BorderColor3=Color3.fromRGB(
        0,0,0)N.BorderSizePixel=0 N.Position=UDim2.fromScale(0,1)N.Size=UDim2.
        fromOffset(30,2)N.Parent=K local O=Instance.new'Frame'O.AnchorPoint=Vector2.new(
        0,1)O.BackgroundColor3=Color3.fromRGB(255,255,255)O.BorderColor3=Color3.fromRGB(
        0,0,0)O.BorderSizePixel=0 O.Position=UDim2.fromScale(0,1)O.Size=UDim2.
        fromOffset(2,30)O.Parent=K local P=Instance.new'Frame'P.AnchorPoint=Vector2.new(
        1,1)P.BackgroundColor3=Color3.fromRGB(255,255,255)P.BorderColor3=Color3.fromRGB(
        0,0,0)P.BorderSizePixel=0 P.Position=UDim2.fromScale(1,1)P.Size=UDim2.
        fromOffset(2,30)P.Parent=K local Q=Instance.new'Frame'Q.AnchorPoint=Vector2.new(
        1,1)Q.BackgroundColor3=Color3.fromRGB(255,255,255)Q.BorderColor3=Color3.fromRGB(
        0,0,0)Q.BorderSizePixel=0 Q.Position=UDim2.fromScale(1,1)Q.Size=UDim2.
        fromOffset(30,2)Q.Parent=K local R=Instance.new'Frame'R.AnchorPoint=Vector2.new(
        1,0)R.BackgroundColor3=Color3.fromRGB(255,255,255)R.BorderColor3=Color3.fromRGB(
        0,0,0)R.BorderSizePixel=0 R.Position=UDim2.fromScale(1,0)R.Size=UDim2.
        fromOffset(2,30)R.Parent=K local S=Instance.new'Frame'S.AnchorPoint=Vector2.new(
        1,0)S.BackgroundColor3=Color3.fromRGB(255,255,255)S.BorderColor3=Color3.fromRGB(
        0,0,0)S.BorderSizePixel=0 S.Position=UDim2.fromScale(1,0)S.Size=UDim2.
        fromOffset(30,2)S.Parent=K K.Parent=J local T=Instance.new'ImageLabel'T.
        AnchorPoint=Vector2.new(0.5,0.5)T.BackgroundColor3=Color3.fromRGB(255,255,255)T.
        BackgroundTransparency=1 T.BorderColor3=Color3.fromRGB(0,0,0)T.BorderSizePixel=0
        T.Image='rbxassetid://109289851861610'T.Position=UDim2.fromScale(0.5,0.5)T.
        ScaleType=Enum.ScaleType.Fit T.Size=UDim2.new(1,-20,1,-20)local U=Instance.new
        'UIGradient'U.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
        fromRGB(101,143,175)),ColorSequenceKeypoint.new(1,Color3.fromRGB(197,173,128))}U
        .Offset=Vector2.new(0,0.15)U.Rotation=90 U.Parent=T T.Parent=J local V=Instance.
        new'TextLabel'V.AnchorPoint=Vector2.new(0,1)V.AutomaticSize=Enum.AutomaticSize.
        XY V.BackgroundColor3=Color3.fromRGB(255,255,255)V.BackgroundTransparency=1 V.
        BorderColor3=Color3.fromRGB(0,0,0)V.BorderSizePixel=0 V.FontFace=Font.new(
        'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)V.
        Position=UDim2.fromOffset(0,-5)V.Size=UDim2.fromScale(1,0)V.Text=
        'RIOTPLAYER987123'V.TextColor3=Color3.fromRGB(255,255,255)V.TextSize=13 V.
        TextWrapped=true V.TextYAlignment=Enum.TextYAlignment.Top V.Visible=false local
        W=Instance.new'UIPadding'W.PaddingLeft=UDim.new(0,20)W.Parent=V V.Parent=J local
        X=Instance.new'Frame'X.AnchorPoint=Vector2.new(0.5,0.5)X.BackgroundColor3=Color3
        .fromRGB(255,255,255)X.BackgroundTransparency=1 X.BorderColor3=Color3.fromRGB(0,
        0,0)X.BorderSizePixel=0 X.Position=UDim2.fromScale(0.5,0.5)X.Size=UDim2.new(1,-2
        ,1,-2)X.Visible=false local Y=Instance.new'UIStroke'Y.ApplyStrokeMode=Enum.
        ApplyStrokeMode.Border Y.Color=Color3.fromRGB(255,255,255)Y.Parent=X X.Parent=J
        local Z=Instance.new'Frame'Z.BackgroundColor3=Color3.fromRGB(0,0,0)Z.
        BackgroundTransparency=1 Z.BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0
        Z.Size=UDim2.fromScale(1,1)Z.Visible=false Z.Parent=J J.Parent=H local _=
        Instance.new'Frame'_.AutomaticSize=Enum.AutomaticSize.XY _.BackgroundColor3=
        Color3.fromRGB(255,255,255)_.BackgroundTransparency=1 _.BorderColor3=Color3.
        fromRGB(0,0,0)_.BorderSizePixel=0 _.LayoutOrder=2 _.Position=UDim2.new(1,5,0,10)
        _.Size=UDim2.fromOffset(50,0)_.Visible=true local ah=Instance.new'TextLabel'ah.
        AnchorPoint=Vector2.new(0,1)ah.AutomaticSize=Enum.AutomaticSize.XY ah.
        BackgroundColor3=Color3.fromRGB(255,255,255)ah.BackgroundTransparency=1 ah.
        BorderColor3=Color3.fromRGB(0,0,0)ah.BorderSizePixel=0 ah.FontFace=Font.new(
        'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ah.
        Position=UDim2.fromOffset(0,-5)ah.RichText=true ah.Text='100M'ah.TextColor3=
        Color3.fromRGB(255,255,255)ah.TextSize=13 ah.TextWrapped=true ah.TextXAlignment=
        Enum.TextXAlignment.Left ah.TextYAlignment=Enum.TextYAlignment.Top ah.Parent=_
        ah.Visible=false local ai=Instance.new'TextLabel'ai.AnchorPoint=Vector2.new(0,1)
        ai.AutomaticSize=Enum.AutomaticSize.XY ai.BackgroundColor3=Color3.fromRGB(255,
        255,255)ai.BackgroundTransparency=1 ai.BorderColor3=Color3.fromRGB(0,0,0)ai.
        BorderSizePixel=0 ai.FontFace=Font.new('rbxassetid://12187362578',Enum.
        FontWeight.SemiBold,Enum.FontStyle.Normal)ai.LayoutOrder=1 ai.Position=UDim2.
        fromOffset(0,-5)ai.RichText=true ai.Text='BF 30'ai.TextColor3=Color3.fromRGB(255
        ,255,255)ai.TextSize=13 ai.TextWrapped=true ai.TextXAlignment=Enum.
        TextXAlignment.Left ai.TextYAlignment=Enum.TextYAlignment.Top ai.Parent=_ ai.
        Visible=false local aj=Instance.new'TextLabel'aj.AnchorPoint=Vector2.new(0,1)aj.
        AutomaticSize=Enum.AutomaticSize.XY aj.BackgroundColor3=Color3.fromRGB(255,255,
        255)aj.BackgroundTransparency=1 aj.BorderColor3=Color3.fromRGB(0,0,0)aj.
        BorderSizePixel=0 aj.ClipsDescendants=true aj.FontFace=Font.new(
        'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)aj.
        LayoutOrder=2 aj.Position=UDim2.fromOffset(0,-5)aj.RichText=true aj.Text='140HP'
        aj.TextColor3=Color3.fromRGB(255,255,255)aj.TextSize=13 aj.TextWrapped=true aj.
        TextXAlignment=Enum.TextXAlignment.Left aj.TextYAlignment=Enum.TextYAlignment.
        Top aj.Parent=_ aj.Visible=false local ak=Instance.new'UIListLayout'ak.SortOrder
        =Enum.SortOrder.LayoutOrder ak.Parent=_ _.Parent=H local al=Instance.new
        'UIListLayout'al.FillDirection=Enum.FillDirection.Horizontal al.HorizontalFlex=
        Enum.UIFlexAlignment.Fill al.Padding=UDim.new(0,10)al.SortOrder=Enum.SortOrder.
        LayoutOrder al.Parent=H H.Parent=G G.Parent=y y.Parent=e.overlay g.
        makeDraggable(y)g.makeDraggable(ad)f._userInputService.InputEnded:Connect(
        function(am,an)if an then return end if am.KeyCode==ac.Settings.Keybind then e.
        overlay.Visible=not e.overlay.Visible end end)local am=function()local am=ae.
        AbsoluteSize.Y+9 o.Size=UDim2.new(1,0,1,-am)o.Position=UDim2.new(0,0,0,am)end ae
        :GetPropertyChangedSignal'AbsoluteSize':Connect(am)am()function ac:
        UpdateSettings(an)if an.Title then ac.Settings.Title=an.Title af.Text=an.Title
        end if an.Keybind then ac.Settings.Keybind=an.Keybind e.winKeybind=an.Keybind
        end end function ac:Tab(an)local ao={Settings=an}assert(ao.Settings.Name and
        type(ao.Settings.Name)=='string','Missing string or wrong type')if not ao.
        Settings.Image or ao.Settings.Image==''then ao.Settings.Image=d.Assets.
        DefaultImage end e.tabSystem.tabIndex+=1 local ap=Instance.new'Frame'ap.
        AutomaticSize=Enum.AutomaticSize.Y ap.BackgroundColor3=Color3.fromRGB(30,34,47)
        ap.BackgroundTransparency=1 ap.BorderColor3=Color3.fromRGB(0,0,0)ap.
        BorderSizePixel=0 ap.Size=UDim2.fromOffset(50,50)ap.Parent=r ap.LayoutOrder=e.
        tabSystem.tabIndex local aq=Instance.new'TextLabel'aq.AutomaticSize=Enum.
        AutomaticSize.Y aq.BackgroundColor3=Color3.fromRGB(255,255,255)aq.
        BackgroundTransparency=1 aq.BorderColor3=Color3.fromRGB(0,0,0)aq.BorderSizePixel
        =0 aq.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Bold,Enum.
        FontStyle.Normal)aq.LayoutOrder=1 aq.Position=UDim2.new(0,0,1,10)aq.RichText=
        true aq.Size=UDim2.fromScale(1,0)aq.Text=ao.Settings.Name:upper()aq.TextColor3=
        Color3.fromRGB(150,150,150)aq.TextSize=11 aq.TextWrapped=true aq.Parent=ap local
        ar=Instance.new'TextButton'ar.AutoButtonColor=false ar.BackgroundColor3=Color3.
        fromRGB(30,34,47)ar.BorderColor3=Color3.fromRGB(0,0,0)ar.BorderSizePixel=0 ar.
        FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'ar.Size=UDim2.
        fromOffset(50,50)ar.Text=''ar.TextColor3=Color3.fromRGB(0,0,0)ar.TextSize=14
        local as=Instance.new'UICorner'as.CornerRadius=UDim.new(0,13)as.Parent=ar local
        at=Instance.new'UIStroke'at.ApplyStrokeMode=Enum.ApplyStrokeMode.Border at.Color
        =Color3.fromRGB(185,228,255)at.Transparency=1 at.Parent=ar local au=Instance.new
        'ImageLabel'au.AnchorPoint=Vector2.new(0.5,0.5)au.BackgroundColor3=Color3.
        fromRGB(255,255,255)au.BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0
        ,0,0)au.BorderSizePixel=0 au.Image=ao.Settings.Image au.ImageColor3=Color3.
        fromRGB(150,150,150)au.Position=UDim2.fromScale(0.5,0.5)au.ScaleType=Enum.
        ScaleType.Crop au.Size=UDim2.fromOffset(28,28)au.Parent=ar ar.Parent=ap local av
        =Instance.new'UIListLayout'av.Padding=UDim.new(0,10)av.SortOrder=Enum.SortOrder.
        LayoutOrder av.Parent=ap local aw=Instance.new'ScrollingFrame'aw.Name=
        'TabContent'aw.AutomaticCanvasSize=Enum.AutomaticSize.Y aw.BackgroundColor3=
        Color3.fromRGB(255,255,255)aw.BackgroundTransparency=1 aw.BorderColor3=Color3.
        fromRGB(0,0,0)aw.BorderSizePixel=0 aw.CanvasSize=UDim2.new()aw.
        ScrollBarImageTransparency=1 aw.ScrollBarThickness=1 aw.Size=UDim2.fromScale(1,1
        )local ax=Instance.new'UIListLayout'ax.Name='UIListLayout'ax.Padding=UDim.new(0,
        10)ax.SortOrder=Enum.SortOrder.LayoutOrder ax.Parent=aw local ay=Instance.new
        'UIPadding'ay.Name='UIPadding'ay.PaddingBottom=UDim.new(0,20)ay.PaddingLeft=UDim
        .new(0,25)ay.PaddingRight=UDim.new(0,25)ay.Parent=aw e.tabSystem.tabInstances[ap
        ]={Name=aq,Stroke=at,Icon=au,TabContent=aw}function ao:Select()if e.tabSystem.
        tabInstances[e.tabSystem.currentTab]then local az=e.tabSystem.tabInstances[e.
        tabSystem.currentTab]g.tween(az.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
        TextColor3=Color3.fromRGB(150,150,150)}):Play()g.tween(az.Icon,TweenInfo.new(0.1
        ,Enum.EasingStyle.Sine),{ImageColor3=Color3.fromRGB(150,150,150)}):Play()g.
        tween(az.Stroke,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=1}):Play(
        )if e.tabSystem.currentContent then e.tabSystem.currentContent.Parent=nil end
        end if e.tabSystem.tabInstances[ap]then local az=e.tabSystem.tabInstances[ap]g.
        tween(az.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=Color3.
        fromRGB(168,193,225)}):Play()g.tween(az.Icon,TweenInfo.new(0.1,Enum.EasingStyle.
        Sine),{ImageColor3=Color3.fromRGB(133,192,228)}):Play()g.tween(az.Stroke,
        TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=0}):Play()e.tabSystem.
        currentTab=ap aw.Parent=v e.tabSystem.currentContent=aw end end ar.
        MouseButton1Click:Connect(function()ao:Select()end)function ao:Section(az,aA)
        local aB,aC={Settings=az},Instance.new'Frame'aC.Name='Section'aC.AutomaticSize=
        Enum.AutomaticSize.Y aC.BackgroundColor3=Color3.fromRGB(255,255,255)aC.
        BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel
        =0 aC.Size=UDim2.fromScale(1,0)local aD=Instance.new'TextButton'aD.Name=
        'Leading'aD.AutoButtonColor=false aD.AutomaticSize=Enum.AutomaticSize.Y aD.
        BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1 aD.
        BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.LayoutOrder=-1 aD.
        Selectable=false aD.Size=UDim2.fromScale(1,0)aD.Text=''local aE=Instance.new
        'TextLabel'aE.Name='Name'aE.AutomaticSize=Enum.AutomaticSize.XY aE.
        BackgroundColor3=Color3.fromRGB(255,255,255)aE.BackgroundTransparency=1 aE.
        BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel=0 aE.FontFace=Font.new(
        'rbxassetid://16658237174',Enum.FontWeight.Bold,Enum.FontStyle.Normal)aE.
        LayoutOrder=1 aE.Position=UDim2.fromOffset(28,0)aE.RichText=true aE.TextColor3=
        Color3.fromRGB(225,225,225)aE.TextSize=20 aE.TextWrapped=true aE.TextXAlignment=
        Enum.TextXAlignment.Left aE.Parent=aD local aF=Instance.new'ImageButton'aF.Name=
        'Chevron'aF.AnchorPoint=Vector2.new(0,0.5)aF.AutoButtonColor=false aF.
        BackgroundColor3=Color3.fromRGB(30,34,47)aF.BackgroundTransparency=1 aF.
        BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.Image=
        'rbxassetid://77136690433593'aF.LayoutOrder=1 aF.Position=UDim2.fromScale(0,0.5)
        aF.Selectable=false aF.Active=false aF.Interactable=false aF.Size=UDim2.
        fromOffset(18,18)aF.Parent=aD aD.Parent=aC local aG=Instance.new'Frame'aG.Name=
        'Trailing'aG.BackgroundColor3=Color3.fromRGB(255,255,255)aG.
        BackgroundTransparency=1 aG.BorderColor3=Color3.fromRGB(0,0,0)aG.BorderSizePixel
        =0 aG.ClipsDescendants=true aG.Size=UDim2.fromScale(1,0)local aH=Instance.new
        'UIListLayout'aH.Name='UIListLayout'aH.Padding=UDim.new(0,10)aH.SortOrder=Enum.
        SortOrder.LayoutOrder aH.Parent=aG local aI=Instance.new'UIPadding'aI.Name=
        'UIPadding'aI.PaddingLeft=UDim.new(0,12)aI.Parent=aG local aJ=Instance.new
        'Folder'aJ.Name='Folder'local aK=Instance.new'Frame'aK.Name='Frame'aK.
        AnchorPoint=Vector2.new(0,1)aK.BackgroundColor3=Color3.fromRGB(30,30,30)aK.
        BorderColor3=Color3.fromRGB(0,0,0)aK.BorderSizePixel=0 aK.Position=UDim2.new(0,-
        12,1,0)aK.Size=UDim2.new(0,1,1,0)aK.Parent=aJ aJ.Parent=aG aG.Parent=aC local aL
        =Instance.new'UIListLayout'aL.Name='UIListLayout'aL.Padding=UDim.new(0,10)aL.
        SortOrder=Enum.SortOrder.LayoutOrder aL.Parent=aC local aM=Instance.new
        'UIPadding'aM.Name='UIPadding'aM.PaddingBottom=UDim.new(0,8)aM.PaddingTop=UDim.
        new(0,8)aM.Parent=aC aC.Parent=aw local aN=function(aN)if aN then local aO,aP={}
        ,0 for aQ,aR in pairs(aG:GetChildren())do if aR:IsA'GuiObject'and aR.Visible
        then table.insert(aO,aR)aP+=aR.AbsoluteSize.Y end end if#aO>1 then aP+=(#aO-1)*
        aH.Padding.Offset end g.tween(aG,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size
        =UDim2.new(1,0,0,aP)}):Play()g.tween(aF,TweenInfo.new(0.15,Enum.EasingStyle.Sine
        ),{Rotation=-180}):Play()else g.tween(aG,TweenInfo.new(0.15,Enum.EasingStyle.
        Sine),{Size=UDim2.new(1,0,0,0)}):Play()g.tween(aF,TweenInfo.new(0.15,Enum.
        EasingStyle.Sine),{Rotation=0}):Play()end end aD.MouseButton1Click:Connect(
        function()aB.Settings.Opened=not aB.Settings.Opened aN(aB.Settings.Opened)end)
        local aO=function(aO)if not aO:IsA'GuiObject'then return end aO:
        GetPropertyChangedSignal'Visible':Connect(function()if aB.Settings.Opened then
        aN(true)end end)end for aP,aQ in pairs(aG:GetChildren())do aO(aQ)end aG.
        ChildAdded:Connect(function(aP)aO(aP)if aB.Settings.Opened then aN(true)end end)
        aG.ChildRemoved:Connect(function()if aB.Settings.Opened then aN(true)end end)
        function aB:UpdateSettings(aP)if aP.Visible~=nil then aB.Settings.Visible=aP.
        Visible aC.Visible=aP.Visible end if aP.Opened~=nil then aB.Settings.Opened=aP.
        Opened aN(aP.Opened)end if aP.Name then aB.Settings.Name=aP.Name aE.Text=aP.Name
        end end if aB.Settings.Closed==nil then aB.Settings.Closed=true end aB:
        UpdateSettings(aB.Settings)if aA then d.Components[aA]=aB end aB.Content=aG
        injectComponents(aB)return aB end ao.Content=aw injectComponents(ao)return ao
        end function ac:VisualPreview(an)local ao={N,O,Q,P,S,R,M,L}if an.Enabled~=nil
        then local ap=an.Enabled I.Visible=ap ah.Visible=ap aj.Visible=ap ai.Visible=ap
        V.Visible=ap Z.Visible=ap X.Visible=ap K.Visible=ap for aq,ar in ipairs(ao)do ar
        .Visible=ap end if not ap then return end end if an.Visible~=nil then y.Visible=
        an.Visible end if an.HealthBar then if an.HealthBar.Visible~=nil then I.Visible=
        an.HealthBar.Visible end if an.HealthBar.Color then I.BackgroundColor3=an.
        HealthBar.Color[1]or I.BackgroundColor3 if an.HealthBar.Color[2]~=nil then I.
        Transparency=1-an.HealthBar.Color[2]end end end if an.Distance then if an.
        Distance.Visible~=nil then ah.Visible=an.Distance.Visible end if an.Distance.
        Color then ah.TextColor3=an.Distance.Color[1]or ah.TextColor3 if an.Distance.
        Color[2]~=nil then ah.TextTransparency=1-an.Distance.Color[2]end end end if an.
        Health then if an.Health.Visible~=nil then aj.Visible=an.Health.Visible end if
        an.Health.Color then aj.TextColor3=an.Health.Color[1]or aj.TextColor3 if an.
        Health.Color[2]~=nil then aj.TextTransparency=1-an.Health.Color[2]end end end if
        an.Weapon then if an.Weapon.Visible~=nil then ai.Visible=an.Weapon.Visible end
        if an.Weapon.Color then ai.TextColor3=an.Weapon.Color[1]or ai.TextColor3 if an.
        Weapon.Color[2]~=nil then ai.TextTransparency=1-an.Weapon.Color[2]end end end if
        an.Name then if an.Name.Visible~=nil then V.Visible=an.Name.Visible end if an.
        Name.Color then V.TextColor3=an.Name.Color[1]or V.TextColor3 if an.Name.Color[2]
        ~=nil then V.TextTransparency=1-an.Name.Color[2]end end end if an.FillBox then
        if an.FillBox.Visible~=nil then Z.Visible=an.FillBox.Visible end if an.FillBox.
        Color then Z.BackgroundColor3=an.FillBox.Color[1]or Z.BackgroundColor3 if an.
        FillBox.Color[2]~=nil then Z.BackgroundTransparency=1-an.FillBox.Color[2]end end
        end if an.BoundingBox then if an.BoundingBox.Visible~=nil then X.Visible=an.
        BoundingBox.Visible end if an.BoundingBox.Color then Y.Color=an.BoundingBox.
        Color[1]or Y.Color if an.BoundingBox.Color[2]~=nil then Y.Transparency=1-an.
        BoundingBox.Color[2]end end end if an.CornerBox then if an.CornerBox.Visible~=
        nil then K.Visible=an.CornerBox.Visible end if an.CornerBox.Color then for ap,aq
        in ipairs(ao)do aq.BackgroundColor3=an.CornerBox.Color[1]or aq.BackgroundColor3
        if an.CornerBox.Color[2]~=nil then aq.BackgroundTransparency=1-an.CornerBox.
        Color[2]end end end end end return ac end function d:Notification(ab)local ac={
        Settings=ab}assert(ac.Settings.Title and type(ac.Settings.Title)=='string',
        'Missing notification title or wrong type')local ad=Instance.new'ImageButton'ad.
        AnchorPoint=Vector2.new(1,1)ad.AutoButtonColor=false ad.AutomaticSize=Enum.
        AutomaticSize.Y ad.BackgroundColor3=Color3.fromRGB(17,17,17)ad.BorderColor3=
        Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.Image='rbxassetid://17365187482'ad.
        ImageTransparency=0.96 ad.Position=UDim2.fromScale(1,1)ad.ScaleType=Enum.
        ScaleType.Tile ad.Size=UDim2.fromOffset(280,0)ad.TileSize=UDim2.fromOffset(500,
        325)ad.Position=UDim2.new(1,(ad.AbsoluteSize.X+(e.notifSystem.uIpadding and e.
        notifSystem.uIpadding.PaddingRight.Offset or 0)),1,0)local ae=Instance.new
        'Frame'ae.AutomaticSize=Enum.AutomaticSize.Y ae.BackgroundColor3=Color3.fromRGB(
        255,255,255)ae.BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.
        BorderSizePixel=0 ae.Size=UDim2.fromScale(1,0)local af=Instance.new'UIPadding'af
        .PaddingBottom=UDim.new(0,13)af.PaddingLeft=UDim.new(0,13)af.PaddingRight=UDim.
        new(0,ac.Settings.Image and 42 or 13)af.PaddingTop=UDim.new(0,13)af.Parent=ae
        local ag=Instance.new'UIListLayout'ag.Padding=UDim.new(0,5)ag.SortOrder=Enum.
        SortOrder.LayoutOrder ag.VerticalAlignment=Enum.VerticalAlignment.Center ag.
        Parent=ae local ah=Instance.new'Frame'ah.AutomaticSize=Enum.AutomaticSize.Y ah.
        BackgroundColor3=Color3.fromRGB(255,255,255)ah.BackgroundTransparency=1 ah.
        BorderColor3=Color3.fromRGB(0,0,0)ah.BorderSizePixel=0 ah.Size=UDim2.fromScale(1
        ,0)local ai=Instance.new'UIListLayout'ai.FillDirection=Enum.FillDirection.
        Horizontal ai.Padding=UDim.new(0,13)ai.SortOrder=Enum.SortOrder.LayoutOrder ai.
        Parent=ah local aj=Instance.new'ImageLabel'aj.BackgroundColor3=Color3.fromRGB(
        255,255,255)aj.BackgroundTransparency=1 aj.BorderColor3=Color3.fromRGB(0,0,0)aj.
        BorderSizePixel=0 aj.ImageColor3=Color3.fromRGB(225,225,225)aj.ScaleType=Enum.
        ScaleType.Fit aj.Size=UDim2.fromOffset(16,16)aj.Parent=ah aj.Visible=ac.Settings
        .Image and ac.Settings.Image~=''aj.Image=ac.Settings.Image or''local ak=Instance
        .new'Frame'ak.AutomaticSize=Enum.AutomaticSize.Y ak.BackgroundColor3=Color3.
        fromRGB(255,255,255)ak.BackgroundTransparency=1 ak.BorderColor3=Color3.fromRGB(0
        ,0,0)ak.BorderSizePixel=0 ak.LayoutOrder=1 ak.Size=UDim2.fromScale(1,0)local al=
        Instance.new'UIListLayout'al.Padding=UDim.new(0,5)al.SortOrder=Enum.SortOrder.
        LayoutOrder al.VerticalAlignment=Enum.VerticalAlignment.Center al.Parent=ak
        local am=Instance.new'TextLabel'am.AutomaticSize=Enum.AutomaticSize.Y am.
        BackgroundColor3=Color3.fromRGB(255,255,255)am.BackgroundTransparency=1 am.
        BorderColor3=Color3.fromRGB(0,0,0)am.BorderSizePixel=0 am.FontFace=Font.new(
        'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)am.
        LayoutOrder=1 am.RichText=true am.Size=UDim2.fromScale(1,0)am.TextColor3=Color3.
        fromRGB(225,225,225)am.TextSize=16 am.TextWrapped=true am.TextXAlignment=Enum.
        TextXAlignment.Left am.TextYAlignment=Enum.TextYAlignment.Top am.Parent=ak am.
        Text=ac.Settings.Title local an=Instance.new'TextLabel'an.AutomaticSize=Enum.
        AutomaticSize.Y an.BackgroundColor3=Color3.fromRGB(255,255,255)an.
        BackgroundTransparency=1 an.BorderColor3=Color3.fromRGB(0,0,0)an.BorderSizePixel
        =0 an.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.
        FontStyle.Normal)an.LayoutOrder=1 an.RichText=true an.Size=UDim2.fromScale(1,0)
        an.TextColor3=Color3.fromRGB(100,100,100)an.TextSize=14 an.TextWrapped=true an.
        TextXAlignment=Enum.TextXAlignment.Left an.TextYAlignment=Enum.TextYAlignment.
        Top an.Parent=ak an.Visible=ac.Settings.Description and true or false an.Text=ac
        .Settings.Description or''local ao=Instance.new'UIPadding'ao.PaddingTop=UDim.
        new(0,-1)ao.Parent=ak ak.Parent=ah local ap=Instance.new'UIPadding'ap.PaddingTop
        =UDim.new(0,1)ap.Parent=ah ah.Parent=ae ae.Parent=ad table.insert(e.notifSystem.
        notifInstances,ad)ad.Parent=e.notifSystem.notifications local aq=Instance.new
        'UICorner'aq.CornerRadius=UDim.new(0,15)aq.Parent=ad g.tween(ad,TweenInfo.new(
        0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,0,1,0)}):Play()if ac.
        Settings.Lifetime and ac.Settings.Lifetime>0 then task.delay(ac.Settings.
        Lifetime,function()ac:Cancel()end)end function ac:Cancel()local ar=table.find(e.
        notifSystem.notifInstances,ad)if not ar then return end table.remove(e.
        notifSystem.notifInstances,ar)task.spawn(function()g.tween(ad,TweenInfo.new(0.25
        ,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,ad.AbsoluteSize.X+(e.
        notifSystem.uIpadding and e.notifSystem.uIpadding.PaddingRight.Offset or 0),1,ad
        .Position.Y.Offset)}):Play()end)task.delay(0.25,function()ad:Destroy()end)for as
        =ar-1,1,-1 do task.spawn(function()local at=e.notifSystem.notifInstances[as]g.
        tween(at,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=at.Position+
        UDim2.new(0,0,0,ad.AbsoluteSize.Y+(e.notifSystem.uIpadding and e.notifSystem.
        uIpadding.PaddingBottom.Offset or 0))}):Play()end)end end return ac end function
        d:Unload()e.gui:Destroy()end e.localPlayer=f._players.LocalPlayer local ab=
        function()e.camera=f._workspace.CurrentCamera end ab()f._workspace:
        GetPropertyChangedSignal'CurrentCamera':Connect(ab)e.gui=g.secureGui{
        OnTopOfCoreBlur=true,ScreenInsets=Enum.ScreenInsets.None,ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=2147483647}e.overlay=
        Instance.new('Frame',e.gui)e.overlay.BackgroundColor3=Color3.fromRGB(255,255,255
        )e.overlay.BackgroundTransparency=1 e.overlay.BorderColor3=Color3.fromRGB(0,0,0)
        e.overlay.BorderSizePixel=0 e.overlay.Size=UDim2.fromScale(1,1)e.overlay.Parent=
        e.gui e.notifSystem.notifications=Instance.new('Frame',e.gui)e.notifSystem.
        notifications.BackgroundColor3=Color3.fromRGB(255,255,255)e.notifSystem.
        notifications.BackgroundTransparency=1 e.notifSystem.notifications.BorderColor3=
        Color3.fromRGB(0,0,0)e.notifSystem.notifications.BorderSizePixel=0 e.notifSystem
        .notifications.Size=UDim2.fromScale(1,1)e.notifSystem.notifications.ZIndex=2 e.
        notifSystem.uIpadding=Instance.new('UIPadding',e.notifSystem.notifications)e.
        notifSystem.uIpadding.PaddingBottom=UDim.new(0,15)e.notifSystem.uIpadding.
        PaddingLeft=UDim.new(0,15)e.notifSystem.uIpadding.PaddingRight=UDim.new(0,15)e.
        notifSystem.uIpadding.PaddingTop=UDim.new(0,15)local ac=function(ac)local ad=
        table.find(e.notifSystem.notifInstances,ac)if ad then for ae,af in pairs(e.
        notifSystem.notifInstances)do if ae~=ad then g.tween(af,TweenInfo.new(0.25,Enum.
        EasingStyle.Exponential),{Position=af.Position-UDim2.new(0,0,0,e.notifSystem.
        notifInstances[ad].AbsoluteSize.Y+10)}):Play()end end end end e.notifSystem.
        notifications.ChildAdded:Connect(ac)return d end function a.c()local aa=a.load
        'a'local ab=aa.SecureService local ac,ad,ae,af,ag=ab'RunService',ab'Players',ab
        'Workspace',ab'UserInputService',gethui and gethui()or ab'CoreGui'local ah,ai=ad
        .LocalPlayer,ae.CurrentCamera local aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax
        ,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ=ai.ViewportSize,math.floor,math.round,math.
        sin,math.cos,table.clear,table.unpack,table.find,table.create,CFrame.fromMatrix,
        ai.WorldToViewportPoint,ae.IsA,ae.GetPivot,ae.FindFirstChild,ae.
        FindFirstChildOfClass,ae.GetChildren,CFrame.identity.PointToObjectSpace,Color3.
        new().Lerp,Vector2.zero.Min,Vector2.zero.Max,Vector2.zero.Lerp,Vector3.zero.Min,
        Vector3.zero.Max,Vector2.new(0,1),Vector2.new(0,2),Vector2.new(5,0),{Vector3.
        new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),Vector3.new(-1,-1,1),
        Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3.new(1,-1,1)}
        local aK,aL=function(aK)local aL,aM for aN=1,#aK do local aO=aK[aN]local aP,aQ=
        aO.CFrame,aO.Size aL=aE(aL or aP.Position,(aP-aQ*0.5).Position)aM=aF(aM or aP.
        Position,(aP+aQ*0.5).Position)end local aN=(aL+aM)*0.5 local aO=Vector3.new(aN.X
        ,aN.Y,aM.Z)return CFrame.new(aN,aO),aM-aL end,function(aK)local aL,aM=at(ai,aK)
        return Vector2.new(aL.X,aL.Y),aM,aL.Z end local aM,aN,aO,aP=function(aM,aN)local
        aO=ar(#aJ)for aP=1,#aJ do aO[aP]=aL((aM+aN*0.5*aJ[aP]).Position)end local aP,aQ=
        aB(aj,ap(aO)),aC(Vector2.zero,ap(aO))return{Corners=aO,TopLeft=Vector2.new(ak(aP
        .X),ak(aP.Y)),TopRight=Vector2.new(ak(aQ.X),ak(aP.Y)),BottomLeft=Vector2.new(ak(
        aP.X),ak(aQ.Y)),BottomRight=Vector2.new(ak(aQ.X),ak(aQ.Y))}end,function(aM,aN)
        local aO,aP,aQ,aR=aM.X,aM.Y,an(aN),am(aN)return Vector2.new(aO*aQ-aP*aR,aO*aR+aP
        *aQ)end,function(aM,aN,aO)if aN=='Team Color'or(aM.Interface.Shared.UseTeamColor
        and not aO)then return aM.Interface.GetTeamColor(aM.Player)or Color3.new(1,1,1)
        end return aN end,{}aP.__index=aP function aP.New(aQ,aR)local b=setmetatable({},
        aP)b.Player=assert(aQ,'Missing argument #1 (Player expected)')b.Interface=
        assert(aR,'Missing argument #2 (table expected)')b:Construct()return b end
        function aP:_Create(aQ,aR)local b=Drawing.new(aQ)for c,d in next,aR do pcall(
        function()b[c]=d end)end self.Bin[#self.Bin+1]=b return b end function aP:
        Construct()self.CharCache={}self.ChildCount=0 self.Bin={}self.Drawings={Box3d={{
        self:_Create('Line',{Thickness=1,Visible=false}),self:_Create('Line',{Thickness=
        1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=false})},{self:
        _Create('Line',{Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,
        Visible=false}),self:_Create('Line',{Thickness=1,Visible=false})},{self:_Create(
        'Line',{Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=
        false}),self:_Create('Line',{Thickness=1,Visible=false})},{self:_Create('Line',{
        Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=false}),
        self:_Create('Line',{Thickness=1,Visible=false})}},Visible={TracerOutline=self:
        _Create('Line',{Thickness=2,Visible=false}),Tracer=self:_Create('Line',{
        Thickness=1,Visible=false}),BoxFill=self:_Create('Square',{Filled=true,Visible=
        false}),BoxOutline=self:_Create('Square',{Thickness=2,Visible=false}),Box=self:
        _Create('Square',{Thickness=1,Visible=false}),CornerBox={},HealthBarOutline=self
        :_Create('Line',{Thickness=6,Visible=false}),HealthBar=self:_Create('Line',{
        Thickness=4,Visible=false}),HealthText=self:_Create('Text',{Center=true,Visible=
        false}),Name=self:_Create('Text',{Text=string.upper(self.Player.DisplayName),
        Center=true,Visible=false}),Distance=self:_Create('Text',{Center=true,Visible=
        false}),Weapon=self:_Create('Text',{Center=true,Visible=false}),Skeleton={Head=
        self:_Create('Circle',{NumSides=30,Thickness=1,Visible=false})}},Hidden={
        ArrowOutline=self:_Create('Triangle',{Thickness=3,Visible=false}),Arrow=self:
        _Create('Triangle',{Filled=true,Visible=false})}}for aQ=1,8 do table.insert(self
        .Drawings.Visible.CornerBox,self:_Create('Line',{Thickness=2,Visible=false}))end
        for aQ=1,14 do self.Drawings.Visible.Skeleton[aQ]=self:_Create('Line',{Thickness
        =1,Visible=false})end self.RenderConnection=ac.RenderStepped:Connect(function(aQ
        )self:Update(aQ)self:Render(aQ)end)end function aP:Destruct()self.
        RenderConnection:Disconnect()for aQ=1,#self.Bin do self.Bin[aQ]:Remove()end ao(
        self)end function aP:Update()local aQ=self.Interface self.Options=aQ.Team[aQ.
        IsFriendly(self.Player)and'Friendly'or'Enemy']self.Character=aQ.GetCharacter(
        self.Player)self.Health,self.MaxHealth=aQ.GetHealth(self.Player)self.Weapon=aQ.
        GetWeapon(self.Player)self.Enabled=self.Options.Enabled and self.Character and
        not(#aQ.Whitelist>0 and not aq(aQ.Whitelist,self.Player.UserId))local aR=self.
        Enabled and aw(self.Character,aQ.GetRootPart())if not aR then self.CharCache={}
        self.OnScreen=false return end local b,c,d=aL(aR.Position)self.OnScreen=c self.
        Distance=d if aQ.Shared.LimitDistance and d>aQ.Shared.MaxDistance then self.
        OnScreen=false end if self.OnScreen then local e,f=self.CharCache,ay(self.
        Character)if not e[1]or self.ChildCount~=#f then ao(e)for g=1,#f do local h=f[g]
        if au(h,'BasePart')and aQ.IsBodyPart(h.Name)then e[#e+1]=h end end self.
        ChildCount=#f end self.Corners=aM(aK(e))elseif self.Options.OffScreenArrow then
        local e=ai.CFrame local f=as(e.Position,e.RightVector,Vector3.yAxis)local g=az(f
        ,aR.Position)self.Direction=Vector2.new(g.X,g.Z).Unit end end function aP:Render
        ()local aQ,aR=self.Interface,self.OnScreen or false local b,c,d,e,f,g,h=self.
        Enabled and aQ.GetHealth()>0 or false,self.Drawings.Visible,self.Drawings.Hidden
        ,self.Drawings.Box3d,self.Interface,self.Options,self.Corners c.Box.Visible=b
        and aR and g.Box c.BoxOutline.Visible=c.Box.Visible and g.BoxOutline if c.Box.
        Visible then local i=c.Box i.Position=h.TopLeft i.Size=h.BottomRight-h.TopLeft i
        .Color=aO(self,g.BoxColor[1])i.Transparency=g.BoxColor[2]local j=c.BoxOutline j.
        Position=i.Position j.Size=i.Size j.Color=aO(self,g.BoxOutlineColor[1],true)j.
        Transparency=g.BoxOutlineColor[2]end local i=b and aR and g.CornerBox for j=1,8
        do local k=c.CornerBox[j]k.Visible=i end if i then local j,k=(h.TopRight.X-h.
        TopLeft.X)*0.2,(h.BottomLeft.Y-h.TopLeft.Y)*0.2 j=math.clamp(j,2,30)k=math.
        clamp(k,2,30)local l=function(l,o,r,s)local t,u=c.CornerBox[l],c.CornerBox[l+1]
        local v=t.Thickness or 1 local w=(v-1)local x,y=w/2,r.Unit*(r.Magnitude+w)t.From
        =o-r.Unit*x t.To=o+y-r.Unit*x t.Color=aO(self,g.CornerBoxColor[1])t.Transparency
        =g.CornerBoxColor[2]local z=s.Unit*(s.Magnitude+w)u.From=o-s.Unit*x u.To=o+z-s.
        Unit*x u.Color=aO(self,g.CornerBoxColor[1])u.Transparency=g.CornerBoxColor[2]end
        l(1,h.TopLeft,Vector2.new(j,0),Vector2.new(0,k))l(3,h.TopRight,Vector2.new(-j,0)
        ,Vector2.new(0,k))l(5,h.BottomRight,Vector2.new(-j,0),Vector2.new(0,-k))l(7,h.
        BottomLeft,Vector2.new(j,0),Vector2.new(0,-k))end c.BoxFill.Visible=b and aR and
        g.BoxFill if c.BoxFill.Visible then local j=c.BoxFill j.Position=h.TopLeft j.
        Size=h.BottomRight-h.TopLeft j.Color=aO(self,g.BoxFillColor[1])j.Transparency=g.
        BoxFillColor[2]end c.HealthBar.Visible=b and aR and g.HealthBar c.
        HealthBarOutline.Visible=c.HealthBar.Visible and g.HealthBarOutline if c.
        HealthBar.Visible then local j=math.clamp((h.TopRight.X-h.TopLeft.X)*0.03,1,10)
        local k=Vector2.new((j+3),0)local l,o,r=h.TopLeft-k,h.BottomLeft-k,c.HealthBar r
        .To=o r.From=aD(o,l,self.Health/self.MaxHealth)r.Color=aA(g.DyingColor,g.
        HealthyColor,self.Health/self.MaxHealth)r.Thickness=j local s=c.HealthBarOutline
        s.To=o+aG s.From=l-aG s.Color=aO(self,g.HealthBarOutlineColor[1],true)s.
        Transparency=g.HealthBarOutlineColor[2]s.Thickness=r.Thickness+2 end c.Name.
        Visible=b and aR and g.Name if c.Name.Visible then local j=c.Name j.Size=f.
        Shared.TextSize j.Font=f.Shared.TextFont j.Color=aO(self,g.NameColor[1])j.
        Transparency=g.NameColor[2]j.Outline=g.NameOutline j.OutlineColor=aO(self,g.
        NameOutlineColor,true)j.Position=(h.TopLeft+h.TopRight)*0.5-Vector2.yAxis*j.
        TextBounds.Y-aH end local j=h and h.TopRight.Y or 0 c.Distance.Visible=b and aR
        and self.Distance and g.Distance if c.Distance.Visible then local k=c.Distance k
        .Text=al(self.Distance*0.28)..'M'k.Size=f.Shared.TextSize k.Font=f.Shared.
        TextFont k.Color=aO(self,g.DistanceColor[1])k.Transparency=g.DistanceColor[2]k.
        Outline=g.DistanceOutline k.OutlineColor=aO(self,g.DistanceOutlineColor,true)k.
        Position=Vector2.new(h.TopRight.X+aI.X+k.TextBounds.X*0.5,j-k.TextBounds.Y*0.5-
        aI.Y)j=j+k.TextBounds.Y+aI.Y end c.Weapon.Visible=b and aR and g.Weapon if c.
        Weapon.Visible then local k=c.Weapon k.Text=self.Weapon k.Size=f.Shared.TextSize
        k.Font=f.Shared.TextFont k.Color=aO(self,g.WeaponColor[1])k.Transparency=g.
        WeaponColor[2]k.Outline=g.WeaponOutline k.OutlineColor=aO(self,g.
        WeaponOutlineColor,true)k.Position=Vector2.new(h.TopRight.X+aI.X+k.TextBounds.X*
        0.5,j-k.TextBounds.Y*0.5)j=j+k.TextBounds.Y+aI.Y end c.HealthText.Visible=b and
        aR and g.HealthText if c.HealthText.Visible then local k=c.HealthText k.Text=(
        self.Health>=(2147483647)and'INF 'or al(self.Health))..'HP'k.Size=f.Shared.
        TextSize k.Font=f.Shared.TextFont k.Color=aO(self,g.HealthTextColor[1])k.
        Transparency=g.HealthTextColor[2]k.Outline=g.HealthTextOutline k.OutlineColor=
        aO(self,g.HealthTextOutlineColor,true)k.Position=Vector2.new(h.TopRight.X+aI.X+k
        .TextBounds.X*0.5,j-k.TextBounds.Y*0.5)end c.Tracer.Visible=b and aR and g.
        Tracer c.TracerOutline.Visible=c.Tracer.Visible and g.TracerOutline if c.Tracer.
        Visible then local k=c.Tracer k.Color=aO(self,g.TracerColor[1])k.Transparency=g.
        TracerColor[2]k.To=(h.BottomLeft+h.BottomRight)*0.5 k.From=g.TracerOrigin==
        'Middle'and aj*0.5 or g.TracerOrigin=='Top'and aj*Vector2.new(0.5,0)or g.
        TracerOrigin=='Bottom'and aj*Vector2.new(0.5,1)or g.TracerOrigin=='Mouse'and af:
        GetMouseLocation()local l=c.TracerOutline l.Color=aO(self,g.TracerOutlineColor[1
        ],true)l.Transparency=g.TracerOutlineColor[2]l.To=k.To l.From=k.From end d.Arrow
        .Visible=b and not aR and g.OffScreenArrow d.ArrowOutline.Visible=d.Arrow.
        Visible and g.OffScreenArrowOutline if d.Arrow.Visible and self.Direction then
        local k=d.Arrow k.PointA=aB(aC(aj*0.5+self.Direction*g.OffScreenArrowRadius,
        Vector2.one*25),aj-Vector2.one*25)k.PointB=k.PointA-aN(self.Direction,0.45)*g.
        OffScreenArrowSize k.PointC=k.PointA-aN(self.Direction,-0.45)*g.
        OffScreenArrowSize k.Color=aO(self,g.OffScreenArrowColor[1])k.Transparency=g.
        OffScreenArrowColor[2]local l=d.ArrowOutline l.PointA=k.PointA l.PointB=k.PointB
        l.PointC=k.PointC l.Color=aO(self,g.OffScreenArrowOutlineColor[1],true)l.
        Transparency=g.OffScreenArrowOutlineColor[2]end local k=b and aR and g.Box3d for
        l=1,#e do local o=e[l]for r=1,#o do local s=o[r]s.Visible=k s.Color=aO(self,g.
        Box3dColor[1])s.Transparency=g.Box3dColor[2]end if k then local r=o[1]r.From=h.
        Corners[l]r.To=h.Corners[l==4 and 1 or l+1]local s=o[2]s.From=h.Corners[l==4 and
        1 or l+1]s.To=h.Corners[l==4 and 5 or l+5]local t=o[3]t.From=h.Corners[l==4 and
        5 or l+5]t.To=h.Corners[l==4 and 8 or l+4]end end local l=b and aR and g.
        Skeleton if l then local o,r=f.GetJoints(self.Character)local s=c.Skeleton.Head
        s.Visible=false if o.Head then local t,u=aL(o.Head.Position)if u then s.Visible=
        true s.Position=t s.Radius=math.clamp((h.TopRight.X-h.TopLeft.X)*0.1,2,50)s.
        Thickness=g.SkeletonThickness s.Color=aO(self,g.SkeletonColor[1])s.Transparency=
        g.SkeletonColor[2]end end for t,u in ipairs(r)do local v=c.Skeleton[t]v.Visible=
        false local w,x=u[1],u[2]if w and x then local y,z=aL(w==o.Head and w.Position-
        Vector3.new(0,w.Size.Y/2,0)or w.Position)local A,B=aL(x.Position)if z and B then
        v.Visible=true v.From=y v.To=A v.Thickness=g.SkeletonThickness v.Color=aO(self,g
        .SkeletonColor[1])v.Transparency=g.SkeletonColor[2]end end end else c.Skeleton.
        Head.Visible=false for o,r in ipairs(c.Skeleton)do if type(r)=='table'then
        continue end r.Visible=false end end end local aR={}aR.__index=aR function aR.
        New(b,c)local d=setmetatable({},aR)d.Player=assert(b,
        'Missing argument #1 (Player expected)')d.Interface=assert(c,
        'Missing argument #2 (table expected)')d:Construct()return d end function aR:
        Construct()self.Highlight=Instance.new'Highlight'self.UpdateConnection=ac.
        RenderStepped:Connect(function()self:Update()end)end function aR:Destruct()self.
        UpdateConnection:Disconnect()self.Highlight:Destroy()ao(self)end function aR:
        Update()local b,c=self.Highlight,self.Interface local d,e=c.GetCharacter(self.
        Player),c.Team[c.IsFriendly(self.Player)and'Friendly'or'Enemy']local f=e.Enabled
        and d and not(#c.Whitelist>0 and not aq(c.Whitelist,self.Player.UserId))b.
        Enabled=f and e.Chams if b.Enabled then b.Adornee=d b.FillColor=aO(self,e.
        ChamsFillColor[1])b.FillTransparency=e.ChamsFillColor[2]b.OutlineColor=aO(self,e
        .ChamsOutlineColor[1],true)b.OutlineTransparency=e.ChamsOutlineColor[2]b.
        DepthMode=e.ChamsVisibleOnly and'Occluded'or'AlwaysOnTop'b.Parent=ag end end
        local b={}b.__index=b function b.New(c,d)local e=setmetatable({},b)e.Instance=
        assert(c,'Missing argument #1 (Instance Expected)')e.Options=assert(d,
        'Missing argument #2 (table expected)')e:Construct()return e end function b:
        Construct()local c=self.Options c.Enabled=c.Enabled==nil and true or c.Enabled c
        .Text=c.Text or'{name}'c.TextColor=c.TextColor or{Color3.new(1,1,1),1}c.
        TextOutline=c.TextOutline==nil and true or c.TextOutline c.TextOutlineColor=c.
        TextOutlineColor or Color3.new()c.TextSize=c.TextSize or 13 c.TextFont=c.
        TextFont or 2 c.LimitDistance=c.LimitDistance or false c.MaxDistance=c.
        MaxDistance or 150 self.Text=Drawing.new'Text'self.Text.Center=true self.
        RenderConnection=ac.Stepped:Connect(function(d)self:Render(d)end)end function b:
        Destruct()self.RenderConnection:Disconnect()self.Text:Remove()end function b:
        Render()local c=self.Instance if not c or not c.Parent then return self:
        Destruct()end local d,e=self.Text,self.Options if not e.Enabled then d.Visible=
        false return end local f=av(c).Position local g,h,i=aL(f)if e.LimitDistance and
        i>e.MaxDistance then h=false end d.Visible=h if d.Visible then d.Position=g d.
        Color=e.TextColor[1]d.Transparency=e.TextColor[2]d.Outline=e.TextOutline d.
        OutlineColor=e.TextOutlineColor d.Size=e.TextSize d.Font=e.TextFont d.Text=e.
        Text:gsub('{name}',string.upper(c.Name)):gsub('{distance}',al(i*0.28)..'M'):
        gsub('{position}',string.upper(tostring(f)))end return nil end local c={
        HasLoaded=false,ObjectCache={},Whitelist={},Shared={TextSize=13,TextFont=2,
        LimitDistance=false,MaxDistance=150,UseTeamColor=false,IncludeLocalPlayer=false}
        ,Team={Enemy={Enabled=false,Box=false,BoxColor={Color3.new(1,0,0),1},BoxOutline=
        true,BoxOutlineColor={Color3.new(),1},BoxFill=false,BoxFillColor={Color3.new(1,0
        ,0),0.5},CornerBox=false,CornerBoxColor={Color3.new(1,1,1),1},HealthBar=false,
        HealthyColor=Color3.fromRGB(58,161,47),DyingColor=Color3.fromRGB(161,47,47),
        HealthBarOutline=true,HealthBarOutlineColor={Color3.new(),0.5},HealthText=false,
        HealthTextColor={Color3.new(1,1,1),1},HealthTextOutline=true,
        HealthTextOutlineColor=Color3.new(),Box3d=false,Box3dColor={Color3.new(1,0,0),1}
        ,Name=false,NameColor={Color3.new(1,1,1),1},NameOutline=true,NameOutlineColor=
        Color3.new(),Weapon=false,WeaponColor={Color3.new(1,1,1),1},WeaponOutline=true,
        WeaponOutlineColor=Color3.new(),Distance=false,DistanceColor={Color3.new(1,1,1),
        1},DistanceOutline=true,DistanceOutlineColor=Color3.new(),Tracer=false,
        TracerOrigin='Bottom',TracerColor={Color3.new(1,0,0),1},TracerOutline=true,
        TracerOutlineColor={Color3.new(),1},OffScreenArrow=false,OffScreenArrowColor={
        Color3.new(1,1,1),1},OffScreenArrowSize=15,OffScreenArrowRadius=150,
        OffScreenArrowOutline=true,OffScreenArrowOutlineColor={Color3.new(),1},Chams=
        false,ChamsVisibleOnly=false,ChamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
        ChamsOutlineColor={Color3.new(1,0,0),0},Skeleton=false,SkeletonThickness=1,
        SkeletonColor={Color3.new(1,0,0),1}},Friendly={Enabled=false,Box=false,BoxColor=
        {Color3.new(0,1,0),1},BoxOutline=true,BoxOutlineColor={Color3.new(),1},BoxFill=
        false,BoxFillColor={Color3.new(0,1,0),0.5},CornerBox=false,CornerBoxColor={
        Color3.new(1,1,1),1},HealthBar=false,HealthyColor=Color3.new(0,1,0),DyingColor=
        Color3.new(1,0,0),HealthBarOutline=true,HealthBarOutlineColor={Color3.new(),0.5}
        ,HealthText=false,HealthTextColor={Color3.new(1,1,1),1},HealthTextOutline=true,
        HealthTextOutlineColor=Color3.new(),Box3d=false,Box3dColor={Color3.new(0,1,0),1}
        ,Name=false,NameColor={Color3.new(1,1,1),1},NameOutline=true,NameOutlineColor=
        Color3.new(),Weapon=false,WeaponColor={Color3.new(1,1,1),1},WeaponOutline=true,
        WeaponOutlineColor=Color3.new(),Distance=false,DistanceColor={Color3.new(1,1,1),
        1},DistanceOutline=true,DistanceOutlineColor=Color3.new(),Tracer=false,
        TracerOrigin='Bottom',TracerColor={Color3.new(0,1,0),1},TracerOutline=true,
        TracerOutlineColor={Color3.new(),1},OffScreenArrow=false,OffScreenArrowColor={
        Color3.new(1,1,1),1},OffScreenArrowSize=15,OffScreenArrowRadius=150,
        OffScreenArrowOutline=true,OffScreenArrowOutlineColor={Color3.new(),1},Chams=
        false,ChamsVisibleOnly=false,ChamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
        ChamsOutlineColor={Color3.new(0,1,0),0},Skeleton=false,SkeletonColor={Color3.
        new(0,1,0),1}}}}function c.AddInstance(d,e)local f=c.ObjectCache if f[d]then
        warn'Instance handler already exists.'else f[d]={b.New(d,e)}end return f[d][1]
        end function c.Load()assert(not c.HasLoaded,'Esp has already been loaded.')local
        d,e,f=function(d)c.ObjectCache[d]={aP.New(d,c),aR.New(d,c)}end,function(d)local
        e=c.ObjectCache[d]if e then for f=1,#e do e[f]:Destruct()end c.ObjectCache[d]=
        nil end end,ad:GetPlayers()for g=c.Shared.IncludeLocalPlayer and 1 or 2,#f do d(
        f[g])end c.PlayerAdded=ad.PlayerAdded:Connect(d)c.PlayerRemoving=ad.
        PlayerRemoving:Connect(e)c.HasLoaded=true end function c.Unload()assert(c.
        HasLoaded,'Esp has not been loaded yet.')for d,e in next,c.ObjectCache do for f=
        1,#e do e[f]:Destruct()end c.ObjectCache[d]=nil end c.PlayerAdded:Disconnect()c.
        PlayerRemoving:Disconnect()c.HasLoaded=false end function c.GetWeapon(d)local e=
        'None'if d and d.Character then local f=d.Character:FindFirstChildOfClass'Tool'
        if f then e=f.Name end end return string.upper(e)end function c.IsFriendly(d)
        return d.Team and d.Team==ah.Team end function c.GetTeamColor(d)return d.Team
        and d.Team.TeamColor and d.Team.TeamColor.Color end function c.GetCharacter(d)
        return d.Character end function c.IsBodyPart(d)return d=='Head'or d:find'Torso'
        or d:find'Leg'or d:find'Arm'end function c.GetRootPart()return'HumanoidRootPart'
        end function c.GetHealth(d)local e=d and c.GetCharacter(d)local f=e and ax(e,
        'Humanoid')if f then return f.Health,f.MaxHealth end return 100,100 end function
        c.GetJoints(d)local e={Head=d:FindFirstChild'Head',UpperTorso=d:FindFirstChild
        'UpperTorso'or d:FindFirstChild'Torso',LowerTorso=d:FindFirstChild'LowerTorso'or
        d:FindFirstChild'Torso',LeftUpperArm=d:FindFirstChild'LeftUpperArm'or d:
        FindFirstChild'Left Arm',LeftLowerArm=d:FindFirstChild'LeftLowerArm'or d:
        FindFirstChild'Left Arm',LeftHand=d:FindFirstChild'LeftHand'or d:FindFirstChild
        'Left Arm',RightUpperArm=d:FindFirstChild'RightUpperArm'or d:FindFirstChild
        'Right Arm',RightLowerArm=d:FindFirstChild'RightLowerArm'or d:FindFirstChild
        'Right Arm',RightHand=d:FindFirstChild'RightHand'or d:FindFirstChild'Right Arm',
        LeftUpperLeg=d:FindFirstChild'LeftUpperLeg'or d:FindFirstChild'Left Leg',
        LeftLowerLeg=d:FindFirstChild'LeftLowerLeg'or d:FindFirstChild'Left Leg',
        LeftFoot=d:FindFirstChild'LeftFoot'or d:FindFirstChild'Left Leg',RightUpperLeg=d
        :FindFirstChild'RightUpperLeg'or d:FindFirstChild'Right Leg',RightLowerLeg=d:
        FindFirstChild'RightLowerLeg'or d:FindFirstChild'Right Leg',RightFoot=d:
        FindFirstChild'RightFoot'or d:FindFirstChild'Right Leg'}local f={{e.Head,e.
        UpperTorso},{e.UpperTorso,e.LowerTorso},{e.UpperTorso,e.LeftUpperArm},{e.
        LeftUpperArm,e.LeftLowerArm},{e.LeftLowerArm,e.LeftHand},{e.UpperTorso,e.
        RightUpperArm},{e.RightUpperArm,e.RightLowerArm},{e.RightLowerArm,e.RightHand},{
        e.LowerTorso,e.LeftUpperLeg},{e.LeftUpperLeg,e.LeftLowerLeg},{e.LeftLowerLeg,e.
        LeftFoot},{e.LowerTorso,e.RightUpperLeg},{e.RightUpperLeg,e.RightLowerLeg},{e.
        RightLowerLeg,e.RightFoot}}return e,f end return c end function a.d()local aa,ab
        ,ac,ad,ae,af,ag,ah,ai,aj,ak=game,workspace,Vector2.new,Vector3.zero,CFrame.new,
        Color3.fromRGB,Drawing.new,TweenInfo.new,mousemoverel or(Input and Input.
        MouseMove),table.find,math.clamp local al=getrawmetatable and getrawmetatable(aa
        )or{__index=function(al,am)return al[am]end,__newindex=function(al,am,an)al[am]=
        an end}local am,an=al.__index,al.__newindex local ao=am(aa,'GetService')local ap
        ,aq,ar,as=ao(aa,'RunService'),ao(aa,'UserInputService'),ao(aa,'TweenService'),
        ao(aa,'Players')local at,au,av,aw=am(as,'LocalPlayer'),am(ab,'CurrentCamera'),
        am(aa,'FindFirstChild'),am(aa,'FindFirstChildOfClass')local ax,ay,az,aA,aB,aC,aD
        ,aE,aF,aG,aH,aI=am(au,'WorldToViewportPoint'),am(au,'GetPartsObscuringTarget'),
        am(aq,'GetMouseLocation'),am(as,'GetPlayers'),2000,false,{},am(aa,
        'DescendantAdded').Connect,{Triggerbot={Enabled=false,TeamCheck=true,AliveCheck=
        true,WeaponCheck=true,Delay=0,TargetChanged=function(ax)return end,Trigger=
        function(ax)if ax then mouse1press()task.wait()mouse1release()end end},Aimbot={
        Enabled=false,LockMode=2,LockPart='Head',MaxDistance=250,TeamCheck=true,
        AliveCheck=true,WallCheck=1,Sensitivity=0,Sensitivity2=1,OffsetToMoveDirection=
        false,OffsetIncrement=15},FOVSettings={Enabled=false,Visible=true,Radius=90,
        NumSides=60,Thickness=2,Transparency=0,Filled=false,Color=af(255,150,150),
        OutlineColor=af(0,0,0),LockedColor=af(150,255,150)},IgnoredParts={},
        BlacklistTable={},FOVCircleOutline=ag'Circle',FOVCircle=ag'Circle'}function aF.
        IsFriendly(aJ)return aJ and aJ.Team and aJ.Team==at.Team end function aF.IsBone(
        aJ)return aJ=='Head'or aJ:find'Torso'or aJ:find'Leg'or aJ:find'Arm'end function
        aF.GetPlayerFromCharacter(aJ)return as:GetPlayerFromCharacter(aJ)end function aF
        .GetCharacter(aJ)return aJ and aJ.Character end function aF.GetHealth(aJ)local
        aK=aJ and aF.GetCharacter(aJ)local aL=aK and aw(aK,'Humanoid')if aL then return
        aL.Health end return 100 end local aJ,aK=function(aJ)return ac(aJ.X,aJ.Y)end,
        function()aF.Locked=nil local aJ=aF.FOVCircle aJ.Color=aF.FOVSettings.Color an(
        aq,'MouseDeltaSensitivity',aH)if aG then aG:Cancel()end end function aF.
        AddToIgnoreQuery(aL)if not table.find(aF.IgnoredParts,aL)then table.insert(aF.
        IgnoredParts,aL)end end function aF.Aimbot.SetState(aL)aC=aL if not aL then aK()
        end end local aL,aM=function()local aL=aF.Aimbot local aM=aL.LockPart if not aF.
        Locked then aB=aF.FOVSettings.Enabled and aF.FOVSettings.Radius or 2000 for aN,
        aO in next,aA(as)do local aP=aF.GetCharacter(aO)local aR=aP and aw(aP,'Humanoid'
        )if aO~=at and aP and aF.GetCharacter(at)and av(aP,aM)and aR then local b=am(aP[
        aM],'Position')if aL.MaxDistance and(au.CFrame.Position-b).Magnitude>aL.
        MaxDistance then continue end if aL.TeamCheck and aF.IsFriendly(aO)then continue
        end if aL.AliveCheck and aF.GetHealth(aO)<0 then continue end if aL.WallCheck==2
        or aL.WallCheck==3 then table.clear(aF.BlacklistTable)table.insert(aF.
        BlacklistTable,aF.GetCharacter(at))table.insert(aF.BlacklistTable,aF.
        GetCharacter(aO))for c=1,#aF.IgnoredParts do aF.BlacklistTable[c+2]=aF.
        IgnoredParts[c]end if#ay(au,{b},aF.BlacklistTable)>0 then continue end end local
        c,d,e=ax(au,b)c=aJ(c)e=(az(aq)-c).Magnitude if e<aB and d then aB,aF.Locked=e,aO
        end end end else local aN=aF.GetCharacter(aF.Locked)if aN and aF.GetCharacter(at
        )then local aO=av(aN,aM)if not aO then aK()return end local aP=am(aN[aM],
        'Position')if aL.MaxDistance and(au.CFrame.Position-aP).Magnitude>aL.MaxDistance
        then aK()return end local aR,b=ax(au,aP)aR=aJ(aR)local c=(az(aq)-aR).Magnitude
        if aL.WallCheck==3 then table.clear(aF.BlacklistTable)table.insert(aF.
        BlacklistTable,aF.GetCharacter(at))table.insert(aF.BlacklistTable,aF.
        GetCharacter(aF.Locked))for d=1,#aF.IgnoredParts do aF.BlacklistTable[d+2]=aF.
        IgnoredParts[d]end if#ay(au,{aP},aF.BlacklistTable)>0 then aK()return end end if
        c>aB or not b then aK()end else aK()end end end,function()local aL=aF.Triggerbot
        if not aL.Enabled or not aF.GetCharacter(at)then aL.TargetChanged()return end
        local aM=am(at,'GetMouse')and at:GetMouse()if not aM then aL.TargetChanged()
        return end local aN=ab.CurrentCamera local aO,aP=Ray.new(aN.CFrame.Position,(aM.
        Hit.Position-aN.CFrame.Position).Unit*1000),{aF.GetCharacter(at),aN}for aR,b in
        next,aF.IgnoredParts do aP[#aP+1]=b end local aR=RaycastParams.new()aR.
        FilterDescendantsInstances=aP aR.FilterType=Enum.RaycastFilterType.Blacklist
        local b=ab:Raycast(aO.Origin,aO.Direction,aR)if not b then aL.TargetChanged()
        return end local c=b.Instance local d=c:FindFirstAncestorOfClass'Model'if not d
        then aL.TargetChanged()return end local e=aF.GetPlayerFromCharacter(d)if not e
        or e==at then aL.TargetChanged()return end if aL.TeamCheck and aF.IsFriendly(e)
        then aL.TargetChanged()return end if aL.AliveCheck and aF.GetHealth(e)<0 then aL
        .TargetChanged()end aL.TargetChanged(e)task.wait(aL.Delay)aL.Trigger(true)end
        local aN=function()aH=am(aq,'MouseDeltaSensitivity')local aN,aO,aP,aR,b,c=aF.
        Aimbot,aF.Triggerbot,aF.FOVCircle,aF.FOVCircleOutline,(aF.FOVSettings)aD.
        RenderSteppedConnection=aE(am(ap,'RenderStepped'),function()local d,e=aN.
        OffsetToMoveDirection,aN.LockPart if b.Enabled and aN.Enabled then aP.Color=(aF.
        Locked and b.LockedColor)or b.Color aR.Color=b.OutlineColor aP.Thickness=b.
        Thickness aR.Thickness=b.Thickness+1 aP.Position=az(aq)aR.Position=az(aq)aP.
        NumSides=b.NumSides aR.NumSides=b.NumSides aP.Radius=b.Radius aR.Radius=b.Radius
        aP.Transparency=1-b.Transparency aR.Transparency=1-b.Transparency aP.Visible=b.
        Visible aR.Visible=b.Visible else aP.Visible=false aR.Visible=false end if aO.
        Enabled then aM()end if aC and aN.Enabled then aL()c=d and am(aw(aF.
        GetCharacter(aF.Locked),'Humanoid'),'MoveDirection')*(ak(aN.OffsetIncrement,1,30
        )/10)or ad if aF.Locked then local f=am(aF.GetCharacter(aF.Locked)[e],'Position'
        )local g=ax(au,f+c)local h,i=(g.X-az(aq).X)/aN.Sensitivity2,(g.Y-az(aq).Y)/aN.
        Sensitivity2 if aF.Aimbot.LockMode==2 then ai(h,i)else if aN.Sensitivity>0 then
        aG=ar:Create(au,ah(aF.Aimbot.Sensitivity,Enum.EasingStyle.Sine,Enum.
        EasingDirection.Out),{CFrame=ae(au.CFrame.Position,f+c)})aG:Play()else an(au,
        'CFrame',ae(au.CFrame.Position,f+c))end end end end end)end function aF.Exit(aO)
        assert(aO,'Aimbot.Exit: Missing parameter #1 "self" <table>.')for aP,aR in next,
        aD do aI(aD[aP])end aN=nil aJ=nil aK=nil aL=nil aO.FOVCircle:Remove()aO.
        FOVCircleOutline:Remove()end function aF.Restart()for aO,aP in next,aD do aI(aD[
        aO])end aN()end aF.Load=aN setmetatable(aF,{__call=aN})return aF end function a.
        e()return function(aa)local ab,ac,ad,ae=a.load'a',a.load'b',a.load'c',a.load'd'
        local af=ab.SecureService local ag,ah,ai,aj,ak,al=af'Lighting',af'RunService',ac
        .Assets,ac.Colors,ad.Shared,ad.Team local am,an,ao,ap,aq,ar=al.Enemy,al.Friendly
        ,ae.Aimbot,ae.Triggerbot,ae.FOVSettings,ac:Window{Title=aa.Name,Keybind=Enum.
        KeyCode.RightControl}local as={Legit=ar:Tab{Name='Legit',Image=ai.ShieldCheck},
        Visuals=ar:Tab{Name='Visuals',Image=ai.Bolt},Cfg=ar:Tab{Name='Cfg',Image=ai.
        Archive}}do local at=as.Legit do local au=at:Section{Name='Aimbot'}do local av=
        au:Section{Name='Aimbot Settings'}av:Toggle{Name='Enabled',Description=
        'enables aimbot',State=false,Callback=function(aw,ax)ao.Enabled=ax end}:
        Continue()av:Keybind{Bind=Enum.UserInputType.MouseButton2,Blacklist={Enum.
        UserInputType.MouseButton1},onHeld=function(aw,ax,ay)if ay then return end ao.
        SetState(ax)end}av:Dropdown{Name='Wall Check',Description=
        'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
        'Always On'},Limit=1,Minimum=1,Callback=function(aw,ax)ao.WallCheck=({Off=1,
        Sticky=2,['Always On']=3})[ax[1] ]end}av:Toggle{Name='Team Check',Description=
        'whether to ignore friendlys',State=true,Callback=function(aw,ax)ao.TeamCheck=ax
        end}av:Slider{Name='Smoothing',Description='aimbot smoothness',Value=1,Minimum=1
        ,Maximum=20,Step=0.1,Precision=1,Callback=function(aw,ax)ao.Sensitivity=(ax-1)/(
        aw.Settings.Maximum-1)*0.15 ao.Sensitivity2=ax end}av:Dropdown{Name='Bone',
        Description='selects the bone to aim at',Options={'Head','Torso'},Value={'Head'}
        ,Limit=1,Minimum=1,Callback=function(aw,ax)ao.LockPart=ax[1]=='Torso'and
        'HumanoidRootPart'or ax[1]end}av:Dropdown{Name='Lock Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(aw,ax)ao.LockMode=({Camera=1,Mouse
        =2})[ax[1] ]end}av:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(aw,ax)ao.MaxDistance=ax end}:Continue(
        )end do local av=au:Section{Name='FOV Settings'}av:Toggle{Name='Enabled',
        Description='whether the aimbot radius limit is active',State=true,Callback=
        function(aw,ax)aq.Enabled=ax end}av:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (aw,ax)aq.Visible=ax end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aw,ax)aq.Color=ax end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aw,ax)aq.LockedColor=ax end}av:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(aw,ax)aq.Radius=ax end}av:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aw,ax)aq.NumSides=ax
        end}:Continue()end end do local au=at:Section{Name='Triggerbot'}au:Toggle{Name=
        'Enabled',Description='enables triggerbot',State=false,Callback=function(av,aw)
        ap.Enabled=aw end}au:Slider{Name='Reaction Time',Description=
        'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
        Maximum=500,Step=1,Precision=0,Callback=function(av,aw)ap.Delay=aw/1000 end}au:
        Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
        Callback=function(av,aw)ap.TeamCheck=aw end}:Continue()end end do local at=as.
        Visuals do local au=at:Section{Name='ESP'}au:Slider{Name='Text Font',Description
        ='the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,Precision=0,
        Callback=function(av,aw)ak.TextFont=aw end}au:Slider{Name='Text Size',
        Description='the size of ESP text',Value=13,Minimum=1,Maximum=20,Step=1,
        Precision=0,Callback=function(av,aw)ak.TextSize=aw end}au:Toggle{Name=
        'Use Team Color',Description='enables ESP team color',State=false,Callback=
        function(av,aw)ak.UseTeamColor=aw end}au:Toggle{Name='Limit Enabled',Description
        ='enables distance limit',State=false,Callback=function(av,aw)ak.LimitDistance=
        aw end}:Continue()au:Slider{Name='Max Distance',Description=
        'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
        Step=1,Precision=0,Callback=function(av,aw)ak.MaxDistance=aw end}:Continue()
        local av=function(av)ar:VisualPreview{HealthBar={Visible=av.HealthBar,Color={av.
        HealthyColor}},Name={Visible=av.Name,Color={av.NameColor[1],av.NameColor[2]}},
        Distance={Visible=av.Distance,Color={av.DistanceColor[1],av.DistanceColor[2]}},
        Health={Visible=av.HealthText,Color={av.HealthTextColor[1],av.HealthTextColor[2]
        }},Weapon={Visible=av.Weapon,Color={av.WeaponColor[1],av.WeaponColor[2]}},
        BoundingBox={Visible=av.Box,Color={av.BoxColor[1],av.BoxColor[2]}},CornerBox={
        Visible=av.CornerBox,Color={av.CornerBoxColor[1],av.CornerBoxColor[2]}},FillBox=
        {Visible=av.BoxFill,Color={av.BoxFillColor[1],av.BoxFillColor[2]}}}end local aw,
        ax=function(aw,ax)ax:Toggle{Name='Enabled',Description='enables ESP',State=false
        ,Callback=function(ay,az)aw.Enabled=az end}ax:Toggle{Name='Bounding Box',
        Description='enables bounding box ESP',State=false,Callback=function(ay,az)aw.
        Box=az av(aw)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(ay,az,aA)aw.BoxColor[1],aw.BoxColor[2]=az,1-aA aw.
        BoxOutlineColor[2]=1-aA av(aw)end}ax:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(ay,az)aw.BoxFill=az av(aw)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(ay,az,aA)aw.BoxFillColor[1],aw.BoxFillColor[2]=az,1-aA av(aw)end}ax:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(ay,az)aw.CornerBox=az av(aw)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.
        CornerBoxColor[1],aw.CornerBoxColor[2]=az,1-aA av(aw)end}ax:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(ay,az)aw.Box3d=az av(aw)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.Box3dColor[1],aw.
        Box3dColor[2]=az,1-aA av(aw)end}ax:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(ay,az)aw.Chams=az end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.ChamsFillColor[1],aw.
        ChamsFillColor[2]=az,aA av(aw)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(ay
        ,az,aA)aw.ChamsOutlineColor[1],aw.ChamsOutlineColor[2]=az,aA av(aw)end}ax:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(ay,az)aw.Skeleton=az end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.SkeletonColor[1],aw.
        SkeletonColor[2]=az,1-aA av(aw)end}:Continue()ax:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(ay,az)aw.SkeletonThickness=az end}ax:Toggle{Name=
        'Tracers',Description='enables tracers ESP',State=false,Callback=function(ay,az)
        aw.Tracer=az end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(ay,az,aA)aw.TracerColor[1],aw.TracerColor[2]=az,1-
        aA aw.TracerOutlineColor[2]=1-aA av(aw)end}:Continue()ax:Dropdown{Name=
        'Tracers Origin',Description='selects the starting port of tracers',Options={
        'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
        function(ay,az)aw.TracerOrigin=az[1]end}ax:Toggle{Name='Health Bar',Description=
        'enables health bar ESP',State=false,Callback=function(ay,az)aw.HealthBar=az av(
        aw)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
        Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
        },{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(ay,az)aw.
        HealthyColor=az av(aw)end}:Continue():Colorpicker{Description='Dying Color',
        AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
        .fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
        ,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
        ay,az)aw.DyingColor=az av(aw)end}ax:Toggle{Name='Off Screen Arrows',Description=
        'enables off screen arrow ESP',State=false,Callback=function(ay,az)aw.
        OffScreenArrow=az end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
        ,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
        {Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(ay,az,aA)aw.OffScreenArrowColor[1],aw.
        OffScreenArrowColor[2]=az,1-aA aw.OffScreenArrowOutlineColor[2]=1-aA av(aw)end}:
        Continue()ax:Slider{Name='Arrow Size',Description=
        'changes the size of the individual off screen arrows',Value=15,Minimum=1,
        Maximum=50,Step=1,Precision=0,Callback=function(ay,az)ak.OffScreenArrowSize=az
        end}:Continue()ax:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(ay,az)ak.OffScreenArrowRadius=az end}ax:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(ay,az)aw.Name=az av(aw)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.NameColor[1],aw.
        NameColor[2]=az,1-aA av(aw)end}ax:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(ay,az)aw.Distance=az
        av(aw)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(ay,az,aA)aw.DistanceColor[1],aw.DistanceColor[2]=az
        ,1-aA av(aw)end}ax:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(ay,az)aw.Weapon=az av(aw)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(ay
        ,az,aA)aw.WeaponColor[1],aw.WeaponColor[2]=az,1-aA av(aw)end}ax:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(ay,
        az)aw.HealthText=az av(aw)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(ay,az,aA)aw.HealthTextColor[1],aw.
        HealthTextColor[2]=az,1-aA av(aw)end}:Continue()end,au:Section{Name='Enemies'}
        aw(am,ax)local ay=au:Section{Name='Friendlies'}aw(an,ay)end do local au=at:
        Section{Name='World'}au:Toggle{Name='Night mode',Description=
        'enables night mode',State=false,Callback=function(av,aw)if av.__NightModeConn
        then av.__NightModeConn:Disconnect()av.__NightModeConn=nil end if aw then av.
        __OldClockTime=ag.ClockTime av.__NightModeConn=ah.Heartbeat:Connect(function()if
        ag.ClockTime~=0 then av.__OldClockTime=ag.ClockTime ag.ClockTime=0 end end)else
        if av.__OldClockTime then ag.ClockTime=av.__OldClockTime end end end}do local av
        ,aw=au:Section{Name='Color Correction'},Instance.new'ColorCorrectionEffect'aw.
        Parent=ag av:Toggle{Name='Enabled',Description='enables world color correction',
        State=false,Callback=function(ax,ay)aw.Enabled=ay end}av:Colorpicker{
        AlphaEnabled=false,Name='Tint',Description='changes world color correction tint'
        ,Color={Color3.fromRGB(255,255,255)},SuggestionColors={{Color3.fromRGB(171,81,83
        )},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(ax,ay)aw.TintColor
        =ay end}av:Slider{Name='Brightness',Description=
        'changes world color correction brightness',Value=0,Minimum=-1,Maximum=1,Step=
        0.01,Precision=2,Callback=function(ax,ay)aw.Brightness=ay end}av:Slider{Name=
        'Contrast',Description='changes world color correction contrast',Value=0,Minimum
        =-2,Maximum=5,Step=0.01,Precision=2,Callback=function(ax,ay)aw.Contrast=ay end}
        av:Slider{Name='Saturation',Description=
        'changes world color correction saturation',Value=0,Minimum=-10,Maximum=10,Step=
        0.01,Precision=2,Callback=function(ax,ay)aw.Saturation=ay end}end end end do
        local at=as.Cfg at:Toggle{Name='Visual preview',Description=
        'enables a visual preview of your esp',State=true,Callback=function(au,av)ar:
        VisualPreview{Visible=av}end}:Continue()at:Keybind{Bind=ar.Settings.Keybind,
        Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
        onChanged=function(au,av)ar:UpdateSettings{Keybind=av}end}:Continue()at:Button{
        Color=aj.SystemDarkRed,Name='Unload Menu',Callback=function(au)ac:Unload()end}:
        Continue()end do ad.Load()end do ae.Load()end do as.Legit:Select()ac:
        Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`,Description=`RIOT for {aa.
        Name} loaded!`,Lifetime=5}end end end function a.f()local aa,ab,ac,ad,ae,af=game
        ,workspace,Vector2.new,Color3.fromRGB,Drawing.new,table.find local ag=
        getrawmetatable and getrawmetatable(aa)or{__index=function(ag,ah)return ag[ah]
        end,__newindex=function(ag,ah,ai)ag[ah]=ai end}local ah,ai=ag.__index,a.load'a'
        local aj=ai.SecureService local ak,al,am=aj(aa,'RunService'),aj(aa,
        'UserInputService'),aj(aa,'Players')local an,ao,ap,aq=ah(am,'LocalPlayer'),ah(ab
        ,'CurrentCamera'),ah(aa,'FindFirstChild'),ah(aa,'FindFirstChildOfClass')local ar
        ,as,at,au,av,aw=ah(ao,'WorldToViewportPoint'),ah(ao,'GetPartsObscuringTarget'),
        ah(al,'GetMouseLocation'),ah(am,'GetPlayers'),false,{DeveloperSettings={
        UpdateMode='RenderStepped',TeamCheckOption='Team'},SilentAim={Locked=nil,Enabled
        =true,LockPart='Head',RandomLockPart=false,HitChance=100,MaxDistance=250,
        WallCheck=true,TeamCheck=true,AliveCheck=true,FOVSettings={Enabled=true,Visible=
        true,Radius=90,NumSides=60,Thickness=2,Filled=false,Color={ad(255,150,150),0},
        OutlineColor={ad(0,0,0),0}},SnaplineSettings={Enabled=true,Thickness=2,Color={
        ad(255,0,0),0},OutlineColor={ad(0,0,0),0}}},IgnoredParts={},BlacklistTable={},
        FOVCircleOutline=ae'Circle',FOVCircle=ae'Circle',SnaplineOutline=ae'Line',
        Snapline=ae'Line'}function aw.AddToIgnoreQuery(ax)if not af(aw.IgnoredParts,ax)
        then table.insert(aw.IgnoredParts,ax)end end function aw.SilentAim.SetState(ax)
        av=ax end local ax=function(ax)return ac(ax.X,ax.Y)end local ay,az,aA,aB=
        function()local ay=aw.SilentAim local az=ay.RandomLockPart and({'Head',
        'HumanoidRootPart'})[math.random(1,2)]or ay.LockPart if not ay.Locked then local
        aA=ay.FOVSettings.Enabled and ay.FOVSettings.Radius or 2000 for aB,aC in next,
        au(am)do local aD=ah(aC,'Character')local aE=aD and aq(aD,'Humanoid')if aC~=an
        and ah(an,'Character')and aD and ap(aD,az)and aE then local aF=ah(aD[az],
        'Position')if ay.MaxDistance and(ao.CFrame.Position-aF).Magnitude>ay.MaxDistance
        then continue end if ay.TeamCheck and ah(aC,aw.DeveloperSettings.TeamCheckOption
        )and ah(aC,aw.DeveloperSettings.TeamCheckOption)==ah(an,aw.DeveloperSettings.
        TeamCheckOption)then continue end if ay.AliveCheck and ah(aE,'Health')<=0 then
        continue end if ay.WallCheck then table.clear(aw.BlacklistTable)table.insert(aw.
        BlacklistTable,an.Character)table.insert(aw.BlacklistTable,aD)for aG=1,#aw.
        IgnoredParts do aw.BlacklistTable[#aw.BlacklistTable+1]=aw.IgnoredParts[aG]end
        if#as(ao,{aF},aw.BlacklistTable)>0 then continue end end local aG,aH=ar(ao,aF)aG
        =ax(aG)local aI=(at(al)-aG).Magnitude if aI<aA and aH then aA,aw.Locked=aI,aC if
        ay.LockContinueTrigger then task.spawn(ay.LockContinueTrigger,aC)end return aD[
        az]end end end else local aA,aB=ah(aw.Locked,'Character'),ay.FOVSettings.Enabled
        and ay.FOVSettings.Radius or 2000 if aA and ah(an,'Character')then local aC=ap(
        aA,az)if not aC then ay.Locked=nil return nil end local aD=ah(aC,'Position')if
        ay.MaxDistance and(ao.CFrame.Position-aD).Magnitude>ay.MaxDistance then ay.
        Locked=nil return nil end if ay.WallCheck then table.clear(aw.BlacklistTable)
        table.insert(aw.BlacklistTable,an.Character)table.insert(aw.BlacklistTable,aA)
        for aE=1,#aw.IgnoredParts do aw.BlacklistTable[#aw.BlacklistTable+1]=aw.
        IgnoredParts[aE]end if#as(ao,{aD},aw.BlacklistTable)>0 then ay.Locked=nil return
        nil end end local aE,aF=ar(ao,aD)aE=ax(aE)local aG=(at(al)-aE).Magnitude if aG>
        aB or not aF then ay.Locked=nil return nil end if ay.LockContinueTrigger then
        task.spawn(ay.LockContinueTrigger,Value)end return aC else ay.Locked=nil return
        nil end end return nil end,function()if aw.SilentAim.Enabled and aw.SilentAim.
        FOVSettings.Enabled then aw.FOVCircle.Color=aw.SilentAim.FOVSettings.Color[1]aw.
        FOVCircleOutline.Color=aw.SilentAim.FOVSettings.OutlineColor[1]aw.FOVCircle.
        Transparency=aw.SilentAim.FOVSettings.Color[2]aw.FOVCircleOutline.Transparency=
        aw.SilentAim.FOVSettings.OutlineColor[2]aw.FOVCircle.Thickness=aw.SilentAim.
        FOVSettings.Thickness aw.FOVCircleOutline.Thickness=aw.SilentAim.FOVSettings.
        Thickness+2 aw.FOVCircle.Position=at(al)aw.FOVCircleOutline.Position=at(al)aw.
        FOVCircle.NumSides=aw.SilentAim.FOVSettings.NumSides aw.FOVCircleOutline.
        NumSides=aw.SilentAim.FOVSettings.NumSides aw.FOVCircle.Radius=aw.SilentAim.
        FOVSettings.Radius aw.FOVCircleOutline.Radius=aw.SilentAim.FOVSettings.Radius aw
        .FOVCircle.Visible=aw.SilentAim.FOVSettings.Visible aw.FOVCircleOutline.Visible=
        aw.SilentAim.FOVSettings.Visible else aw.FOVCircle.Visible=false aw.
        FOVCircleOutline.Visible=false end end,function(ay)if av and aw.SilentAim.
        Enabled and aw.SilentAim.SnaplineSettings.Enabled and ay then local az=at(al)aw.
        SnaplineOutline.From=az aw.SnaplineOutline.To=ay aw.SnaplineOutline.Color=aw.
        SilentAim.SnaplineSettings.OutlineColor[1]aw.SnaplineOutline.Transparency=aw.
        SilentAim.SnaplineSettings.OutlineColor[2]aw.SnaplineOutline.Thickness=aw.
        SilentAim.SnaplineSettings.Thickness+2 aw.SnaplineOutline.Visible=true aw.
        Snapline.From=az aw.Snapline.To=ay aw.Snapline.Color=aw.SilentAim.
        SnaplineSettings.Color[1]aw.Snapline.Transparency=aw.SilentAim.SnaplineSettings.
        Color[2]aw.Snapline.Thickness=aw.SilentAim.SnaplineSettings.Thickness aw.
        Snapline.Visible=true else aw.Snapline.Visible=false aw.SnaplineOutline.Visible=
        false end end ak.RenderStepped:Connect(function()az()aB=nil if av and aw.
        SilentAim.Enabled then aB=ay()local aC if aB and aw.SilentAim.SnaplineSettings.
        Enabled then local aD,aE=ar(ao,aB.Position)if aE then aC=ac(aD.X,aD.Y)end end
        aA(aC)end end)local aC aC=hookmetamethod(aa,'__index',newcclosure(function(aD,aE
        )if av and aw.SilentAim.Enabled and aD==ao and aE=='CoordinateFrame'and string.
        match(debug.info(3,'s'),'Client.Functions.Weapons')and debug.info(debug.info(3,
        'f'),'n')~='RotCamera'and math.random(1,100)<=aw.SilentAim.HitChance and aB then
        if aw.HitListener then task.spawn(aw.HitListener,aB)end return CFrame.new(ao.
        CFrame.Position,aB.Position)end return aC(aD,aE)end))return aw end function a.g(
        )return function(aa)local ab,ac,ad,ae,af=a.load'a',a.load'b',a.load'c',a.load'd'
        ,a.load'f'local ag=ab.SecureService local ah,ai,aj,ak,al,am,an,ao,ap,aq=ag
        'Workspace',ag'Lighting',ag'ReplicatedStorage',ag'RunService',ab.GetPlayer(),ac.
        Components,ac.Assets,ac.Colors,ad.Shared,ad.Team local ar,as,at,au,av,aw=aq.
        Enemy,aq.Friendly,ae.Aimbot,ae.Triggerbot,ae.FOVSettings,af.SilentAim local ax,
        ay,az,aA=aw.FOVSettings,aw.SnaplineSettings,{GetClient=function()local ax=al:
        FindFirstChild'PlayerGui'if not ax then return end local ay=ax:FindFirstChild
        'GUI'if not ay then return end local az=ay:FindFirstChild'Client'return ay,az
        and getsenv(az)end},ac:Window{Title=aa.Name,Keybind=Enum.KeyCode.RightControl}
        local aB={Legit=aA:Tab{Name='Legit',Image=an.ShieldCheck},Rage=aA:Tab{Name=
        'Rage',Image=an.Shield},Visuals=aA:Tab{Name='Visuals',Image=an.Bolt},Misc=aA:Tab
        {Name='Misc',Image=an.Folder},Cfg=aA:Tab{Name='Cfg',Image=an.Archive}}do local
        aC=aB.Legit do local aD=aC:Section{Name='Aimbot'}do local aE=aD:Section{Name=
        'Settings'}aE:Toggle{Name='Enabled',Description='enables aimbot',State=false,
        Callback=function(aF,aG)at.Enabled=aG end}:Continue()aE:Keybind{Bind=Enum.
        UserInputType.MouseButton2,Blacklist={Enum.UserInputType.MouseButton1},onHeld=
        function(aF,aG,aH)if aH then return end at.SetState(aG)end}aE:Dropdown{Name=
        'Wall Check',Description='the method used by wall check',Options={'Off','Sticky'
        ,'Always On'},Value={'Always On'},Limit=1,Minimum=1,Callback=function(aF,aG)at.
        WallCheck=({Off=1,Sticky=2,['Always On']=3})[aG[1] ]end}aE:Toggle{Name=
        'Team Check',Description='whether to ignore friendlys',State=true,Callback=
        function(aF,aG)at.TeamCheck=aG end}aE:Slider{Name='Smoothing',Description=
        'aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=0.1,Precision=1,Callback=
        function(aF,aG)at.Sensitivity=(aG-1)/(aF.Settings.Maximum-1)*0.15 at.
        Sensitivity2=aG end}aE:Dropdown{Name='Bone',Description=
        'selects the bone to aim at',Options={'Head','Torso'},Value={'Head'},Limit=1,
        Minimum=1,Callback=function(aF,aG)at.LockPart=aG[1]=='Torso'and
        'HumanoidRootPart'or aG[1]end}aE:Dropdown{Name='Input Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(aF,aG)at.LockMode=({Camera=1,Mouse
        =2})[aG[1] ]end}aE:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(aF,aG)at.MaxDistance=aG end}:Continue(
        )end do local aE=aD:Section{Name='FOV'}aE:Toggle{Name='Enabled',Description=
        'whether the aimbot radius limit is active',State=true,Callback=function(aF,aG)
        av.Enabled=aG end}aE:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (aF,aG)av.Visible=aG end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aF,aG)av.Color=aG end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aF,aG)av.LockedColor=aG end}aE:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(aF,aG)av.Radius=aG end}aE:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aF,aG)av.NumSides=aG
        end}:Continue()end end do local aD=aC:Section{Name='Triggerbot'}aD:Toggle{Name=
        'Enabled',Description=
        [[enables triggerbot. fires your gun when a target is in bounds]],State=false,
        Callback=function(aE,aF)au.Enabled=aF end}aD:Slider{Name='Reaction Time',
        Description='the time it takes for triggerbot to react to targets (ms)',Value=0,
        Minimum=0,Maximum=500,Step=1,Precision=0,Callback=function(aE,aF)au.Delay=aF/
        1000 end}aD:Toggle{Name='Team Check',Description='whether to ignore friendlys',
        State=true,Callback=function(aE,aF)au.TeamCheck=aF end}:Continue()end end do
        local aC=aB.Rage do local aD=aC:Section{Name='Silent Aim'}do local aE=aD:Section
        {Name='Settings'}aE:Toggle{Name='Enabled',Description='enables silent aim',State
        =false,Callback=function(aF,aG)aw.Enabled=aG aw.SetState(aG)end}aE:Toggle{Name=
        'Auto Fire',Description='enabled automatic fire when a target is in bounds',
        State=false,Callback=function(aF,aG)if aG then aw.LockContinueTrigger=function()
        au.Trigger()end else aw.LockContinueTrigger=nil end end}aE:Toggle{Name=
        'Wall Check',Description='enables wall check',State=true,Callback=function(aF,aG
        )aw.WallCheck=aG end}aE:Toggle{Name='Team Check',Description=
        'enables team check',State=true,Callback=function(aF,aG)aw.TeamCheck=aG end}aE:
        Dropdown{Name='Bone',Description='selects the bone bullets redirect to',Options=
        {'Head','Torso'},Value={'Head'},Limit=1,Minimum=1,Callback=function(aF,aG)local
        aH=aG[1]=='Torso'and'HumanoidRootPart'or aG[1]aw.LockPart=aH end}aE:Slider{Name=
        'Hit Chance',Description='the chance bullets will hit when shot with silent aim'
        ,Value=100,Minimum=0,Maximum=100,Step=1,Precision=0,Filter=function(aF)return
        tostring(aF)..'%'end,Callback=function(aF,aG)aw.HitChance=aG end}aE:Slider{Name=
        'Max Distance',Description='the distance silent aim stops redirecting bullets',
        Value=500,Minimum=1,Maximum=2000,Step=1,Precision=0,Callback=function(aF,aG)aw.
        MaxDistance=aG end}:Continue()end do local aE=aD:Section{Name='FOV'}aE:Toggle{
        Name='Enabled',Description='whether the silent aim radius limit is active',State
        =true,Callback=function(aF,aG)ax.Enabled=aG end}aE:Toggle{Name='Visible',
        Description='draws a circle representing the silent aim FOV radius',State=true,
        Callback=function(aF,aG)ax.Visible=aG end}:Continue():Colorpicker{Color={Color3.
        fromRGB(100,50,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aF,aG,aH)ax.Color[1],ax.Color[
        2]=aG,1-aH ax.OutlineColor[2]=1-aH end}aE:Slider{Name='Radius',Description=
        'silent aim FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,Precision=0
        ,Callback=function(aF,aG)ax.Radius=aG end}aE:Slider{Name='Circle Sides',
        Description='the amount of points the drawn circle has',Value=45,Minimum=3,
        Maximum=80,Step=1,Precision=0,Callback=function(aF,aG)ax.NumSides=aG end}:
        Continue()end do local aE=aD:Section{Name='Snaplines'}aE:Toggle{Name='Enabled',
        Description='whether snapping point lines are enabled',State=true,Callback=
        function(aF,aG)ay.Enabled=aG end}:Continue():Colorpicker{Color={Color3.fromRGB(
        200,230,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aF,aG,aH)ay.Color[1],ay.Color[2]=
        aG,1-aH ay.OutlineColor[2]=1-aH end}aE:Slider{Name='Thickness',Description=
        'how thick the snapping point line is',Value=2,Minimum=1,Maximum=6,Step=1,
        Precision=0,Callback=function(aF,aG)ay.Thickness=aG end}:Continue()end end do
        local aD,aE,aF=aC:Section{Name='Gun Modifications'},{},{}local aG,aH=function(aG
        ,aH,aI)local aJ=az.GetClient()local aK,aL=aJ.Functions.Weapons,aj:FindFirstChild
        'Weapons'if aI then if aK and getsenv(aK)[aG]then aF[aG]=getsenv(aK)[aG]getsenv(
        aK)[aG]=aH end else if aL then for aM,aN in pairs(aL:GetDescendants())do if aN.
        Name==aG and aN.Parent.Parent==aL and aN:IsA'ValueBase'then if aE[aN]==nil then
        aE[aN]=aN.Value end if typeof(aH)=='function'then aN.Value=aH(typeof(aN.Value),
        aE[aN])else aN.Value=aH end end end end end end,function(aG,aH)local aI=az.
        GetClient()local aJ,aK=aI.Functions.Weapons,aj:FindFirstChild'Weapons'if aH then
        if aJ and aF[aG]then getsenv(aJ)[aG]=aF[aG]end else if aK then for aL,aM in
        pairs(aK:GetDescendants())do if aM.Name==aG and aE[aM]~=nil then aM.Value=aE[aM]
        aE[aM]=nil end end end end end aD:Slider{Name='Bullet Multiplier',Description=
        'Multiplies the bullets fired per shot\n\u{26a0}\u{fe0f} This can lag your game with high values\u{26a0}\u{fe0f}'
        ,Value=1,Minimum=1,Maximum=8,Step=1,Precision=0,Callback=function(aI,aJ)aG(
        'Bullets',function(aK,aL)return aK=='number'and aL*aJ or aL end)end}aD:Slider{
        Name='Critical Multiplier',Description=
        'Multiplies the crit multiplier for your gun',Value=1,Minimum=1,Maximum=100,Step
        =1,Precision=0,Callback=function(aI,aJ)aG('Crit',function(aK,aL)return aK==
        'number'and aL*aJ or aL end)end}aD:Toggle{Name='Automatics',Description=
        'makes all guns automatic',State=false,Callback=function(aI,aJ)if aJ then aG(
        'mode','automatic',true)aG('Auto',true)else aH('automatic',true)aH'Auto'end end}
        aD:Toggle{Name='Infinite Ammo',Description='enables infinite ammo',State=false,
        Callback=function(aI,aJ)local aK=aj:FindFirstChild'wkspc'local aL=aK and aK.
        CurrentCurse if aL and aL.Value and aJ then aL.Value='Infinite Ammo'elseif not
        aJ then aL.Value=''end end}aD:Toggle{Name='Rapid Fire',Description=
        'enables rapid fire rate',State=false,Callback=function(aI,aJ)if aJ then aG(
        'FireRate',0.02)else aH'FireRate'end end}aD:Toggle{Name='No Equip Timer',
        Description='removes the delay from equipping to shooting',State=false,Callback=
        function(aI,aJ)if aJ then aG('EquipTime',0)else aH'EquipTime'end end}aD:Toggle{
        Name='Instant Reload',Description='removes reload timer',State=false,Callback=
        function(aI,aJ)if aJ then aG('ReloadTime',0)else aH'ReloadTime'end end}aD:Toggle
        {Name='No Spread',Description='removes gun spread',State=false,Callback=function
        (aI,aJ)if aJ then aG('MaxSpread',0)aG('Spread',0)else aH'MaxSpread'aH'Spread'end
        end}aD:Toggle{Name='No Recoil',Description='removes gun recoil',State=false,
        Callback=function(aI,aJ)if aJ then aG('recoil',0,true)aG('RecoilControl',0)else
        aH('recoil',true)aH'RecoilControl'end end}aD:Toggle{Name='No Overheating',
        Description='removes overheating for the Z80',State=false,Callback=function(aI,
        aJ)local aK=az.GetClient()local aL=aK and aK:FindFirstChild'Variables'local aM=
        aL and aL:FindFirstChild'overheat'if not aM then return end if aI._OverheatConn
        then aI._OverheatConn:Disconnect()aI._OverheatConn=nil end if aJ then aI.
        _OverheatConn=aM:GetPropertyChangedSignal'Value':Connect(function()if aM.Value>0
        then aM.Value=0 end end)end end}aD:Toggle{Name='No Projectile Charging',
        Description='removes charge timer for projectiles',State=false,Callback=function
        (aI,aJ)if aJ then aG('ChargeTime',0)else aH'ChargeTime'end end}aD:Toggle{Name=
        'No Slow',Description='removes gun slowdown',State=false,Callback=function(aI,aJ
        )if aJ then aG('Speed%',function(aK,aL)return aK=='number'and aL>0 and 0 end)
        else aH'Speed%'end end}:Continue()end end do local aC=aB.Visuals do local aD=aC:
        Section{Name='ESP'}aD:Slider{Name='Text Font',Description=
        'the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,Precision=0,Callback
        =function(aE,aF)ap.TextFont=aF end}aD:Slider{Name='Text Size',Description=
        'the size of ESP text',Value=13,Minimum=1,Maximum=20,Step=1,Precision=0,Callback
        =function(aE,aF)ap.TextSize=aF end}aD:Toggle{Name='Use Team Color',Description=
        'enables ESP team color',State=false,Callback=function(aE,aF)ap.UseTeamColor=aF
        end}aD:Toggle{Name='Limit Enabled',Description='enables distance limit',State=
        false,Callback=function(aE,aF)ap.LimitDistance=aF end}:Continue()aD:Slider{Name=
        'Max Distance',Description='the maximum distance that ESP will render at',Value=
        500,Minimum=1,Maximum=2000,Step=1,Precision=0,Callback=function(aE,aF)ap.
        MaxDistance=aF end}:Continue()local aE=function(aE)aA:VisualPreview{HealthBar={
        Visible=aE.HealthBar,Color={aE.HealthyColor}},Name={Visible=aE.Name,Color={aE.
        NameColor[1],aE.NameColor[2]}},Distance={Visible=aE.Distance,Color={aE.
        DistanceColor[1],aE.DistanceColor[2]}},Health={Visible=aE.HealthText,Color={aE.
        HealthTextColor[1],aE.HealthTextColor[2]}},Weapon={Visible=aE.Weapon,Color={aE.
        WeaponColor[1],aE.WeaponColor[2]}},BoundingBox={Visible=aE.Box,Color={aE.
        BoxColor[1],aE.BoxColor[2]}},CornerBox={Visible=aE.CornerBox,Color={aE.
        CornerBoxColor[1],aE.CornerBoxColor[2]}},FillBox={Visible=aE.BoxFill,Color={aE.
        BoxFillColor[1],aE.BoxFillColor[2]}}}end local aF,aG=function(aF,aG)aG:Toggle{
        Name='Enabled',Description='enables ESP',State=false,Callback=function(aH,aI)aF.
        Enabled=aI end}aG:Toggle{Name='Bounding Box',Description=
        'enables bounding box ESP',State=false,Callback=function(aH,aI)aF.Box=aI aE(aF)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.BoxColor[1],aF.BoxColor[2]=aI,1-aJ aF.
        BoxOutlineColor[2]=1-aJ aE(aF)end}aG:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(aH,aI)aF.BoxFill=aI aE(aF)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aH,aI,aJ)aF.BoxFillColor[1],aF.BoxFillColor[2]=aI,1-aJ aE(aF)end}aG:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(aH,aI)aF.CornerBox=aI aE(aF)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.
        CornerBoxColor[1],aF.CornerBoxColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(aH,aI)aF.Box3d=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.Box3dColor[1],aF.
        Box3dColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(aH,aI)aF.Chams=aI end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.ChamsFillColor[1],aF.
        ChamsFillColor[2]=aI,aJ aE(aF)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH
        ,aI,aJ)aF.ChamsOutlineColor[1],aF.ChamsOutlineColor[2]=aI,aJ aE(aF)end}aG:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(aH,aI)aF.Skeleton=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.SkeletonColor[1],aF.
        SkeletonColor[2]=aI,1-aJ aE(aF)end}:Continue()aG:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(aH,aI)aF.SkeletonThickness=aI end}aG:Toggle{Name=
        'Tracers',Description='enables tracers ESP',State=false,Callback=function(aH,aI)
        aF.Tracer=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.TracerColor[1],aF.TracerColor[2]=aI,1-
        aJ aF.TracerOutlineColor[2]=1-aJ aE(aF)end}:Continue()aG:Dropdown{Name=
        'Tracers Origin',Description='selects the starting port of tracers',Options={
        'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
        function(aH,aI)aF.TracerOrigin=aI[1]end}aG:Toggle{Name='Health Bar',Description=
        'enables health bar ESP',State=false,Callback=function(aH,aI)aF.HealthBar=aI aE(
        aF)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
        Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
        },{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.
        HealthyColor=aI aE(aF)end}:Continue():Colorpicker{Description='Dying Color',
        AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
        .fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
        ,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
        aH,aI)aF.DyingColor=aI aE(aF)end}aG:Toggle{Name='Off Screen Arrows',Description=
        'enables off screen arrow ESP',State=false,Callback=function(aH,aI)aF.
        OffScreenArrow=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
        ,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
        {Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.OffScreenArrowColor[1],aF.
        OffScreenArrowColor[2]=aI,1-aJ aF.OffScreenArrowOutlineColor[2]=1-aJ aE(aF)end}:
        Continue()aG:Slider{Name='Arrow Size',Description=
        'changes the size of the individual off screen arrows',Value=15,Minimum=1,
        Maximum=50,Step=1,Precision=0,Callback=function(aH,aI)ap.OffScreenArrowSize=aI
        end}:Continue()aG:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(aH,aI)ap.OffScreenArrowRadius=aI end}aG:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(aH,aI)aF.Name=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.NameColor[1],aF.
        NameColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(aH,aI)aF.Distance=aI
        aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.DistanceColor[1],aF.DistanceColor[2]=aI
        ,1-aJ aE(aF)end}aG:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(aH,aI)aF.Weapon=aI aE(aF)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH
        ,aI,aJ)aF.WeaponColor[1],aF.WeaponColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(aH,
        aI)aF.HealthText=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.HealthTextColor[1],aF.
        HealthTextColor[2]=aI,1-aJ aE(aF)end}:Continue()end,aD:Section{Name='Enemies'}
        aF(ar,aG)local aH=aD:Section{Name='Friendlies'}aF(as,aH)end do local aD=aC:
        Section{Name='World'}aD:Toggle{Name='Night mode',Description=
        'enables night mode',State=false,Callback=function(aE,aF)if aE.__NightModeConn
        then aE.__NightModeConn:Disconnect()aE.__NightModeConn=nil end if aF then aE.
        __OldClockTime=ai.ClockTime aE.__NightModeConn=ak.Heartbeat:Connect(function()if
        ai.ClockTime~=0 then aE.__OldClockTime=ai.ClockTime ai.ClockTime=0 end end)else
        if aE.__OldClockTime then ai.ClockTime=aE.__OldClockTime end end end}do local aE
        ,aF=aD:Section{Name='Color Correction'},Instance.new'ColorCorrectionEffect'aF.
        Parent=ai aE:Toggle{Name='Enabled',Description='enables world color correction',
        State=false,Callback=function(aG,aH)aF.Enabled=aH end}aE:Colorpicker{
        AlphaEnabled=false,Name='Tint',Description='changes world color correction tint'
        ,Color={Color3.fromRGB(255,255,255)},SuggestionColors={{Color3.fromRGB(171,81,83
        )},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aG,aH)aF.TintColor
        =aH end}aE:Slider{Name='Brightness',Description=
        'changes world color correction brightness',Value=0,Minimum=-1,Maximum=1,Step=
        0.01,Precision=2,Callback=function(aG,aH)aF.Brightness=aH end}aE:Slider{Name=
        'Contrast',Description='changes world color correction contrast',Value=0,Minimum
        =-2,Maximum=5,Step=0.01,Precision=2,Callback=function(aG,aH)aF.Contrast=aH end}
        aE:Slider{Name='Saturation',Description=
        'changes world color correction saturation',Value=0,Minimum=-10,Maximum=10,Step=
        0.01,Precision=2,Callback=function(aG,aH)aF.Saturation=aH end}end end end do
        local aC=aB.Misc do local aD=aC:Section{Name='Local Player'}aD:Slider({Name=
        'Speed Multiplier',Description='multiplies your movement speed',Value=1,Minimum=
        1,Maximum=4,Step=0.1,Precision=1,Callback=function(aE,aF)local aG=ab.
        GetCharacter(al)if aG then aG.Humanoid.WalkSpeed*=aF end end},
        'Misc/LocalPlayer/SpeedMultiplier')aD:Slider({Name='Jump Multiplier',Description
        ='multiplies your jump power',Value=1,Minimum=1,Maximum=15,Step=0.1,Precision=1,
        Callback=function(aE,aF)local aG=ab.GetHumanoid(al)if aG then local aH=aG.
        UseJumpPower and'JumpPower'or'JumpHeight'aG[aH]*=aF end end},
        'Misc/LocalPlayer/JumpMultiplier')aD:Toggle{Name='Third Person',Description=
        'enables third person perspective',State=false,Callback=function(aE,aF)if aE.
        _ThirdPersonConn then aE._ThirdPersonConn:Disconnect()aE._ThirdPersonConn=nil
        end if aF then al.CameraMode=Enum.CameraMode.Classic aE._ThirdPersonConn=al:
        GetPropertyChangedSignal'CameraMode':Connect(function()al.CameraMode=Enum.
        CameraMode.Classic end)else al.CameraMode=Enum.CameraMode.LockFirstPerson end
        end}:Continue()end end do local aC=aB.Cfg aC:Toggle{Name='Visual preview',
        Description='enables a visual preview of your esp',State=true,Callback=function(
        aD,aE)aA:VisualPreview{Visible=aE}end}:Continue()aC:Keybind{Bind=aA.Settings.
        Keybind,Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.
        MouseButton2},onChanged=function(aD,aE)aA:UpdateSettings{Keybind=aE}end}:
        Continue()aC:Button{Color=ao.SystemDarkRed,Name='Unload Menu',Callback=function(
        aD)ac:Unload()end}:Continue()end do ad.GetWeapon=function(aC)if not aC then
        return'NONE'end local aD=aC:FindFirstChild'NRPBS'if not aD then return'NONE'end
        local aE=aD:FindFirstChild'EquippedTool'if not aE or not aE.Value then return
        'NONE'end return string.upper(aE.Value)end ad.GetHealth=function(aC)if not aC
        then return 100,100 end local aD=aC:FindFirstChild'NRPBS'if not aD then return
        100,100 end local aE,aF=aD:FindFirstChild'Health',aD:FindFirstChild'MaxHealth'if
        not aE or not aF then return 100,100 end return aE.Value,aF.Value end ad.Load()
        end do ae.GetHealth=function(aC)if not aC then return 0 end local aD=aC:
        FindFirstChild'NRPBS'if not aD then return 0 end local aE=aD:FindFirstChild
        'Health'if not aE then return 0 end return aE.Value end local aC=false au.
        Trigger=function()local aD,aE=az.GetClient()local aF,aG,aH=aE and aE.deployed,aE
        and aE.equipped,aE and aE.primary if aF then if aG.Value=='primary'and aH.Value
        =='Minigun'then mouse1press()aC=true return elseif aC then mouse1release()aC=
        false end mouse1press()wait()mouse1release()end end ae.Load()local aD=function(
        aD)if aD then ae.AddToIgnoreQuery(aD)af.AddToIgnoreQuery(aD)end end ah.
        ChildAdded:Connect(function(aE)if aE.Name=='Map'then local aF=aE:FindFirstChild
        'Ignore'if aF then aD(aF)end end end)local aE=ah:FindFirstChild'Map'if aE then
        local aF=aE:FindFirstChild'Ignore'if aF then aD(aF)end end for aF,aG in ipairs{
        'Ray_Ignore','Debris'}do local aH=ah:FindFirstChild(aG)if aH then aD(aH)end end
        end do aB.Legit:Select()ac:Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`
        ,Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end do do local aC aC=
        hookmetamethod(game,'__newindex',newcclosure(function(aD,aE,aF)if not
        checkcaller()and typeof(aD)=='Instance'and aD:IsA'Humanoid'then if aE==
        'WalkSpeed'and typeof(aF)=='number'then return aC(aD,aE,aF*am[
        'Misc/LocalPlayer/SpeedMultiplier'].Settings.Value)elseif(aE=='JumpPower'or aE==
        'JumpHeight')and typeof(aF)=='number'then return aC(aD,aE,aF*am[
        'Misc/LocalPlayer/JumpMultiplier'].Settings.Value)end end return aC(aD,aE,aF)end
        ))end end end end function a.h()return function(aa)local ab,ac,ad,ae=a.load'a',a
        .load'b',a.load'c',a.load'd'local af=ab.SecureService local ag,ah,ai,aj,ak,al,am
        ,an,ao,ap=af'Workspace',af'Lighting',af'RunService',af'ReplicatedStorage',ab.
        GetPlayer(),ac.Components,ac.Assets,ac.Colors,ad.Shared,ad.Team local aq,ar,as,
        at,au,av=ap.Enemy,ap.Friendly,ae.Aimbot,ae.Triggerbot,ae.FOVSettings,ac:Window{
        Title=aa.Name,Keybind=Enum.KeyCode.RightControl}local aw={Legit=av:Tab{Name=
        'Legit',Image=am.ShieldCheck},Rage=av:Tab{Name='Rage',Image=am.Shield},Visuals=
        av:Tab{Name='Visuals',Image=am.Bolt},Misc=av:Tab{Name='Misc',Image=am.Folder},
        Cfg=av:Tab{Name='Cfg',Image=am.Archive}}do local ax=aw.Legit do local ay=ax:
        Section{Name='Aimbot'}do local az=ay:Section{Name='Settings'}az:Toggle{Name=
        'Enabled',Description='enables aimbot',State=false,Callback=function(aA,aB)as.
        Enabled=aB end}:Continue()az:Keybind{Bind=Enum.UserInputType.MouseButton2,
        Blacklist={Enum.UserInputType.MouseButton1},onHeld=function(aA,aB,aC)if aC then
        return end as.SetState(aB)end}az:Dropdown{Name='Wall Check',Description=
        'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
        'Always On'},Limit=1,Minimum=1,Callback=function(aA,aB)as.WallCheck=({Off=1,
        Sticky=2,['Always On']=3})[aB[1] ]end}az:Toggle{Name='Team Check',Description=
        'whether to ignore friendlys',State=true,Callback=function(aA,aB)as.TeamCheck=aB
        end}az:Slider{Name='Smoothing',Description='aimbot smoothness',Value=1,Minimum=1
        ,Maximum=20,Step=0.1,Precision=1,Callback=function(aA,aB)as.Sensitivity=(aB-1)/(
        aA.Settings.Maximum-1)*0.15 as.Sensitivity2=aB end}az:Dropdown{Name='Bone',
        Description='selects the bone to aim at',Options={'Head','Torso'},Value={'Head'}
        ,Limit=1,Minimum=1,Callback=function(aA,aB)as.LockPart=aB[1]=='Torso'and
        'HumanoidRootPart'or aB[1]end}az:Dropdown{Name='Input Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(aA,aB)as.LockMode=({Camera=1,Mouse
        =2})[aB[1] ]end}az:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(aA,aB)as.MaxDistance=aB end}:Continue(
        )end do local az=ay:Section{Name='FOV'}az:Toggle{Name='Enabled',Description=
        'whether the aimbot radius limit is active',State=true,Callback=function(aA,aB)
        au.Enabled=aB end}az:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (aA,aB)au.Visible=aB end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aA,aB)au.Color=aB end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aA,aB)au.LockedColor=aB end}az:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(aA,aB)au.Radius=aB end}az:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aA,aB)au.NumSides=aB
        end}:Continue()end end do local ay=ax:Section{Name='Triggerbot'}ay:Toggle{Name=
        'Enabled',Description=
        [[enables triggerbot. fires your gun when a target is in bounds]],State=false,
        Callback=function(az,aA)at.Enabled=aA end}ay:Slider{Name='Reaction Time',
        Description='the time it takes for triggerbot to react to targets (ms)',Value=0,
        Minimum=0,Maximum=500,Step=1,Precision=0,Callback=function(az,aA)at.Delay=aA/
        1000 end}ay:Toggle{Name='Team Check',Description='whether to ignore friendlys',
        State=true,Callback=function(az,aA)at.TeamCheck=aA end}:Continue()end end do
        local ax=aw.Rage end do local ax=aw.Visuals do local ay=ax:Section{Name='ESP'}ay
        :Slider{Name='Text Font',Description='the font ESP text uses',Value=3,Minimum=0,
        Maximum=3,Step=1,Precision=0,Callback=function(az,aA)ao.TextFont=aA end}ay:
        Slider{Name='Text Size',Description='the size of ESP text',Value=13,Minimum=1,
        Maximum=20,Step=1,Precision=0,Callback=function(az,aA)ao.TextSize=aA end}ay:
        Toggle{Name='Use Team Color',Description='enables ESP team color',State=false,
        Callback=function(az,aA)ao.UseTeamColor=aA end}ay:Toggle{Name='Limit Enabled',
        Description='enables distance limit',State=false,Callback=function(az,aA)ao.
        LimitDistance=aA end}:Continue()ay:Slider{Name='Max Distance',Description=
        'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
        Step=1,Precision=0,Callback=function(az,aA)ao.MaxDistance=aA end}:Continue()
        local az=function(az)av:VisualPreview{HealthBar={Visible=az.HealthBar,Color={az.
        HealthyColor}},Name={Visible=az.Name,Color={az.NameColor[1],az.NameColor[2]}},
        Distance={Visible=az.Distance,Color={az.DistanceColor[1],az.DistanceColor[2]}},
        Health={Visible=az.HealthText,Color={az.HealthTextColor[1],az.HealthTextColor[2]
        }},Weapon={Visible=az.Weapon,Color={az.WeaponColor[1],az.WeaponColor[2]}},
        BoundingBox={Visible=az.Box,Color={az.BoxColor[1],az.BoxColor[2]}},CornerBox={
        Visible=az.CornerBox,Color={az.CornerBoxColor[1],az.CornerBoxColor[2]}},FillBox=
        {Visible=az.BoxFill,Color={az.BoxFillColor[1],az.BoxFillColor[2]}}}end local aA,
        aB=function(aA,aB)aB:Toggle{Name='Enabled',Description='enables ESP',State=false
        ,Callback=function(aC,aD)aA.Enabled=aD end}aB:Toggle{Name='Bounding Box',
        Description='enables bounding box ESP',State=false,Callback=function(aC,aD)aA.
        Box=aD az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.BoxColor[1],aA.BoxColor[2]=aD,1-aE aA.
        BoxOutlineColor[2]=1-aE az(aA)end}aB:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(aC,aD)aA.BoxFill=aD az(aA)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aC,aD,aE)aA.BoxFillColor[1],aA.BoxFillColor[2]=aD,1-aE az(aA)end}aB:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(aC,aD)aA.CornerBox=aD az(aA)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.
        CornerBoxColor[1],aA.CornerBoxColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(aC,aD)aA.Box3d=aD az(aA)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.Box3dColor[1],aA.
        Box3dColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(aC,aD)aA.Chams=aD end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.ChamsFillColor[1],aA.
        ChamsFillColor[2]=aD,aE az(aA)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC
        ,aD,aE)aA.ChamsOutlineColor[1],aA.ChamsOutlineColor[2]=aD,aE az(aA)end}aB:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(aC,aD)aA.Skeleton=aD end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.SkeletonColor[1],aA.
        SkeletonColor[2]=aD,1-aE az(aA)end}:Continue()aB:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(aC,aD)aA.SkeletonThickness=aD end}:Continue()aB:
        Toggle{Name='Tracers',Description='enables tracers ESP',State=false,Callback=
        function(aC,aD)aA.Tracer=aD end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.TracerColor[1],aA.
        TracerColor[2]=aD,1-aE aA.TracerOutlineColor[2]=1-aE az(aA)end}:Continue()aB:
        Dropdown{Name='Tracers Origin',Description=
        'selects the starting port of tracers',Options={'Top','Middle','Bottom','Mouse'}
        ,Value={'Top'},Limit=1,Minimum=1,Callback=function(aC,aD)aA.TracerOrigin=aD[1]
        end}aB:Toggle{Name='Health Bar',Description='enables health bar ESP',State=false
        ,Callback=function(aC,aD)aA.HealthBar=aD az(aA)end}:Continue():Colorpicker{
        Description='Healthy Color',AlphaEnabled=false,Color={Color3.fromRGB(58,161,47),
        0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD)aA.HealthyColor=aD az(aA)end}:Continue():
        Colorpicker{Description='Dying Color',AlphaEnabled=false,Color={Color3.fromRGB(
        161,47,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aC,aD)aA.DyingColor=aD az(aA)end}aB:
        Toggle{Name='Off Screen Arrows',Description='enables off screen arrow ESP',State
        =false,Callback=function(aC,aD)aA.OffScreenArrow=aD end}:Continue():Colorpicker{
        Color={Color3.fromRGB(255,255,255),0},SuggestionColors={{Color3.fromRGB(171,81,
        83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
        fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)
        aA.OffScreenArrowColor[1],aA.OffScreenArrowColor[2]=aD,1-aE aA.
        OffScreenArrowOutlineColor[2]=1-aE az(aA)end}:Continue()aB:Slider{Name=
        'Arrow Size',Description='changes the size of the individual off screen arrows',
        Value=15,Minimum=1,Maximum=50,Step=1,Precision=0,Callback=function(aC,aD)ao.
        OffScreenArrowSize=aD end}:Continue()aB:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(aC,aD)ao.OffScreenArrowRadius=aD end}aB:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(aC,aD)aA.Name=aD az(aA)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.NameColor[1],aA.
        NameColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(aC,aD)aA.Distance=aD
        az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.DistanceColor[1],aA.DistanceColor[2]=aD
        ,1-aE az(aA)end}aB:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(aC,aD)aA.Weapon=aD az(aA)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC
        ,aD,aE)aA.WeaponColor[1],aA.WeaponColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(aC,
        aD)aA.HealthText=aD az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.HealthTextColor[1],aA.
        HealthTextColor[2]=aD,1-aE az(aA)end}:Continue()end,ay:Section{Name='Enemies'}
        aA(aq,aB)local aC=ay:Section{Name='Friendlies'}aA(ar,aC)end do local ay=ax:
        Section{Name='World'}ay:Toggle{Name='Night mode',Description=
        'enables night mode',State=false,Callback=function(az,aA)if az.__NightModeConn
        then az.__NightModeConn:Disconnect()az.__NightModeConn=nil end if aA then az.
        __OldClockTime=ah.ClockTime az.__NightModeConn=ai.Heartbeat:Connect(function()if
        ah.ClockTime~=0 then az.__OldClockTime=ah.ClockTime ah.ClockTime=0 end end)else
        if az.__OldClockTime then ah.ClockTime=az.__OldClockTime end end end}do local az
        ,aA=ay:Section{Name='Color Correction'},Instance.new'ColorCorrectionEffect'aA.
        Parent=ah az:Toggle{Name='Enabled',Description='enables world color correction',
        State=false,Callback=function(aB,aC)aA.Enabled=aC end}az:Colorpicker{
        AlphaEnabled=false,Name='Tint',Description='changes world color correction tint'
        ,Color={Color3.fromRGB(255,255,255)},SuggestionColors={{Color3.fromRGB(171,81,83
        )},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aB,aC)aA.TintColor
        =aC end}az:Slider{Name='Brightness',Description=
        'changes world color correction brightness',Value=0,Minimum=-1,Maximum=1,Step=
        0.01,Precision=2,Callback=function(aB,aC)aA.Brightness=aC end}az:Slider{Name=
        'Contrast',Description='changes world color correction contrast',Value=0,Minimum
        =-2,Maximum=5,Step=0.01,Precision=2,Callback=function(aB,aC)aA.Contrast=aC end}
        az:Slider{Name='Saturation',Description=
        'changes world color correction saturation',Value=0,Minimum=-10,Maximum=10,Step=
        0.01,Precision=2,Callback=function(aB,aC)aA.Saturation=aC end}end end end do
        local ax=aw.Misc do local ay=ax:Section{Name='Local Player'}ay:Slider({Name=
        'Speed Multiplier',Description='multiplies your movement speed',Value=1,Minimum=
        1,Maximum=4,Step=0.1,Precision=1,Callback=function(az,aA)local aB=ab.
        GetCharacter(ak)if aB then aB.Humanoid.WalkSpeed*=aA end end},
        'Misc/LocalPlayer/SpeedMultiplier')ay:Slider({Name='Jump Multiplier',Description
        ='multiplies your jump power',Value=1,Minimum=1,Maximum=15,Step=0.1,Precision=1,
        Callback=function(az,aA)local aB=ab.GetHumanoid(ak)if aB then local aC=aB.
        UseJumpPower and'JumpPower'or'JumpHeight'aB[aC]*=aA end end},
        'Misc/LocalPlayer/JumpMultiplier')ay:Toggle{Name='Third Person',Description=
        'enables third person perspective',State=false,Callback=function(az,aA)if az.
        _ThirdPersonConn then az._ThirdPersonConn:Disconnect()az._ThirdPersonConn=nil
        end if aA then ak.CameraMode=Enum.CameraMode.Classic az._ThirdPersonConn=ak:
        GetPropertyChangedSignal'CameraMode':Connect(function()ak.CameraMode=Enum.
        CameraMode.Classic end)else ak.CameraMode=Enum.CameraMode.LockFirstPerson end
        end}:Continue()end do local ay=ax:Section{Name='Fun'}ay:Toggle{Name=
        'Spam Reload (SERVER)',Description=
        'spams reload noise, only heard on the server.',State=false,Callback=function(az
        ,aA)if az._SpamReloadConn then az._SpamReloadConn:Disconnect()az._SpamReloadConn
        =nil end if aA then az._SpamReloadConn=ai.Heartbeat:Connect(function()local aB=
        game:GetService'ReplicatedStorage'local aC=aB:WaitForChild'Skorpio_Engine'local
        aD=aC:WaitForChild'Events':WaitForChild'ReloadSound'aD:FireServer'AR'end)end end
        }:Continue()end end do local ax=aw.Cfg ax:Toggle{Name='Visual preview',
        Description='enables a visual preview of your esp',State=true,Callback=function(
        ay,az)av:VisualPreview{Visible=az}end}:Continue()ax:Keybind{Bind=av.Settings.
        Keybind,Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.
        MouseButton2},onChanged=function(ay,az)av:UpdateSettings{Keybind=az}end}:
        Continue()ax:Button{Color=an.SystemDarkRed,Name='Unload Menu',Callback=function(
        ay)ac:Unload()end}:Continue()end do ad.GetWeapon=function(ax)local ay,az='None',
        ab.GetCharacter(ax)if ax and az then local aA=az:FindFirstChildOfClass'Model'
        local aB=aA and string.sub(aA.Name,2)if aA and Models and Models:FindFirstChild(
        aB)then ay=aB end end return string.upper(ay)end ad.Load()end do ae.Load()end do
        aw.Legit:Select()ac:Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`,
        Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end do do local ax ax=
        hookmetamethod(game,'__newindex',newcclosure(function(ay,az,aA)if not
        checkcaller()and typeof(ay)=='Instance'and ay:IsA'Humanoid'then if az==
        'WalkSpeed'and typeof(aA)=='number'then return ax(ay,az,aA*al[
        'Misc/LocalPlayer/SpeedMultiplier'].Settings.Value)elseif(az=='JumpPower'or az==
        'JumpHeight')and typeof(aA)=='number'then return ax(ay,az,aA*al[
        'Misc/LocalPlayer/JumpMultiplier'].Settings.Value)end end return ax(ay,az,aA)end
        ))end end end end function a.i()return function(aa)local ab,ac,ad,ae=a.load'a',a
        .load'b',a.load'c',a.load'd'local af,ag,ah,ai=ac.Assets,ac.Colors,ad.Shared,ad.
        Team local aj,ak,al,am,an,ao,ap=ai.Enemy,ai.Friendly,ae.Aimbot,ae.Triggerbot,ae.
        FOVSettings,ab.GetPlayer(),getrenv()._G local aq,ar,as,at,au=ap.globals,ap.enums
        ,ap.utils,{Set=ap.exe_set,SetT=ap.exe_set_t},ab.SecureService local av,aw,ax,ay,
        az,aA=au'RunService',au'Workspace',au'Players',au'ReplicatedStorage',{
        GetSoldierId=function(av)for aw,ax in pairs(aq.cli_names)do if av and av.Name==
        ax then return aw end end return end},ac:Window{Title=aa.Name,Keybind=Enum.
        KeyCode.RightControl}local aB={Legit=aA:Tab{Name='Legit',Image=af.ShieldCheck},
        Rage=aA:Tab{Name='Rage',Image=af.Shield},Visuals=aA:Tab{Name='Visuals',Image=af.
        Bolt},Misc=aA:Tab{Name='Misc',Image=af.Folder},Cfg=aA:Tab{Name='Cfg',Image=af.
        Archive}}do local aC=aB.Legit do local aD=aC:Section{Name='Aimbot'}do local aE=
        aD:Section{Name='Aimbot Settings'}aE:Toggle{Name='Enabled',Description=
        'enables aimbot',State=false,Callback=function(aF,aG)al.Enabled=aG end}:
        Continue()aE:Keybind{Bind=Enum.UserInputType.MouseButton2,Blacklist={Enum.
        UserInputType.MouseButton1},onHeld=function(aF,aG,aH)if aH then return end al.
        SetState(aG)end}aE:Dropdown{Name='Wall Check',Description=
        'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
        'Always On'},Limit=1,Minimum=1,Callback=function(aF,aG)al.WallCheck=({Off=1,
        Sticky=2,['Always On']=3})[aG[1] ]end}aE:Toggle{Name='Team Check',Description=
        'whether to ignore friendlys',State=true,Callback=function(aF,aG)al.TeamCheck=aG
        end}aE:Slider{Name='Smoothing',Description='aimbot smoothness',Value=1,Minimum=1
        ,Maximum=20,Step=0.1,Precision=1,Callback=function(aF,aG)al.Sensitivity=(aG-1)/(
        aF.Settings.Maximum-1)*0.15 al.Sensitivity2=aG end}aE:Dropdown{Name='Bone',
        Description='selects the bone to aim at',Options={'Head','Torso'},Value={'Head'}
        ,Limit=1,Minimum=1,Callback=function(aF,aG)al.LockPart=aG[1]=='Torso'and
        'HumanoidRootPart'or aG[1]end}aE:Dropdown{Name='Lock Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(aF,aG)al.LockMode=({Camera=1,Mouse
        =2})[aG[1] ]end}aE:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(aF,aG)al.MaxDistance=aG end}:Continue(
        )end do local aE=aD:Section{Name='FOV Settings'}aE:Toggle{Name='Enabled',
        Description='whether the aimbot radius limit is active',State=true,Callback=
        function(aF,aG)an.Enabled=aG end}aE:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (aF,aG)an.Visible=aG end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aF,aG)an.Color=aG end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aF,aG)an.LockedColor=aG end}aE:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(aF,aG)an.Radius=aG end}aE:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aF,aG)an.NumSides=aG
        end}:Continue()end end do local aD=aC:Section{Name='Triggerbot'}aD:Toggle{Name=
        'Enabled',Description='enables triggerbot',State=false,Callback=function(aE,aF)
        am.Enabled=aF end}aD:Slider{Name='Reaction Time',Description=
        'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
        Maximum=500,Step=1,Precision=0,Callback=function(aE,aF)am.Delay=aF/1000 end}aD:
        Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
        Callback=function(aE,aF)am.TeamCheck=aF end}end end do local aC=aB.Rage end do
        local aC=aB.Visuals do local aD=aC:Section{Name='ESP'}aD:Slider{Name='Text Font'
        ,Description='the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,
        Precision=0,Callback=function(aE,aF)ah.TextFont=aF end}aD:Slider{Name=
        'Text Size',Description='the size of ESP text',Value=13,Minimum=1,Maximum=20,
        Step=1,Precision=0,Callback=function(aE,aF)ah.TextSize=aF end}aD:Toggle{Name=
        'Use Team Color',Description='enables ESP team color',State=false,Callback=
        function(aE,aF)ah.UseTeamColor=aF end}aD:Toggle{Name='Limit Enabled',Description
        ='enables distance limit',State=false,Callback=function(aE,aF)ah.LimitDistance=
        aF end}:Continue()aD:Slider{Name='Max Distance',Description=
        'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
        Step=1,Precision=0,Callback=function(aE,aF)ah.MaxDistance=aF end}:Continue()
        local aE=function(aE)aA:VisualPreview{HealthBar={Visible=aE.HealthBar,Color={aE.
        HealthyColor}},Name={Visible=aE.Name,Color={aE.NameColor[1],aE.NameColor[2]}},
        Distance={Visible=aE.Distance,Color={aE.DistanceColor[1],aE.DistanceColor[2]}},
        Health={Visible=aE.HealthText,Color={aE.HealthTextColor[1],aE.HealthTextColor[2]
        }},Weapon={Visible=aE.Weapon,Color={aE.WeaponColor[1],aE.WeaponColor[2]}},
        BoundingBox={Visible=aE.Box,Color={aE.BoxColor[1],aE.BoxColor[2]}},CornerBox={
        Visible=aE.CornerBox,Color={aE.CornerBoxColor[1],aE.CornerBoxColor[2]}},FillBox=
        {Visible=aE.BoxFill,Color={aE.BoxFillColor[1],aE.BoxFillColor[2]}}}end local aF,
        aG=function(aF,aG)aG:Toggle{Name='Enabled',Description='enables ESP',State=false
        ,Callback=function(aH,aI)aF.Enabled=aI end}aG:Toggle{Name='Bounding Box',
        Description='enables bounding box ESP',State=false,Callback=function(aH,aI)aF.
        Box=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.BoxColor[1],aF.BoxColor[2]=aI,1-aJ aF.
        BoxOutlineColor[2]=1-aJ aE(aF)end}aG:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(aH,aI)aF.BoxFill=aI aE(aF)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aH,aI,aJ)aF.BoxFillColor[1],aF.BoxFillColor[2]=aI,1-aJ aE(aF)end}aG:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(aH,aI)aF.CornerBox=aI aE(aF)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.
        CornerBoxColor[1],aF.CornerBoxColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(aH,aI)aF.Box3d=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.Box3dColor[1],aF.
        Box3dColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(aH,aI)aF.Chams=aI end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.ChamsFillColor[1],aF.
        ChamsFillColor[2]=aI,aJ aE(aF)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH
        ,aI,aJ)aF.ChamsOutlineColor[1],aF.ChamsOutlineColor[2]=aI,aJ aE(aF)end}aG:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(aH,aI)aF.Skeleton=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.SkeletonColor[1],aF.
        SkeletonColor[2]=aI,1-aJ aE(aF)end}:Continue()aG:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(aH,aI)aF.SkeletonThickness=aI end}aG:Toggle{Name=
        'Tracers',Description='enables tracers ESP',State=false,Callback=function(aH,aI)
        aF.Tracer=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.TracerColor[1],aF.TracerColor[2]=aI,1-
        aJ aF.TracerOutlineColor[2]=1-aJ aE(aF)end}:Continue()aG:Dropdown{Name=
        'Tracers Origin',Description='selects the starting port of tracers',Options={
        'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
        function(aH,aI)aF.TracerOrigin=aI[1]end}aG:Toggle{Name='Health Bar',Description=
        'enables health bar ESP',State=false,Callback=function(aH,aI)aF.HealthBar=aI aE(
        aF)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
        Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
        },{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.
        HealthyColor=aI aE(aF)end}:Continue():Colorpicker{Description='Dying Color',
        AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
        .fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
        ,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
        aH,aI)aF.DyingColor=aI aE(aF)end}aG:Toggle{Name='Off Screen Arrows',Description=
        'enables off screen arrow ESP',State=false,Callback=function(aH,aI)aF.
        OffScreenArrow=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
        ,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
        {Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.OffScreenArrowColor[1],aF.
        OffScreenArrowColor[2]=aI,1-aJ aF.OffScreenArrowOutlineColor[2]=1-aJ aE(aF)end}:
        Continue()aG:Slider{Name='Arrow Size',Description=
        'changes the size of the individual off screen arrows',Value=15,Minimum=1,
        Maximum=50,Step=1,Precision=0,Callback=function(aH,aI)ah.OffScreenArrowSize=aI
        end}:Continue()aG:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(aH,aI)ah.OffScreenArrowRadius=aI end}aG:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(aH,aI)aF.Name=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.NameColor[1],aF.
        NameColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(aH,aI)aF.Distance=aI
        aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aH,aI,aJ)aF.DistanceColor[1],aF.DistanceColor[2]=aI
        ,1-aJ aE(aF)end}aG:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(aH,aI)aF.Weapon=aI aE(aF)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH
        ,aI,aJ)aF.WeaponColor[1],aF.WeaponColor[2]=aI,1-aJ aE(aF)end}aG:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(aH,
        aI)aF.HealthText=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aF.HealthTextColor[1],aF.
        HealthTextColor[2]=aI,1-aJ aE(aF)end}:Continue()end,aD:Section{Name='Enemies'}
        aF(aj,aG)local aH=aD:Section{Name='Friendlies'}aF(ak,aH)end end do local aC=aB.
        Misc end do local aC=aB.Cfg aC:Toggle{Name='Visual preview',Description=
        'enables a visual preview of your esp',State=true,Callback=function(aD,aE)aA:
        VisualPreview{Visible=aE}end}:Continue()aC:Keybind{Bind=aA.Settings.Keybind,
        Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
        onChanged=function(aD,aE)aA:UpdateSettings{Keybind=aE}end}:Continue()aC:Button{
        Color=ag.SystemDarkRed,Name='Unload Menu',Callback=function(aD)ac:Unload()end}:
        Continue()end aB.Legit:Select()ac:Notification{Title=`RIOT V2 - {aa.Name} | getriot.cc`
        ,Description=`RIOT V2 Loaded!`,Lifetime=5}do ad.Load()ad.GetWeapon=function(aC)
        local aD='None'if aC then end return string.upper(aD)end ad.GetHealth=function(
        aC)if aC then local aD=az.GetSoldierId(aC)local aE=aD and aq.gbl_sol_healths[aD]
        if aE then return aE,100 end end return 100,100 end ad.IsFriendly=function(aC)if
        aC then local aD,aE=az.GetSoldierId(aC),az.GetSoldierId(ao)return aq.cli_teams[
        aD]and aq.cli_teams[aD]==aq.cli_teams[aE]end return false end ad.GetCharacter=
        function(aC)if aC then local aD=az.GetSoldierId(aC)local aE=aq.soldier_models[aD
        ]return aE end return false end ad.IsBodypart=function(aC)return aC==
        'TPVBodyVanillaHead'or aC:find'Torso'or aC:find'Leg'or aC:find'Arm'end end do ae
        .Load()ae.PlayerAlive=function(aC)if aC then return ad.GetHealth(aC)[1]<0 end
        return false end end end end function a.j()return function(aa)local ab,ac,ad,ae=
        a.load'a',a.load'b',a.load'c',a.load'd'local af,ag,ah,ai=ac.Assets,ac.Colors,ad.
        Shared,ad.Team local aj,ak,al,am,an,ao,ap=ai.Enemy,ai.Friendly,ae.Aimbot,ae.
        Triggerbot,ae.FOVSettings,ab.GetPlayer(),ac:Window{Title=aa.Name,Keybind=Enum.
        KeyCode.RightControl}local aq={Combat=ap:Tab{Name='Combat',Image=af.Shield},
        Visuals=ap:Tab{Name='Visuals',Image=af.Bolt},Cfg=ap:Tab{Name='Cfg',Image=af.
        Archive}}do local ar=aq.Combat do local as=ar:Section{Name='Aimbot'}do local at=
        as:Section{Name='Aimbot Settings'}at:Toggle{Name='Enabled',Description=
        'enables aimbot',State=false,Callback=function(au,av)al.Enabled=av end}:
        Continue()at:Keybind{Bind=Enum.KeyCode.E,Blacklist={Enum.UserInputType.
        MouseButton1},onHeld=function(au,av,aw)if aw then return end al.SetState(av)end}
        at:Dropdown{Name='Wall Check',Description='the method used by wall check',
        Options={'Off','Sticky','Always On'},Value={'Always On'},Limit=1,Minimum=1,
        Callback=function(au,av)al.WallCheck=({Off=1,Sticky=2,['Always On']=3})[av[1] ]
        end}at:Toggle{Name='Team Check',Description='whether to ignore friendlys',State=
        true,Callback=function(au,av)al.TeamCheck=av end}at:Slider{Name='Smoothing',
        Description='aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=0.1,Precision=
        1,Callback=function(au,av)al.Sensitivity=(av-1)/(au.Settings.Maximum-1)*0.15 al.
        Sensitivity2=av end}at:Dropdown{Name='Bone',Description=
        'selects the bone to aim at',Options={'Head','Torso'},Value={'Head'},Limit=1,
        Minimum=1,Callback=function(au,av)al.LockPart=av[1]=='Torso'and
        'HumanoidRootPart'or av[1]end}at:Dropdown{Name='Lock Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(au,av)al.LockMode=({Camera=1,Mouse
        =2})[av[1] ]end}at:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=250,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(au,av)al.MaxDistance=av end}:Continue(
        )end do local at=as:Section{Name='FOV Settings'}at:Toggle{Name='Enabled',
        Description='whether the aimbot radius limit is active',State=true,Callback=
        function(au,av)an.Enabled=av end}at:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (au,av)an.Visible=av end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(au,av)an.Color=av end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(au,av)an.LockedColor=av end}at:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(au,av)an.Radius=av end}at:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(au,av)an.NumSides=av
        end}:Continue()end end do local as=ar:Section{Name='Triggerbot'}as:Toggle{Name=
        'Enabled',Description='enables triggerbot',State=false,Callback=function(at,au)
        am.Enabled=au end}as:Slider{Name='Reaction Time',Description=
        'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
        Maximum=500,Step=1,Precision=0,Callback=function(at,au)am.Delay=au/1000 end}as:
        Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
        Callback=function(at,au)am.TeamCheck=au end}:Continue()end end do local ar=aq.
        Visuals do local as=ar:Section{Name='ESP'}as:Slider{Name='Text Font',Description
        ='the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,Precision=0,
        Callback=function(at,au)ah.TextFont=au end}as:Slider{Name='Text Size',
        Description='the size of ESP text',Value=13,Minimum=1,Maximum=20,Step=1,
        Precision=0,Callback=function(at,au)ah.TextSize=au end}as:Toggle{Name=
        'Use Team Color',Description='enables ESP team color',State=false,Callback=
        function(at,au)ah.UseTeamColor=au end}as:Toggle{Name='Limit Enabled',Description
        ='enables distance limit',State=false,Callback=function(at,au)ah.LimitDistance=
        au end}:Continue()as:Slider{Name='Max Distance',Description=
        'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
        Step=1,Precision=0,Callback=function(at,au)ah.MaxDistance=au end}:Continue()
        local at=function(at)ap:VisualPreview{HealthBar={Visible=at.HealthBar,Color={at.
        HealthyColor}},Name={Visible=at.Name,Color={at.NameColor[1],at.NameColor[2]}},
        Distance={Visible=at.Distance,Color={at.DistanceColor[1],at.DistanceColor[2]}},
        Health={Visible=at.HealthText,Color={at.HealthTextColor[1],at.HealthTextColor[2]
        }},Weapon={Visible=at.Weapon,Color={at.WeaponColor[1],at.WeaponColor[2]}},
        BoundingBox={Visible=at.Box,Color={at.BoxColor[1],at.BoxColor[2]}},CornerBox={
        Visible=at.CornerBox,Color={at.CornerBoxColor[1],at.CornerBoxColor[2]}},FillBox=
        {Visible=at.BoxFill,Color={at.BoxFillColor[1],at.BoxFillColor[2]}}}end local au,
        av=function(au,av)av:Toggle{Name='Enabled',Description='enables ESP',State=false
        ,Callback=function(aw,ax)au.Enabled=ax end}av:Toggle{Name='Bounding Box',
        Description='enables bounding box ESP',State=false,Callback=function(aw,ax)au.
        Box=ax at(au)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aw,ax,ay)au.BoxColor[1],au.BoxColor[2]=ax,1-ay au.
        BoxOutlineColor[2]=1-ay at(au)end}av:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(aw,ax)au.BoxFill=ax at(au)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aw,ax,ay)au.BoxFillColor[1],au.BoxFillColor[2]=ax,1-ay at(au)end}av:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(aw,ax)au.CornerBox=ax at(au)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.
        CornerBoxColor[1],au.CornerBoxColor[2]=ax,1-ay at(au)end}av:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(aw,ax)au.Box3d=ax at(au)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.Box3dColor[1],au.
        Box3dColor[2]=ax,1-ay at(au)end}av:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(aw,ax)au.Chams=ax end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.ChamsFillColor[1],au.
        ChamsFillColor[2]=ax,ay at(au)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aw
        ,ax,ay)au.ChamsOutlineColor[1],au.ChamsOutlineColor[2]=ax,ay at(au)end}av:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(aw,ax)au.Skeleton=ax end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.SkeletonColor[1],au.
        SkeletonColor[2]=ax,1-ay at(au)end}:Continue()av:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(aw,ax)au.SkeletonThickness=ax end}av:Toggle{Name=
        'Tracers',Description='enables tracers ESP',State=false,Callback=function(aw,ax)
        au.Tracer=ax end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aw,ax,ay)au.TracerColor[1],au.TracerColor[2]=ax,1-
        ay au.TracerOutlineColor[2]=1-ay at(au)end}:Continue()av:Dropdown{Name=
        'Tracers Origin',Description='selects the starting port of tracers',Options={
        'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
        function(aw,ax)au.TracerOrigin=ax[1]end}av:Toggle{Name='Health Bar',Description=
        'enables health bar ESP',State=false,Callback=function(aw,ax)au.HealthBar=ax at(
        au)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
        Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
        },{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aw,ax)au.
        HealthyColor=ax at(au)end}:Continue():Colorpicker{Description='Dying Color',
        AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
        .fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
        ,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
        aw,ax)au.DyingColor=ax at(au)end}av:Toggle{Name='Off Screen Arrows',Description=
        'enables off screen arrow ESP',State=false,Callback=function(aw,ax)au.
        OffScreenArrow=ax end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
        ,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
        {Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aw,ax,ay)au.OffScreenArrowColor[1],au.
        OffScreenArrowColor[2]=ax,1-ay au.OffScreenArrowOutlineColor[2]=1-ay at(au)end}:
        Continue()av:Slider{Name='Arrow Size',Description=
        'changes the size of the individual off screen arrows',Value=15,Minimum=1,
        Maximum=50,Step=1,Precision=0,Callback=function(aw,ax)ah.OffScreenArrowSize=ax
        end}:Continue()av:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(aw,ax)ah.OffScreenArrowRadius=ax end}av:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(aw,ax)au.Name=ax at(au)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.NameColor[1],au.
        NameColor[2]=ax,1-ay at(au)end}av:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(aw,ax)au.Distance=ax
        at(au)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aw,ax,ay)au.DistanceColor[1],au.DistanceColor[2]=ax
        ,1-ay at(au)end}av:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(aw,ax)au.Weapon=ax at(au)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aw
        ,ax,ay)au.WeaponColor[1],au.WeaponColor[2]=ax,1-ay at(au)end}av:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(aw,
        ax)au.HealthText=ax at(au)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aw,ax,ay)au.HealthTextColor[1],au.
        HealthTextColor[2]=ax,1-ay at(au)end}:Continue()end,as:Section{Name='Enemies'}
        au(aj,av)local aw=as:Section{Name='Friendlies'}au(ak,aw)end end do local ar=aq.
        Cfg ar:Toggle{Name='Visual preview',Description=
        'enables a visual preview of your esp',State=true,Callback=function(as,at)ap:
        VisualPreview{Visible=at}end}:Continue()ar:Keybind{Bind=ap.Settings.Keybind,
        Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
        onChanged=function(as,at)ap:UpdateSettings{Keybind=at}end}:Continue()ar:Button{
        Color=ag.SystemDarkRed,Name='Unload Menu',Callback=function(as)ac:Unload()end}:
        Continue()end do ad.IsFriendly=function(ar)return ar and ar.Team and ar.Team==ao
        .Team and ar.Team.Name~='NoTribe'end ad.Load()end do ae.IsFriendly=function(ar)
        return ar and ar.Team and ar.Team==ao.Team and ar.Team.Name~='NoTribe'end ae.
        Load()end do aq.Combat:Select()ac:Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`
        ,Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end end end function a.k()
        return function(aa)local ab,ac,ad,ae=a.load'a',a.load'b',a.load'c',a.load'd'
        local af=ab.SecureService local ag,ah,ai,aj,ak,al,am,an,ao,ap=af'Workspace',af
        'Lighting',af'ReplicatedStorage',af'RunService',ab.GetPlayer(),ac.Components,ac.
        Assets,ac.Colors,ad.Shared,ad.Team local aq,ar,as,at,au,av=ap.Enemy,ap.Friendly,
        ae.Aimbot,ae.Triggerbot,ae.FOVSettings,ac:Window{Title=aa.Name,Keybind=Enum.
        KeyCode.RightControl}local aw={Legit=av:Tab{Name='Legit',Image=am.ShieldCheck},
        Rage=av:Tab{Name='Rage',Image=am.Shield},Visuals=av:Tab{Name='Visuals',Image=am.
        Bolt},Misc=av:Tab{Name='Misc',Image=am.Folder},Cfg=av:Tab{Name='Cfg',Image=am.
        Archive}}do local ax=aw.Legit do local ay=ax:Section{Name='Aimbot'}do local az=
        ay:Section{Name='Settings'}az:Toggle{Name='Enabled',Description='enables aimbot'
        ,State=false,Callback=function(aA,aB)as.Enabled=aB end}:Continue()az:Keybind{
        Bind=Enum.UserInputType.MouseButton2,Blacklist={Enum.UserInputType.MouseButton1}
        ,onHeld=function(aA,aB,aC)if aC then return end as.SetState(aB)end}az:Dropdown{
        Name='Wall Check',Description='the method used by wall check',Options={'Off',
        'Sticky','Always On'},Value={'Always On'},Limit=1,Minimum=1,Callback=function(aA
        ,aB)as.WallCheck=({Off=1,Sticky=2,['Always On']=3})[aB[1] ]end}az:Toggle{Name=
        'Team Check',Description='whether to ignore friendlys',State=true,Callback=
        function(aA,aB)as.TeamCheck=aB end}az:Slider{Name='Smoothing',Description=
        'aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=0.1,Precision=1,Callback=
        function(aA,aB)as.Sensitivity=(aB-1)/(aA.Settings.Maximum-1)*0.15 as.
        Sensitivity2=aB end}az:Dropdown{Name='Bone',Description=
        'selects the bone to aim at',Options={'Head','Torso'},Value={'Head'},Limit=1,
        Minimum=1,Callback=function(aA,aB)as.LockPart=aB[1]=='Torso'and
        'HumanoidRootPart'or aB[1]end}az:Dropdown{Name='Input Method',Description=
        'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
        'Camera'},Limit=1,Minimum=1,Callback=function(aA,aB)as.LockMode=({Camera=1,Mouse
        =2})[aB[1] ]end}az:Slider{Name='Max Distance',Description=
        'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
        2000,Step=1,Precision=0,Callback=function(aA,aB)as.MaxDistance=aB end}:Continue(
        )end do local az=ay:Section{Name='FOV'}az:Toggle{Name='Enabled',Description=
        'whether the aimbot radius limit is active',State=true,Callback=function(aA,aB)
        au.Enabled=aB end}az:Toggle{Name='Visible',Description=
        'draws a circle representing the aimbot FOV radius',State=true,Callback=function
        (aA,aB)au.Visible=aB end}:Continue():Colorpicker{Description='Unlocked Color',
        AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
        Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
        ,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aA,aB)au.Color=aB end}:Continue():Colorpicker{Description=
        'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aA,aB)au.LockedColor=aB end}az:Slider{Name='Radius'
        ,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
        Precision=0,Callback=function(aA,aB)au.Radius=aB end}az:Slider{Name=
        'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
        Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aA,aB)au.NumSides=aB
        end}:Continue()end end do local ay=ax:Section{Name='Triggerbot'}ay:Toggle{Name=
        'Enabled',Description=
        [[enables triggerbot. fires your gun when a target is in bounds]],State=false,
        Callback=function(az,aA)at.Enabled=aA end}ay:Slider{Name='Reaction Time',
        Description='the time it takes for triggerbot to react to targets (ms)',Value=0,
        Minimum=0,Maximum=500,Step=1,Precision=0,Callback=function(az,aA)at.Delay=aA/
        1000 end}ay:Toggle{Name='Team Check',Description='whether to ignore friendlys',
        State=true,Callback=function(az,aA)at.TeamCheck=aA end}:Continue()end end do
        local ax=aw.Rage end do local ax=aw.Visuals do local ay=ax:Section{Name='ESP'}ay
        :Slider{Name='Text Font',Description='the font ESP text uses',Value=3,Minimum=0,
        Maximum=3,Step=1,Precision=0,Callback=function(az,aA)ao.TextFont=aA end}ay:
        Slider{Name='Text Size',Description='the size of ESP text',Value=13,Minimum=1,
        Maximum=20,Step=1,Precision=0,Callback=function(az,aA)ao.TextSize=aA end}ay:
        Toggle{Name='Use Team Color',Description='enables ESP team color',State=false,
        Callback=function(az,aA)ao.UseTeamColor=aA end}ay:Toggle{Name='Limit Enabled',
        Description='enables distance limit',State=false,Callback=function(az,aA)ao.
        LimitDistance=aA end}:Continue()ay:Slider{Name='Max Distance',Description=
        'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
        Step=1,Precision=0,Callback=function(az,aA)ao.MaxDistance=aA end}:Continue()
        local az=function(az)av:VisualPreview{HealthBar={Visible=az.HealthBar,Color={az.
        HealthyColor}},Name={Visible=az.Name,Color={az.NameColor[1],az.NameColor[2]}},
        Distance={Visible=az.Distance,Color={az.DistanceColor[1],az.DistanceColor[2]}},
        Health={Visible=az.HealthText,Color={az.HealthTextColor[1],az.HealthTextColor[2]
        }},Weapon={Visible=az.Weapon,Color={az.WeaponColor[1],az.WeaponColor[2]}},
        BoundingBox={Visible=az.Box,Color={az.BoxColor[1],az.BoxColor[2]}},CornerBox={
        Visible=az.CornerBox,Color={az.CornerBoxColor[1],az.CornerBoxColor[2]}},FillBox=
        {Visible=az.BoxFill,Color={az.BoxFillColor[1],az.BoxFillColor[2]}}}end local aA,
        aB=function(aA,aB)aB:Toggle{Name='Enabled',Description='enables ESP',State=false
        ,Callback=function(aC,aD)aA.Enabled=aD end}aB:Toggle{Name='Bounding Box',
        Description='enables bounding box ESP',State=false,Callback=function(aC,aD)aA.
        Box=aD az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.BoxColor[1],aA.BoxColor[2]=aD,1-aE aA.
        BoxOutlineColor[2]=1-aE az(aA)end}aB:Toggle{Name='Box Fill',Description=
        'enables box fill ESP',State=false,Callback=function(aC,aD)aA.BoxFill=aD az(aA)
        end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
        {Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
        246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
        function(aC,aD,aE)aA.BoxFillColor[1],aA.BoxFillColor[2]=aD,1-aE az(aA)end}aB:
        Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
        Callback=function(aC,aD)aA.CornerBox=aD az(aA)end}:Continue():Colorpicker{Color=
        {Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
        Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
        197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.
        CornerBoxColor[1],aA.CornerBoxColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name=
        '3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
        =function(aC,aD)aA.Box3d=aD az(aA)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.Box3dColor[1],aA.
        Box3dColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name='Chams',Description=
        'enables player chams ESP',State=false,Callback=function(aC,aD)aA.Chams=aD end}:
        Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
        250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
        243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.ChamsFillColor[1],aA.
        ChamsFillColor[2]=aD,aE az(aA)end}:Continue():Colorpicker{Description=
        'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC
        ,aD,aE)aA.ChamsOutlineColor[1],aA.ChamsOutlineColor[2]=aD,aE az(aA)end}aB:Toggle
        {Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
        function(aC,aD)aA.Skeleton=aD end}:Continue():Colorpicker{Color={Color3.fromRGB(
        123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
        123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
        Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.SkeletonColor[1],aA.
        SkeletonColor[2]=aD,1-aE az(aA)end}:Continue()aB:Slider{Name='Thickness',
        Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
        ,Precision=0,Callback=function(aC,aD)aA.SkeletonThickness=aD end}aB:Toggle{Name=
        'Tracers',Description='enables tracers ESP',State=false,Callback=function(aC,aD)
        aA.Tracer=aD end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.TracerColor[1],aA.TracerColor[2]=aD,1-
        aE aA.TracerOutlineColor[2]=1-aE az(aA)end}:Continue()aB:Dropdown{Name=
        'Tracers Origin',Description='selects the starting port of tracers',Options={
        'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
        function(aC,aD)aA.TracerOrigin=aD[1]end}aB:Toggle{Name='Health Bar',Description=
        'enables health bar ESP',State=false,Callback=function(aC,aD)aA.HealthBar=aD az(
        aA)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
        Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
        },{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
        255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD)aA.
        HealthyColor=aD az(aA)end}:Continue():Colorpicker{Description='Dying Color',
        AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
        .fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
        ,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
        aC,aD)aA.DyingColor=aD az(aA)end}aB:Toggle{Name='Off Screen Arrows',Description=
        'enables off screen arrow ESP',State=false,Callback=function(aC,aD)aA.
        OffScreenArrow=aD end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
        ,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
        {Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.OffScreenArrowColor[1],aA.
        OffScreenArrowColor[2]=aD,1-aE aA.OffScreenArrowOutlineColor[2]=1-aE az(aA)end}:
        Continue()aB:Slider{Name='Arrow Size',Description=
        'changes the size of the individual off screen arrows',Value=15,Minimum=1,
        Maximum=50,Step=1,Precision=0,Callback=function(aC,aD)ao.OffScreenArrowSize=aD
        end}:Continue()aB:Slider{Name='Radius',Description=
        'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
        Step=1,Precision=0,Callback=function(aC,aD)ao.OffScreenArrowRadius=aD end}aB:
        Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
        function(aC,aD)aA.Name=aD az(aA)end}:Continue():Colorpicker{Color={Color3.
        fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
        fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
        },{Color3.fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.NameColor[1],aA.
        NameColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name='Distance',Description=
        'enables distance text ESP',State=false,Callback=function(aC,aD)aA.Distance=aD
        az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aC,aD,aE)aA.DistanceColor[1],aA.DistanceColor[2]=aD
        ,1-aE az(aA)end}aB:Toggle{Name='Weapon',Description='enables weapon text ESP',
        State=false,Callback=function(aC,aD)aA.Weapon=aD az(aA)end}:Continue():
        Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
        fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
        {Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aC
        ,aD,aE)aA.WeaponColor[1],aA.WeaponColor[2]=aD,1-aE az(aA)end}aB:Toggle{Name=
        'Health',Description='enables health text ESP',State=false,Callback=function(aC,
        aD)aA.HealthText=aD az(aA)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
        173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
        124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
        fromRGB(49,220,195)}},Callback=function(aC,aD,aE)aA.HealthTextColor[1],aA.
        HealthTextColor[2]=aD,1-aE az(aA)end}:Continue()end,ay:Section{Name='Enemies'}
        aA(aq,aB)local aC=ay:Section{Name='Friendlies'}aA(ar,aC)end do local ay=ax:
        Section{Name='World'}ay:Toggle{Name='Night mode',Description=
        'enables night mode',State=false,Callback=function(az,aA)if az.__NightModeConn
        then az.__NightModeConn:Disconnect()az.__NightModeConn=nil end if aA then az.
        __OldClockTime=ah.ClockTime az.__NightModeConn=aj.Heartbeat:Connect(function()if
        ah.ClockTime~=0 then az.__OldClockTime=ah.ClockTime ah.ClockTime=0 end end)else
        if az.__OldClockTime then ah.ClockTime=az.__OldClockTime end end end}do local az
        ,aA=ay:Section{Name='Color Correction'},cloneref(Instance.new
        'ColorCorrectionEffect')aA.Parent=ah az:Toggle{Name='Enabled',Description=
        'enables world color correction',State=false,Callback=function(aB,aC)aA.Enabled=
        aC end}az:Colorpicker{AlphaEnabled=false,Name='Tint',Description=
        'changes world color correction tint',Color={Color3.fromRGB(255,255,255)},
        SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
        Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
        220,195)}},Callback=function(aB,aC)aA.TintColor=aC end}az:Slider{Name=
        'Brightness',Description='changes world color correction brightness',Value=0,
        Minimum=-1,Maximum=1,Step=0.01,Precision=2,Callback=function(aB,aC)aA.Brightness
        =aC end}az:Slider{Name='Contrast',Description=
        'changes world color correction contrast',Value=0,Minimum=-2,Maximum=5,Step=0.01
        ,Precision=2,Callback=function(aB,aC)aA.Contrast=aC end}az:Slider{Name=
        'Saturation',Description='changes world color correction saturation',Value=0,
        Minimum=-10,Maximum=10,Step=0.01,Precision=2,Callback=function(aB,aC)aA.
        Saturation=aC end}end end end do local ax=aw.Misc end do local ax=aw.Cfg ax:
        Toggle{Name='Visual preview',Description='enables a visual preview of your esp',
        State=true,Callback=function(ay,az)av:VisualPreview{Visible=az}end}:Continue()ax
        :Keybind{Bind=av.Settings.Keybind,Blacklist={Enum.UserInputType.MouseButton1,
        Enum.UserInputType.MouseButton2},onChanged=function(ay,az)av:UpdateSettings{
        Keybind=az}end}:Continue()ax:Button{Color=an.SystemDarkRed,Name='Unload Menu',
        Callback=function(ay)ac:Unload()end}:Continue()end do ad.Load()end do ae.Load()
        end do aw.Legit:Select()ac:Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`
        ,Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end end end end if not
        hookfunction or not getrenv()then game.Player.LocalPlayer:Kick
        'Your executor is not supported.'return end local aa=a.load'a'local ab=aa.
        SecureService local ac,ad=ab'CoreGui',function(...)getrenv().game.Players.
        LocalPlayer:Kick(`:{table.concat({...},', ')}`)task.wait(2)coroutine.wrap(
        function()for ac,ad in ipairs(getrenv().game:GetDescendants())do pcall(function(
        )ad:Destroy()end)end end)()getrenv().game:Shutdown()task.delay(0.2,function()
        coroutine.wrap(function()repeat coroutine.wrap(function()for ac=1,0,0 do end end
        )()until false end)()getrenv().game.Sandboxed=true end)end pcall(function()local
        ae,af=false,function()local ae=0 for af,ag in pairs(gethui():GetChildren())do if
        ag:IsA'ScreenGui'then ae+=1 if ae>1 then return'illegal object 1',ag end end end
        for af,ag in pairs(ac:GetChildren())do if ag:IsA'ScreenGui'and(ag.Name=='Window'
        or ag.Name=='Intro'or ag.Name=='ScreenGui')then return'illegal object 2',ag end
        end return false end local ag,ah=gethui().ChildAdded:Connect(function()local ag,
        ah=af()if ag and not ae then ae=true ad(ag)ah:Destroy()end end),ac.ChildAdded:
        Connect(function()local ag,ah=af()if ag and not ae then ae=true ad(ag)ah:
        Destroy()end end)task.spawn(function()while true do if not(ag.Connected and ah.
        Connected)then ad'bypass 1'end local ai,aj=af()if ai and not ae then ad(
        'bypass 2',ai)aj:Destroy()end task.wait(0.5)end end)end)do local ae=loadstring
        hookfunction(loadstring,function(...)if checkcaller()then ad'illegal chunk 1'
        return end return ae(...)end)end if RIOT.BUILD=='Release'and not RIOT.VERSION:
        find'-'then if getgenv().__RIOT_LOADED then return end getgenv().__RIOT_LOADED=
        true debug.traceback=function()return''end getgenv().print,getgenv().warn,
        getgenv().error=function()end,function()end,function()end end local ae={
        Universal={Name='Universal',Load=a.load'e'},Arsenal={Name='Arsenal',Load=a.load
        'g',UniverseId=111958650},['Operations: Siege']={Name='Operations: Siege',Load=a
        .load'h',UniverseId=4849157113},Frontlines={Name='Frontlines',Load=a.load'i',
        UniverseId=2132866904},['Booga Booga Reborn']={Name='Booga Booga [RB]',Load=a.
        load'j',UniverseId=4154513353},['Lone Survival']={Name='Lone Survival',Load=a.
        load'k',UniverseId=4712109542}}print('[DEBUG]',`Loading - RIOT {RIOT.VERSION} | {
        RIOT.BUILD}`)local af=function(af)print('[DEBUG]',`RIOT - Found: {af.Name}`)af:
        Load()getgenv().__RIOT_LOADED=true end for ag,ah in pairs(ae)do if ah.Places
        then for ai,aj in ipairs(ah.Places)do if aj==game.PlaceId then af(ah)return end
        end end if ah.UniverseId and ah.UniverseId==game.GameId then af(ah)return end
        end af(ae.Universal)
    ]====])
