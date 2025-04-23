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

Push(
	[====[

		getgenv().RIOT = {
			BUILD = 'Release',
			VERSION = 'v2.0.0' or 'v0.0.0'
		}

		local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
		end return a.cache[b].c end}do function a.a()local b,c={Components={},Assets={
		DefaultImage='rbxassetid://134552883719543',ShieldCheck=
		'rbxassetid://72905476505849',Shield='rbxassetid://125424227377940',Archive=
		'rbxassetid://86530498402003',Folder='rbxassetid://134156031333431',Bolt=
		'rbxassetid://99791134265440',Globe='rbxassetid://132856339478739',Computer=
		'rbxassetid://136037119434947',Settings='rbxassetid://71732494649961'},Colors={
		SystemDarkRed=Color3.fromRGB(104,29,29)}},{folder='Riot',unloaded=false,
		localPlayer=nil,camera=nil,gui=nil,overlay=nil,dropdownFrames={},notifSystem={
		totalOffset=0,notifications=nil,uIpadding=nil,notifInstances={}},tabSystem={
		tabInstances={},tabIndex=0,currentTab=nil,currentContent=nil},KeyMap_Spec={[Enum
		.UserInputType.MouseButton1]='VK_LBUTTON',[Enum.UserInputType.MouseButton2]=
		'VK_RBUTTON',[Enum.UserInputType.MouseButton3]='VK_MBUTTON',[Enum.KeyCode.Return
		]='VK_RETURN',[Enum.KeyCode.CapsLock]='VK_CAPITAL',[Enum.KeyCode.PageUp]=
		'VK_PRIOR',[Enum.KeyCode.PageDown]='VK_NEXT',[Enum.KeyCode.Escape]='VK_ESCAPE',[
		Enum.KeyCode.Backspace]='VK_BACK',[Enum.KeyCode.Space]='VK_SPACE'},GetService=
		function(b)return cloneref and cloneref(game:GetService(b))or game:GetService(b)
		end}local d={_players=c.GetService'Players',_runService=c.GetService'RunService'
		,_userInputService=c.GetService'UserInputService',_tweenService=c.GetService
		'TweenService',_workspace=c.GetService'Workspace'}local e={tween=function(e,f,g)
		return d._tweenService:Create(e,f,g)end,callback=function(e,...)local f={...}
		task.spawn(function()e(table.unpack(f))end)end,parseKeyCode=function(e)if c.
		KeyMap_Spec[e]then return c.KeyMap_Spec[e]end if e.Name then return'VK_'..e.Name
		:upper()end return'VK_UNKNOWN'end,secureGui=function(e)local f=Instance.new
		'ScreenGui'for g,h in pairs(e)do if g~='Parent'then pcall(function()f[g]=h end)
		end end f.Parent=(d._runService:IsStudio()and c.localPlayer:FindFirstChild
		'PlayerGui'or gethui and gethui()or c.GetService'CoreGui')return f end,
		mouseInFrame=function(e)local f,g,h=d._userInputService:GetMouseLocation(),e.
		AbsolutePosition,e.AbsoluteSize return f.X>=g.X and f.X<=g.X+h.X and f.Y>=g.Y
		and f.Y<=g.Y+h.Y end,makeDraggable=function(e,f)assert(e,
		'Expected a base frame for makeDraggable')f=f or e local g,h,i,j=false local k=
		function(k)local l=k.Position-h e.Position=UDim2.new(i.X.Scale,i.X.Offset+l.X,i.
		Y.Scale,i.Y.Offset+l.Y)end f.InputBegan:Connect(function(l)if l.UserInputType==
		Enum.UserInputType.MouseButton1 or l.UserInputType==Enum.UserInputType.Touch
		then g=true h=l.Position i=e.Position l.Changed:Connect(function()if l.
		UserInputState==Enum.UserInputState.End then g=false end end)end end)f.
		InputChanged:Connect(function(l)if l.UserInputType==Enum.UserInputType.
		MouseMovement or l.UserInputType==Enum.UserInputType.Touch then j=l end end)d.
		_userInputService.InputChanged:Connect(function(l)if g and l==j and e.Visible
		then k(l)end end)end,subParser={None=function(e)return e end,Numeric=function(e)
		return e:gsub('%D','')end,Alphabetic=function(e)return e:gsub('[^a-zA-Z ]','')
		end,Alphanumeric=function(e)return e:gsub('[^a-zA-Z0-9]','')end,FloatNumeric=
		function(e)return e:gsub('[^-%.%d]',''):gsub('^(%-?)0+','%1'):gsub('(%-?)%.',
		'%10.'):gsub('(%..*)%.','%1'):gsub('(%-.)','%1')end,Mathematic=function(e)e=e:
		gsub('[^%d%.%+%-%*/%^%%%(%)]','')local f,g=function(f)local g,h={},''for i in f:
		gmatch'.'do if i:match'[%d%.]'then h=h..i else if h~=''then table.insert(g,h)h=
		''end table.insert(g,i)end end if h~=''then table.insert(g,h)end return g end,{[
		'+']=1,['-']=1,['*']=2,['/']=2,['%']=2,['^']=3}local h,i=function(h)local i,j={}
		,{}for k,l in ipairs(h)do if tonumber(l)then table.insert(i,l)elseif l=='('then
		table.insert(j,l)elseif l==')'then while#j>0 and j[#j]~='('do table.insert(i,
		table.remove(j))end table.remove(j)else while#j>0 and g[j[#j] ]and g[j[#j] ]>=g[
		l]do table.insert(i,table.remove(j))end table.insert(j,l)end end while#j>0 do
		table.insert(i,table.remove(j))end return i end,function(h)local i={}for j,k in
		ipairs(h)do if tonumber(k)then table.insert(i,tonumber(k))else local l,m=table.
		remove(i),table.remove(i)if not m or not l then return e end if k=='+'then table
		.insert(i,m+l)elseif k=='-'then table.insert(i,m-l)elseif k=='*'then table.
		insert(i,m*l)elseif k=='/'then table.insert(i,m/l)elseif k=='%'then table.
		insert(i,m%l)elseif k=='^'then table.insert(i,m^l)end end end return tostring(i[
		1]or e)end return i(h(f(e)))end}}function CreateSection(f,g,h)local i,j={
		Settings=g},Instance.new'Frame'j.Name='Section'j.AutomaticSize=Enum.
		AutomaticSize.Y j.BackgroundColor3=Color3.fromRGB(255,255,255)j.
		BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
		j.Size=UDim2.fromScale(1,0)local k=Instance.new'TextButton'k.Name='Leading'k.
		AutoButtonColor=false k.AutomaticSize=Enum.AutomaticSize.Y k.BackgroundColor3=
		Color3.fromRGB(255,255,255)k.BackgroundTransparency=1 k.BorderColor3=Color3.
		fromRGB(0,0,0)k.BorderSizePixel=0 k.LayoutOrder=-1 k.Selectable=false k.Size=
		UDim2.fromScale(1,0)k.Text=''local l=Instance.new'TextLabel'l.Name='Name'l.
		AutomaticSize=Enum.AutomaticSize.XY l.BackgroundColor3=Color3.fromRGB(255,255,
		255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.
		BorderSizePixel=0 l.FontFace=Font.new('rbxassetid://16658237174',Enum.FontWeight
		.Bold,Enum.FontStyle.Normal)l.LayoutOrder=1 l.Position=UDim2.fromOffset(28,0)l.
		RichText=true l.TextColor3=Color3.fromRGB(225,225,225)l.TextSize=20 l.
		TextWrapped=true l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=k local m=
		Instance.new'ImageButton'm.Name='Chevron'm.AnchorPoint=Vector2.new(0,0.5)m.
		AutoButtonColor=false m.BackgroundColor3=Color3.fromRGB(30,34,47)m.
		BackgroundTransparency=1 m.BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0
		m.Image='rbxassetid://77136690433593'm.LayoutOrder=1 m.Position=UDim2.fromScale(
		0,0.5)m.Selectable=false m.Active=false m.Interactable=false m.Size=UDim2.
		fromOffset(18,18)m.Parent=k k.Parent=j local n=Instance.new'Frame'n.Name=
		'Trailing'n.BackgroundColor3=Color3.fromRGB(255,255,255)n.BackgroundTransparency
		=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.ClipsDescendants=
		true n.Size=UDim2.fromScale(1,0)local o=Instance.new'UIListLayout'o.Name=
		'UIListLayout'o.Padding=UDim.new(0,10)o.SortOrder=Enum.SortOrder.LayoutOrder o.
		Parent=n local p=Instance.new'UIPadding'p.Name='UIPadding'p.PaddingLeft=UDim.
		new(0,12)p.Parent=n local q=Instance.new'Folder'q.Name='Folder'local r=Instance.
		new'Frame'r.Name='Frame'r.AnchorPoint=Vector2.new(0,1)r.BackgroundColor3=Color3.
		fromRGB(30,30,30)r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.
		Position=UDim2.new(0,-12,1,0)r.Size=UDim2.new(0,1,1,0)r.Parent=q q.Parent=n n.
		Parent=j local s=Instance.new'UIListLayout's.Name='UIListLayout's.Padding=UDim.
		new(0,10)s.SortOrder=Enum.SortOrder.LayoutOrder s.Parent=j local t=Instance.new
		'UIPadding't.Name='UIPadding't.PaddingBottom=UDim.new(0,8)t.PaddingTop=UDim.new(
		0,8)t.Parent=j j.Parent=f local u=function(u)if u then local v,w={},0 for x,y in
		pairs(n:GetChildren())do if y:IsA'GuiObject'and y.Visible then table.insert(v,y)
		w+=y.AbsoluteSize.Y end end if#v>1 then w+=(#v-1)*o.Padding.Offset end e.tween(n
		,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size=UDim2.new(1,0,0,w)}):Play()e.
		tween(m,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Rotation=-180}):Play()else e.
		tween(n,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size=UDim2.new(1,0,0,0)}):
		Play()e.tween(m,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Rotation=0}):Play()
		end end k.MouseButton1Click:Connect(function()i.Settings.Opened=not i.Settings.
		Opened u(i.Settings.Opened)end)local v=function(v)if not v:IsA'GuiObject'then
		return end v:GetPropertyChangedSignal'Visible':Connect(function()if i.Settings.
		Opened then u(true)end end)v:GetPropertyChangedSignal'AbsoluteSize':Connect(
		function()if i.Settings.Opened then u(true)end end)end for w,x in pairs(n:
		GetChildren())do v(x)end n.ChildAdded:Connect(function(w)v(w)if i.Settings.
		Opened then u(true)end end)n.ChildRemoved:Connect(function()if i.Settings.Opened
		then u(true)end end)function i:UpdateSettings(w)if w.Visible~=nil then i.
		Settings.Visible=w.Visible j.Visible=w.Visible end if w.Opened~=nil then i.
		Settings.Opened=w.Opened u(w.Opened)end if w.Name then i.Settings.Name=w.Name l.
		Text=w.Name end end if i.Settings.Closed==nil then i.Settings.Closed=true end i:
		UpdateSettings(i.Settings)if h then b.Components[h]=i end i.Content=n
		injectComponents(i)return i end function CreateButton(f,g,h)local i={Settings=g}
		assert(i.Settings.Name and type(i.Settings.Name)=='string',
		'Missing button name or wrong type')local j=Instance.new'Frame'j.AutomaticSize=
		Enum.AutomaticSize.Y j.BackgroundColor3=i.Settings.Color or Color3.fromRGB(30,30
		,30)j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0 j.Size=UDim2.new(1,0
		,0,40)j.Visible=i.Settings.Visible==nil and true or i.Settings.Visible j.Parent=
		f local k=Instance.new'UICorner'k.CornerRadius=UDim.new(0,5)k.Parent=j local l=
		Instance.new'TextButton'l.AutoButtonColor=false l.AutomaticSize=Enum.
		AutomaticSize.Y l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
		BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
		l.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.
		FontStyle.Normal)l.RichText=true l.Size=UDim2.new(1,0,0,40)l.Text=i.Settings.
		Name l.TextColor3=Color3.fromRGB(156,156,156)l.TextSize=15 l.TextWrapped=true l.
		TextXAlignment=Enum.TextXAlignment.Center local m=Instance.new'UIPadding'm.
		PaddingBottom=UDim.new(0,12)m.PaddingLeft=UDim.new(0,15)m.PaddingRight=UDim.new(
		0,15)m.PaddingTop=UDim.new(0,12)m.Parent=l l.Parent=j function i:UpdateSettings(
		n)if n.Name then i.Settings.Name=n.Name l.Text=n.Name end if n.Color then i.
		Settings.Color=n.Color j.BackgroundColor3=n.Color end if n.Callback then i.
		Settings.Callback=n.Callback end if n.Visible~=nil then i.Settings.Visible=n.
		Visible j.Visible=n.Visible end return i end local n=Instance.new'Frame'n.
		BackgroundColor3=Color3.fromRGB(30,30,30)n.BorderColor3=Color3.fromRGB(0,0,0)n.
		BorderSizePixel=0 n.Size=UDim2.new(1,0,0,1)n.Parent=f function i:Continue()n.
		Visible=false return i end function i:End()n.Visible=true return i end local o=
		function()if i.Settings.Callback then e.callback(i.Settings.Callback)end end l.
		MouseButton1Click:Connect(o)if h then b.Components[h]=i end return i:End()end
		function CreateToggle(f,g,h)local i={Settings=g,Type='Toggle'}assert(i.Settings.
		Name and type(i.Settings.Name)=='string','Missing name or wrong type')local j=
		Instance.new'Frame'j.AutomaticSize=Enum.AutomaticSize.Y j.BackgroundColor3=
		Color3.fromRGB(255,255,255)j.BackgroundTransparency=1 j.BorderColor3=Color3.
		fromRGB(0,0,0)j.BorderSizePixel=0 j.Size=UDim2.fromScale(1,0)j.Parent=f j.
		Visible=i.Settings.Visible==nil and true or i.Settings.Visible local k=Instance.
		new'Frame'k.AutomaticSize=Enum.AutomaticSize.Y k.BackgroundColor3=Color3.
		fromRGB(255,255,255)k.BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0
		,0)k.BorderSizePixel=0 k.Size=UDim2.new(1,-50,0,33)local l=Instance.new
		'TextLabel'l.AutomaticSize=Enum.AutomaticSize.XY l.BackgroundColor3=Color3.
		fromRGB(255,255,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0
		,0)l.BorderSizePixel=0 l.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)l.RichText=true l.TextColor3=Color3.
		fromRGB(225,225,225)l.TextSize=16 l.TextWrapped=true l.TextXAlignment=Enum.
		TextXAlignment.Left l.Parent=k l.Text=i.Settings.Name local m=Instance.new
		'UIListLayout'm.Name='UIListLayout'm.Padding=UDim.new(0,5)m.SortOrder=Enum.
		SortOrder.LayoutOrder m.VerticalAlignment=Enum.VerticalAlignment.Center m.Parent
		=k local n=Instance.new'TextLabel'n.AutomaticSize=Enum.AutomaticSize.XY n.
		BackgroundColor3=Color3.fromRGB(255,255,255)n.BackgroundTransparency=1 n.
		BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.FontFace=Font.new(
		'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)n.
		LayoutOrder=1 n.RichText=true n.Text=i.Settings.Description or''n.TextColor3=
		Color3.fromRGB(80,80,80)n.TextSize=12 n.TextWrapped=true n.TextXAlignment=Enum.
		TextXAlignment.Left n.Parent=k n.Visible=i.Settings.Description and true or
		false k.Parent=j local o=Instance.new'ImageLabel'o.AnchorPoint=Vector2.new(1,0.5
		)o.BackgroundColor3=Color3.fromRGB(37,37,46)o.BackgroundTransparency=1 o.
		BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.Image=
		'rbxassetid://86699956318312'o.ImageColor3=Color3.fromRGB(33,36,45)o.Position=
		UDim2.fromScale(1,0.5)o.Size=UDim2.fromOffset(35,10)local p=Instance.new
		'UIPadding'p.Name='ToggleUIPadding'p.PaddingBottom=UDim.new(0,1)p.PaddingLeft=
		UDim.new(0,-8)p.PaddingTop=UDim.new(0,1)p.Parent=o local q=Instance.new
		'ImageLabel'q.AnchorPoint=Vector2.new(1,0.5)q.BackgroundColor3=Color3.fromRGB(30
		,34,47)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.
		BorderSizePixel=0 q.Image='rbxassetid://83379579183005'q.ImageColor3=Color3.
		fromRGB(156,156,156)q.Position=UDim2.fromScale(0.5,0.5)q.Size=UDim2.fromOffset(
		14,14)q.Parent=o o.Parent=j local r=Instance.new'UIPadding'r.PaddingBottom=UDim.
		new(0,8)r.PaddingTop=UDim.new(0,8)r.Parent=j local s=Instance.new'TextButton's.
		AutoButtonColor=false s.BackgroundTransparency=1 s.Size=UDim2.fromScale(1,1)s.
		Text=''s.Parent=j i.Settings.State=i.Settings.State or false local t=function()e
		.tween(q,TweenInfo.new(0.2,Enum.EasingStyle.Exponential),{Position=UDim2.
		fromScale(i.Settings.State and 1 or 0.5,0.5),ImageColor3=i.Settings.State and
		Color3.fromRGB(138,193,227)or Color3.fromRGB(156,156,156)}):Play()if i.Settings.
		Callback then e.callback(i.Settings.Callback,i,i.Settings.State)end end s.
		MouseButton1Click:Connect(function()i.Settings.State=not i.Settings.State t()end
		)function i:UpdateSettings(u)if u.Name then i.Settings.Name=u.Name l.Text=u.Name
		end if u.Description~=nil then i.Settings.Description=u.Description n.Text=u.
		Description or''n.Visible=u.Description and true or false end if u.State~=nil
		then i.Settings.State=u.State t()end if u.Callback then i.Settings.Callback=u.
		Callback end if u.Visible~=nil then i.Settings.Visible=u.Visible j.Visible=u.
		Visible end end local u=Instance.new'Frame'u.BackgroundColor3=Color3.fromRGB(30,
		30,30)u.BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0 u.Size=UDim2.new(1
		,0,0,1)u.Parent=f function i:Continue()u.Visible=false return i end function i:
		End()u.Visible=true return i end t()if h then b.Components[h]=i end i.Content=f
		injectComponents(i,'Colorpicker')return i:End()end function CreateSlider(f,g,h)
		local i={Settings=g,Type='Slider'}assert(i.Settings.Name and type(i.Settings.
		Name)=='string','Missing name or wrong type')assert(i.Settings.Value and type(i.
		Settings.Value)=='number','Missing value or wrong type')assert(i.Settings.
		Minimum and type(i.Settings.Minimum)=='number','Missing minimum or wrong type')
		assert(i.Settings.Maximum and type(i.Settings.Maximum)=='number',
		'Missing maximum or wrong type')assert(i.Settings.Minimum<=i.Settings.Maximum,
		'Minimum should be less than Maximum')assert(i.Settings.Maximum>=i.Settings.
		Minimum,'Maximum should be greater than Minimum')local j=Instance.new'Frame'j.
		AutomaticSize=Enum.AutomaticSize.Y j.BackgroundColor3=Color3.fromRGB(255,255,255
		)j.BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.
		BorderSizePixel=0 j.Size=UDim2.fromScale(1,0)j.Visible=i.Settings.Visible==nil
		and true or i.Settings.Visible j.Parent=f local k=Instance.new'UIPadding'k.
		PaddingBottom=UDim.new(0,8)k.PaddingTop=UDim.new(0,8)k.Parent=j local l=Instance
		.new'Frame'l.AutomaticSize=Enum.AutomaticSize.Y l.BackgroundColor3=Color3.
		fromRGB(255,255,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0
		,0)l.BorderSizePixel=0 l.Size=UDim2.fromScale(1,0)local m=Instance.new'Frame'm.
		AnchorPoint=Vector2.new(1,0.5)m.AutomaticSize=Enum.AutomaticSize.XY m.
		BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
		BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.LayoutOrder=1 m.Position
		=UDim2.fromScale(1,0.5)local n=Instance.new'ImageLabel'n.AnchorPoint=Vector2.
		new(1,0.5)n.BackgroundColor3=Color3.fromRGB(30,34,47)n.BackgroundTransparency=1
		n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.Image=
		'rbxassetid://82545477110166'n.ImageColor3=Color3.fromRGB(150,150,150)n.Position
		=UDim2.fromScale(1,0.5)n.Size=UDim2.fromOffset(20,20)n.Parent=m local o=Instance
		.new'UIListLayout'o.FillDirection=Enum.FillDirection.Horizontal o.
		HorizontalAlignment=Enum.HorizontalAlignment.Right o.Padding=UDim.new(0,6)o.
		SortOrder=Enum.SortOrder.LayoutOrder o.VerticalAlignment=Enum.VerticalAlignment.
		Center o.Parent=m local p=Instance.new'TextLabel'p.AnchorPoint=Vector2.new(0,0.5
		)p.AutomaticSize=Enum.AutomaticSize.XY p.BackgroundColor3=Color3.fromRGB(255,255
		,255)p.BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.
		BorderSizePixel=0 p.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
		.SemiBold,Enum.FontStyle.Normal)p.LayoutOrder=1 p.Position=UDim2.fromScale(0,0.5
		)p.RichText=true p.Text='0'p.TextColor3=Color3.fromRGB(150,150,150)p.TextSize=16
		p.TextWrapped=true p.TextXAlignment=Enum.TextXAlignment.Left p.Parent=m m.Parent
		=l local q=Instance.new'Frame'q.AutomaticSize=Enum.AutomaticSize.Y q.
		BackgroundColor3=Color3.fromRGB(255,255,255)q.BackgroundTransparency=1 q.
		BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0 q.Size=UDim2.new(1,-80,0,0
		)local r=Instance.new'TextLabel'r.AutomaticSize=Enum.AutomaticSize.XY r.
		BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
		BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.FontFace=Font.new(
		'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)r.
		RichText=true r.Text=i.Settings.Name r.TextColor3=Color3.fromRGB(225,225,225)r.
		TextSize=16 r.TextWrapped=true r.TextXAlignment=Enum.TextXAlignment.Left r.
		Parent=q local s=Instance.new'UIListLayout's.Name='UIListLayout's.Padding=UDim.
		new(0,5)s.SortOrder=Enum.SortOrder.LayoutOrder s.VerticalAlignment=Enum.
		VerticalAlignment.Center s.Parent=q local t=Instance.new'TextLabel't.
		AutomaticSize=Enum.AutomaticSize.XY t.BackgroundColor3=Color3.fromRGB(255,255,
		255)t.BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0,0)t.
		BorderSizePixel=0 t.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
		.SemiBold,Enum.FontStyle.Normal)t.LayoutOrder=1 t.RichText=true t.Text=i.
		Settings.Description or''t.TextColor3=Color3.fromRGB(80,80,80)t.TextSize=12 t.
		TextWrapped=true t.TextXAlignment=Enum.TextXAlignment.Left t.Parent=q t.Visible=
		i.Settings.Description and true or false q.Parent=l local u=Instance.new
		'UIListLayout'u.Name='UIListLayout'u.FillDirection=Enum.FillDirection.Horizontal
		u.HorizontalAlignment=Enum.HorizontalAlignment.Center u.HorizontalFlex=Enum.
		UIFlexAlignment.Fill u.Padding=UDim.new(0,5)u.SortOrder=Enum.SortOrder.
		LayoutOrder u.VerticalAlignment=Enum.VerticalAlignment.Center u.Parent=l l.
		Parent=j local v=Instance.new'UIListLayout'v.Name='UIListLayout'v.Padding=UDim.
		new(0,15)v.SortOrder=Enum.SortOrder.LayoutOrder v.Parent=j local w=Instance.new
		'TextButton'w.BackgroundColor3=Color3.fromRGB(37,37,46)w.BorderColor3=Color3.
		fromRGB(0,0,0)w.BorderSizePixel=0 w.Size=UDim2.new(1,0,0,10)w.Text=''w.
		AutoButtonColor=false w.LayoutOrder=1 local x=Instance.new'UICorner'x.Name=
		'UICorner'x.CornerRadius=UDim.new(0,15)x.Parent=w local y=Instance.new'Frame'y.
		BackgroundColor3=Color3.fromRGB(138,193,227)y.BorderColor3=Color3.fromRGB(0,0,0)
		y.BorderSizePixel=0 y.Size=UDim2.new(0,0,0,10)local z=Instance.new'UICorner'z.
		Name='UICorner'z.CornerRadius=UDim.new(0,15)z.Parent=y local A=Instance.new
		'ImageLabel'A.AnchorPoint=Vector2.new(0.5,0.5)A.BackgroundColor3=Color3.fromRGB(
		255,255,255)A.BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.
		BorderSizePixel=0 A.Image='rbxassetid://127947626656649'A.ImageColor3=Color3.
		fromRGB(20,20,20)A.Position=UDim2.fromScale(1,0.5)A.Size=UDim2.fromOffset(26,20)
		A.ZIndex=2 local B=Instance.new'ImageLabel'B.AnchorPoint=Vector2.new(0.5,0.5)B.
		BackgroundColor3=Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B.
		BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.Image=
		'rbxassetid://98639906538385'B.ImageColor3=Color3.fromRGB(225,225,225)B.Position
		=UDim2.fromScale(0.5,0.5)B.Size=UDim2.fromOffset(18,18)B.Parent=A A.Parent=w y.
		Parent=w w.Parent=j local C=function()local C,D,E=10,10,w.AbsoluteSize.X local F
		,G,H=E-(C+D),i.Settings.Minimum,i.Settings.Maximum local I=i.Settings.Value or(G
		+H)/2 local J,K=(I-G)/(H-G),A.AbsoluteSize.X/2 y.Size=UDim2.new(0,F*J,0,10)A.
		Position=UDim2.new(0,C+(F*J),0.5,0)local L=tonumber(string.format('%.'..(i.
		Settings.Precision or 0)..'f',I))local M=i.Settings.Filter and i.Settings.
		Filter(L,G,H)p.Text=M or L end local D,E=function(D)local E,F,G,H=10,10,D.
		Position.X,B.AbsoluteSize.X/2 local I,J,K=G-(H*0.5),w.AbsolutePosition.X+E,w.
		AbsoluteSize.X-(E+F)I=math.clamp(I-J,0,K)local L=I/K L=i.Settings.Minimum+L*(i.
		Settings.Maximum-i.Settings.Minimum)local M=i.Settings.Step or 0 i.Settings.
		Value=M>0 and math.round(L/M)*M or L C()if i.Settings.Callback then e.callback(i
		.Settings.Callback,i,i.Settings.Value)end end,false local F=function(F)if F.
		UserInputType==Enum.UserInputType.MouseButton1 then E=true D(F)if i.Settings.
		inputChanged then e.callback(i.Settings.inputChanged,i,i.Settings.Value,E)end
		end end w.InputBegan:Connect(F)w.InputEnded:Connect(function(G)if G.
		UserInputType==Enum.UserInputType.MouseButton1 then E=false if i.Settings.
		inputChanged then e.callback(i.Settings.inputChanged,i,i.Settings.Value,E)end
		end end)w:GetPropertyChangedSignal'AbsoluteSize':Connect(C)C()d.
		_userInputService.InputChanged:Connect(function(G)if E and G.UserInputType==Enum
		.UserInputType.MouseMovement then D(G)end end)function i:UpdateSettings(G)if G.
		Visible~=nil then i.Settings.Visible=G.Visible j.Visible=G.Visible end if G.Name
		then i.Settings.Name=G.Name r.Text=G.Name end if G.Description~=nil then i.
		Settings.Description=G.Description t.Text=G.Description or''t.Visible=G.
		Description and true or false end if G.Minimum then i.Settings.Minimum=G.Minimum
		end if G.Maximum then i.Settings.Maximum=G.Maximum end if G.Step~=nil then i.
		Settings.Step=G.Step end if G.Precision~=nil then i.Settings.Precision=G.
		Precision end if G.Filter then i.Settings.Filter=G.Filter end if G.Callback then
		i.Settings.Callback=G.Callback end if G.inputChanged then i.Settings.
		inputChanged=G.inputChanged end if G.Value then local H,I=i.Settings.Minimum,i.
		Settings.Maximum local J,K=math.clamp(G.Value,H,I),i.Settings.Step or 0 if K>0
		then J=math.round(J/K)*K end i.Settings.Value=J task.defer(function()if w.
		AbsoluteSize.X==0 then w:GetPropertyChangedSignal'AbsoluteSize':Wait()end C()if
		i.Settings.Callback then e.callback(i.Settings.Callback,i,i.Settings.Value)end
		end)end end local G=Instance.new'Frame'G.BackgroundColor3=Color3.fromRGB(30,30,
		30)G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0 G.Size=UDim2.new(1,0,
		0,1)G.Parent=f function i:Continue()G.Visible=false return i end function i:End(
		)G.Visible=true return i end i:UpdateSettings(i.Settings)if h then b.Components[
		h]=i end return i:End()end function CreateInput(f,g,h)local i,j={Settings=g,Type
		='Input'},Instance.new'Frame'j.BackgroundColor3=Color3.fromRGB(30,30,30)j.
		BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0 j.Size=UDim2.new(1,0,0,40)
		j.Visible=i.Settings.Visible==nil and true or i.Settings.Visible j.Parent=f
		local k=Instance.new'UICorner'k.CornerRadius=UDim.new(0,5)k.Parent=j local l=
		Instance.new'UIListLayout'l.FillDirection=Enum.FillDirection.Horizontal l.
		Padding=UDim.new(0,15)l.SortOrder=Enum.SortOrder.LayoutOrder l.VerticalAlignment
		=Enum.VerticalAlignment.Center l.Parent=j local m=Instance.new'UIPadding'm.
		PaddingLeft=UDim.new(0,15)m.Parent=j local n=Instance.new'TextBox'n.AnchorPoint=
		Vector2.new(0,0.5)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
		BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0
		n.ClearTextOnFocus=false n.ClipsDescendants=true n.CursorPosition=-1 n.FontFace=
		Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
		Normal)n.LayoutOrder=1 n.PlaceholderColor3=Color3.fromRGB(120,120,120)n.
		PlaceholderText=i.Settings.Placeholder or'...'n.Size=UDim2.new(1,-50,1,0)n.Text=
		i.Settings.Text or''n.TextColor3=Color3.fromRGB(156,156,156)n.TextSize=15 n.
		TextXAlignment=Enum.TextXAlignment.Left n.Parent=j local o=Instance.new
		'ImageLabel'o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
		BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0
		o.Image='rbxassetid://98129527229953'o.ImageColor3=Color3.fromRGB(156,156,156)o.
		Size=UDim2.fromOffset(20,20)o.Parent=j n.FocusLost:Connect(function()if i.
		Settings.CharacterSub=='Mathematic'then n.Text=e.subParser[i.Settings.
		CharacterSub](n.Text)end if i.Settings.Callback then e.callback(i.Settings.
		Callback,i,n.Text)end end)n:GetPropertyChangedSignal'Text':Connect(function()if
		i.Settings.CharacterSub and i.Settings.CharacterSub~='Mathematic'and e.subParser
		[i.Settings.CharacterSub]then n.Text=e.subParser[i.Settings.CharacterSub](n.Text
		)elseif type(i.Settings.CharacterSub)=='function'then n.Text=i.Settings.
		CharacterSub(n.Text)end if i.Settings.CharacterLimit then if string.len(n.Text)>
		i.Settings.CharacterLimit then n.Text=string.sub(n.Text,1,i.Settings.
		CharacterLimit)end end i.Settings.Text=n.Text if i.Settings.onTextChanged then e
		.callback(i.Settings.onTextChanged,i,n.Text)end end)function i:UpdateSettings(p)
		if p.Text then i.Settings.Text=p.Text n.Text=p.Text if i.Settings.Callback then
		e.callback(i.Settings.Callback,i,n.Text)end end if p.Placeholder then i.Settings
		.Placeholder=p.Placeholder n.PlaceholderText=p.Placeholder end if p.Callback
		then i.Settings.Callback=p.Callback end if p.onTextChanged then i.Settings.
		onTextChanged=p.onTextChanged end if p.Visible~=nil then i.Settings.Visible=p.
		Visible j.Visible=p.Visible end end local p=Instance.new'Frame'p.
		BackgroundColor3=Color3.fromRGB(30,30,30)p.BorderColor3=Color3.fromRGB(0,0,0)p.
		BorderSizePixel=0 p.Size=UDim2.new(1,0,0,1)p.Parent=f function i:Continue()p.
		Visible=false return i end function i:End()p.Visible=true return i end i:
		UpdateSettings(i.Settings)if h then b.Components[h]=i end return i:End()end
		function CreateMultiInput(f,g,h)local i,j={Settings=g,Type='MultiInput'},
		Instance.new'Frame'j.BackgroundColor3=Color3.fromRGB(30,30,30)j.
		BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
		j.Size=UDim2.new(1,0,0,40)j.Parent=f local k=Instance.new'UIListLayout'k.
		FillDirection=Enum.FillDirection.Horizontal k.HorizontalFlex=Enum.
		UIFlexAlignment.Fill k.Padding=UDim.new(0,5)k.SortOrder=Enum.SortOrder.
		LayoutOrder k.VerticalAlignment=Enum.VerticalAlignment.Center k.Parent=j local l
		={}for m,n in ipairs(i.Settings.Inputs)do local o=Instance.new'TextBox'o.
		BackgroundColor3=Color3.fromRGB(30,30,30)o.BorderColor3=Color3.fromRGB(0,0,0)o.
		BorderSizePixel=0 o.ClearTextOnFocus=false o.ClipsDescendants=true o.FontFace=
		Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
		Normal)o.LayoutOrder=1 o.PlaceholderColor3=Color3.fromRGB(120,120,120)o.
		PlaceholderText=n.Placeholder or'...'o.Size=UDim2.fromScale(1,1)o.Text=n.Text or
		''o.TextColor3=Color3.fromRGB(156,156,156)o.TextSize=15 o.TextXAlignment=Enum.
		TextXAlignment.Left o.Parent=j l[m]={inputBox=o}local p=Instance.new'UIPadding'p
		.PaddingLeft=UDim.new(0,10)p.PaddingRight=UDim.new(0,10)p.Parent=o local q=
		Instance.new'UICorner'q.CornerRadius=UDim.new(0,5)q.Parent=o local r=n.
		CharacterSub or'None'o.FocusLost:Connect(function()if i.Settings.Callback then e
		.callback(i.Settings.Callback,i,m,o.Text)end end)o:GetPropertyChangedSignal
		'Text':Connect(function()if r and type(r)=='string'and e.subParser[r]then o.Text
		=e.subParser[r](o.Text)elseif r and type(r)=='function'then o.Text=n.
		CharacterSub(o.Text)end if n.CharacterLimit then if string.len(o.Text)>n.
		CharacterLimit then o.Text=string.sub(o.Text,1,n.CharacterLimit)end end n.Text=o
		.Text if i.Settings.onTextChanged then e.callback(i.Settings.onTextChanged,i,m,o
		.Text)end end)end function i:UpdateSettings(m,n)local o,p=i.Settings.Inputs[m],l
		[m]if o and p then if n.Text~=nil then o.Text=n.Text p.inputBox.Text=n.Text if i
		.Settings.Callback then e.callback(i.Settings.Callback,i,m,n.Text)end end if n.
		Placeholder~=nil then o.Placeholder=n.Placeholder p.inputBox.PlaceholderText=n.
		Placeholder end end if n.Callback~=nil then i.Settings.Callback=n.Callback end
		if n.onTextChanged~=nil then i.Settings.onTextChanged=n.onTextChanged end if n.
		Visible~=nil then i.Settings.Visible=n.Visible j.Visible=n.Visible end end local
		m=Instance.new'Frame'm.BackgroundColor3=Color3.fromRGB(30,30,30)m.BorderColor3=
		Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.Size=UDim2.new(1,0,0,1)m.Parent=f
		function i:Continue()m.Visible=false return i end function i:End()m.Visible=true
		return i end for n,o in pairs(i.Settings.Inputs)do i:UpdateSettings(n,o)end if h
		then b.Components[h]=i end return i:End()end function CreateDropdown(f,g,h)local
		i={Settings=g,Type='Dropdown'}assert(i.Settings.Name and type(i.Settings.Name)==
		'string','Missing name or wrong type')local j=Instance.new'Frame'j.AutomaticSize
		=Enum.AutomaticSize.Y j.BackgroundColor3=Color3.fromRGB(255,255,255)j.
		BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
		j.Size=UDim2.fromScale(1,0)j.Parent=f local k=Instance.new'UIPadding'k.
		PaddingBottom=UDim.new(0,8)k.PaddingTop=UDim.new(0,8)k.Parent=j local l=Instance
		.new'UIListLayout'l.Padding=UDim.new(0,15)l.SortOrder=Enum.SortOrder.LayoutOrder
		l.Parent=j local m=Instance.new'TextButton'm.AutoButtonColor=false m.
		AutomaticSize=Enum.AutomaticSize.Y m.BackgroundColor3=Color3.fromRGB(30,30,30)m.
		BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.ClipsDescendants=true m.
		FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Bold,Enum.FontStyle
		.Normal)m.LayoutOrder=1 m.Position=UDim2.fromScale(0,0.16)m.Size=UDim2.new(1,0,0
		,40)m.Text=''m.TextColor3=Color3.fromRGB(156,156,156)m.TextSize=15 m.
		TextXAlignment=Enum.TextXAlignment.Left m.TextYAlignment=Enum.TextYAlignment.Top
		local n=Instance.new'UIPadding'n.PaddingBottom=UDim.new(0,10)n.PaddingLeft=UDim.
		new(0,15)n.PaddingRight=UDim.new(0,15)n.PaddingTop=UDim.new(0,10)n.Parent=m
		local o=Instance.new'UICorner'o.CornerRadius=UDim.new(0,5)o.Parent=m local p=
		Instance.new'Frame'p.AutomaticSize=Enum.AutomaticSize.Y p.BackgroundColor3=
		Color3.fromRGB(255,255,255)p.BackgroundTransparency=1 p.BorderColor3=Color3.
		fromRGB(0,0,0)p.BorderSizePixel=0 p.Size=UDim2.fromScale(1,0)local q=Instance.
		new'ImageLabel'q.AnchorPoint=Vector2.new(1,0.5)q.BackgroundColor3=Color3.
		fromRGB(30,34,47)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)
		q.BorderSizePixel=0 q.Image='rbxassetid://77136690433593'q.ImageColor3=Color3.
		fromRGB(150,150,150)q.LayoutOrder=1 q.Position=UDim2.fromScale(1,0.5)q.Size=
		UDim2.fromOffset(18,18)q.Parent=p local r=Instance.new'TextLabel'r.AutomaticSize
		=Enum.AutomaticSize.Y r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
		BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0
		r.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.
		FontStyle.Normal)r.RichText=true r.Size=UDim2.new(1,-35,0,20)r.Text='...'r.
		TextColor3=Color3.fromRGB(156,156,156)r.TextSize=15 r.TextWrapped=true r.
		TextXAlignment=Enum.TextXAlignment.Left r.Parent=p p.Parent=m m.Parent=j local s
		=Instance.new'Frame's.AutomaticSize=Enum.AutomaticSize.Y s.BackgroundColor3=
		Color3.fromRGB(255,255,255)s.BackgroundTransparency=1 s.BorderColor3=Color3.
		fromRGB(0,0,0)s.BorderSizePixel=0 s.Size=UDim2.new(1,0,0,33)local t=Instance.new
		'TextLabel't.AutomaticSize=Enum.AutomaticSize.XY t.BackgroundColor3=Color3.
		fromRGB(255,255,255)t.BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0
		,0)t.BorderSizePixel=0 t.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)t.RichText=true t.Text='Name't.
		TextColor3=Color3.fromRGB(225,225,225)t.TextSize=16 t.TextWrapped=true t.
		TextXAlignment=Enum.TextXAlignment.Left t.Parent=s local u=Instance.new
		'UIListLayout'u.Padding=UDim.new(0,5)u.SortOrder=Enum.SortOrder.LayoutOrder u.
		VerticalAlignment=Enum.VerticalAlignment.Center u.Parent=s local v=Instance.new
		'TextLabel'v.AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=Color3.
		fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0
		,0)v.BorderSizePixel=0 v.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)v.LayoutOrder=1 v.RichText=true v.Text
		='description'v.TextColor3=Color3.fromRGB(80,80,80)v.TextSize=12 v.TextWrapped=
		true v.TextXAlignment=Enum.TextXAlignment.Left v.Parent=s v.Visible=i.Settings.
		Description and true or false s.Parent=j local w=Instance.new'Frame'w.Name=
		'dropdownFrame'w.BackgroundColor3=Color3.fromRGB(30,30,30)w.BorderColor3=Color3.
		fromRGB(0,0,0)w.BorderSizePixel=0 w.Size=UDim2.fromOffset(350,150)local x=
		Instance.new'ScrollingFrame'x.Name='dropdownContent'x.Active=true x.
		AutomaticCanvasSize=Enum.AutomaticSize.Y x.BackgroundColor3=Color3.fromRGB(30,30
		,30)x.BackgroundTransparency=1 x.BorderColor3=Color3.fromRGB(0,0,0)x.
		BorderSizePixel=0 x.CanvasSize=UDim2.new()x.ScrollBarImageTransparency=0.7 x.
		ScrollBarThickness=3 x.Size=UDim2.fromScale(1,1)local y=Instance.new
		'UIListLayout'y.Name='UIListLayout'y.SortOrder=Enum.SortOrder.LayoutOrder y.
		Parent=x local z=Instance.new'UIPadding'z.Name='UIPadding'z.PaddingRight=UDim.
		new(0,15)z.Parent=x x.Parent=w local A=Instance.new'UIPadding'A.Name='UIPadding'
		A.PaddingBottom=UDim.new(0,10)A.PaddingLeft=UDim.new(0,15)A.PaddingTop=UDim.new(
		0,3)A.Parent=w local B=Instance.new'UICorner'B.Name='UICorner'B.CornerRadius=
		UDim.new(0,5)B.Parent=w local C,D,E,F,G,H=false,false,false,{},{},{Selected=
		Color3.fromRGB(225,225,225),Unselected=Color3.fromRGB(156,156,156)}table.insert(
		c.dropdownFrames,w)local I=function(I)local J,K='...',{}for L,M in ipairs(F)do
		local N=G[M].Text table.insert(K,N)end if#K==1 then J=K[1]elseif#K>1 then J=
		table.concat(K,', ')end r.Text=J i.Settings.Value=K if I and i.Settings.Callback
		then e.callback(i.Settings.Callback,i,K)end end local J=function(J)local K,L=i.
		Settings.Limit,i.Settings.Minimum or 0 if table.find(F,J)then if#F-1<L then
		return end table.remove(F,table.find(F,J))e.tween(G[J],TweenInfo.new(0.1,Enum.
		EasingStyle.Sine),{TextColor3=H.Unselected}):Play()else if K and#F>=K then local
		M=table.remove(F,1)e.tween(G[M],TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
		TextColor3=H.Unselected}):Play()end table.insert(F,J)e.tween(G[J],TweenInfo.new(
		0.1,Enum.EasingStyle.Sine),{TextColor3=H.Selected}):Play()end I(true)end local K
		,L=function(K)for L,M in ipairs(K)do local N=Instance.new'TextButton'N.Name=
		'Button'N.AutoButtonColor=false N.AutomaticSize=Enum.AutomaticSize.Y N.
		BackgroundTransparency=1 N.BorderSizePixel=0 N.FontFace=Font.new(
		'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)N.
		RichText=true N.Size=UDim2.fromScale(1,0)N.Text=M N.TextColor3=Color3.fromRGB(
		156,156,156)N.TextSize=15 N.TextWrapped=true N.TextXAlignment=Enum.
		TextXAlignment.Left N.Parent=x N.LayoutOrder=L local O=Instance.new'UIPadding'O.
		Name='UIPadding'O.PaddingBottom=UDim.new(0,15)O.PaddingTop=UDim.new(0,15)O.
		Parent=N N.MouseButton1Click:Connect(function()J(M)end)G[M]=N end end,function()
		w.Position=UDim2.new(0,m.AbsolutePosition.X,0,m.AbsolutePosition.Y+(m.
		AbsoluteSize.Y*2)+25)end local M=function()if E then return end E=true if D then
		e.tween(q,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=0}):Play()local M=e
		.tween(w,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(m.
		AbsoluteSize.X,0)})M:Play()M.Completed:Wait()w.Parent=nil D=false else e.tween(q
		,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=180}):Play()for M,N in
		pairs(c.dropdownFrames)do if N==w then N.Size=UDim2.fromOffset(m.AbsoluteSize.X,
		0)N.Parent=c.gui e.tween(N,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.
		fromOffset(m.AbsoluteSize.X,150)}):Play()L()else local O=e.tween(N,TweenInfo.
		new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(m.AbsoluteSize.X,0)})O.
		Completed:Connect(function()N.Parent=nil end)O:Play()end end D=true end E=false
		end m.MouseButton1Click:Connect(M)m:GetPropertyChangedSignal'AbsolutePosition':
		Connect(L)m:GetPropertyChangedSignal'AbsoluteSize':Connect(L)w.MouseEnter:
		Connect(function()C=true end)w.MouseLeave:Connect(function()C=false end)d.
		_userInputService.InputBegan:Connect(function(N)if N.UserInputType==Enum.
		UserInputType.MouseButton1 and not C and w.Parent then M()end end)function i:
		Insert(N)K(N)end function i:Remove(N)for O,P in ipairs(N)do for Q=#i.Settings.
		Options,1,-1 do if i.Settings.Options[Q]==P then table.remove(i.Settings.Options
		,Q)end end if G[P]then G[P]:Destroy()G[P]=nil end for Q=#F,1,-1 do if F[Q]==P
		then table.remove(F,Q)end end I()end end function i:UpdateSettings(N)if N.
		Visible~=nil then j=N.Visible end if N.Name then i.Settings.Name=N.Name t.Text=N
		.Name end if N.Description~=nil then i.Settings.Description=N.Description v.Text
		=N.Description or''v.Visible=N.Description and true or false end if N.Limit~=nil
		then i.Settings.Limit=N.Limit end if N.Minimum then i.Settings.Minimum=N.Minimum
		end if N.Callback then i.Settings.Callback=N.Callback end if N.Options then i.
		Settings.Options=N.Options for O,P in pairs(G)do P:Destroy()end G={}K(N.Options)
		end if N.Value~=nil then if type(N.Value)=='string'then J(N.Value)elseif type(N.
		Value)=='table'then for O,P in pairs(N.Value)do J(P)end end end end local N=
		Instance.new'Frame'N.BackgroundColor3=Color3.fromRGB(30,30,30)N.BorderColor3=
		Color3.fromRGB(0,0,0)N.BorderSizePixel=0 N.Size=UDim2.new(1,0,0,1)N.Parent=f
		function i:Continue()N.Visible=false return i end function i:End()N.Visible=true
		return i end i:UpdateSettings(i.Settings)if h then b.Components[h]=i end return
		i:End()end function CreateColorpicker(f,g,h)local i,j={Settings=g,Type=
		'Colorpicker'},Instance.new'Frame'j.Name='Colorpicker'j.AutomaticSize=Enum.
		AutomaticSize.Y j.BackgroundColor3=Color3.fromRGB(255,255,255)j.
		BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
		j.Size=UDim2.fromScale(1,0)local m=Instance.new'UIPadding'm.Name='UIPadding'm.
		PaddingBottom=UDim.new(0,8)m.PaddingTop=UDim.new(0,8)m.Parent=j local p=Instance
		.new'Frame'p.Name='ElementInfo'p.AutomaticSize=Enum.AutomaticSize.Y p.
		BackgroundColor3=Color3.fromRGB(255,255,255)p.BackgroundTransparency=1 p.
		BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.Size=UDim2.fromScale(1,0
		)local q=Instance.new'Frame'q.Name='Info'q.AutomaticSize=Enum.AutomaticSize.Y q.
		BackgroundColor3=Color3.fromRGB(255,255,255)q.BackgroundTransparency=1 q.
		BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0 q.Size=UDim2.new(1,-80,0,0
		)local r=Instance.new'TextLabel'r.Name='Name'r.AutomaticSize=Enum.AutomaticSize.
		XY r.BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
		BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.FontFace=Font.new(
		'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)r.
		RichText=true r.Text='Name'r.TextColor3=Color3.fromRGB(225,225,225)r.TextSize=16
		r.TextWrapped=true r.TextXAlignment=Enum.TextXAlignment.Left r.Parent=q r.
		Visible=false local s=Instance.new'UIListLayout's.Name='UIListLayout's.Padding=
		UDim.new(0,5)s.SortOrder=Enum.SortOrder.LayoutOrder s.VerticalAlignment=Enum.
		VerticalAlignment.Center s.Parent=q local t=Instance.new'TextLabel't.Name=
		'Description't.AutomaticSize=Enum.AutomaticSize.XY t.BackgroundColor3=Color3.
		fromRGB(255,255,255)t.BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0
		,0)t.BorderSizePixel=0 t.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)t.LayoutOrder=1 t.RichText=true t.Text
		='Description't.TextColor3=Color3.fromRGB(80,80,80)t.TextSize=12 t.TextWrapped=
		true t.TextXAlignment=Enum.TextXAlignment.Left t.Parent=q t.Visible=false q.
		Parent=p p.Parent=j local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.
		Padding=UDim.new(0,15)u.SortOrder=Enum.SortOrder.LayoutOrder u.Parent=j local v=
		Instance.new'Frame'v.Name='PickerColors'v.AutomaticSize=Enum.AutomaticSize.Y v.
		BackgroundColor3=Color3.fromRGB(255,255,255)v.BackgroundTransparency=1 v.
		BorderColor3=Color3.fromRGB(0,0,0)v.BorderSizePixel=0 v.LayoutOrder=1 v.Size=
		UDim2.fromScale(1,0)local w=Instance.new'Frame'w.Name='SuggestedColors'w.
		AutomaticSize=Enum.AutomaticSize.Y w.BackgroundColor3=Color3.fromRGB(255,255,255
		)w.BackgroundTransparency=1 w.BorderColor3=Color3.fromRGB(0,0,0)w.
		BorderSizePixel=0 w.Size=UDim2.fromScale(0.7,0)local x=Instance.new
		'UIListLayout'x.Name='UIListLayout'x.FillDirection=Enum.FillDirection.Horizontal
		x.Padding=UDim.new(0,8)x.SortOrder=Enum.SortOrder.LayoutOrder x.Parent=w w.
		Parent=v local y=Instance.new'Frame'y.Name='CustomColor'y.AnchorPoint=Vector2.
		new(1,0)y.AutomaticSize=Enum.AutomaticSize.Y y.BackgroundColor3=Color3.fromRGB(
		255,255,255)y.BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0,0)y.
		BorderSizePixel=0 y.Position=UDim2.fromScale(1,0)y.Size=UDim2.fromScale(0.3,0)
		local z=Instance.new'UIListLayout'z.Name='UIListLayout'z.FillDirection=Enum.
		FillDirection.Horizontal z.HorizontalAlignment=Enum.HorizontalAlignment.Right z.
		Padding=UDim.new(0,8)z.SortOrder=Enum.SortOrder.LayoutOrder z.VerticalAlignment=
		Enum.VerticalAlignment.Center z.Parent=y local A=Instance.new'TextLabel'A.Name=
		'Name'A.AutomaticSize=Enum.AutomaticSize.XY A.BackgroundColor3=Color3.fromRGB(
		255,255,255)A.BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.
		BorderSizePixel=0 A.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
		.SemiBold,Enum.FontStyle.Normal)A.Text='Custom'A.TextColor3=Color3.fromRGB(200,
		200,200)A.TextSize=13 A.TextWrapped=true A.TextXAlignment=Enum.TextXAlignment.
		Left A.Parent=y local B=Instance.new'ImageButton'B.Name='SuggestionColor'B.
		BackgroundColor3=Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B.
		BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.Image=
		'rbxassetid://79776444663640'B.ImageColor3=Color3.fromRGB(33,182,244)B.
		LayoutOrder=1 B.Size=UDim2.fromOffset(15,15)local C=Instance.new'ImageLabel'C.
		Name='Transparency'C.BackgroundColor3=Color3.fromRGB(255,255,255)C.
		BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0
		C.Image='rbxassetid://101467502072089'C.ImageTransparency=1 C.Size=UDim2.
		fromScale(1,1)C.Parent=B B.Parent=y y.Parent=v v.Parent=j j.Parent=f local D=
		Instance.new'Frame'D.Name='ColorpickerInput'D.AutomaticSize=Enum.AutomaticSize.X
		D.BackgroundColor3=Color3.fromRGB(30,30,30)D.BorderColor3=Color3.fromRGB(0,0,0)D
		.BorderSizePixel=0 D.Position=UDim2.fromScale(0.272,0.732)D.Size=UDim2.
		fromOffset(0,40)D.Visible=false D.Parent=c.gui local E=Instance.new'UICorner'E.
		Name='UICorner'E.CornerRadius=UDim.new(0,5)E.Parent=D local F=Instance.new
		'UIListLayout'F.Name='UIListLayout'F.FillDirection=Enum.FillDirection.Horizontal
		F.Padding=UDim.new(0,10)F.SortOrder=Enum.SortOrder.LayoutOrder F.
		VerticalAlignment=Enum.VerticalAlignment.Center F.Parent=D local G=Instance.new
		'ImageLabel'G.Name='Icon'G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
		BackgroundTransparency=1 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0
		G.Image='rbxassetid://88238578565569'G.ImageColor3=Color3.fromRGB(156,156,156)G.
		Size=UDim2.fromOffset(20,20)G.Parent=D local H=Instance.new'UIPadding'H.Name=
		'UIPadding'H.PaddingLeft=UDim.new(0,15)H.PaddingRight=UDim.new(0,10)H.Parent=D
		local I=Instance.new'Frame'I.Name='Inputs'I.AutomaticSize=Enum.AutomaticSize.X I
		.BackgroundColor3=Color3.fromRGB(255,255,255)I.BackgroundTransparency=1 I.
		BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.Size=UDim2.fromScale(0,1
		)local J=Instance.new'TextBox'J.Name='Alpha'J.AutomaticSize=Enum.AutomaticSize.X
		J.BackgroundColor3=Color3.fromRGB(30,30,30)J.BorderColor3=Color3.fromRGB(0,0,0)J
		.BorderSizePixel=0 J.ClearTextOnFocus=false J.ClipsDescendants=true J.
		CursorPosition=-1 J.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
		.SemiBold,Enum.FontStyle.Normal)J.LayoutOrder=6 J.PlaceholderColor3=Color3.
		fromRGB(120,120,120)J.PlaceholderText='Alpha'J.Size=UDim2.fromScale(0,1)J.Text=
		'255'J.TextColor3=Color3.fromRGB(156,156,156)J.TextSize=15 J.TextXAlignment=Enum
		.TextXAlignment.Left local K=Instance.new'UICorner'K.Name='UICorner'K.
		CornerRadius=UDim.new(0,5)K.Parent=J local L=Instance.new'UIPadding'L.Name=
		'UIPadding'L.PaddingLeft=UDim.new(0,8)L.PaddingRight=UDim.new(0,8)L.Parent=J J.
		Parent=I local M=Instance.new'TextBox'M.Name='Red'M.AutomaticSize=Enum.
		AutomaticSize.X M.BackgroundColor3=Color3.fromRGB(30,30,30)M.BorderColor3=Color3
		.fromRGB(0,0,0)M.BorderSizePixel=0 M.ClearTextOnFocus=false M.ClipsDescendants=
		true M.CursorPosition=-1 M.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)M.PlaceholderColor3=Color3.fromRGB(120
		,120,120)M.PlaceholderText='Red'M.Size=UDim2.fromScale(0,1)M.Text='255'M.
		TextColor3=Color3.fromRGB(156,156,156)M.TextSize=15 M.TextXAlignment=Enum.
		TextXAlignment.Left local N=Instance.new'UICorner'N.Name='UICorner'N.
		CornerRadius=UDim.new(0,5)N.Parent=M local O=Instance.new'UIPadding'O.Name=
		'UIPadding'O.PaddingLeft=UDim.new(0,8)O.PaddingRight=UDim.new(0,8)O.Parent=M M.
		Parent=I local P=Instance.new'TextBox'P.Name='Blue'P.AutomaticSize=Enum.
		AutomaticSize.X P.BackgroundColor3=Color3.fromRGB(30,30,30)P.BorderColor3=Color3
		.fromRGB(0,0,0)P.BorderSizePixel=0 P.ClearTextOnFocus=false P.ClipsDescendants=
		true P.CursorPosition=-1 P.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)P.LayoutOrder=4 P.PlaceholderColor3=
		Color3.fromRGB(120,120,120)P.PlaceholderText='Blue'P.Size=UDim2.fromScale(0,1)P.
		Text='255'P.TextColor3=Color3.fromRGB(156,156,156)P.TextSize=15 P.TextXAlignment
		=Enum.TextXAlignment.Left local Q=Instance.new'UICorner'Q.Name='UICorner'Q.
		CornerRadius=UDim.new(0,5)Q.Parent=P local R=Instance.new'UIPadding'R.Name=
		'UIPadding'R.PaddingLeft=UDim.new(0,8)R.PaddingRight=UDim.new(0,8)R.Parent=P P.
		Parent=I local S=Instance.new'TextBox'S.Name='Green'S.AutomaticSize=Enum.
		AutomaticSize.X S.BackgroundColor3=Color3.fromRGB(30,30,30)S.BorderColor3=Color3
		.fromRGB(0,0,0)S.BorderSizePixel=0 S.ClearTextOnFocus=false S.ClipsDescendants=
		true S.CursorPosition=-1 S.FontFace=Font.new('rbxassetid://12187365364',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)S.LayoutOrder=2 S.PlaceholderColor3=
		Color3.fromRGB(120,120,120)S.PlaceholderText='Green'S.Size=UDim2.fromScale(0,1)S
		.Text='255'S.TextColor3=Color3.fromRGB(156,156,156)S.TextSize=15 S.
		TextXAlignment=Enum.TextXAlignment.Left local T=Instance.new'UICorner'T.Name=
		'UICorner'T.CornerRadius=UDim.new(0,5)T.Parent=S local U=Instance.new'UIPadding'
		U.Name='UIPadding'U.PaddingLeft=UDim.new(0,8)U.PaddingRight=UDim.new(0,8)U.
		Parent=S S.Parent=I local V=Instance.new'UIListLayout'V.Name='UIListLayout'V.
		FillDirection=Enum.FillDirection.Horizontal V.SortOrder=Enum.SortOrder.
		LayoutOrder V.VerticalAlignment=Enum.VerticalAlignment.Center V.Parent=I I.
		Parent=D function i:SetColor(W,X)local Y=1-(X or 0)i.Settings.Color=W i.Settings
		.Transparency=Y local Z,_,aa,ab=math.round(W.R*255),math.round(W.G*255),math.
		round(W.B*255),math.round((1-Y)*255)M.Text=tostring(Z)S.Text=tostring(_)P.Text=
		tostring(aa)J.Text=tostring(ab)B.ImageColor3=W C.ImageTransparency=1-Y if i.
		Settings.Callback then e.callback(i.Settings.Callback,i,W,Y)end return i end
		local aa=function()local aa,ab=B.AbsolutePosition,B.AbsoluteSize local W,X=aa.X+
		ab.X,aa.Y+(ab.Y*2)+D.AbsoluteSize.Y D.Position=UDim2.fromOffset(W,X)end aa()B:
		GetPropertyChangedSignal'AbsolutePosition':Connect(aa)B.MouseButton1Click:
		Connect(function()D.Visible=not D.Visible end)local ab=function()local ab,W,X,Y=
		tonumber(M.Text),tonumber(S.Text),tonumber(P.Text),tonumber(J.Text)ab=ab and
		math.clamp(ab,0,255)or(i.Settings.Color.R*255)W=W and math.clamp(W,0,255)or(i.
		Settings.Color.G*255)X=X and math.clamp(X,0,255)or(i.Settings.Color.B*255)Y=Y
		and math.clamp(Y,0,255)or(1-i.Settings.Transparency)*255 local Z,_=Color3.
		fromRGB(ab,W,X),Y/255 i:SetColor(Z,_)end for W,X in pairs(I:GetChildren())do if
		X:IsA'TextBox'then X.FocusLost:Connect(function(Y)if Y then ab()end end)end end
		local W=false D.MouseEnter:Connect(function()W=true end)D.MouseLeave:Connect(
		function()W=false end)d._userInputService.InputBegan:Connect(function(X)if X.
		UserInputType==Enum.UserInputType.MouseButton1 and not W and D.Visible then D.
		Visible=false end end)function i:UpdateSettings(X)X=X or{}if X.Visible~=nil then
		i.Settings.Visible=X.Visible j.Visible=X.Visible end if X.Name then i.Settings.
		Name=X.Name r.Text=X.Name r.Visible=X.Name and true or false end if X.
		Description then i.Settings.Description=X.Description t.Text=X.Description or''t
		.Visible=X.Description and true or false end if X.AlphaEnabled~=nil then i.
		Settings.AlphaEnabled=X.AlphaEnabled J.Visible=X.AlphaEnabled end if X.Color
		then i:SetColor(X.Color[1],1-(X.Color[2]or 0))end if X.SuggestionColors then i.
		Settings.SuggestionColors=X.SuggestionColors for Y,Z in ipairs(w:GetChildren())
		do if Z:IsA'GuiObject'then Z:Destroy()end end for Y,Z in ipairs(X.
		SuggestionColors)do local _,ac,ad=Z[1],Z[2]or 0,Instance.new'ImageButton'ad.Name
		='SuggestionColor'ad.BackgroundTransparency=1 ad.BorderSizePixel=0 ad.Image=
		'rbxassetid://79776444663640'ad.ImageColor3=_ ad.Size=UDim2.fromOffset(15,15)ad.
		LayoutOrder=Y local ae=Instance.new'ImageLabel'ae.Name='Transparency'ae.
		BackgroundTransparency=1 ae.BorderSizePixel=0 ae.Image=
		'rbxassetid://101467502072089'ae.ImageTransparency=1-ac ae.Size=UDim2.fromScale(
		1,1)ae.Parent=ad ad.MouseButton1Click:Connect(function()i:SetColor(_,1-ac)end)ad
		.Parent=w end end if not X.Name and not X.Description then p.Visible=false m.
		PaddingTop=UDim.new(0,0)elseif not X.Name and X.Description then m.PaddingTop=
		UDim.new(0,-5)else p.Visible=true m.PaddingTop=UDim.new(0,8)end end i:
		UpdateSettings(i.Settings)local ac=Instance.new'Frame'ac.BackgroundColor3=Color3
		.fromRGB(30,30,30)ac.BorderColor3=Color3.fromRGB(0,0,0)ac.BorderSizePixel=0 ac.
		Size=UDim2.new(1,0,0,1)ac.Parent=f function i:Continue()ac.Visible=false return
		i end function i:End()ac.Visible=true return i end if h then b.Components[h]=i
		end i.Content=f injectComponents(i,'Colorpicker')return i:End()end function
		CreateKeybind(aa,ab,ac)local ad,ae={Settings=ab,Type='Keybind'},Instance.new
		'Frame'ae.AutomaticSize=Enum.AutomaticSize.Y ae.BackgroundColor3=Color3.fromRGB(
		0,0,0)ae.BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.
		BorderSizePixel=0 ae.Size=UDim2.fromScale(1,0)ae.Visible=ad.Settings.Visible==
		nil and true or ad.Settings.Visible ae.Parent=aa local f=Instance.new
		'TextButton'f.AutoButtonColor=false f.AutomaticSize=Enum.AutomaticSize.Y f.
		BackgroundColor3=Color3.fromRGB(30,30,30)f.BorderColor3=Color3.fromRGB(0,0,0)f.
		BorderSizePixel=0 f.FontFace=Font.new
		'rbxasset://fonts/families/SourceSansPro.json'f.Size=UDim2.new(1,0,0,40)f.Text=
		''f.TextColor3=Color3.fromRGB(0,0,0)f.TextSize=14 local g=Instance.new
		'TextLabel'g.AnchorPoint=Vector2.new(0,0.5)g.AutomaticSize=Enum.AutomaticSize.XY
		g.BackgroundColor3=Color3.fromRGB(255,255,255)g.BackgroundTransparency=1 g.
		BorderColor3=Color3.fromRGB(0,0,0)g.BorderSizePixel=0 g.FontFace=Font.new(
		'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)g.
		LayoutOrder=1 g.Position=UDim2.fromScale(0,0.5)g.TextColor3=Color3.fromRGB(156,
		156,156)g.TextSize=15 g.TextWrapped=true g.TextXAlignment=Enum.TextXAlignment.
		Left g.Text='Unbinded'local h=Instance.new'UIPadding'h.PaddingBottom=UDim.new(0,
		10)h.PaddingRight=UDim.new(0,50)h.PaddingTop=UDim.new(0,10)h.Parent=g g.Parent=f
		local i=Instance.new'UIPadding'i.PaddingLeft=UDim.new(0,15)i.Parent=f local j=
		Instance.new'UIListLayout'j.FillDirection=Enum.FillDirection.Horizontal j.
		Padding=UDim.new(0,15)j.SortOrder=Enum.SortOrder.LayoutOrder j.VerticalAlignment
		=Enum.VerticalAlignment.Center j.Parent=f local m=Instance.new'ImageLabel'm.
		BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
		BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.Image=
		'rbxassetid://94052787260057'm.ImageColor3=Color3.fromRGB(156,156,156)m.Size=
		UDim2.fromOffset(20,20)m.Parent=f local p=Instance.new'UICorner'p.CornerRadius=
		UDim.new(0,5)p.Parent=f f.Parent=ae local q,r,s={Selected=Color3.fromRGB(225,225
		,225),Unselected=Color3.fromRGB(156,156,156)},false,function(q)if q then m.
		Visible=false g.Text='Press a key'g.Size=UDim2.fromScale(1,0)g.TextXAlignment=
		Enum.TextXAlignment.Center h.PaddingRight=UDim.new(0,15)f.Active=false f.
		Interactable=false elseif q==false then m.Visible=true g.Size=UDim2.fromScale(0,
		0)g.TextXAlignment=Enum.TextXAlignment.Left h.PaddingRight=UDim.new(0,50)f.
		Active=true f.Interactable=true else m.Visible=true g.Text='Unbinded'g.Size=
		UDim2.fromScale(0,0)g.TextXAlignment=Enum.TextXAlignment.Left h.PaddingRight=
		UDim.new(0,50)f.Active=true f.Interactable=true end end if ad.Settings.Bind then
		s(false)if ad.Settings.Bind.EnumType==Enum.KeyCode then g.Text=e.parseKeyCode(ad
		.Settings.Bind)elseif ad.Settings.Bind==Enum.UserInputType.MouseButton1 or ad.
		Settings.Bind==Enum.UserInputType.MouseButton2 then g.Text=e.parseKeyCode(ad.
		Settings.Bind)end else s(nil)end ae.MouseEnter:Connect(function()e.tween(m,
		TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageColor3=q.Selected}):Play()e.
		tween(g,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=q.Selected}):Play()
		end)ae.MouseLeave:Connect(function()e.tween(m,TweenInfo.new(0.1,Enum.EasingStyle
		.Sine),{ImageColor3=q.Unselected}):Play()e.tween(g,TweenInfo.new(0.1,Enum.
		EasingStyle.Sine),{TextColor3=q.Unselected}):Play()end)f.InputEnded:Connect(
		function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.
		UserInputType==Enum.UserInputType.Touch then r=true s(true)end end)d.
		_userInputService.InputBegan:Connect(function(t,u)if r and not u and not(ad.
		Settings.Blacklist and(table.find(ad.Settings.Blacklist,t.KeyCode)or table.find(
		ad.Settings.Blacklist,t.UserInputType)))then if t.UserInputType==Enum.
		UserInputType.Keyboard then ad.Settings.Bind=t.KeyCode g.Text=e.parseKeyCode(t.
		KeyCode)s(false)if ad.Settings.onChanged then e.callback(ad.Settings.onChanged,
		ad,ad.Settings.Bind)end r=false elseif t.UserInputType==Enum.UserInputType.
		MouseButton1 or t.UserInputType==Enum.UserInputType.MouseButton2 then ad.
		Settings.Bind=t.UserInputType g.Text=e.parseKeyCode(t.UserInputType)s(false)if
		ad.Settings.onChanged then e.callback(ad.Settings.onChanged,ad,ad.Settings.Bind)
		end r=false end end end)d._userInputService.InputBegan:Connect(function(t,u)if
		not r then if t.KeyCode==ad.Settings.Bind or t.UserInputType==ad.Settings.Bind
		then if ad.Settings.Callback then e.callback(ad.Settings.Callback,ad,u)end if ad
		.Settings.onHeld then e.callback(ad.Settings.onHeld,ad,true,u)end end end end)d.
		_userInputService.InputEnded:Connect(function(t,u)if not r and(t.KeyCode==ad.
		Settings.Bind or t.UserInputType==ad.Settings.Bind)then if ad.Settings.onHeld
		then e.callback(ad.Settings.onHeld,ad,false,u)end end end)function ad:
		UpdateSettings(t)if t.Visible~=nil then ad.Settings.Visible=t.Visible ae.Visible
		=t.Visible end if t.Bind then ad.Settings.Bind=t.Bind s(false)if ad.Settings.
		Bind.EnumType==Enum.KeyCode then g.Text=e.parseKeyCode(ad.Settings.Bind)elseif
		ad.Settings.Bind==Enum.UserInputType.MouseButton1 or ad.Settings.Bind==Enum.
		UserInputType.MouseButton2 then g.Text=e.parseKeyCode(ad.Settings.Bind)end if t.
		Callback then e.callback(ad.Settings.Callback,ad,false)end end if t.Callback
		then ad.Settings.Callback=t.Callback end if t.onHeld then ad.Settings.onHeld=t.
		onHeld end if t.onChanged then ad.Settings.onChanged=t.onChanged end end local t
		=Instance.new'Frame't.BackgroundColor3=Color3.fromRGB(30,30,30)t.BorderColor3=
		Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.Size=UDim2.new(1,0,0,1)t.Parent=aa
		function ad:Continue()t.Visible=false return ad end function ad:End()t.Visible=
		true return ad end ad:UpdateSettings(ad.Settings)if ac then b.Components[ac]=ad
		end return ad:End()end function CreateDivider(aa,ab,ac)local ad,ae={Settings=ab}
		,Instance.new'Frame'ae.BackgroundColor3=Color3.fromRGB(30,30,30)ae.BorderColor3=
		Color3.fromRGB(0,0,0)ae.BorderSizePixel=0 ae.Size=UDim2.new(1,0,0,1)ae.Parent=aa
		ae.Visible=ad.Settings and(ad.Settings.Visible==nil and true or ad.Settings.
		Visible)or true function ad:UpdateSettings(f)if f.Visible~=nil then ad.Settings.
		Visible=f.Visible ae.Visible=f.Visible end end if ac then b.Components[ac]=ad
		end return ad end local aa={Section=CreateSection,Button=CreateButton,Toggle=
		CreateToggle,Keybind=CreateKeybind,Dropdown=CreateDropdown,Colorpicker=
		CreateColorpicker,MultiInput=CreateMultiInput,Input=CreateInput,Slider=
		CreateSlider,Divider=CreateDivider}function injectComponents(ab,ac)for ad,ae in
		pairs(aa)do if ac and ad==ac then ab[ad]=function(f,...)return ae(f.Content,...)
		end break else ab[ad]=function(f,...)return ae(f.Content,...)end end end end
		function b:Window(ab)local ac={Settings=ab}assert(ac.Settings.Title and type(ac.
		Settings.Title)=='string','Missing window title or wrong type')ac.Settings.
		Keybind=ac.Settings.Keybind or Enum.KeyCode.RightControl c.winKeybind=ac.
		Settings.Keybind local ad=Instance.new'ImageLabel'ad.BackgroundColor3=Color3.
		fromRGB(17,17,17)ad.BorderColor3=Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.
		ClipsDescendants=true ad.Image='rbxassetid://17365187482'ad.ImageTransparency=
		0.96 ad.ScaleType=Enum.ScaleType.Tile ad.Size=UDim2.fromOffset(400,672)ad.
		TileSize=UDim2.fromOffset(500,325)local ae=Instance.new'Frame'ae.AutomaticSize=
		Enum.AutomaticSize.XY ae.BackgroundColor3=Color3.fromRGB(255,255,255)ae.
		BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.BorderSizePixel
		=0 local f=Instance.new'TextLabel'f.AutomaticSize=Enum.AutomaticSize.XY f.
		BackgroundColor3=Color3.fromRGB(255,255,255)f.BackgroundTransparency=1 f.
		BorderColor3=Color3.fromRGB(0,0,0)f.BorderSizePixel=0 f.FontFace=Font.new(
		'rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.FontStyle.Normal)f.
		RichText=true f.Text=ac.Settings.Title f.TextColor3=Color3.fromRGB(255,255,255)f
		.TextSize=35 f.TextWrapped=true f.TextXAlignment=Enum.TextXAlignment.Left f.
		Parent=ae local g=Instance.new'UIPadding'g.PaddingLeft=UDim.new(0,25)g.
		PaddingRight=UDim.new(0,25)g.Parent=ae local h=Instance.new'Frame'h.AnchorPoint=
		Vector2.new(0,1)h.BackgroundColor3=Color3.fromRGB(255,255,255)h.
		BackgroundTransparency=0.9 h.BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel
		=0 h.Position=UDim2.new(0,0,1,10)h.Size=UDim2.new(0.95,0,0,1)local i=Instance.
		new'Frame'i.BackgroundColor3=Color3.fromRGB(185,228,255)i.BorderColor3=Color3.
		fromRGB(0,0,0)i.BorderSizePixel=0 i.Size=UDim2.new(0.5,0,0,1)i.Parent=h h.Parent
		=ae local j=Instance.new'UIListLayout'j.Padding=UDim.new(0,10)j.SortOrder=Enum.
		SortOrder.LayoutOrder j.VerticalAlignment=Enum.VerticalAlignment.Center j.Parent
		=ae ae.Parent=ad local m=Instance.new'UICorner'm.CornerRadius=UDim.new(0,15)m.
		Parent=ad local p=Instance.new'UIPadding'p.PaddingBottom=UDim.new(0,25)p.
		PaddingTop=UDim.new(0,25)p.Parent=ad local q=Instance.new'Frame'q.AnchorPoint=
		Vector2.new(0,1)q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
		BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0
		q.ClipsDescendants=true q.LayoutOrder=1 q.Position=UDim2.fromScale(0,1)q.Size=
		UDim2.new(1,0,1,-55)local r=Instance.new'ScrollingFrame'r.Active=true r.
		AutomaticCanvasSize=Enum.AutomaticSize.X r.AutomaticSize=Enum.AutomaticSize.Y r.
		BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
		BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.CanvasSize=UDim2.new()r.
		ScrollBarImageTransparency=1 r.ScrollBarThickness=1 r.ScrollingDirection=Enum.
		ScrollingDirection.X r.Size=UDim2.fromScale(1,0)local s=Instance.new
		'UIListLayout's.FillDirection=Enum.FillDirection.Horizontal s.Padding=UDim.new(0
		,10)s.SortOrder=Enum.SortOrder.LayoutOrder s.Parent=r local t=Instance.new
		'UIPadding't.PaddingBottom=UDim.new(0,10)t.PaddingLeft=UDim.new(0,26)t.
		PaddingRight=UDim.new(0,26)t.PaddingTop=UDim.new(0,1)t.Parent=r r.Parent=q local
		u=Instance.new'UIListLayout'u.Padding=UDim.new(0,25)u.SortOrder=Enum.SortOrder.
		LayoutOrder u.Parent=q local v=Instance.new'Frame'v.BackgroundColor3=Color3.
		fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0
		,0)v.BorderSizePixel=0 v.Size=UDim2.new(1,0,1,-104)v.Parent=q q.Parent=ad local
		w=Instance.new'UIListLayout'w.Padding=UDim.new(0,30)w.SortOrder=Enum.SortOrder.
		LayoutOrder w.Parent=ad ad.Parent=c.overlay local x=Instance.new'UIPadding'x.
		PaddingBottom=UDim.new(0,15)x.PaddingLeft=UDim.new(0,15)x.PaddingRight=UDim.new(
		0,15)x.PaddingTop=UDim.new(0,15)x.Parent=c.overlay local y=Instance.new
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
		_.Size=UDim2.fromOffset(50,0)_.Visible=true local af=Instance.new'TextLabel'af.
		AnchorPoint=Vector2.new(0,1)af.AutomaticSize=Enum.AutomaticSize.XY af.
		BackgroundColor3=Color3.fromRGB(255,255,255)af.BackgroundTransparency=1 af.
		BorderColor3=Color3.fromRGB(0,0,0)af.BorderSizePixel=0 af.FontFace=Font.new(
		'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)af.
		Position=UDim2.fromOffset(0,-5)af.RichText=true af.Text='100M'af.TextColor3=
		Color3.fromRGB(255,255,255)af.TextSize=13 af.TextWrapped=true af.TextXAlignment=
		Enum.TextXAlignment.Left af.TextYAlignment=Enum.TextYAlignment.Top af.Parent=_
		af.Visible=false local ag=Instance.new'TextLabel'ag.AnchorPoint=Vector2.new(0,1)
		ag.AutomaticSize=Enum.AutomaticSize.XY ag.BackgroundColor3=Color3.fromRGB(255,
		255,255)ag.BackgroundTransparency=1 ag.BorderColor3=Color3.fromRGB(0,0,0)ag.
		BorderSizePixel=0 ag.FontFace=Font.new('rbxassetid://12187362578',Enum.
		FontWeight.SemiBold,Enum.FontStyle.Normal)ag.LayoutOrder=1 ag.Position=UDim2.
		fromOffset(0,-5)ag.RichText=true ag.Text='BF 30'ag.TextColor3=Color3.fromRGB(255
		,255,255)ag.TextSize=13 ag.TextWrapped=true ag.TextXAlignment=Enum.
		TextXAlignment.Left ag.TextYAlignment=Enum.TextYAlignment.Top ag.Parent=_ ag.
		Visible=false local ah=Instance.new'TextLabel'ah.AnchorPoint=Vector2.new(0,1)ah.
		AutomaticSize=Enum.AutomaticSize.XY ah.BackgroundColor3=Color3.fromRGB(255,255,
		255)ah.BackgroundTransparency=1 ah.BorderColor3=Color3.fromRGB(0,0,0)ah.
		BorderSizePixel=0 ah.ClipsDescendants=true ah.FontFace=Font.new(
		'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ah.
		LayoutOrder=2 ah.Position=UDim2.fromOffset(0,-5)ah.RichText=true ah.Text='140HP'
		ah.TextColor3=Color3.fromRGB(255,255,255)ah.TextSize=13 ah.TextWrapped=true ah.
		TextXAlignment=Enum.TextXAlignment.Left ah.TextYAlignment=Enum.TextYAlignment.
		Top ah.Parent=_ ah.Visible=false local ai=Instance.new'UIListLayout'ai.SortOrder
		=Enum.SortOrder.LayoutOrder ai.Parent=_ _.Parent=H local aj=Instance.new
		'UIListLayout'aj.FillDirection=Enum.FillDirection.Horizontal aj.HorizontalFlex=
		Enum.UIFlexAlignment.Fill aj.Padding=UDim.new(0,10)aj.SortOrder=Enum.SortOrder.
		LayoutOrder aj.Parent=H H.Parent=G G.Parent=y y.Parent=c.overlay e.
		makeDraggable(y)e.makeDraggable(ad)d._userInputService.InputEnded:Connect(
		function(ak,al)if al then return end if ak.KeyCode==ac.Settings.Keybind then c.
		overlay.Visible=not c.overlay.Visible end end)local ak=function()local ak=ae.
		AbsoluteSize.Y+9 q.Size=UDim2.new(1,0,1,-ak)q.Position=UDim2.new(0,0,0,ak)end ae
		:GetPropertyChangedSignal'AbsoluteSize':Connect(ak)ak()function ac:
		UpdateSettings(al)if al.Title then ac.Settings.Title=al.Title f.Text=al.Title
		end if al.Keybind then ac.Settings.Keybind=al.Keybind c.winKeybind=al.Keybind
		end end function ac:Tab(al)local am={Settings=al}assert(am.Settings.Name and
		type(am.Settings.Name)=='string','Missing string or wrong type')if not am.
		Settings.Image or am.Settings.Image==''then am.Settings.Image=b.Assets.
		DefaultImage end c.tabSystem.tabIndex+=1 local an=Instance.new'Frame'an.
		AutomaticSize=Enum.AutomaticSize.Y an.BackgroundColor3=Color3.fromRGB(30,34,47)
		an.BackgroundTransparency=1 an.BorderColor3=Color3.fromRGB(0,0,0)an.
		BorderSizePixel=0 an.Size=UDim2.fromOffset(50,50)an.Parent=r an.LayoutOrder=c.
		tabSystem.tabIndex local ao=Instance.new'TextLabel'ao.AutomaticSize=Enum.
		AutomaticSize.Y ao.BackgroundColor3=Color3.fromRGB(255,255,255)ao.
		BackgroundTransparency=1 ao.BorderColor3=Color3.fromRGB(0,0,0)ao.BorderSizePixel
		=0 ao.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Bold,Enum.
		FontStyle.Normal)ao.LayoutOrder=1 ao.Position=UDim2.new(0,0,1,10)ao.RichText=
		true ao.Size=UDim2.fromScale(1,0)ao.Text=am.Settings.Name:upper()ao.TextColor3=
		Color3.fromRGB(150,150,150)ao.TextSize=11 ao.TextWrapped=true ao.Parent=an local
		ap=Instance.new'TextButton'ap.AutoButtonColor=false ap.BackgroundColor3=Color3.
		fromRGB(30,34,47)ap.BorderColor3=Color3.fromRGB(0,0,0)ap.BorderSizePixel=0 ap.
		FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'ap.Size=UDim2.
		fromOffset(50,50)ap.Text=''ap.TextColor3=Color3.fromRGB(0,0,0)ap.TextSize=14
		local aq=Instance.new'UICorner'aq.CornerRadius=UDim.new(0,13)aq.Parent=ap local
		ar=Instance.new'UIStroke'ar.ApplyStrokeMode=Enum.ApplyStrokeMode.Border ar.Color
		=Color3.fromRGB(185,228,255)ar.Transparency=1 ar.Parent=ap local as=Instance.new
		'ImageLabel'as.AnchorPoint=Vector2.new(0.5,0.5)as.BackgroundColor3=Color3.
		fromRGB(255,255,255)as.BackgroundTransparency=1 as.BorderColor3=Color3.fromRGB(0
		,0,0)as.BorderSizePixel=0 as.Image=am.Settings.Image as.ImageColor3=Color3.
		fromRGB(150,150,150)as.Position=UDim2.fromScale(0.5,0.5)as.ScaleType=Enum.
		ScaleType.Crop as.Size=UDim2.fromOffset(28,28)as.Parent=ap ap.Parent=an local at
		=Instance.new'UIListLayout'at.Padding=UDim.new(0,10)at.SortOrder=Enum.SortOrder.
		LayoutOrder at.Parent=an local au=Instance.new'ScrollingFrame'au.Name=
		'TabContent'au.AutomaticCanvasSize=Enum.AutomaticSize.Y au.BackgroundColor3=
		Color3.fromRGB(255,255,255)au.BackgroundTransparency=1 au.BorderColor3=Color3.
		fromRGB(0,0,0)au.BorderSizePixel=0 au.CanvasSize=UDim2.new()au.
		ScrollBarImageTransparency=1 au.ScrollBarThickness=1 au.Size=UDim2.fromScale(1,1
		)local av=Instance.new'UIListLayout'av.Name='UIListLayout'av.Padding=UDim.new(0,
		10)av.SortOrder=Enum.SortOrder.LayoutOrder av.Parent=au local aw=Instance.new
		'UIPadding'aw.Name='UIPadding'aw.PaddingBottom=UDim.new(0,20)aw.PaddingLeft=UDim
		.new(0,25)aw.PaddingRight=UDim.new(0,25)aw.Parent=au c.tabSystem.tabInstances[an
		]={Name=ao,Stroke=ar,Icon=as,TabContent=au}function am:Select()if c.tabSystem.
		tabInstances[c.tabSystem.currentTab]then local ax=c.tabSystem.tabInstances[c.
		tabSystem.currentTab]e.tween(ax.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
		TextColor3=Color3.fromRGB(150,150,150)}):Play()e.tween(ax.Icon,TweenInfo.new(0.1
		,Enum.EasingStyle.Sine),{ImageColor3=Color3.fromRGB(150,150,150)}):Play()e.
		tween(ax.Stroke,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=1}):Play(
		)if c.tabSystem.currentContent then c.tabSystem.currentContent.Parent=nil end
		end if c.tabSystem.tabInstances[an]then local ax=c.tabSystem.tabInstances[an]e.
		tween(ax.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=Color3.
		fromRGB(168,193,225)}):Play()e.tween(ax.Icon,TweenInfo.new(0.1,Enum.EasingStyle.
		Sine),{ImageColor3=Color3.fromRGB(133,192,228)}):Play()e.tween(ax.Stroke,
		TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=0}):Play()c.tabSystem.
		currentTab=an au.Parent=v c.tabSystem.currentContent=au end end ap.
		MouseButton1Click:Connect(function()am:Select()end)function am:Section(ax,ay)
		local az,aA={Settings=ax},Instance.new'Frame'aA.Name='Section'aA.AutomaticSize=
		Enum.AutomaticSize.Y aA.BackgroundColor3=Color3.fromRGB(255,255,255)aA.
		BackgroundTransparency=1 aA.BorderColor3=Color3.fromRGB(0,0,0)aA.BorderSizePixel
		=0 aA.Size=UDim2.fromScale(1,0)local aB=Instance.new'TextButton'aB.Name=
		'Leading'aB.AutoButtonColor=false aB.AutomaticSize=Enum.AutomaticSize.Y aB.
		BackgroundColor3=Color3.fromRGB(255,255,255)aB.BackgroundTransparency=1 aB.
		BorderColor3=Color3.fromRGB(0,0,0)aB.BorderSizePixel=0 aB.LayoutOrder=-1 aB.
		Selectable=false aB.Size=UDim2.fromScale(1,0)aB.Text=''local aC=Instance.new
		'TextLabel'aC.Name='Name'aC.AutomaticSize=Enum.AutomaticSize.XY aC.
		BackgroundColor3=Color3.fromRGB(255,255,255)aC.BackgroundTransparency=1 aC.
		BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel=0 aC.FontFace=Font.new(
		'rbxassetid://16658237174',Enum.FontWeight.Bold,Enum.FontStyle.Normal)aC.
		LayoutOrder=1 aC.Position=UDim2.fromOffset(28,0)aC.RichText=true aC.TextColor3=
		Color3.fromRGB(225,225,225)aC.TextSize=20 aC.TextWrapped=true aC.TextXAlignment=
		Enum.TextXAlignment.Left aC.Parent=aB local aD=Instance.new'ImageButton'aD.Name=
		'Chevron'aD.AnchorPoint=Vector2.new(0,0.5)aD.AutoButtonColor=false aD.
		BackgroundColor3=Color3.fromRGB(30,34,47)aD.BackgroundTransparency=1 aD.
		BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.Image=
		'rbxassetid://77136690433593'aD.LayoutOrder=1 aD.Position=UDim2.fromScale(0,0.5)
		aD.Selectable=false aD.Active=false aD.Interactable=false aD.Size=UDim2.
		fromOffset(18,18)aD.Parent=aB aB.Parent=aA local aE=Instance.new'Frame'aE.Name=
		'Trailing'aE.BackgroundColor3=Color3.fromRGB(255,255,255)aE.
		BackgroundTransparency=1 aE.BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel
		=0 aE.ClipsDescendants=true aE.Size=UDim2.fromScale(1,0)local aF=Instance.new
		'UIListLayout'aF.Name='UIListLayout'aF.Padding=UDim.new(0,10)aF.SortOrder=Enum.
		SortOrder.LayoutOrder aF.Parent=aE local aG=Instance.new'UIPadding'aG.Name=
		'UIPadding'aG.PaddingLeft=UDim.new(0,12)aG.Parent=aE local aH=Instance.new
		'Folder'aH.Name='Folder'local aI=Instance.new'Frame'aI.Name='Frame'aI.
		AnchorPoint=Vector2.new(0,1)aI.BackgroundColor3=Color3.fromRGB(30,30,30)aI.
		BorderColor3=Color3.fromRGB(0,0,0)aI.BorderSizePixel=0 aI.Position=UDim2.new(0,-
		12,1,0)aI.Size=UDim2.new(0,1,1,0)aI.Parent=aH aH.Parent=aE aE.Parent=aA local aJ
		=Instance.new'UIListLayout'aJ.Name='UIListLayout'aJ.Padding=UDim.new(0,10)aJ.
		SortOrder=Enum.SortOrder.LayoutOrder aJ.Parent=aA local aK=Instance.new
		'UIPadding'aK.Name='UIPadding'aK.PaddingBottom=UDim.new(0,8)aK.PaddingTop=UDim.
		new(0,8)aK.Parent=aA aA.Parent=au local aL=function(aL)if aL then local aM,aN={}
		,0 for aO,aP in pairs(aE:GetChildren())do if aP:IsA'GuiObject'and aP.Visible
		then table.insert(aM,aP)aN+=aP.AbsoluteSize.Y end end if#aM>1 then aN+=(#aM-1)*
		aF.Padding.Offset end e.tween(aE,TweenInfo.new(0.15,Enum.EasingStyle.Sine),{Size
		=UDim2.new(1,0,0,aN)}):Play()e.tween(aD,TweenInfo.new(0.15,Enum.EasingStyle.Sine
		),{Rotation=-180}):Play()else e.tween(aE,TweenInfo.new(0.15,Enum.EasingStyle.
		Sine),{Size=UDim2.new(1,0,0,0)}):Play()e.tween(aD,TweenInfo.new(0.15,Enum.
		EasingStyle.Sine),{Rotation=0}):Play()end end aB.MouseButton1Click:Connect(
		function()az.Settings.Opened=not az.Settings.Opened aL(az.Settings.Opened)end)
		local aM=function(aM)if not aM:IsA'GuiObject'then return end aM:
		GetPropertyChangedSignal'Visible':Connect(function()if az.Settings.Opened then
		aL(true)end end)end for aN,aO in pairs(aE:GetChildren())do aM(aO)end aE.
		ChildAdded:Connect(function(aN)aM(aN)if az.Settings.Opened then aL(true)end end)
		aE.ChildRemoved:Connect(function()if az.Settings.Opened then aL(true)end end)
		function az:UpdateSettings(aN)if aN.Visible~=nil then az.Settings.Visible=aN.
		Visible aA.Visible=aN.Visible end if aN.Opened~=nil then az.Settings.Opened=aN.
		Opened aL(aN.Opened)end if aN.Name then az.Settings.Name=aN.Name aC.Text=aN.Name
		end end if az.Settings.Closed==nil then az.Settings.Closed=true end az:
		UpdateSettings(az.Settings)if ay then b.Components[ay]=az end az.Content=aE
		injectComponents(az)return az end am.Content=au injectComponents(am)return am
		end function ac:VisualPreview(al)local am={N,O,Q,P,S,R,M,L}if al.Enabled~=nil
		then local an=al.Enabled I.Visible=an af.Visible=an ah.Visible=an ag.Visible=an
		V.Visible=an Z.Visible=an X.Visible=an K.Visible=an for ao,ap in ipairs(am)do ap
		.Visible=an end if not an then return end end if al.Visible~=nil then y.Visible=
		al.Visible end if al.HealthBar then if al.HealthBar.Visible~=nil then I.Visible=
		al.HealthBar.Visible end if al.HealthBar.Color then I.BackgroundColor3=al.
		HealthBar.Color[1]or I.BackgroundColor3 if al.HealthBar.Color[2]~=nil then I.
		Transparency=1-al.HealthBar.Color[2]end end end if al.Distance then if al.
		Distance.Visible~=nil then af.Visible=al.Distance.Visible end if al.Distance.
		Color then af.TextColor3=al.Distance.Color[1]or af.TextColor3 if al.Distance.
		Color[2]~=nil then af.TextTransparency=1-al.Distance.Color[2]end end end if al.
		Health then if al.Health.Visible~=nil then ah.Visible=al.Health.Visible end if
		al.Health.Color then ah.TextColor3=al.Health.Color[1]or ah.TextColor3 if al.
		Health.Color[2]~=nil then ah.TextTransparency=1-al.Health.Color[2]end end end if
		al.Weapon then if al.Weapon.Visible~=nil then ag.Visible=al.Weapon.Visible end
		if al.Weapon.Color then ag.TextColor3=al.Weapon.Color[1]or ag.TextColor3 if al.
		Weapon.Color[2]~=nil then ag.TextTransparency=1-al.Weapon.Color[2]end end end if
		al.Name then if al.Name.Visible~=nil then V.Visible=al.Name.Visible end if al.
		Name.Color then V.TextColor3=al.Name.Color[1]or V.TextColor3 if al.Name.Color[2]
		~=nil then V.TextTransparency=1-al.Name.Color[2]end end end if al.FillBox then
		if al.FillBox.Visible~=nil then Z.Visible=al.FillBox.Visible end if al.FillBox.
		Color then Z.BackgroundColor3=al.FillBox.Color[1]or Z.BackgroundColor3 if al.
		FillBox.Color[2]~=nil then Z.BackgroundTransparency=1-al.FillBox.Color[2]end end
		end if al.BoundingBox then if al.BoundingBox.Visible~=nil then X.Visible=al.
		BoundingBox.Visible end if al.BoundingBox.Color then Y.Color=al.BoundingBox.
		Color[1]or Y.Color if al.BoundingBox.Color[2]~=nil then Y.Transparency=1-al.
		BoundingBox.Color[2]end end end if al.CornerBox then if al.CornerBox.Visible~=
		nil then K.Visible=al.CornerBox.Visible end if al.CornerBox.Color then for an,ao
		in ipairs(am)do ao.BackgroundColor3=al.CornerBox.Color[1]or ao.BackgroundColor3
		if al.CornerBox.Color[2]~=nil then ao.BackgroundTransparency=1-al.CornerBox.
		Color[2]end end end end end return ac end function b:Notification(ab)local ac={
		Settings=ab}assert(ac.Settings.Title and type(ac.Settings.Title)=='string',
		'Missing notification title or wrong type')local ad=Instance.new'ImageButton'ad.
		AnchorPoint=Vector2.new(1,1)ad.AutoButtonColor=false ad.AutomaticSize=Enum.
		AutomaticSize.Y ad.BackgroundColor3=Color3.fromRGB(17,17,17)ad.BorderColor3=
		Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.Image='rbxassetid://17365187482'ad.
		ImageTransparency=0.96 ad.Position=UDim2.fromScale(1,1)ad.ScaleType=Enum.
		ScaleType.Tile ad.Size=UDim2.fromOffset(280,0)ad.TileSize=UDim2.fromOffset(500,
		325)ad.Position=UDim2.new(1,(ad.AbsoluteSize.X+(c.notifSystem.uIpadding and c.
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
		=UDim.new(0,1)ap.Parent=ah ah.Parent=ae ae.Parent=ad table.insert(c.notifSystem.
		notifInstances,ad)ad.Parent=c.notifSystem.notifications local aq=Instance.new
		'UICorner'aq.CornerRadius=UDim.new(0,15)aq.Parent=ad e.tween(ad,TweenInfo.new(
		0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,0,1,0)}):Play()if ac.
		Settings.Lifetime and ac.Settings.Lifetime>0 then task.delay(ac.Settings.
		Lifetime,function()ac:Cancel()end)end function ac:Cancel()local ar=table.find(c.
		notifSystem.notifInstances,ad)if not ar then return end table.remove(c.
		notifSystem.notifInstances,ar)task.spawn(function()e.tween(ad,TweenInfo.new(0.25
		,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,ad.AbsoluteSize.X+(c.
		notifSystem.uIpadding and c.notifSystem.uIpadding.PaddingRight.Offset or 0),1,ad
		.Position.Y.Offset)}):Play()end)task.delay(0.25,function()ad:Destroy()end)for as
		=ar-1,1,-1 do task.spawn(function()local at=c.notifSystem.notifInstances[as]e.
		tween(at,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=at.Position+
		UDim2.new(0,0,0,ad.AbsoluteSize.Y+(c.notifSystem.uIpadding and c.notifSystem.
		uIpadding.PaddingBottom.Offset or 0))}):Play()end)end end return ac end function
		b:Unload()c.gui:Destroy()end c.localPlayer=d._players.LocalPlayer local ab=
		function()c.camera=d._workspace.CurrentCamera end ab()d._workspace:
		GetPropertyChangedSignal'CurrentCamera':Connect(ab)c.gui=e.secureGui{
		OnTopOfCoreBlur=true,ScreenInsets=Enum.ScreenInsets.None,ResetOnSpawn=false,
		ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=2147483647}c.overlay=
		Instance.new('Frame',c.gui)c.overlay.BackgroundColor3=Color3.fromRGB(255,255,255
		)c.overlay.BackgroundTransparency=1 c.overlay.BorderColor3=Color3.fromRGB(0,0,0)
		c.overlay.BorderSizePixel=0 c.overlay.Size=UDim2.fromScale(1,1)c.overlay.Parent=
		c.gui c.notifSystem.notifications=Instance.new('Frame',c.gui)c.notifSystem.
		notifications.BackgroundColor3=Color3.fromRGB(255,255,255)c.notifSystem.
		notifications.BackgroundTransparency=1 c.notifSystem.notifications.BorderColor3=
		Color3.fromRGB(0,0,0)c.notifSystem.notifications.BorderSizePixel=0 c.notifSystem
		.notifications.Size=UDim2.fromScale(1,1)c.notifSystem.notifications.ZIndex=2 c.
		notifSystem.uIpadding=Instance.new('UIPadding',c.notifSystem.notifications)c.
		notifSystem.uIpadding.PaddingBottom=UDim.new(0,15)c.notifSystem.uIpadding.
		PaddingLeft=UDim.new(0,15)c.notifSystem.uIpadding.PaddingRight=UDim.new(0,15)c.
		notifSystem.uIpadding.PaddingTop=UDim.new(0,15)local ac=function(ac)local ad=
		table.find(c.notifSystem.notifInstances,ac)if ad then for ae,af in pairs(c.
		notifSystem.notifInstances)do if ae~=ad then e.tween(af,TweenInfo.new(0.25,Enum.
		EasingStyle.Exponential),{Position=af.Position-UDim2.new(0,0,0,c.notifSystem.
		notifInstances[ad].AbsoluteSize.Y+10)}):Play()end end end end c.notifSystem.
		notifications.ChildAdded:Connect(ac)return b end function a.b()local aa={}aa.
		ProtectGui=function(ab)local ac=cloneref and cloneref(game)or game local ad,ae=
		pcall(function()ab.Parent=gethui and gethui()or cloneref and cloneref(ac:
		GetService'CoreGui')or ac:GetService'CoreGui'end)return ad and ab or error(
		'Failed to protect GUI: '..tostring(ae))end aa.ProtectGui=newcclosure and
		newcclosure(aa.ProtectGui)or aa.ProtectGui aa.SecureService=function(ab)local ac
		=cloneref and cloneref(game)or game local ad,ae=pcall(function()return cloneref
		and cloneref(ac:GetService(ab))or ac:GetService(ab)end)return ad and ae or
		error('Unable to retrieve service: '..ab)end aa.SecureService=newcclosure and
		newcclosure(aa.SecureService)or aa.SecureService function aa.GetPlayer()local ab
		,ac=pcall(function()return(aa.SecureService'Players')end)return ab and(ac).
		LocalPlayer or nil end function aa.GetCharacter(ab)local ac,ad=pcall(function()
		return ab and ab.Character or nil end)return ac and ad or nil end function aa.
		GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(ab)return ac
		and ac:FindFirstChildOfClass'Humanoid'or nil end)return ac and ad or nil end
		return aa end function a.c()local aa=a.load'b'.SecureService local ab,ac,ad,ae,
		af=aa'RunService',aa'Players',aa'Workspace',aa'UserInputService',gethui and
		gethui()or aa'CoreGui'local ag,ah=ac.LocalPlayer,ad.CurrentCamera local ai,aj,ak
		,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ=ah.
		ViewportSize,math.floor,math.round,math.sin,math.cos,table.clear,table.unpack,
		table.find,table.create,CFrame.fromMatrix,ah.WorldToViewportPoint,ad.IsA,ad.
		GetPivot,ad.FindFirstChild,ad.FindFirstChildOfClass,ad.GetChildren,CFrame.
		identity.PointToObjectSpace,Color3.new().Lerp,Vector2.zero.Min,Vector2.zero.Max,
		Vector2.zero.Lerp,Vector3.zero.Min,Vector3.zero.Max,Vector2.new(7,0),Vector2.
		new(0,1),Vector2.new(0,2),Vector2.new(5,0),{Vector3.new(-1,-1,-1),Vector3.new(-1
		,1,-1),Vector3.new(-1,1,1),Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.
		new(1,1,-1),Vector3.new(1,1,1),Vector3.new(1,-1,1)}local aK,aL=function(aK)local
		aL,aM for aN=1,#aK do local aO=aK[aN]local aP,b=aO.CFrame,aO.Size aL=aD(aL or aP
		.Position,(aP-b*0.5).Position)aM=aE(aM or aP.Position,(aP+b*0.5).Position)end
		local aN=(aL+aM)*0.5 local aO=Vector3.new(aN.X,aN.Y,aM.Z)return CFrame.new(aN,aO
		),aM-aL end,function(aK)local aL,aM=as(ah,aK)return Vector2.new(aL.X,aL.Y),aM,aL
		.Z end local aM,aN,aO,aP=function(aM,aN)local aO=aq(#aJ)for aP=1,#aJ do aO[aP]=
		aL((aM+aN*0.5*aJ[aP]).Position)end local aP,b=aA(ai,ao(aO)),aB(Vector2.zero,ao(
		aO))return{Corners=aO,TopLeft=Vector2.new(aj(aP.X),aj(aP.Y)),TopRight=Vector2.
		new(aj(b.X),aj(aP.Y)),BottomLeft=Vector2.new(aj(aP.X),aj(b.Y)),BottomRight=
		Vector2.new(aj(b.X),aj(b.Y))}end,function(aM,aN)local aO,aP,b,c=aM.X,aM.Y,am(aN)
		,al(aN)return Vector2.new(aO*b-aP*c,aO*c+aP*b)end,function(aM,aN,aO)if aN==
		'Team Color'or(aM.Interface.Shared.UseTeamColor and not aO)then return aM.
		Interface.GetTeamColor(aM.Player)or Color3.new(1,1,1)end return aN end,{}aP.
		__index=aP function aP.New(b,c)local d=setmetatable({},aP)d.Player=assert(b,
		'Missing argument #1 (Player expected)')d.Interface=assert(c,
		'Missing argument #2 (table expected)')d:Construct()return d end function aP:
		_Create(b,c)local d=Drawing.new(b)for e,f in next,c do pcall(function()d[e]=f
		end)end self.Bin[#self.Bin+1]=d return d end function aP:Construct()self.
		CharCache={}self.ChildCount=0 self.Bin={}self.Drawings={Box3d={{self:_Create(
		'Line',{Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=
		false}),self:_Create('Line',{Thickness=1,Visible=false})},{self:_Create('Line',{
		Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=false}),
		self:_Create('Line',{Thickness=1,Visible=false})},{self:_Create('Line',{
		Thickness=1,Visible=false}),self:_Create('Line',{Thickness=1,Visible=false}),
		self:_Create('Line',{Thickness=1,Visible=false})},{self:_Create('Line',{
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
		_Create('Triangle',{Filled=true,Visible=false})}}for b=1,8 do table.insert(self.
		Drawings.Visible.CornerBox,self:_Create('Line',{Thickness=2,Visible=false}))end
		for b=1,14 do self.Drawings.Visible.Skeleton[b]=self:_Create('Line',{Thickness=1
		,Visible=false})end self.RenderConnection=ab.RenderStepped:Connect(function(b)
		self:Update(b)self:Render(b)end)end function aP:Destruct()self.RenderConnection:
		Disconnect()for b=1,#self.Bin do self.Bin[b]:Remove()end an(self)end function aP
		:Update()local b=self.Interface self.Options=b.Team[b.IsFriendly(self.Player)and
		'Friendly'or'Enemy']self.Character=b.GetCharacter(self.Player)self.Health,self.
		MaxHealth=b.GetHealth(self.Player)self.Weapon=b.GetWeapon(self.Player)self.
		Enabled=self.Options.Enabled and self.Character and not(#b.Whitelist>0 and not
		ap(b.Whitelist,self.Player.UserId))local c=self.Enabled and av(self.Character,b.
		GetRootPart())if not c then self.CharCache={}self.OnScreen=false return end
		local d,e,f=aL(c.Position)self.OnScreen=e self.Distance=f if b.Shared.
		LimitDistance and f>b.Shared.MaxDistance then self.OnScreen=false end if self.
		OnScreen then local g,h=self.CharCache,ax(self.Character)if not g[1]or self.
		ChildCount~=#h then an(g)for i=1,#h do local j=h[i]if at(j,'BasePart')and b.
		IsBodyPart(j.Name)then g[#g+1]=j end end self.ChildCount=#h end self.Corners=aM(
		aK(g))elseif self.Options.OffScreenArrow then local g=ah.CFrame local h=ar(g.
		Position,g.RightVector,Vector3.yAxis)local i=ay(h,c.Position)self.Direction=
		Vector2.new(i.X,i.Z).Unit end end function aP:Render()local b,c=self.Interface,
		self.OnScreen or false local d,e,f,g,h,i,j=self.Enabled and b.GetHealth()>0 or
		false,self.Drawings.Visible,self.Drawings.Hidden,self.Drawings.Box3d,self.
		Interface,self.Options,self.Corners e.Box.Visible=d and c and i.Box e.BoxOutline
		.Visible=e.Box.Visible and i.BoxOutline if e.Box.Visible then local m=e.Box m.
		Position=j.TopLeft m.Size=j.BottomRight-j.TopLeft m.Color=aO(self,i.BoxColor[1])
		m.Transparency=i.BoxColor[2]local p=e.BoxOutline p.Position=m.Position p.Size=m.
		Size p.Color=aO(self,i.BoxOutlineColor[1],true)p.Transparency=i.BoxOutlineColor[
		2]end local m=d and c and i.CornerBox for p=1,8 do local q=e.CornerBox[p]q.
		Visible=m end if m then local p,q=(j.TopRight.X-j.TopLeft.X)*0.2,(j.BottomLeft.Y
		-j.TopLeft.Y)*0.2 p=math.clamp(p,2,30)q=math.clamp(q,2,30)local r=function(r,s,t
		,u)local v,w=e.CornerBox[r],e.CornerBox[r+1]local x=v.Thickness or 1 local y=(x-
		1)local z,A=y/2,t.Unit*(t.Magnitude+y)v.From=s-t.Unit*z v.To=s+A-t.Unit*z v.
		Color=aO(self,i.CornerBoxColor[1])v.Transparency=i.CornerBoxColor[2]local B=u.
		Unit*(u.Magnitude+y)w.From=s-u.Unit*z w.To=s+B-u.Unit*z w.Color=aO(self,i.
		CornerBoxColor[1])w.Transparency=i.CornerBoxColor[2]end r(1,j.TopLeft,Vector2.
		new(p,0),Vector2.new(0,q))r(3,j.TopRight,Vector2.new(-p,0),Vector2.new(0,q))r(5,
		j.BottomRight,Vector2.new(-p,0),Vector2.new(0,-q))r(7,j.BottomLeft,Vector2.new(p
		,0),Vector2.new(0,-q))end e.BoxFill.Visible=d and c and i.BoxFill if e.BoxFill.
		Visible then local p=e.BoxFill p.Position=j.TopLeft p.Size=j.BottomRight-j.
		TopLeft p.Color=aO(self,i.BoxFillColor[1])p.Transparency=i.BoxFillColor[2]end e.
		HealthBar.Visible=d and c and i.HealthBar e.HealthBarOutline.Visible=e.HealthBar
		.Visible and i.HealthBarOutline if e.HealthBar.Visible then local p,q,r=j.
		TopLeft-aF,j.BottomLeft-aF,e.HealthBar r.To=q r.From=aC(q,p,self.Health/self.
		MaxHealth)r.Color=az(i.DyingColor,i.HealthyColor,self.Health/self.MaxHealth)
		local s=e.HealthBarOutline s.To=q+aG s.From=p-aG s.Color=aO(self,i.
		HealthBarOutlineColor[1],true)s.Transparency=i.HealthBarOutlineColor[2]end e.
		Name.Visible=d and c and i.Name if e.Name.Visible then local p=e.Name p.Size=h.
		Shared.TextSize p.Font=h.Shared.TextFont p.Color=aO(self,i.NameColor[1])p.
		Transparency=i.NameColor[2]p.Outline=i.NameOutline p.OutlineColor=aO(self,i.
		NameOutlineColor,true)p.Position=(j.TopLeft+j.TopRight)*0.5-Vector2.yAxis*p.
		TextBounds.Y-aH end local p=j and j.TopRight.Y or 0 e.Distance.Visible=d and c
		and self.Distance and i.Distance if e.Distance.Visible then local q=e.Distance q
		.Text=ak(self.Distance*0.28)..'M'q.Size=h.Shared.TextSize q.Font=h.Shared.
		TextFont q.Color=aO(self,i.DistanceColor[1])q.Transparency=i.DistanceColor[2]q.
		Outline=i.DistanceOutline q.OutlineColor=aO(self,i.DistanceOutlineColor,true)q.
		Position=Vector2.new(j.TopRight.X+aI.X+q.TextBounds.X*0.5,p-q.TextBounds.Y*0.5-
		aI.Y)p=p+q.TextBounds.Y+aI.Y end e.Weapon.Visible=d and c and i.Weapon if e.
		Weapon.Visible then local q=e.Weapon q.Text=self.Weapon q.Size=h.Shared.TextSize
		q.Font=h.Shared.TextFont q.Color=aO(self,i.WeaponColor[1])q.Transparency=i.
		WeaponColor[2]q.Outline=i.WeaponOutline q.OutlineColor=aO(self,i.
		WeaponOutlineColor,true)q.Position=Vector2.new(j.TopRight.X+aI.X+q.TextBounds.X*
		0.5,p-q.TextBounds.Y*0.5)p=p+q.TextBounds.Y+aI.Y end e.HealthText.Visible=d and
		c and i.HealthText if e.HealthText.Visible then local q=e.HealthText q.Text=ak(
		self.Health)..'HP'q.Size=h.Shared.TextSize q.Font=h.Shared.TextFont q.Color=aO(
		self,i.HealthTextColor[1])q.Transparency=i.HealthTextColor[2]q.Outline=i.
		HealthTextOutline q.OutlineColor=aO(self,i.HealthTextOutlineColor,true)q.
		Position=Vector2.new(j.TopRight.X+aI.X+q.TextBounds.X*0.5,p-q.TextBounds.Y*0.5)
		end e.Tracer.Visible=d and c and i.Tracer e.TracerOutline.Visible=e.Tracer.
		Visible and i.TracerOutline if e.Tracer.Visible then local q=e.Tracer q.Color=
		aO(self,i.TracerColor[1])q.Transparency=i.TracerColor[2]q.To=(j.BottomLeft+j.
		BottomRight)*0.5 q.From=i.TracerOrigin=='Middle'and ai*0.5 or i.TracerOrigin==
		'Top'and ai*Vector2.new(0.5,0)or i.TracerOrigin=='Bottom'and ai*Vector2.new(0.5,
		1)or i.TracerOrigin=='Mouse'and ae:GetMouseLocation()local r=e.TracerOutline r.
		Color=aO(self,i.TracerOutlineColor[1],true)r.Transparency=i.TracerOutlineColor[2
		]r.To=q.To r.From=q.From end f.Arrow.Visible=d and not c and i.OffScreenArrow f.
		ArrowOutline.Visible=f.Arrow.Visible and i.OffScreenArrowOutline if f.Arrow.
		Visible and self.Direction then local q=f.Arrow q.PointA=aA(aB(ai*0.5+self.
		Direction*i.OffScreenArrowRadius,Vector2.one*25),ai-Vector2.one*25)q.PointB=q.
		PointA-aN(self.Direction,0.45)*i.OffScreenArrowSize q.PointC=q.PointA-aN(self.
		Direction,-0.45)*i.OffScreenArrowSize q.Color=aO(self,i.OffScreenArrowColor[1])q
		.Transparency=i.OffScreenArrowColor[2]local r=f.ArrowOutline r.PointA=q.PointA r
		.PointB=q.PointB r.PointC=q.PointC r.Color=aO(self,i.OffScreenArrowOutlineColor[
		1],true)r.Transparency=i.OffScreenArrowOutlineColor[2]end local q=d and c and i.
		Box3d for r=1,#g do local s=g[r]for t=1,#s do local u=s[t]u.Visible=q u.Color=
		aO(self,i.Box3dColor[1])u.Transparency=i.Box3dColor[2]end if q then local t=s[1]
		t.From=j.Corners[r]t.To=j.Corners[r==4 and 1 or r+1]local u=s[2]u.From=j.Corners
		[r==4 and 1 or r+1]u.To=j.Corners[r==4 and 5 or r+5]local v=s[3]v.From=j.Corners
		[r==4 and 5 or r+5]v.To=j.Corners[r==4 and 8 or r+4]end end local r=d and c and
		i.Skeleton if r then local s,t=h.GetJoints(self.Character)local u=e.Skeleton.
		Head u.Visible=false if s.Head then local v,w=aL(s.Head.Position)if w then u.
		Visible=true u.Position=v u.Radius=math.clamp((j.TopRight.X-j.TopLeft.X)*0.1,2,
		15)u.Thickness=i.SkeletonThickness u.Color=aO(self,i.SkeletonColor[1])u.
		Transparency=i.SkeletonColor[2]end end for v,w in ipairs(t)do local x=e.Skeleton
		[v]x.Visible=false local y,z=w[1],w[2]if y and z then local A,B=aL(y==s.Head and
		y.Position-Vector3.new(0,y.Size.Y/2,0)or y.Position)local C,D=aL(z.Position)if B
		and D then x.Visible=true x.From=A x.To=C x.Thickness=i.SkeletonThickness x.
		Color=aO(self,i.SkeletonColor[1])x.Transparency=i.SkeletonColor[2]end end end
		else e.Skeleton.Head.Visible=false for s,t in ipairs(e.Skeleton)do if type(t)==
		'table'then continue end t.Visible=false end end end local c={}c.__index=c
		function c.New(d,e)local f=setmetatable({},c)f.Player=assert(d,
		'Missing argument #1 (Player expected)')f.Interface=assert(e,
		'Missing argument #2 (table expected)')f:Construct()return f end function c:
		Construct()self.Highlight=Instance.new'Highlight'self.UpdateConnection=ab.
		RenderStepped:Connect(function()self:Update()end)end function c:Destruct()self.
		UpdateConnection:Disconnect()self.Highlight:Destroy()an(self)end function c:
		Update()local d,e=self.Highlight,self.Interface local f,g=e.GetCharacter(self.
		Player),e.Team[e.IsFriendly(self.Player)and'Friendly'or'Enemy']local h=g.Enabled
		and f and not(#e.Whitelist>0 and not ap(e.Whitelist,self.Player.UserId))d.
		Enabled=h and g.Chams if d.Enabled then d.Adornee=f d.FillColor=aO(self,g.
		ChamsFillColor[1])d.FillTransparency=g.ChamsFillColor[2]d.OutlineColor=aO(self,g
		.ChamsOutlineColor[1],true)d.OutlineTransparency=g.ChamsOutlineColor[2]d.
		DepthMode=g.ChamsVisibleOnly and'Occluded'or'AlwaysOnTop'd.Parent=af end end
		local d={}d.__index=d function d.New(e,f)local g=setmetatable({},d)g.Instance=
		assert(e,'Missing argument #1 (Instance Expected)')g.Options=assert(f,
		'Missing argument #2 (table expected)')g:Construct()return g end function d:
		Construct()local e=self.Options e.Enabled=e.Enabled==nil and true or e.Enabled e
		.Text=e.Text or'{name}'e.TextColor=e.TextColor or{Color3.new(1,1,1),1}e.
		TextOutline=e.TextOutline==nil and true or e.TextOutline e.TextOutlineColor=e.
		TextOutlineColor or Color3.new()e.TextSize=e.TextSize or 13 e.TextFont=e.
		TextFont or 2 e.LimitDistance=e.LimitDistance or false e.MaxDistance=e.
		MaxDistance or 150 self.Text=Drawing.new'Text'self.Text.Center=true self.
		RenderConnection=ab.Stepped:Connect(function(f)self:Render(f)end)end function d:
		Destruct()self.RenderConnection:Disconnect()self.Text:Remove()end function d:
		Render()local e=self.Instance if not e or not e.Parent then return self:
		Destruct()end local f,g=self.Text,self.Options if not g.Enabled then f.Visible=
		false return end local h=au(e).Position local i,j,m=aL(h)if g.LimitDistance and
		m>g.MaxDistance then j=false end f.Visible=j if f.Visible then f.Position=i f.
		Color=g.TextColor[1]f.Transparency=g.TextColor[2]f.Outline=g.TextOutline f.
		OutlineColor=g.TextOutlineColor f.Size=g.TextSize f.Font=g.TextFont f.Text=g.
		Text:gsub('{name}',string.upper(e.Name)):gsub('{distance}',ak(m*0.28)..'M'):
		gsub('{position}',string.upper(tostring(h)))end return nil end local e={
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
		new(0,1,0),1}}}}function e.AddInstance(f,g)local h=e.ObjectCache if h[f]then
		warn'Instance handler already exists.'else h[f]={d.New(f,g)}end return h[f][1]
		end function e.Load()assert(not e.HasLoaded,'Esp has already been loaded.')local
		f,g,h=function(f)e.ObjectCache[f]={aP.New(f,e),c.New(f,e)}end,function(f)local g
		=e.ObjectCache[f]if g then for h=1,#g do g[h]:Destruct()end e.ObjectCache[f]=nil
		end end,ac:GetPlayers()for i=e.Shared.IncludeLocalPlayer and 1 or 2,#h do f(h[i]
		)end e.PlayerAdded=ac.PlayerAdded:Connect(f)e.PlayerRemoving=ac.PlayerRemoving:
		Connect(g)e.HasLoaded=true end function e.Unload()assert(e.HasLoaded,
		'Esp has not been loaded yet.')for f,g in next,e.ObjectCache do for h=1,#g do g[
		h]:Destruct()end e.ObjectCache[f]=nil end e.PlayerAdded:Disconnect()e.
		PlayerRemoving:Disconnect()e.HasLoaded=false end function e.GetWeapon(f)local g=
		'None'if f and f.Character then local h=f.Character:FindFirstChildOfClass'Tool'
		if h then g=h.Name end end return string.upper(g)end function e.IsFriendly(f)
		return f.Team and f.Team==ag.Team end function e.GetTeamColor(f)return f.Team
		and f.Team.TeamColor and f.Team.TeamColor.Color end function e.GetCharacter(f)
		return f.Character end function e.IsBodyPart(f)return f=='Head'or f:find'Torso'
		or f:find'Leg'or f:find'Arm'end function e.GetRootPart()return'HumanoidRootPart'
		end function e.GetHealth(f)local g=f and e.GetCharacter(f)local h=g and aw(g,
		'Humanoid')if h then return h.Health,h.MaxHealth end return 100,100 end function
		e.GetJoints(f)local g={Head=f:FindFirstChild'Head',UpperTorso=f:FindFirstChild
		'UpperTorso'or f:FindFirstChild'Torso',LowerTorso=f:FindFirstChild'LowerTorso'or
		f:FindFirstChild'Torso',LeftUpperArm=f:FindFirstChild'LeftUpperArm'or f:
		FindFirstChild'Left Arm',LeftLowerArm=f:FindFirstChild'LeftLowerArm'or f:
		FindFirstChild'Left Arm',LeftHand=f:FindFirstChild'LeftHand'or f:FindFirstChild
		'Left Arm',RightUpperArm=f:FindFirstChild'RightUpperArm'or f:FindFirstChild
		'Right Arm',RightLowerArm=f:FindFirstChild'RightLowerArm'or f:FindFirstChild
		'Right Arm',RightHand=f:FindFirstChild'RightHand'or f:FindFirstChild'Right Arm',
		LeftUpperLeg=f:FindFirstChild'LeftUpperLeg'or f:FindFirstChild'Left Leg',
		LeftLowerLeg=f:FindFirstChild'LeftLowerLeg'or f:FindFirstChild'Left Leg',
		LeftFoot=f:FindFirstChild'LeftFoot'or f:FindFirstChild'Left Leg',RightUpperLeg=f
		:FindFirstChild'RightUpperLeg'or f:FindFirstChild'Right Leg',RightLowerLeg=f:
		FindFirstChild'RightLowerLeg'or f:FindFirstChild'Right Leg',RightFoot=f:
		FindFirstChild'RightFoot'or f:FindFirstChild'Right Leg'}local h={{g.Head,g.
		UpperTorso},{g.UpperTorso,g.LowerTorso},{g.UpperTorso,g.LeftUpperArm},{g.
		LeftUpperArm,g.LeftLowerArm},{g.LeftLowerArm,g.LeftHand},{g.UpperTorso,g.
		RightUpperArm},{g.RightUpperArm,g.RightLowerArm},{g.RightLowerArm,g.RightHand},{
		g.LowerTorso,g.LeftUpperLeg},{g.LeftUpperLeg,g.LeftLowerLeg},{g.LeftLowerLeg,g.
		LeftFoot},{g.LowerTorso,g.RightUpperLeg},{g.RightUpperLeg,g.RightLowerLeg},{g.
		RightLowerLeg,g.RightFoot}}return g,h end return e end function a.d()local aa,ab
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
		aO in next,aA(as)do local aP=aF.GetCharacter(aO)local c=aP and aw(aP,'Humanoid')
		if aO~=at and aP and aF.GetCharacter(at)and av(aP,aM)and c then local d=am(aP[aM
		],'Position')if aL.MaxDistance and(au.CFrame.Position-d).Magnitude>aL.
		MaxDistance then continue end if aL.TeamCheck and aF.IsFriendly(aO)then continue
		end if aL.AliveCheck and aF.GetHealth(aO)<0 then continue end if aL.WallCheck==2
		or aL.WallCheck==3 then table.clear(aF.BlacklistTable)table.insert(aF.
		BlacklistTable,aF.GetCharacter(at))table.insert(aF.BlacklistTable,aF.
		GetCharacter(aO))for e=1,#aF.IgnoredParts do aF.BlacklistTable[e+2]=aF.
		IgnoredParts[e]end if#ay(au,{d},aF.BlacklistTable)>0 then continue end end local
		e,f,g=ax(au,d)e=aJ(e)g=(az(aq)-e).Magnitude if g<aB and f then aB,aF.Locked=g,aO
		end end end else local aN=aF.GetCharacter(aF.Locked)if aN and aF.GetCharacter(at
		)then local aO=av(aN,aM)if not aO then aK()return end local aP=am(aN[aM],
		'Position')if aL.MaxDistance and(au.CFrame.Position-aP).Magnitude>aL.MaxDistance
		then aK()return end local c,d=ax(au,aP)c=aJ(c)local e=(az(aq)-c).Magnitude if aL
		.WallCheck==3 then table.clear(aF.BlacklistTable)table.insert(aF.BlacklistTable,
		aF.GetCharacter(at))table.insert(aF.BlacklistTable,aF.GetCharacter(aF.Locked))
		for f=1,#aF.IgnoredParts do aF.BlacklistTable[f+2]=aF.IgnoredParts[f]end if#ay(
		au,{aP},aF.BlacklistTable)>0 then aK()return end end if e>aB or not d then aK()
		end else aK()end end end,function()local aL=aF.Triggerbot if not aL.Enabled or
		not aF.GetCharacter(at)then aL.TargetChanged()return end local aM=am(at,
		'GetMouse')and at:GetMouse()if not aM then aL.TargetChanged()return end local aN
		=ab.CurrentCamera local aO,aP=Ray.new(aN.CFrame.Position,(aM.Hit.Position-aN.
		CFrame.Position).Unit*1000),{aF.GetCharacter(at),aN}for c,d in next,aF.
		IgnoredParts do aP[#aP+1]=d end local c=RaycastParams.new()c.
		FilterDescendantsInstances=aP c.FilterType=Enum.RaycastFilterType.Blacklist
		local d=ab:Raycast(aO.Origin,aO.Direction,c)if not d then aL.TargetChanged()
		return end local e=d.Instance local f=e:FindFirstAncestorOfClass'Model'if not f
		then aL.TargetChanged()return end local g=aF.GetPlayerFromCharacter(f)if not g
		or g==at then aL.TargetChanged()return end if aL.TeamCheck and aF.IsFriendly(g)
		then aL.TargetChanged()return end if aL.AliveCheck and aF.GetHealth(g)<0 then aL
		.TargetChanged()end aL.TargetChanged(g)task.wait(aL.Delay)aL.Trigger(true)end
		local aN=function()aH=am(aq,'MouseDeltaSensitivity')local aN,aO,aP,c,d,e=aF.
		Aimbot,aF.Triggerbot,aF.FOVCircle,aF.FOVCircleOutline,(aF.FOVSettings)aD.
		RenderSteppedConnection=aE(am(ap,'RenderStepped'),function()local f,g=aN.
		OffsetToMoveDirection,aN.LockPart if d.Enabled and aN.Enabled then aP.Color=(aF.
		Locked and d.LockedColor)or d.Color c.Color=d.OutlineColor aP.Thickness=d.
		Thickness c.Thickness=d.Thickness+1 aP.Position=az(aq)c.Position=az(aq)aP.
		NumSides=d.NumSides c.NumSides=d.NumSides aP.Radius=d.Radius c.Radius=d.Radius
		aP.Transparency=1-d.Transparency c.Transparency=1-d.Transparency aP.Visible=d.
		Visible c.Visible=d.Visible else aP.Visible=false c.Visible=false end if aO.
		Enabled then aM()end if aC and aN.Enabled then aL()e=f and am(aw(aF.
		GetCharacter(aF.Locked),'Humanoid'),'MoveDirection')*(ak(aN.OffsetIncrement,1,30
		)/10)or ad if aF.Locked then local h=am(aF.GetCharacter(aF.Locked)[g],'Position'
		)local i=ax(au,h+e)local j,m=(i.X-az(aq).X)/aN.Sensitivity2,(i.Y-az(aq).Y)/aN.
		Sensitivity2 if aF.Aimbot.LockMode==2 then ai(j,m)else if aN.Sensitivity>0 then
		aG=ar:Create(au,ah(aF.Aimbot.Sensitivity,Enum.EasingStyle.Sine,Enum.
		EasingDirection.Out),{CFrame=ae(au.CFrame.Position,h+e)})aG:Play()else an(au,
		'CFrame',ae(au.CFrame.Position,h+e))end end end end end)end function aF.Exit(aO)
		assert(aO,'Aimbot.Exit: Missing parameter #1 "self" <table>.')for aP,c in next,
		aD do aI(aD[aP])end aN=nil aJ=nil aK=nil aL=nil aO.FOVCircle:Remove()aO.
		FOVCircleOutline:Remove()end function aF.Restart()for aO,aP in next,aD do aI(aD[
		aO])end aN()end aF.Load=aN setmetatable(aF,{__call=aN})return aF end function a.
		e()return function(aa)local ab,ac,ad=a.load'a',a.load'c',a.load'd'local ae,af,ag
		,ah=ab.Assets,ab.Colors,ac.Shared,ac.Team local ai,aj,ak,al,am,an=ah.Enemy,ah.
		Friendly,ad.Aimbot,ad.Triggerbot,ad.FOVSettings,ab:Window{Title=aa.Name,Keybind=
		Enum.KeyCode.RightControl}local ao={Legit=an:Tab{Name='Legit',Image=ae.
		ShieldCheck},Visuals=an:Tab{Name='Visuals',Image=ae.Bolt},Cfg=an:Tab{Name='Cfg',
		Image=ae.Archive}}do local ap=ao.Legit do local aq=ap:Section{Name='Aimbot'}do
		local ar=aq:Section{Name='Aimbot Settings'}ar:Toggle{Name='Enabled',Description=
		'enables aimbot',State=false,Callback=function(as,at)ak.Enabled=at end}:
		Continue()ar:Keybind{Bind=Enum.UserInputType.MouseButton2,Blacklist={Enum.
		UserInputType.MouseButton1},onHeld=function(as,at,au)if au then return end ak.
		SetState(at)end}ar:Dropdown{Name='Wall Check',Description=
		'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
		'Always On'},Limit=1,Minimum=1,Callback=function(as,at)ak.WallCheck=({Off=1,
		Sticky=2,['Always On']=3})[at[1] ]end}ar:Toggle{Name='Team Check',Description=
		'whether to ignore friendlys',State=true,Callback=function(as,at)ak.TeamCheck=at
		end}ar:Slider{Name='Smoothing',Description='aimbot smoothness',Value=1,Minimum=1
		,Maximum=20,Step=0.1,Precision=1,Callback=function(as,at)ak.Sensitivity=(at-1)/(
		as.Settings.Maximum-1)*0.15 ak.Sensitivity2=at end}ar:Dropdown{Name='Bone',
		Description='selects the bone to aim at',Options={'All','Head','Chest','Stomach'
		,'Left Arm','Right Arm','Left Leg','Right Leg'},Value={'Head'},Limit=1,Minimum=1
		,Callback=function(as,at)ak.LockPart=at[1]=='Torso'and'HumanoidRootPart'or at[1]
		end}ar:Dropdown{Name='Lock Method',Description=
		'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
		'Camera'},Limit=1,Minimum=1,Callback=function(as,at)ak.LockMode=({Camera=1,Mouse
		=2})[at[1] ]end}ar:Slider{Name='Max Distance',Description=
		'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
		2000,Step=1,Precision=0,Callback=function(as,at)ak.MaxDistance=at end}:Continue(
		)end do local ar=aq:Section{Name='FOV Settings'}ar:Toggle{Name='Enabled',
		Description='whether the aimbot radius limit is active',State=true,Callback=
		function(as,at)am.Enabled=at end}ar:Toggle{Name='Visible',Description=
		'draws a circle representing the aimbot FOV radius',State=true,Callback=function
		(as,at)am.Visible=at end}:Continue():Colorpicker{Description='Unlocked Color',
		AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
		Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
		,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
		function(as,at)am.Color=at end}:Continue():Colorpicker{Description=
		'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(as,at)am.LockedColor=at end}ar:Slider{Name='Radius'
		,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
		Precision=0,Callback=function(as,at)am.Radius=at end}ar:Slider{Name=
		'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
		Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(as,at)am.NumSides=at
		end}:Continue()end end do local aq=ap:Section{Name='Triggerbot'}aq:Toggle{Name=
		'Enabled',Description='enables triggerbot',State=false,Callback=function(ar,as)
		al.Enabled=as end}aq:Slider{Name='Reaction Time',Description=
		'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
		Maximum=500,Step=1,Precision=0,Callback=function(ar,as)al.Delay=as/1000 end}aq:
		Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
		Callback=function(ar,as)al.TeamCheck=as end}:Continue()end end do local ap=ao.
		Visuals do local aq=ap:Section{Name='ESP'}aq:Slider{Name='Text Font',Description
		='the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,Precision=0,
		Callback=function(ar,as)ag.TextFont=as end}aq:Slider{Name='Text Size',
		Description='the size of ESP text',Value=13,Minimum=1,Maximum=20,Step=1,
		Precision=0,Callback=function(ar,as)ag.TextSize=as end}aq:Toggle{Name=
		'Use Team Color',Description='enables ESP team color',State=false,Callback=
		function(ar,as)ag.UseTeamColor=as end}aq:Toggle{Name='Limit Enabled',Description
		='enables distance limit',State=false,Callback=function(ar,as)ag.LimitDistance=
		as end}:Continue()aq:Slider{Name='Max Distance',Description=
		'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
		Step=1,Precision=0,Callback=function(ar,as)ag.MaxDistance=as end}:Continue()
		local ar=function(ar)an:VisualPreview{HealthBar={Visible=ar.HealthBar,Color={ar.
		HealthyColor}},Name={Visible=ar.Name,Color={ar.NameColor[1],ar.NameColor[2]}},
		Distance={Visible=ar.Distance,Color={ar.DistanceColor[1],ar.DistanceColor[2]}},
		Health={Visible=ar.HealthText,Color={ar.HealthTextColor[1],ar.HealthTextColor[2]
		}},Weapon={Visible=ar.Weapon,Color={ar.WeaponColor[1],ar.WeaponColor[2]}},
		BoundingBox={Visible=ar.Box,Color={ar.BoxColor[1],ar.BoxColor[2]}},CornerBox={
		Visible=ar.CornerBox,Color={ar.CornerBoxColor[1],ar.CornerBoxColor[2]}},FillBox=
		{Visible=ar.BoxFill,Color={ar.BoxFillColor[1],ar.BoxFillColor[2]}}}end local as,
		at=function(as,at)at:Toggle{Name='Enabled',Description='enables ESP',State=false
		,Callback=function(au,av)as.Enabled=av end}at:Toggle{Name='Bounding Box',
		Description='enables bounding box ESP',State=false,Callback=function(au,av)as.
		Box=av ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(au,av,aw)as.BoxColor[1],as.BoxColor[2]=av,1-aw as.
		BoxOutlineColor[2]=1-aw ar(as)end}at:Toggle{Name='Box Fill',Description=
		'enables box fill ESP',State=false,Callback=function(au,av)as.BoxFill=av ar(as)
		end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
		{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
		246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
		function(au,av,aw)as.BoxFillColor[1],as.BoxFillColor[2]=av,1-aw ar(as)end}at:
		Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
		Callback=function(au,av)as.CornerBox=av ar(as)end}:Continue():Colorpicker{Color=
		{Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
		Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
		197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au,av,aw)as.
		CornerBoxColor[1],as.CornerBoxColor[2]=av,1-aw ar(as)end}at:Toggle{Name=
		'3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
		=function(au,av)as.Box3d=av ar(as)end}:Continue():Colorpicker{Color={Color3.
		fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
		fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
		},{Color3.fromRGB(49,220,195)}},Callback=function(au,av,aw)as.Box3dColor[1],as.
		Box3dColor[2]=av,1-aw ar(as)end}at:Toggle{Name='Chams',Description=
		'enables player chams ESP',State=false,Callback=function(au,av)as.Chams=av end}:
		Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
		250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
		243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
		fromRGB(49,220,195)}},Callback=function(au,av,aw)as.ChamsFillColor[1],as.
		ChamsFillColor[2]=av,aw ar(as)end}:Continue():Colorpicker{Description=
		'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
		fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
		{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au
		,av,aw)as.ChamsOutlineColor[1],as.ChamsOutlineColor[2]=av,aw ar(as)end}at:Toggle
		{Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
		function(au,av)as.Skeleton=av end}:Continue():Colorpicker{Color={Color3.fromRGB(
		123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
		123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
		Color3.fromRGB(49,220,195)}},Callback=function(au,av,aw)as.SkeletonColor[1],as.
		SkeletonColor[2]=av,1-aw ar(as)end}:Continue()at:Slider{Name='Thickness',
		Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
		,Precision=0,Callback=function(au,av)as.SkeletonThickness=av end}at:Toggle{Name=
		'Tracers',Description='enables tracers ESP',State=false,Callback=function(au,av)
		as.Tracer=av end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243),0},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(au,av,aw)as.TracerColor[1],as.TracerColor[2]=av,1-
		aw as.TracerOutlineColor[2]=1-aw ar(as)end}:Continue()at:Dropdown{Name=
		'Tracers Origin',Description='selects the starting port of tracers',Options={
		'Top','Middle','Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=
		function(au,av)as.TracerOrigin=av[1]end}at:Toggle{Name='Health Bar',Description=
		'enables health bar ESP',State=false,Callback=function(au,av)as.HealthBar=av ar(
		as)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
		Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
		},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
		255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.
		HealthyColor=av ar(as)end}:Continue():Colorpicker{Description='Dying Color',
		AlphaEnabled=false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3
		.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)}
		,{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(
		au,av)as.DyingColor=av ar(as)end}at:Toggle{Name='Off Screen Arrows',Description=
		'enables off screen arrow ESP',State=false,Callback=function(au,av)as.
		OffScreenArrow=av end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
		,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
		{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(au,av,aw)as.OffScreenArrowColor[1],as.
		OffScreenArrowColor[2]=av,1-aw as.OffScreenArrowOutlineColor[2]=1-aw ar(as)end}:
		Continue()at:Slider{Name='Arrow Size',Description=
		'changes the size of the individual off screen arrows',Value=15,Minimum=1,
		Maximum=50,Step=1,Precision=0,Callback=function(au,av)ag.OffScreenArrowSize=av
		end}:Continue()at:Slider{Name='Radius',Description=
		'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
		Step=1,Precision=0,Callback=function(au,av)ag.OffScreenArrowRadius=av end}at:
		Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
		function(au,av)as.Name=av ar(as)end}:Continue():Colorpicker{Color={Color3.
		fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
		fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
		},{Color3.fromRGB(49,220,195)}},Callback=function(au,av,aw)as.NameColor[1],as.
		NameColor[2]=av,1-aw ar(as)end}at:Toggle{Name='Distance',Description=
		'enables distance text ESP',State=false,Callback=function(au,av)as.Distance=av
		ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(au,av,aw)as.DistanceColor[1],as.DistanceColor[2]=av
		,1-aw ar(as)end}at:Toggle{Name='Weapon',Description='enables weapon text ESP',
		State=false,Callback=function(au,av)as.Weapon=av ar(as)end}:Continue():
		Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
		fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
		{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au
		,av,aw)as.WeaponColor[1],as.WeaponColor[2]=av,1-aw ar(as)end}at:Toggle{Name=
		'Health',Description='enables health text ESP',State=false,Callback=function(au,
		av)as.HealthText=av ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
		173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
		124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
		fromRGB(49,220,195)}},Callback=function(au,av,aw)as.HealthTextColor[1],as.
		HealthTextColor[2]=av,1-aw ar(as)end}:Continue()end,aq:Section{Name='Enemies'}
		as(ai,at)local au=aq:Section{Name='Friendlies'}as(aj,au)end end do local ap=ao.
		Cfg ap:Toggle{Name='Visual preview',Description=
		'enables a visual preview of your esp',State=true,Callback=function(aq,ar)an:
		VisualPreview{Visible=ar}end}:Continue()ap:Keybind{Bind=an.Settings.Keybind,
		Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
		onChanged=function(aq,ar)an:UpdateSettings{Keybind=ar}end}:Continue()ap:Button{
		Color=af.SystemDarkRed,Name='Unload Menu',Callback=function(aq)ab:Unload()end}:
		Continue()end do ac.Load()end do ad.Load()end do ao.Legit:Select()ab:
		Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`,Description=`RIOT for {aa.
		Name} loaded!`,Lifetime=5}end end end function a.f()local aa={}aa.Load=function(
		)local ab,ac=game:GetService'ReplicatedFirst':WaitForChild'NewLoader',game:
		GetService'ReplicatedStorage':WaitForChild'Functions':WaitForChild'Ping'do local
		ad ad=hookfunction(getrenv().task.spawn,newcclosure(function(ae,...)local af={
		...}if af[1]==ac and debug.info(ae,'n')=='InvokeServer'then return task.wait(9e9
		)end return ad(ae,...)end))end do local ad ad=hookmetamethod(game,'__namecall',
		newcclosure(function(ae,af,...)if ae.Parent==nil and not checkcaller()and
		getnamecallmethod()=='Fire'and typeof(af)=='table'then local ag,ah=next(af)if
		typeof(ag)=='userdata'then hookmetamethod(game,'__namecall',ad)return task.wait(
		9e9)end end return ad(ae,af,...)end))end do local ad ad=hookmetamethod(game,
		'__namecall',newcclosure(function(ae,af,...)if ae==game and not checkcaller()and
		getnamecallmethod()=='FindService'and af=='VirtualUser'then hookmetamethod(game,
		'__namecall',ad)return task.wait(9e9)end return ad(ae,af,...)end))end do local
		ad ad=hookmetamethod(game,'__newindex',newcclosure(function(ae,af,ag)if ae==ab
		and not checkcaller()then return task.wait(9e9)end return ad(ae,af,ag)end))end
		end return aa end function a.g()local aa,ab,ac,ad,ae,af=game,workspace,Vector2.
		new,Color3.fromRGB,Drawing.new,table.find local ag=getrawmetatable and
		getrawmetatable(aa)or{__index=function(ag,ah)return ag[ah]end,__newindex=
		function(ag,ah,ai)ag[ah]=ai end}local ah=ag.__index local ai=ah(aa,'GetService')
		local aj,ak,al=ai(aa,'RunService'),ai(aa,'UserInputService'),ai(aa,'Players')
		local am,an,ao,ap=ah(al,'LocalPlayer'),ah(ab,'CurrentCamera'),ah(aa,
		'FindFirstChild'),ah(aa,'FindFirstChildOfClass')local aq,ar,as,at,au,av=ah(an,
		'WorldToViewportPoint'),ah(an,'GetPartsObscuringTarget'),ah(ak,
		'GetMouseLocation'),ah(al,'GetPlayers'),false,{DeveloperSettings={UpdateMode=
		'RenderStepped',TeamCheckOption='Team'},SilentAim={Locked=nil,Enabled=true,
		LockPart='Head',RandomLockPart=false,HitChance=100,MaxDistance=250,WallCheck=
		true,TeamCheck=true,AliveCheck=true,FOVSettings={Enabled=true,Visible=true,
		Radius=90,NumSides=60,Thickness=2,Filled=false,Color={ad(255,150,150),0},
		OutlineColor={ad(0,0,0),0}},SnaplineSettings={Enabled=true,Thickness=2,Color={
		ad(255,0,0),0},OutlineColor={ad(0,0,0),0}}},IgnoredParts={},BlacklistTable={},
		FOVCircleOutline=ae'Circle',FOVCircle=ae'Circle',SnaplineOutline=ae'Line',
		Snapline=ae'Line'}function av.AddToIgnoreQuery(aw)if not af(av.IgnoredParts,aw)
		then table.insert(av.IgnoredParts,aw)end end function av.SilentAim.SetState(aw)
		au=aw end local aw=function(aw)return ac(aw.X,aw.Y)end local ax,ay,az,aA=
		function()local ax=av.SilentAim local ay=ax.RandomLockPart and({'Head',
		'HumanoidRootPart'})[math.random(1,2)]or ax.LockPart if not ax.Locked then local
		az=ax.FOVSettings.Enabled and ax.FOVSettings.Radius or 2000 for aA,aB in next,
		at(al)do local aC=ah(aB,'Character')local aD=aC and ap(aC,'Humanoid')if aB~=am
		and ah(am,'Character')and aC and ao(aC,ay)and aD then local aE=ah(aC[ay],
		'Position')if ax.MaxDistance and(an.CFrame.Position-aE).Magnitude>ax.MaxDistance
		then continue end if ax.TeamCheck and ah(aB,av.DeveloperSettings.TeamCheckOption
		)and ah(aB,av.DeveloperSettings.TeamCheckOption)==ah(am,av.DeveloperSettings.
		TeamCheckOption)then continue end if ax.AliveCheck and ah(aD,'Health')<=0 then
		continue end if ax.WallCheck then table.clear(av.BlacklistTable)table.insert(av.
		BlacklistTable,am.Character)table.insert(av.BlacklistTable,aC)for aF=1,#av.
		IgnoredParts do av.BlacklistTable[#av.BlacklistTable+1]=av.IgnoredParts[aF]end
		if#ar(an,{aE},av.BlacklistTable)>0 then continue end end local aF,aG=aq(an,aE)aF
		=aw(aF)local aH=(as(ak)-aF).Magnitude if aH<az and aG then az,av.Locked=aH,aB if
		ax.LockContinueTrigger then task.spawn(ax.LockContinueTrigger,aB)end return aC[
		ay]end end end else local az,aA=ah(av.Locked,'Character'),ax.FOVSettings.Enabled
		and ax.FOVSettings.Radius or 2000 if az and ah(am,'Character')then local aB=ao(
		az,ay)if not aB then ax.Locked=nil return nil end local aC=ah(aB,'Position')if
		ax.MaxDistance and(an.CFrame.Position-aC).Magnitude>ax.MaxDistance then ax.
		Locked=nil return nil end if ax.WallCheck then table.clear(av.BlacklistTable)
		table.insert(av.BlacklistTable,am.Character)table.insert(av.BlacklistTable,az)
		for aD=1,#av.IgnoredParts do av.BlacklistTable[#av.BlacklistTable+1]=av.
		IgnoredParts[aD]end if#ar(an,{aC},av.BlacklistTable)>0 then ax.Locked=nil return
		nil end end local aD,aE=aq(an,aC)aD=aw(aD)local aF=(as(ak)-aD).Magnitude if aF>
		aA or not aE then ax.Locked=nil return nil end if ax.LockContinueTrigger then
		task.spawn(ax.LockContinueTrigger,Value)end return aB else ax.Locked=nil return
		nil end end return nil end,function()if av.SilentAim.Enabled and av.SilentAim.
		FOVSettings.Enabled then av.FOVCircle.Color=av.SilentAim.FOVSettings.Color[1]av.
		FOVCircleOutline.Color=av.SilentAim.FOVSettings.OutlineColor[1]av.FOVCircle.
		Transparency=av.SilentAim.FOVSettings.Color[2]av.FOVCircleOutline.Transparency=
		av.SilentAim.FOVSettings.OutlineColor[2]av.FOVCircle.Thickness=av.SilentAim.
		FOVSettings.Thickness av.FOVCircleOutline.Thickness=av.SilentAim.FOVSettings.
		Thickness+2 av.FOVCircle.Position=as(ak)av.FOVCircleOutline.Position=as(ak)av.
		FOVCircle.NumSides=av.SilentAim.FOVSettings.NumSides av.FOVCircleOutline.
		NumSides=av.SilentAim.FOVSettings.NumSides av.FOVCircle.Radius=av.SilentAim.
		FOVSettings.Radius av.FOVCircleOutline.Radius=av.SilentAim.FOVSettings.Radius av
		.FOVCircle.Visible=av.SilentAim.FOVSettings.Visible av.FOVCircleOutline.Visible=
		av.SilentAim.FOVSettings.Visible else av.FOVCircle.Visible=false av.
		FOVCircleOutline.Visible=false end end,function(ax)if au and av.SilentAim.
		Enabled and av.SilentAim.SnaplineSettings.Enabled and ax then local ay=as(ak)av.
		SnaplineOutline.From=ay av.SnaplineOutline.To=ax av.SnaplineOutline.Color=av.
		SilentAim.SnaplineSettings.OutlineColor[1]av.SnaplineOutline.Transparency=av.
		SilentAim.SnaplineSettings.OutlineColor[2]av.SnaplineOutline.Thickness=av.
		SilentAim.SnaplineSettings.Thickness+2 av.SnaplineOutline.Visible=true av.
		Snapline.From=ay av.Snapline.To=ax av.Snapline.Color=av.SilentAim.
		SnaplineSettings.Color[1]av.Snapline.Transparency=av.SilentAim.SnaplineSettings.
		Color[2]av.Snapline.Thickness=av.SilentAim.SnaplineSettings.Thickness av.
		Snapline.Visible=true else av.Snapline.Visible=false av.SnaplineOutline.Visible=
		false end end aj.RenderStepped:Connect(function()ay()aA=nil if au and av.
		SilentAim.Enabled then aA=ax()local aB if aA and av.SilentAim.SnaplineSettings.
		Enabled then local aC,aD=aq(an,aA.Position)if aD then aB=ac(aC.X,aC.Y)end end
		az(aB)end end)local aB aB=hookmetamethod(aa,'__index',newcclosure(function(aC,aD
		)if au and av.SilentAim.Enabled and aC==an and aD=='CoordinateFrame'and string.
		match(debug.info(3,'s'),'Client.Functions.Weapons')and debug.info(debug.info(3,
		'f'),'n')~='RotCamera'and math.random(1,100)<=av.SilentAim.HitChance and aA then
		return CFrame.new(an.CFrame.Position,aA.Position)end return aB(aC,aD)end))return
		av end function a.h()return function(aa)local ab,ac,ad,ae,af,ag=a.load'f',a.load
		'b',a.load'a',a.load'c',a.load'd',a.load'g'local ah=ac.SecureService local ai,aj
		,ak,al,am=ah'Workspace',ah'Lighting',ah'ReplicatedStorage',ah'RunService',ac.
		GetPlayer()local an,ao,ap,aq,ar,as=ak:WaitForChild'Modules',ad.Components,ad.
		Assets,ad.Colors,ae.Shared,ae.Team local at,au,av,aw,ax,ay=as.Enemy,as.Friendly,
		af.Aimbot,af.Triggerbot,af.FOVSettings,ag.SilentAim local az,aA,aB,aC=ay.
		FOVSettings,ay.SnaplineSettings,{GetClient=function()local az=am:FindFirstChild
		'PlayerGui'and am.PlayerGui:FindFirstChild'GUI'local aA=az and az:FindFirstChild
		'Client'return aA,getsenv(aA)end},ad:Window{Title=aa.Name,Keybind=Enum.KeyCode.
		RightControl}local aD={Legit=aC:Tab{Name='Legit',Image=ap.ShieldCheck},Rage=aC:
		Tab{Name='Rage',Image=ap.Shield},Visuals=aC:Tab{Name='Visuals',Image=ap.Bolt},
		Misc=aC:Tab{Name='Misc',Image=ap.Folder},Cfg=aC:Tab{Name='Cfg',Image=ap.Archive}
		}do local aE=aD.Legit do local aF=aE:Section{Name='Aimbot'}do local aG=aF:
		Section{Name='Settings'}aG:Toggle{Name='Enabled',Description='enables aimbot',
		State=false,Callback=function(aH,aI)av.Enabled=aI end}:Continue()aG:Keybind{Bind
		=Enum.UserInputType.MouseButton2,Blacklist={Enum.UserInputType.MouseButton1},
		onHeld=function(aH,aI,aJ)if aJ then return end av.SetState(aI)end}aG:Dropdown{
		Name='Wall Check',Description='the method used by wall check',Options={'Off',
		'Sticky','Always On'},Value={'Always On'},Limit=1,Minimum=1,Callback=function(aH
		,aI)av.WallCheck=({Off=1,Sticky=2,['Always On']=3})[aI[1] ]end}aG:Toggle{Name=
		'Team Check',Description='whether to ignore friendlys',State=true,Callback=
		function(aH,aI)av.TeamCheck=aI end}aG:Slider{Name='Smoothing',Description=
		'aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=0.1,Precision=1,Callback=
		function(aH,aI)av.Sensitivity=(aI-1)/(aH.Settings.Maximum-1)*0.15 av.
		Sensitivity2=aI end}aG:Dropdown{Name='Bone',Description=
		'selects the bone to aim at',Options={'Head','Torso'},Value={'Head'},Limit=1,
		Minimum=1,Callback=function(aH,aI)av.LockPart=aI[1]=='Torso'and
		'HumanoidRootPart'or aI[1]end}aG:Dropdown{Name='Input Method',Description=
		'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
		'Camera'},Limit=1,Minimum=1,Callback=function(aH,aI)av.LockMode=({Camera=1,Mouse
		=2})[aI[1] ]end}aG:Slider{Name='Max Distance',Description=
		'the distance aimbot stops locking onto players',Value=800,Minimum=1,Maximum=
		2000,Step=1,Precision=0,Callback=function(aH,aI)av.MaxDistance=aI end}:Continue(
		)end do local aG=aF:Section{Name='FOV'}aG:Toggle{Name='Enabled',Description=
		'whether the aimbot radius limit is active',State=true,Callback=function(aH,aI)
		ax.Enabled=aI end}aG:Toggle{Name='Visible',Description=
		'draws a circle representing the aimbot FOV radius',State=true,Callback=function
		(aH,aI)ax.Visible=aI end}:Continue():Colorpicker{Description='Unlocked Color',
		AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
		Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
		,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
		function(aH,aI)ax.Color=aI end}:Continue():Colorpicker{Description=
		'Locked Color',AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(aH,aI)ax.LockedColor=aI end}aG:Slider{Name='Radius'
		,Description='aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,
		Precision=0,Callback=function(aH,aI)ax.Radius=aI end}aG:Slider{Name=
		'Circle Sides',Description='the amount of points the drawn circle has',Value=45,
		Minimum=3,Maximum=80,Step=1,Precision=0,Callback=function(aH,aI)ax.NumSides=aI
		end}:Continue()end end do local aF=aE:Section{Name='Triggerbot'}aF:Toggle{Name=
		'Enabled',Description=
		[[enables triggerbot. fires your gun when a target is in bounds]],State=false,
		Callback=function(aG,aH)aw.Enabled=aH end}aF:Slider{Name='Reaction Time',
		Description='the time it takes for triggerbot to react to targets (ms)',Value=0,
		Minimum=0,Maximum=500,Step=1,Precision=0,Callback=function(aG,aH)aw.Delay=aH/
		1000 end}aF:Toggle{Name='Team Check',Description='whether to ignore friendlys',
		State=true,Callback=function(aG,aH)aw.TeamCheck=aH end}:Continue()end end do
		local aE=aD.Rage do local aF=aE:Section{Name='Silent Aim'}do local aG=aF:Section
		{Name='Settings'}aG:Toggle{Name='Enabled',Description='enables silent aim',State
		=false,Callback=function(aH,aI)ay.Enabled=aI ay.SetState(aI)end}aG:Toggle{Name=
		'Auto Fire',Description='enabled automatic fire when a target is in bounds',
		State=false,Callback=function(aH,aI)if aI then ay.LockContinueTrigger=function()
		aw.Trigger()end else ay.LockContinueTrigger=nil end end}aG:Toggle{Name=
		'Wall Check',Description='enables wall check',State=true,Callback=function(aH,aI
		)ay.WallCheck=aI end}aG:Toggle{Name='Team Check',Description=
		'enables team check',State=true,Callback=function(aH,aI)ay.TeamCheck=aI end}aG:
		Dropdown{Name='Bone',Description='selects the bone bullets redirect to',Options=
		{'Head','Torso'},Value={'Head'},Limit=1,Minimum=1,Callback=function(aH,aI)local
		aJ=aI[1]=='Torso'and'HumanoidRootPart'or aI[1]ay.LockPart=aJ end}aG:Slider{Name=
		'Hit Chance',Description='the chance bullets will hit when shot with silent aim'
		,Value=100,Minimum=0,Maximum=100,Step=1,Precision=0,Filter=function(aH)return
		tostring(aH)..'%'end,Callback=function(aH,aI)ay.HitChance=aI end}aG:Slider{Name=
		'Max Distance',Description='the distance silent aim stops redirecting bullets',
		Value=500,Minimum=1,Maximum=2000,Step=1,Precision=0,Callback=function(aH,aI)ay.
		MaxDistance=aI end}:Continue()end do local aG=aF:Section{Name='FOV'}aG:Toggle{
		Name='Enabled',Description='whether the silent aim radius limit is active',State
		=true,Callback=function(aH,aI)az.Enabled=aI end}aG:Toggle{Name='Visible',
		Description='draws a circle representing the silent aim FOV radius',State=true,
		Callback=function(aH,aI)az.Visible=aI end}:Continue():Colorpicker{Color={Color3.
		fromRGB(100,50,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
		fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
		},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)az.Color[1],az.Color[
		2]=aI,1-aJ az.OutlineColor[2]=1-aJ end}aG:Slider{Name='Radius',Description=
		'silent aim FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,Precision=0
		,Callback=function(aH,aI)az.Radius=aI end}aG:Slider{Name='Circle Sides',
		Description='the amount of points the drawn circle has',Value=45,Minimum=3,
		Maximum=80,Step=1,Precision=0,Callback=function(aH,aI)az.NumSides=aI end}:
		Continue()end do local aG=aF:Section{Name='Snaplines'}aG:Toggle{Name='Enabled',
		Description='whether snapping point lines are enabled',State=true,Callback=
		function(aH,aI)aA.Enabled=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(
		200,230,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
		123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
		Color3.fromRGB(49,220,195)}},Callback=function(aH,aI,aJ)aA.Color[1],aA.Color[2]=
		aI,1-aJ aA.OutlineColor[2]=1-aJ end}aG:Slider{Name='Thickness',Description=
		'how thick the snapping point line is',Value=2,Minimum=1,Maximum=6,Step=1,
		Precision=0,Callback=function(aH,aI)aA.Thickness=aI end}:Continue()end end do
		local aF,aG,aH=aE:Section{Name='Gun Modifications'},{},{}local aI,aJ=function(aI
		,aJ,aK)local aL,aM=game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.
		Weapons,ak:FindFirstChild'Weapons'if aK then if aL and getsenv(aL)[aI]then aH[aI
		]=getsenv(aL)[aI]getsenv(aL)[aI]=aJ end else if aM then for aN,aO in pairs(aM:
		GetDescendants())do if aO.Name==aI and aO.Parent.Parent==aM and aO:IsA
		'ValueBase'then if aG[aO]==nil then aG[aO]=aO.Value end if typeof(aJ)==
		'function'then aO.Value=aJ(typeof(aO.Value),aG[aO])else aO.Value=aJ end end end
		end end end,function(aI,aJ)local aK,aL=game.Players.LocalPlayer.PlayerGui.GUI.
		Client.Functions.Weapons,ak:FindFirstChild'Weapons'if aJ then if aK and aH[aI]
		then getsenv(aK)[aI]=aH[aI]end else if aL then for aM,aN in pairs(aL:
		GetDescendants())do if aN.Name==aI and aG[aN]~=nil then aN.Value=aG[aN]aG[aN]=
		nil end end end end end aF:Slider{Name='Bullet Multiplier',Description=
		'Multiplies the bullets fired per shot\n\u{26a0}\u{fe0f} This can lag your game with high values\u{26a0}\u{fe0f}'
		,Value=1,Minimum=1,Maximum=8,Step=1,Precision=0,Callback=function(aK,aL)aI(
		'Bullets',function(aM,aN)return aM=='number'and aN*aL or aN end)end}aF:Slider{
		Name='Critical Multiplier',Description=
		'Multiplies the crit multiplier for your gun',Value=1,Minimum=1,Maximum=100,Step
		=1,Precision=0,Callback=function(aK,aL)aI('Crit',function(aM,aN)return aM==
		'number'and aN*aL or aN end)end}aF:Toggle{Name='Automatics',Description=
		'makes all guns automatic',State=false,Callback=function(aK,aL)if aL then aI(
		'mode','automatic',true)aI('Auto',true)else aJ('automatic',true)aJ'Auto'end end}
		aF:Toggle{Name='Infinite Ammo',Description='enables infinite ammo',State=false,
		Callback=function(aK,aL)local aM=ak.wkspc local aN=aM and aM.CurrentCurse if aN
		and aN.Value and aL then aN.Value='Infinite Ammo'elseif not aL then aN.Value=''
		end end}aF:Toggle{Name='Rapid Fire',Description='enables rapid fire rate',State=
		false,Callback=function(aK,aL)if aL then aI('FireRate',0.02)else aJ'FireRate'end
		end}aF:Toggle{Name='No Equip Timer',Description=
		'removes the delay from equipping to shooting',State=false,Callback=function(aK,
		aL)if aL then aI('EquipTime',0)else aJ'EquipTime'end end}aF:Toggle{Name=
		'Instant Reload',Description='removes reload timer',State=false,Callback=
		function(aK,aL)if aL then aI('ReloadTime',0)else aJ'ReloadTime'end end}aF:Toggle
		{Name='No Spread',Description='removes gun spread',State=false,Callback=function
		(aK,aL)if aL then aI('MaxSpread',0)aI('Spread',0)else aJ'MaxSpread'aJ'Spread'end
		end}aF:Toggle{Name='No Recoil',Description='removes gun recoil',State=false,
		Callback=function(aK,aL)if aL then aI('recoil',0,true)aI('RecoilControl',0)else
		aJ('recoil',true)aJ'RecoilControl'end end}aF:Toggle{Name='No Overheating',
		Description='removes overheating for the Z80',State=false,Callback=function(aK,
		aL)local aM=am:FindFirstChild'PlayerGui'and am.PlayerGui:FindFirstChild'GUI'
		local aN=aM and aM:FindFirstChild'Client'local aO=aN and aN:FindFirstChild
		'Variables'local aP=aO and aO:FindFirstChild'overheat'if not aP then return end
		if aK._OverheatConn then aK._OverheatConn:Disconnect()aK._OverheatConn=nil end
		if aL then aK._OverheatConn=aP:GetPropertyChangedSignal'Value':Connect(function(
		)if aP.Value>0 then aP.Value=0 end end)end end}aF:Toggle{Name=
		'No Projectile Charging',Description='removes charge timer for projectiles',
		State=false,Callback=function(aK,aL)if aL then aI('ChargeTime',0)else aJ
		'ChargeTime'end end}aF:Toggle{Name='No Slow',Description='removes gun slowdown',
		State=false,Callback=function(aK,aL)if aL then aI('Speed%',function(aM,aN)return
		aM=='number'and aN>0 and 0 end)else aJ'Speed%'end end}:Continue()end end do
		local aE=aD.Visuals do local aF=aE:Section{Name='ESP'}aF:Slider{Name='Text Font'
		,Description='the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,
		Precision=0,Callback=function(aG,aH)ar.TextFont=aH end}aF:Slider{Name=
		'Text Size',Description='the size of ESP text',Value=13,Minimum=1,Maximum=20,
		Step=1,Precision=0,Callback=function(aG,aH)ar.TextSize=aH end}aF:Toggle{Name=
		'Use Team Color',Description='enables ESP team color',State=false,Callback=
		function(aG,aH)ar.UseTeamColor=aH end}aF:Toggle{Name='Limit Enabled',Description
		='enables distance limit',State=false,Callback=function(aG,aH)ar.LimitDistance=
		aH end}:Continue()aF:Slider{Name='Max Distance',Description=
		'the maximum distance that ESP will render at',Value=500,Minimum=1,Maximum=2000,
		Step=1,Precision=0,Callback=function(aG,aH)ar.MaxDistance=aH end}:Continue()
		local aG=function(aG)aC:VisualPreview{HealthBar={Visible=aG.HealthBar,Color={aG.
		HealthyColor}},Name={Visible=aG.Name,Color={aG.NameColor[1],aG.NameColor[2]}},
		Distance={Visible=aG.Distance,Color={aG.DistanceColor[1],aG.DistanceColor[2]}},
		Health={Visible=aG.HealthText,Color={aG.HealthTextColor[1],aG.HealthTextColor[2]
		}},Weapon={Visible=aG.Weapon,Color={aG.WeaponColor[1],aG.WeaponColor[2]}},
		BoundingBox={Visible=aG.Box,Color={aG.BoxColor[1],aG.BoxColor[2]}},CornerBox={
		Visible=aG.CornerBox,Color={aG.CornerBoxColor[1],aG.CornerBoxColor[2]}},FillBox=
		{Visible=aG.BoxFill,Color={aG.BoxFillColor[1],aG.BoxFillColor[2]}}}end local aH,
		aI=function(aH,aI)aI:Toggle{Name='Enabled',Description='enables ESP',State=false
		,Callback=function(aJ,aK)aH.Enabled=aK end}aI:Toggle{Name='Bounding Box',
		Description='enables bounding box ESP',State=false,Callback=function(aJ,aK)aH.
		Box=aK aG(aH)end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(aJ,aK,aL)aH.BoxColor[1],aH.BoxColor[2]=aK,1-aL aH.
		BoxOutlineColor[2]=1-aL aG(aH)end}aI:Toggle{Name='Box Fill',Description=
		'enables box fill ESP',State=false,Callback=function(aJ,aK)aH.BoxFill=aK aG(aH)
		end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
		{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
		246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
		function(aJ,aK,aL)aH.BoxFillColor[1],aH.BoxFillColor[2]=aK,1-aL aG(aH)end}aI:
		Toggle{Name='Corner Box',Description='enables corner box ESP',State=false,
		Callback=function(aJ,aK)aH.CornerBox=aK aG(aH)end}:Continue():Colorpicker{Color=
		{Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
		Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
		197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.
		CornerBoxColor[1],aH.CornerBoxColor[2]=aK,1-aL aG(aH)end}aI:Toggle{Name=
		'3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
		=function(aJ,aK)aH.Box3d=aK aG(aH)end}:Continue():Colorpicker{Color={Color3.
		fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
		fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
		},{Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.Box3dColor[1],aH.
		Box3dColor[2]=aK,1-aL aG(aH)end}aI:Toggle{Name='Chams',Description=
		'enables player chams ESP',State=false,Callback=function(aJ,aK)aH.Chams=aK end}:
		Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
		250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
		243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
		fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.ChamsFillColor[1],aH.
		ChamsFillColor[2]=aK,aL aG(aH)end}:Continue():Colorpicker{Description=
		'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
		fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
		{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aJ
		,aK,aL)aH.ChamsOutlineColor[1],aH.ChamsOutlineColor[2]=aK,aL aG(aH)end}aI:Toggle
		{Name='Skeletons',Description='enables skeleton/bone ESP',State=false,Callback=
		function(aJ,aK)aH.Skeleton=aK end}:Continue():Colorpicker{Color={Color3.fromRGB(
		123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
		123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
		Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.SkeletonColor[1],aH.
		SkeletonColor[2]=aK,1-aL aG(aH)end}:Continue()aI:Slider{Name='Thickness',
		Description='the thickness of skeleton lines',Value=1,Minimum=1,Maximum=4,Step=1
		,Precision=0,Callback=function(aJ,aK)aH.SkeletonThickness=aK end}:Continue()aI:
		Toggle{Name='Tracers',Description='enables tracers ESP',State=false,Callback=
		function(aJ,aK)aH.Tracer=aK end}:Continue():Colorpicker{Color={Color3.fromRGB(
		123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(
		123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{
		Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.TracerColor[1],aH.
		TracerColor[2]=aK,1-aL aH.TracerOutlineColor[2]=1-aL aG(aH)end}:Continue()aI:
		Dropdown{Name='Tracers Origin',Description=
		'selects the starting port of tracers',Options={'Top','Middle','Bottom','Mouse'}
		,Value={'Top'},Limit=1,Minimum=1,Callback=function(aJ,aK)aH.TracerOrigin=aK[1]
		end}aI:Toggle{Name='Health Bar',Description='enables health bar ESP',State=false
		,Callback=function(aJ,aK)aH.HealthBar=aK aG(aH)end}:Continue():Colorpicker{
		Description='Healthy Color',AlphaEnabled=false,Color={Color3.fromRGB(58,161,47),
		0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(aJ,aK)aH.HealthyColor=aK aG(aH)end}:Continue():
		Colorpicker{Description='Dying Color',AlphaEnabled=false,Color={Color3.fromRGB(
		161,47,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
		124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
		fromRGB(49,220,195)}},Callback=function(aJ,aK)aH.DyingColor=aK aG(aH)end}aI:
		Toggle{Name='Off Screen Arrows',Description='enables off screen arrow ESP',State
		=false,Callback=function(aJ,aK)aH.OffScreenArrow=aK end}:Continue():Colorpicker{
		Color={Color3.fromRGB(255,255,255),0},SuggestionColors={{Color3.fromRGB(171,81,
		83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
		fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)
		aH.OffScreenArrowColor[1],aH.OffScreenArrowColor[2]=aK,1-aL aH.
		OffScreenArrowOutlineColor[2]=1-aL aG(aH)end}:Continue()aI:Slider{Name=
		'Arrow Size',Description='changes the size of the individual off screen arrows',
		Value=15,Minimum=1,Maximum=50,Step=1,Precision=0,Callback=function(aJ,aK)ar.
		OffScreenArrowSize=aK end}:Continue()aI:Slider{Name='Radius',Description=
		'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
		Step=1,Precision=0,Callback=function(aJ,aK)ar.OffScreenArrowRadius=aK end}aI:
		Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
		function(aJ,aK)aH.Name=aK aG(aH)end}:Continue():Colorpicker{Color={Color3.
		fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
		fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
		},{Color3.fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.NameColor[1],aH.
		NameColor[2]=aK,1-aL aG(aH)end}aI:Toggle{Name='Distance',Description=
		'enables distance text ESP',State=false,Callback=function(aJ,aK)aH.Distance=aK
		aG(aH)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(aJ,aK,aL)aH.DistanceColor[1],aH.DistanceColor[2]=aK
		,1-aL aG(aH)end}aI:Toggle{Name='Weapon',Description='enables weapon text ESP',
		State=false,Callback=function(aJ,aK)aH.Weapon=aK aG(aH)end}:Continue():
		Colorpicker{Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.
		fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
		{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aJ
		,aK,aL)aH.WeaponColor[1],aH.WeaponColor[2]=aK,1-aL aG(aH)end}aI:Toggle{Name=
		'Health',Description='enables health text ESP',State=false,Callback=function(aJ,
		aK)aH.HealthText=aK aG(aH)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,
		173,182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
		124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
		fromRGB(49,220,195)}},Callback=function(aJ,aK,aL)aH.HealthTextColor[1],aH.
		HealthTextColor[2]=aK,1-aL aG(aH)end}:Continue()end,aF:Section{Name='Enemies'}
		aH(at,aI)local aJ=aF:Section{Name='Friendlies'}aH(au,aJ)end do local aF=aE:
		Section{Name='World'}aF:Toggle{Name='Night mode',Description=
		'enables night mode',State=false,Callback=function(aG,aH)if aG.__NightModeConn
		then aG.__NightModeConn:Disconnect()aG.__NightModeConn=nil end if aH then aG.
		__OldClockTime=aj.ClockTime aG.__NightModeConn=game:GetService'RunService'.
		Heartbeat:Connect(function()if aj.ClockTime~=0 then aG.__OldClockTime=aj.
		ClockTime aj.ClockTime=0 end end)else if aG.__OldClockTime then aj.ClockTime=aG.
		__OldClockTime end end end}do local aG,aH=aF:Section{Name='Color Correction'},
		Instance.new'ColorCorrectionEffect'aH.Parent=aj aG:Toggle{Name='Enabled',
		Description='enables world color correction',State=false,Callback=function(aI,aJ
		)aH.Enabled=aJ end}aG:Colorpicker{AlphaEnabled=false,Name='Tint',Description=
		'changes world color correction tint',Color={Color3.fromRGB(255,255,255)},
		SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
		Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
		220,195)}},Callback=function(aI,aJ)aH.TintColor=aJ end}aG:Slider{Name=
		'Brightness',Description='changes world color correction brightness',Value=0,
		Minimum=-1,Maximum=1,Step=0.01,Precision=2,Callback=function(aI,aJ)aH.Brightness
		=aJ end}aG:Slider{Name='Contrast',Description=
		'changes world color correction contrast',Value=0,Minimum=-2,Maximum=5,Step=0.01
		,Precision=2,Callback=function(aI,aJ)aH.Contrast=aJ end}aG:Slider{Name=
		'Saturation',Description='changes world color correction saturation',Value=0,
		Minimum=-10,Maximum=10,Step=0.01,Precision=2,Callback=function(aI,aJ)aH.
		Saturation=aJ end}end end end do local aE=aD.Misc do local aF=aE:Section{Name=
		'Local Player'}do aF:Slider({Name='Speed Multiplier',Description=
		'multiplies your movement speed',Value=1,Minimum=1,Maximum=4,Step=0.1,Precision=
		1,Callback=function(aG,aH)local aI=ac.GetCharacter(am)if aI then aI.Humanoid.
		WalkSpeed*=aH end end},'Misc/LocalPlayer/SpeedMultiplier')aF:Slider({Name=
		'Jump Multiplier',Description='multiplies your jump power',Value=1,Minimum=1,
		Maximum=15,Step=0.1,Precision=1,Callback=function(aG,aH)local aI=ac.GetHumanoid(
		am)if aI then local aJ=aI.UseJumpPower and'JumpPower'or'JumpHeight'aI[aJ]*=aH
		end end},'Misc/LocalPlayer/JumpMultiplier')end aF:Toggle{Name='Third Person',
		Description='enables third person perspective',State=false,Callback=function(aG,
		aH)if aG._ThirdPersonConn then aG._ThirdPersonConn:Disconnect()aG.
		_ThirdPersonConn=nil end if aH then am.CameraMode=Enum.CameraMode.Classic aG.
		_ThirdPersonConn=am:GetPropertyChangedSignal'CameraMode':Connect(function()am.
		CameraMode=Enum.CameraMode.Classic end)else am.CameraMode=Enum.CameraMode.
		LockFirstPerson end end}:Continue()end end do local aE=aD.Cfg aE:Toggle{Name=
		'Visual preview',Description='enables a visual preview of your esp',State=true,
		Callback=function(aF,aG)aC:VisualPreview{Visible=aG}end}:Continue()aE:Keybind{
		Bind=aC.Settings.Keybind,Blacklist={Enum.UserInputType.MouseButton1,Enum.
		UserInputType.MouseButton2},onChanged=function(aF,aG)aC:UpdateSettings{Keybind=
		aG}end}:Continue()aE:Button{Color=aq.SystemDarkRed,Name='Unload Menu',Callback=
		function(aF)ad:Unload()end}:Continue()end ab.Load()do ae.Load()ae.GetWeapon=
		function(aE)if not aE then return'NONE'end local aF=aE:FindFirstChild'NRPBS'if
		not aF then return'NONE'end local aG=aF:FindFirstChild'EquippedTool'if not aG or
		not aG.Value then return'NONE'end return string.upper(aG.Value)end ae.GetHealth=
		function(aE)if not aE then return 100,100 end local aF=aE:FindFirstChild'NRPBS'
		if not aF then return 100,100 end local aG,aH=aF:FindFirstChild'Health',aF:
		FindFirstChild'MaxHealth'if not aG or not aH then return 100,100 end return aG.
		Value,aH.Value end end do af.GetHealth=function(aE)if not aE then return 0 end
		local aF=aE:FindFirstChild'NRPBS'if not aF then return 0 end local aG=aF:
		FindFirstChild'Health'if not aG then return 0 end return aG.Value end aw.Trigger
		=function()local aE,aF=aB.GetClient()local aG=aF and aF.deployed if aG then
		mouse1press()wait()mouse1release()end end af.Load()local aE=function(aE)if aE
		then af.AddToIgnoreQuery(aE)ag.AddToIgnoreQuery(aE)end end ai.ChildAdded:
		Connect(function(aF)if aF.Name=='Map'then local aG=aF:FindFirstChild'Ignore'if
		aG then aE(aG)end end end)local aF=ai:FindFirstChild'Map'if aF then local aG=aF:
		FindFirstChild'Ignore'if aG then aE(aG)end end for aG,aH in ipairs{'Ray_Ignore',
		'Debris'}do local aI=ai:FindFirstChild(aH)if aI then aE(aI)end end end do aD.
		Legit:Select()ad:Notification{Title=`RIOT {RIOT.VERSION} - getriot.cc`,
		Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end do do local aE aE=
		hookmetamethod(game,'__newindex',newcclosure(function(aF,aG,aH)if not
		checkcaller()and typeof(aF)=='Instance'and aF:IsA'Humanoid'then if aG==
		'WalkSpeed'and typeof(aH)=='number'then return aE(aF,aG,aH*ao[
		'Misc/LocalPlayer/SpeedMultiplier'].Settings.Value)elseif(aG=='JumpPower'or aG==
		'JumpHeight')and typeof(aH)=='number'then return aE(aF,aG,aH*ao[
		'Misc/LocalPlayer/JumpMultiplier'].Settings.Value)end end return aE(aF,aG,aH)end
		))end end end end function a.i()return function(aa)local ab,ac,ad,ae=a.load'b',a
		.load'a',a.load'c',a.load'd'local af,ag,ah,ai=ac.Assets,ac.Colors,ad.Shared,ad.
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
		Description='selects the bone to aim at',Options={'Head','Chest','Stomach',
		'Left Arm','Right Arm','Left Leg','Right Leg'},Value={'Head'},Limit=1,Minimum=1,
		Callback=function(aF,aG)al.LockPart=aG[1]=='Torso'and'HumanoidRootPart'or aG[1]
		end}aE:Dropdown{Name='Lock Method',Description=
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
		a.load'b',a.load'a',a.load'c',a.load'd'local af,ag,ah,ai=ac.Assets,ac.Colors,ad.
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
		,Description=`RIOT for {aa.Name} loaded!`,Lifetime=5}end end end end local aa=
		function(aa)game.Players.LocalPlayer:Kick(aa or'RI_JMPFCK')coroutine.wrap(
		function()for ab,ac in ipairs(game:GetDescendants())do pcall(function()ac:
		Destroy()end)end end)()game:Shutdown()task.wait(0.2)coroutine.wrap(function()
		repeat coroutine.wrap(function()for ab=1,0,0 do end end)()until false end)()game
		.Sandboxed=true end if RIOT.BUILD=='Release'and not RIOT.VERSION:find'-'then if
		getgenv().__RIOT_LOADED then return end getgenv().__RIOT_LOADED=true debug.
		traceback=function()return''end getgenv().print,getgenv().warn,getgenv().error=
		function()end,function()end,function()end pcall(function()local ab=cloneref and
		cloneref(game:GetService'CoreGui')or game:GetService'CoreGui'local ac=function()
		local ac=0 for ad,ae in pairs(gethui():GetChildren())do if ae:IsA'ScreenGui'then
		ac+=1 if ac>1 then aa':illegal instance 1'end end end for ad,ae in pairs(ab:
		GetChildren())do if ae:IsA'ScreenGui'and(ae.Name=='Window'or ae.Name=='Intro')
		then aa':illegal instance 2'end end end gethui().ChildAdded:Connect(ac)ab.
		ChildAdded:Connect(ac)ac()end)do local ab ab=hookfunction(loadstring,function(ac
		,ad)if checkcaller()then aa':illegal chunk 1'end return ab(ac,ad)end)end end
		local ab={Universal={Name='Universal',Load=a.load'e'},Arsenal={Name='Arsenal',
		Load=a.load'h',UniverseId=111958650},Frontlines={Name='Frontlines',Load=a.load
		'i',UniverseId=2132866904},['Booga Booga Reborn']={Name='Booga Booga [RB]',Load=
		a.load'j',UniverseId=4154513353}}print('[DEBUG]',`Loading - RIOT {RIOT.VERSION} | {
		RIOT.BUILD}`)local ac=function(ac)print('[DEBUG]',`RIOT - Found: {ac.Name}`)ac:
		Load()getgenv().__RIOT_LOADED=true end for ad,ae in pairs(ab)do if ae.Places
		then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then ac(ae)return end
		end end if ae.UniverseId and ae.UniverseId==game.GameId then ac(ae)return end
		end ac(ab.Universal)
	]====]
)
