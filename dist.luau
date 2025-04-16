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


local Push = function(File)
	local Actor = getactors()[1]
	if Actor then
		run_on_actor(Actor, File)
	else
		loadstring(File)()
	end
end

Push([================================================================================[ 
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
Settings.Callback then e.callback(i.Settings.Callback,W,Y)end return i end local
aa=function()local aa,ab=B.AbsolutePosition,B.AbsoluteSize local W,X=aa.X+ab.X,
aa.Y+(ab.Y*2)+D.AbsoluteSize.Y D.Position=UDim2.fromOffset(W,X)end aa()B:
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
af=aa'RunService',aa'Players',aa'Workspace',aa'UserInputService',aa'CoreGui'
local ag,ah=ac.LocalPlayer,ad.CurrentCamera local ai,aj,ak,al,am,an,ao,ap,aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ=ah.ViewportSize,math.floor
,math.round,math.sin,math.cos,table.clear,table.unpack,table.find,table.create,
CFrame.fromMatrix,ah.WorldToViewportPoint,ad.IsA,ad.GetPivot,ad.FindFirstChild,
ad.FindFirstChildOfClass,ad.GetChildren,CFrame.identity.PointToObjectSpace,
Color3.new().Lerp,Vector2.zero.Min,Vector2.zero.Max,Vector2.zero.Lerp,Vector3.
zero.Min,Vector3.zero.Max,Vector2.new(7,0),Vector2.new(0,1),Vector2.new(0,2),
Vector2.new(5,0),{Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1)
,Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1
),Vector3.new(1,-1,1)}local aK,aL=function(aK)local aL,aM for aN=1,#aK do local
aO=aK[aN]local aP,b=aO.CFrame,aO.Size aL=aD(aL or aP.Position,(aP-b*0.5).
Position)aM=aE(aM or aP.Position,(aP+b*0.5).Position)end local aN=(aL+aM)*0.5
local aO=Vector3.new(aN.X,aN.Y,aM.Z)return CFrame.new(aN,aO),aM-aL end,function(
aK)local aL,aM=as(ah,aK)return Vector2.new(aL.X,aL.Y),aM,aL.Z end local aM,aN,aO
,aP=function(aM,aN)local aO=aq(#aJ)for aP=1,#aJ do aO[aP]=aL((aM+aN*0.5*aJ[aP]).
Position)end local aP,b=aA(ai,ao(aO)),aB(Vector2.zero,ao(aO))return{corners=aO,
topLeft=Vector2.new(aj(aP.X),aj(aP.Y)),topRight=Vector2.new(aj(b.X),aj(aP.Y)),
bottomLeft=Vector2.new(aj(aP.X),aj(b.Y)),bottomRight=Vector2.new(aj(b.X),aj(b.Y)
)}end,function(aM,aN)local aO,aP,b,c=aM.X,aM.Y,am(aN),al(aN)return Vector2.new(
aO*b-aP*c,aO*c+aP*b)end,function(aM,aN,aO)if aN=='Team Color'or(aM.interface.
shared.useTeamColor and not aO)then return aM.interface.getTeamColor(aM.player)
or Color3.new(1,1,1)end return aN end,{}aP.__index=aP function aP.new(b,c)local
d=setmetatable({},aP)d.player=assert(b,'Missing argument #1 (Player expected)')d
.interface=assert(c,'Missing argument #2 (table expected)')d:Construct()return d
end function aP:_create(b,c)local d=Drawing.new(b)for e,f in next,c do pcall(
function()d[e]=f end)end self.bin[#self.bin+1]=d return d end function aP:
Construct()self.charCache={}self.childCount=0 self.bin={}self.drawings={box3d={{
self:_create('Line',{Thickness=1,Visible=false}),self:_create('Line',{Thickness=
1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false})},{self:
_create('Line',{Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,
Visible=false}),self:_create('Line',{Thickness=1,Visible=false})},{self:_create(
'Line',{Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=
false}),self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})}},visible={tracerOutline=self:
_create('Line',{Thickness=2,Visible=false}),tracer=self:_create('Line',{
Thickness=1,Visible=false}),boxFill=self:_create('Square',{Filled=true,Visible=
false}),boxOutline=self:_create('Square',{Thickness=2,Visible=false}),box=self:
_create('Square',{Thickness=1,Visible=false}),cornerBox={},healthBarOutline=self
:_create('Line',{Thickness=6,Visible=false}),healthBar=self:_create('Line',{
Thickness=4,Visible=false}),healthText=self:_create('Text',{Center=true,Visible=
false}),name=self:_create('Text',{Text=string.upper(self.player.DisplayName),
Center=true,Visible=false}),distance=self:_create('Text',{Center=true,Visible=
false}),weapon=self:_create('Text',{Center=true,Visible=false})},hidden={
arrowOutline=self:_create('Triangle',{Thickness=3,Visible=false}),arrow=self:
_create('Triangle',{Filled=true,Visible=false})}}for b=1,8 do table.insert(self.
drawings.visible.cornerBox,self:_create('Line',{Thickness=2,Visible=false}))end
self.renderConnection=ab.RenderStepped:Connect(function(b)self:Update(b)self:
Render(b)end)end function aP:Destruct()self.renderConnection:Disconnect()for b=1
,#self.bin do self.bin[b]:Remove()end an(self)end function aP:Update()local b=
self.interface self.options=b.team[b.isFriendly(self.player)and'friendly'or
'enemy']self.character=b.getCharacter(self.player)self.health,self.maxHealth=b.
getHealth(self.player)self.weapon=b.getWeapon(self.player)self.enabled=self.
options.enabled and self.character and not(#b.whitelist>0 and not ap(b.whitelist
,self.player.UserId))local c=self.enabled and av(self.character,'Head')if not c
then self.charCache={}self.onScreen=false return end local d,e,f=aL(c.Position)
self.onScreen=e self.distance=f if b.shared.limitDistance and f>b.shared.
maxDistance then self.onScreen=false end if self.onScreen then local g,h=self.
charCache,ax(self.character)if not g[1]or self.childCount~=#h then an(g)for i=1,
#h do local j=h[i]if at(j,'BasePart')and b.isBodyPart(j.Name)then g[#g+1]=j end
end self.childCount=#h end self.corners=aM(aK(g))elseif self.options.
offScreenArrow then local g=ah.CFrame local h=ar(g.Position,g.RightVector,
Vector3.yAxis)local i=ay(h,c.Position)self.direction=Vector2.new(i.X,i.Z).Unit
end end function aP:Render()local b,c,d,e,f,g,h,i=self.onScreen or false,self.
enabled or false,self.drawings.visible,self.drawings.hidden,self.drawings.box3d,
self.interface,self.options,self.corners d.box.Visible=c and b and h.box d.
boxOutline.Visible=d.box.Visible and h.boxOutline if d.box.Visible then local j=
d.box j.Position=i.topLeft j.Size=i.bottomRight-i.topLeft j.Color=aO(self,h.
boxColor[1])j.Transparency=h.boxColor[2]local m=d.boxOutline m.Position=j.
Position m.Size=j.Size m.Color=aO(self,h.boxOutlineColor[1],true)m.Transparency=
h.boxOutlineColor[2]end local j=c and b and h.cornerBox for m=1,8 do local p=d.
cornerBox[m]p.Visible=j end if j then local m,p=(i.topRight.X-i.topLeft.X)*0.2,(
i.bottomLeft.Y-i.topLeft.Y)*0.2 m=math.clamp(m,2,30)p=math.clamp(p,2,30)local q=
function(q,r,s,t)local u,v=d.cornerBox[q],d.cornerBox[q+1]local w=u.Thickness or
1 local x=(w-1)local y,z=x/2,s.Unit*(s.Magnitude+x)u.From=r-s.Unit*y u.To=r+z-s.
Unit*y u.Color=aO(self,h.cornerBoxColor[1])u.Transparency=h.cornerBoxColor[2]
local A=t.Unit*(t.Magnitude+x)v.From=r-t.Unit*y v.To=r+A-t.Unit*y v.Color=aO(
self,h.cornerBoxColor[1])v.Transparency=h.cornerBoxColor[2]end q(1,i.topLeft,
Vector2.new(m,0),Vector2.new(0,p))q(3,i.topRight,Vector2.new(-m,0),Vector2.new(0
,p))q(5,i.bottomRight,Vector2.new(-m,0),Vector2.new(0,-p))q(7,i.bottomLeft,
Vector2.new(m,0),Vector2.new(0,-p))end d.boxFill.Visible=c and b and h.boxFill
if d.boxFill.Visible then local m=d.boxFill m.Position=i.topLeft m.Size=i.
bottomRight-i.topLeft m.Color=aO(self,h.boxFillColor[1])m.Transparency=h.
boxFillColor[2]end d.healthBar.Visible=c and b and h.healthBar d.
healthBarOutline.Visible=d.healthBar.Visible and h.healthBarOutline if d.
healthBar.Visible then local m,p,q=i.topLeft-aF,i.bottomLeft-aF,d.healthBar q.To
=p q.From=aC(p,m,self.health/self.maxHealth)q.Color=az(h.dyingColor,h.
healthyColor,self.health/self.maxHealth)local r=d.healthBarOutline r.To=p+aG r.
From=m-aG r.Color=aO(self,h.healthBarOutlineColor[1],true)r.Transparency=h.
healthBarOutlineColor[2]end d.name.Visible=c and b and h.name if d.name.Visible
then local m=d.name m.Size=g.shared.textSize m.Font=g.shared.textFont m.Color=
aO(self,h.nameColor[1])m.Transparency=h.nameColor[2]m.Outline=h.nameOutline m.
OutlineColor=aO(self,h.nameOutlineColor,true)m.Position=(i.topLeft+i.topRight)*
0.5-Vector2.yAxis*m.TextBounds.Y-aH end local m=i and i.topRight.Y or 0 d.
distance.Visible=c and b and self.distance and h.distance if d.distance.Visible
then local p=d.distance p.Text=ak(self.distance*0.28)..'M'p.Size=g.shared.
textSize p.Font=g.shared.textFont p.Color=aO(self,h.distanceColor[1])p.
Transparency=h.distanceColor[2]p.Outline=h.distanceOutline p.OutlineColor=aO(
self,h.distanceOutlineColor,true)p.Position=Vector2.new(i.topRight.X+aI.X+p.
TextBounds.X*0.5,m-p.TextBounds.Y*0.5-aI.Y)m=m+p.TextBounds.Y+aI.Y end d.weapon.
Visible=c and b and h.weapon if d.weapon.Visible then local p=d.weapon p.Text=
self.weapon p.Size=g.shared.textSize p.Font=g.shared.textFont p.Color=aO(self,h.
weaponColor[1])p.Transparency=h.weaponColor[2]p.Outline=h.weaponOutline p.
OutlineColor=aO(self,h.weaponOutlineColor,true)p.Position=Vector2.new(i.topRight
.X+aI.X+p.TextBounds.X*0.5,m-p.TextBounds.Y*0.5)m=m+p.TextBounds.Y+aI.Y end d.
healthText.Visible=c and b and h.healthText if d.healthText.Visible then local p
=d.healthText p.Text=ak(self.health)..'HP'p.Size=g.shared.textSize p.Font=g.
shared.textFont p.Color=aO(self,h.healthTextColor[1])p.Transparency=h.
healthTextColor[2]p.Outline=h.healthTextOutline p.OutlineColor=aO(self,h.
healthTextOutlineColor,true)p.Position=Vector2.new(i.topRight.X+aI.X+p.
TextBounds.X*0.5,m-p.TextBounds.Y*0.5)end d.tracer.Visible=c and b and h.tracer
d.tracerOutline.Visible=d.tracer.Visible and h.tracerOutline if d.tracer.Visible
then local p=d.tracer p.Color=aO(self,h.tracerColor[1])p.Transparency=h.
tracerColor[2]p.To=(i.bottomLeft+i.bottomRight)*0.5 p.From=h.tracerOrigin==
'Middle'and ai*0.5 or h.tracerOrigin=='Top'and ai*Vector2.new(0.5,0)or h.
tracerOrigin=='Bottom'and ai*Vector2.new(0.5,1)or h.tracerOrigin=='Mouse'and ae:
GetMouseLocation()local q=d.tracerOutline q.Color=aO(self,h.tracerOutlineColor[1
],true)q.Transparency=h.tracerOutlineColor[2]q.To=p.To q.From=p.From end e.arrow
.Visible=c and(not b)and h.offScreenArrow e.arrowOutline.Visible=e.arrow.Visible
and h.offScreenArrowOutline if e.arrow.Visible and self.direction then local p=e
.arrow p.PointA=aA(aB(ai*0.5+self.direction*h.offScreenArrowRadius,Vector2.one*
25),ai-Vector2.one*25)p.PointB=p.PointA-aN(self.direction,0.45)*h.
offScreenArrowSize p.PointC=p.PointA-aN(self.direction,-0.45)*h.
offScreenArrowSize p.Color=aO(self,h.offScreenArrowColor[1])p.Transparency=h.
offScreenArrowColor[2]local q=e.arrowOutline q.PointA=p.PointA q.PointB=p.PointB
q.PointC=p.PointC q.Color=aO(self,h.offScreenArrowOutlineColor[1],true)q.
Transparency=h.offScreenArrowOutlineColor[2]end local p=c and b and h.box3d for
q=1,#f do local r=f[q]for s=1,#r do local t=r[s]t.Visible=p t.Color=aO(self,h.
box3dColor[1])t.Transparency=h.box3dColor[2]end if p then local s=r[1]s.From=i.
corners[q]s.To=i.corners[q==4 and 1 or q+1]local t=r[2]t.From=i.corners[q==4 and
1 or q+1]t.To=i.corners[q==4 and 5 or q+5]local u=r[3]u.From=i.corners[q==4 and
5 or q+5]u.To=i.corners[q==4 and 8 or q+4]end end end local b={}b.__index=b
function b.new(c,d)local e=setmetatable({},b)e.player=assert(c,
'Missing argument #1 (Player expected)')e.interface=assert(d,
'Missing argument #2 (table expected)')e:Construct()return e end function b:
Construct()self.highlight=Instance.new('Highlight',af)self.updateConnection=ab.
RenderStepped:Connect(function()self:Update()end)end function b:Destruct()self.
updateConnection:Disconnect()self.highlight:Destroy()an(self)end function b:
Update()local c,d=self.highlight,self.interface local e,f=d.getCharacter(self.
player),d.team[d.isFriendly(self.player)and'friendly'or'enemy']local g=f.enabled
and e and not(#d.whitelist>0 and not ap(d.whitelist,self.player.UserId))c.
Enabled=g and f.chams if c.Enabled then c.Adornee=e c.FillColor=aO(self,f.
chamsFillColor[1])c.FillTransparency=f.chamsFillColor[2]c.OutlineColor=aO(self,f
.chamsOutlineColor[1],true)c.OutlineTransparency=f.chamsOutlineColor[2]c.
DepthMode=f.chamsVisibleOnly and'Occluded'or'AlwaysOnTop'end end local c={}c.
__index=c function c.new(d,e)local f=setmetatable({},c)f.instance=assert(d,
'Missing argument #1 (Instance Expected)')f.options=assert(e,
'Missing argument #2 (table expected)')f:Construct()return f end function c:
Construct()local d=self.options d.enabled=d.enabled==nil and true or d.enabled d
.text=d.text or'{name}'d.textColor=d.textColor or{Color3.new(1,1,1),1}d.
textOutline=d.textOutline==nil and true or d.textOutline d.textOutlineColor=d.
textOutlineColor or Color3.new()d.textSize=d.textSize or 13 d.textFont=d.
textFont or 2 d.limitDistance=d.limitDistance or false d.maxDistance=d.
maxDistance or 150 self.text=Drawing.new'Text'self.text.Center=true self.
renderConnection=ab.Stepped:Connect(function(e)self:Render(e)end)end function c:
Destruct()self.renderConnection:Disconnect()self.text:Remove()end function c:
Render()local d=self.instance if not d or not d.Parent then return self:
Destruct()end local e,f=self.text,self.options if not f.enabled then e.Visible=
false return end local g=au(d).Position local h,i,j=aL(g)if f.limitDistance and
j>f.maxDistance then i=false end e.Visible=i if e.Visible then e.Position=h e.
Color=f.textColor[1]e.Transparency=f.textColor[2]e.Outline=f.textOutline e.
OutlineColor=f.textOutlineColor e.Size=f.textSize e.Font=f.textFont e.Text=f.
text:gsub('{name}',string.upper(d.Name)):gsub('{distance}',ak(j*0.28)..'M'):
gsub('{position}',string.upper(tostring(g)))end return nil end local d={
_hasLoaded=false,_objectCache={},whitelist={},shared={textSize=13,textFont=2,
limitDistance=false,maxDistance=150,useTeamColor=false,includeLocalPlayer=false}
,team={enemy={enabled=false,box=false,boxColor={Color3.new(1,0,0),1},boxOutline=
true,boxOutlineColor={Color3.new(),1},boxFill=false,boxFillColor={Color3.new(1,0
,0),0.5},cornerBox=false,cornerBoxColor={Color3.new(1,1,1),1},healthBar=false,
healthyColor=Color3.fromRGB(58,161,47),dyingColor=Color3.fromRGB(161,47,47),
healthBarOutline=true,healthBarOutlineColor={Color3.new(),0.5},healthText=false,
healthTextColor={Color3.new(1,1,1),1},healthTextOutline=true,
healthTextOutlineColor=Color3.new(),box3d=false,box3dColor={Color3.new(1,0,0),1}
,name=false,nameColor={Color3.new(1,1,1),1},nameOutline=true,nameOutlineColor=
Color3.new(),weapon=false,weaponColor={Color3.new(1,1,1),1},weaponOutline=true,
weaponOutlineColor=Color3.new(),distance=false,distanceColor={Color3.new(1,1,1),
1},distanceOutline=true,distanceOutlineColor=Color3.new(),tracer=false,
tracerOrigin='Bottom',tracerColor={Color3.new(1,0,0),1},tracerOutline=true,
tracerOutlineColor={Color3.new(),1},offScreenArrow=false,offScreenArrowColor={
Color3.new(1,1,1),1},offScreenArrowSize=15,offScreenArrowRadius=150,
offScreenArrowOutline=true,offScreenArrowOutlineColor={Color3.new(),1},chams=
false,chamsVisibleOnly=false,chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
chamsOutlineColor={Color3.new(1,0,0),0}},friendly={enabled=false,box=false,
boxColor={Color3.new(0,1,0),1},boxOutline=true,boxOutlineColor={Color3.new(),1},
boxFill=false,boxFillColor={Color3.new(0,1,0),0.5},cornerBox=false,
cornerBoxColor={Color3.new(1,1,1),1},healthBar=false,healthyColor=Color3.new(0,1
,0),dyingColor=Color3.new(1,0,0),healthBarOutline=true,healthBarOutlineColor={
Color3.new(),0.5},healthText=false,healthTextColor={Color3.new(1,1,1),1},
healthTextOutline=true,healthTextOutlineColor=Color3.new(),box3d=false,
box3dColor={Color3.new(0,1,0),1},name=false,nameColor={Color3.new(1,1,1),1},
nameOutline=true,nameOutlineColor=Color3.new(),weapon=false,weaponColor={Color3.
new(1,1,1),1},weaponOutline=true,weaponOutlineColor=Color3.new(),distance=false,
distanceColor={Color3.new(1,1,1),1},distanceOutline=true,distanceOutlineColor=
Color3.new(),tracer=false,tracerOrigin='Bottom',tracerColor={Color3.new(0,1,0),1
},tracerOutline=true,tracerOutlineColor={Color3.new(),1},offScreenArrow=false,
offScreenArrowColor={Color3.new(1,1,1),1},offScreenArrowSize=15,
offScreenArrowRadius=150,offScreenArrowOutline=true,offScreenArrowOutlineColor={
Color3.new(),1},chams=false,chamsVisibleOnly=false,chamsFillColor={Color3.new(
0.2,0.2,0.2),0.5},chamsOutlineColor={Color3.new(0,1,0),0}}}}function d.
AddInstance(e,f)local g=d._objectCache if g[e]then warn
'Instance handler already exists.'else g[e]={c.new(e,f)}end return g[e][1]end
function d.Load()assert(not d._hasLoaded,'Esp has already been loaded.')local e,
f,g=function(e)d._objectCache[e]={aP.new(e,d),b.new(e,d)}end,function(e)local f=
d._objectCache[e]if f then for g=1,#f do f[g]:Destruct()end d._objectCache[e]=
nil end end,ac:GetPlayers()for h=d.shared.includeLocalPlayer and 1 or 2,#g do e(
g[h])end d.playerAdded=ac.PlayerAdded:Connect(e)d.playerRemoving=ac.
PlayerRemoving:Connect(f)d._hasLoaded=true end function d.Unload()assert(d.
_hasLoaded,'Esp has not been loaded yet.')for e,f in next,d._objectCache do for
g=1,#f do f[g]:Destruct()end d._objectCache[e]=nil end d.playerAdded:Disconnect(
)d.playerRemoving:Disconnect()d._hasLoaded=false end function d.getWeapon(e)
local f='None'if e and e.Character then local g=e.Character:
FindFirstChildOfClass'Tool'if g then f=g.Name end end return string.upper(f)end
function d.isFriendly(e)return e.Team and e.Team==ag.Team end function d.
getTeamColor(e)return e.Team and e.Team.TeamColor and e.Team.TeamColor.Color end
function d.getCharacter(e)return e.Character end function d.isBodyPart(e)return
e=='Head'or e:find'Torso'or e:find'Leg'or e:find'Arm'end function d.getHealth(e)
local f=e and d.getCharacter(e)local g=f and aw(f,'Humanoid')if g then return g.
Health,g.MaxHealth end return 100,100 end return d end function a.d()local aa,ab
,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=game,workspace,Vector2.new,Vector3.zero,
CFrame.new,Color3.fromRGB,Drawing.new,TweenInfo.new,mousemoverel or(Input and
Input.MouseMove),table.find,table.remove,string.lower,string.sub,math.clamp
local ao=getrawmetatable and getrawmetatable(aa)or{__index=function(ao,ap)return
ao[ap]end,__newindex=function(ao,ap,aq)ao[ap]=aq end}local ap,aq=ao.__index,ao.
__newindex local ar=ap(aa,'GetService')local as,at,au,av=ar(aa,'RunService'),ar(
aa,'UserInputService'),ar(aa,'TweenService'),ar(aa,'Players')local aw,ax,ay,az,
aA=ap(av,'LocalPlayer'),ap(ab,'CurrentCamera'),ap(aa,'FindFirstChild'),ap(aa,
'FindFirstChildOfClass'),ap(aa,'GetDescendants')local aB,aC,aD,aE,aF,aG,aH,aI,aJ
,aK,aL,aM=ap(ax,'WorldToViewportPoint'),ap(ax,'GetPartsObscuringTarget'),ap(at,
'GetMouseLocation'),ap(av,'GetPlayers'),2000,false,{},ap(aa,'DescendantAdded').
Connect,{DeveloperSettings={UpdateMode='RenderStepped',TeamCheckOption='Team'},
Triggerbot={Enabled=false,TeamCheck=true,AliveCheck=true,WeaponCheck=true,Delay=
0,TargetChanged=function(aB)return end,Trigger=function()mouse1press()wait()
mouse1release()end},Aimbot={Enabled=false,LockMode=2,LockPart='Head',MaxDistance
=250,TeamCheck=true,AliveCheck=true,WallCheck=1,Sensitivity=0,Sensitivity2=1,
OffsetToMoveDirection=false,OffsetIncrement=15},FOVSettings={Enabled=false,
Visible=true,Radius=90,NumSides=60,Thickness=2,Transparency=0,Filled=false,Color
=af(255,150,150),OutlineColor=af(0,0,0),LockedColor=af(150,255,150)},Blacklisted
={},FOVCircleOutline=ag'Circle',FOVCircle=ag'Circle'}local aN,aO,aP=aJ,function(
aN)local aO for aP,b in next,aE(av)do local c=ap(b,'Name')if am(al(c),1,#aN)==
al(aN)then aO=c end end return aO end,function(aN)return ac(aN.X,aN.Y)end local
b=function()aN.Locked=nil local b=aN.FOVCircle b.Color=aN.FOVSettings.Color aq(
at,'MouseDeltaSensitivity',aL)if aK then aK:Cancel()end end function aN.Aimbot.
SetState(c)aG=c if not c then b()end end function aN.PlayerAlive(c)local d=ap(c,
'Character')local e=d and az(d,'Humanoid')return ap(e,'Health')<=0 end local c,d
=function()local c=aN.Aimbot local d=c.LockPart if not aN.Locked then aF=aN.
FOVSettings.Enabled and aN.FOVSettings.Radius or 2000 for e,f in next,aE(av)do
local g=ap(f,'Character')local h=g and az(g,'Humanoid')if f~=aw and not aj(aN.
Blacklisted,ap(f,'Name'))and g and ay(g,d)and h then local i,j=ap(g[d],
'Position'),aN.DeveloperSettings.TeamCheckOption if c.MaxDistance and(ax.CFrame.
Position-i).Magnitude>c.MaxDistance then continue end if c.TeamCheck and ap(f,j)
and ap(f,j)==ap(aw,j)then continue end if c.AliveCheck and aN.PlayerAlive(f)then
continue end if c.WallCheck==2 or c.WallCheck==3 then local m=aA(ap(aw,
'Character'))for p,q in next,aA(g)do m[#m+1]=q end if#aC(ax,{i},m)>0 then
continue end end local m,p,q=aB(ax,i)m=aP(m)q=(aD(at)-m).Magnitude if q<aF and p
then aF,aN.Locked=q,f end end end else local e=ap(aN.Locked,'Character')if e
then local f=ay(e,d)if not f then b()return end local g=ap(e[d],'Position')if c.
MaxDistance and(ax.CFrame.Position-g).Magnitude>c.MaxDistance then b()return end
local h,i=aB(ax,g)h=aP(h)local j=(aD(at)-h).Magnitude if c.WallCheck==3 then
local m=aA(ap(aw,'Character'))for p,q in next,aA(e)do m[#m+1]=q end if#aC(ax,{g}
,m)>0 then b()return end end if j>aF or not i then b()end else b()end end end,
function()local c=aN.Triggerbot if not c.Enabled then c.TargetChanged()return
end local d=ap(aw,'GetMouse')and aw:GetMouse()if not d then c.TargetChanged()
return end local e=ab.CurrentCamera local f,g,h=Ray.new(e.CFrame.Position,(d.Hit
.Position-e.CFrame.Position).Unit*1000),{aw.Character,e},RaycastParams.new()h.
FilterDescendantsInstances=g h.FilterType=Enum.RaycastFilterType.Blacklist local
i=ab:Raycast(f.Origin,f.Direction,h)if not i then c.TargetChanged()return end
local j=i.Instance local m=j:FindFirstAncestorOfClass'Model'if not m then c.
TargetChanged()return end local p,q={},false for r,s in pairs(m:GetChildren())do
if s.Name=='Head'or s.Name:find'Torso'or s.Name:find'Leg'or s.Name:find'Arm'then
table.insert(p,s)end end q=table.find(p,j)or j:IsDescendantOf(table.find(p,j))if
not q then c.TargetChanged()return end local r=av:GetPlayerFromCharacter(m)if
not r or r==aw then c.TargetChanged()return end local s=aN.DeveloperSettings.
TeamCheckOption if c.TeamCheck and ap(r,s)and ap(r,s)==ap(aw,s)then c.
TargetChanged()return end if c.AliveCheck and aN.PlayerAlive then c.
TargetChanged()end c.TargetChanged(r)task.wait(c.Delay)c.Trigger()end local e=
function()aL=ap(at,'MouseDeltaSensitivity')local e,f,g,h,i,j=aN.Aimbot,aN.
Triggerbot,aN.FOVCircle,aN.FOVCircleOutline,(aN.FOVSettings)aH.
RenderSteppedConnection=aI(ap(as,aN.DeveloperSettings.UpdateMode),function()
local m,p=e.OffsetToMoveDirection,e.LockPart if i.Enabled and e.Enabled then g.
Color=(aN.Locked and i.LockedColor)or i.Color h.Color=i.OutlineColor g.Thickness
=i.Thickness h.Thickness=i.Thickness+1 g.Position=aD(at)h.Position=aD(at)g.
NumSides=i.NumSides h.NumSides=i.NumSides g.Radius=i.Radius h.Radius=i.Radius g.
Transparency=1-i.Transparency h.Transparency=1-i.Transparency g.Visible=i.
Visible h.Visible=i.Visible else g.Visible=false h.Visible=false end if f.
Enabled then d()end if aG and e.Enabled then c()j=m and ap(az(ap(aN.Locked,
'Character'),'Humanoid'),'MoveDirection')*(an(e.OffsetIncrement,1,30)/10)or ad
if aN.Locked then local q=ap(ap(aN.Locked,'Character')[p],'Position')local r=aB(
ax,q+j)local s,t=(r.X-aD(at).X)/e.Sensitivity2,(r.Y-aD(at).Y)/e.Sensitivity2 if
aN.Aimbot.LockMode==2 then ai(s,t)else if e.Sensitivity>0 then aK=au:Create(ax,
ah(aN.Aimbot.Sensitivity,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{CFrame
=ae(ax.CFrame.Position,q+j)})aK:Play()else aq(ax,'CFrame',ae(ax.CFrame.Position,
q+j))end end end end end)end function aN.Exit(f)assert(f,
'Aimbot.Exit: Missing parameter #1 "self" <table>.')for g,h in next,aH do aM(aH[
g])end e=nil aP=nil b=nil c=nil aO=nil f.FOVCircle:Remove()f.FOVCircleOutline:
Remove()end function aN.Restart()for f,g in next,aH do aM(aH[f])end e()end
function aN.Blacklist(f,g)assert(f,
'Aimbot.Blacklist: Missing parameter #1 "self" <table>.')assert(g,
'Aimbot.Blacklist: Missing parameter #2 "Username" <string>.')g=aO(g)assert(f,
'Aimbot.Blacklist: User '..g.." couldn't be found.")f.Blacklisted[#f.Blacklisted
+1]=g end function aN.Whitelist(f,g)assert(f,
'Aimbot.Whitelist: Missing parameter #1 "self" <table>.')assert(g,
'Aimbot.Whitelist: Missing parameter #2 "Username" <string>.')g=aO(g)assert(g,
'Aimbot.Whitelist: User '..g.." couldn't be found.")local h=aj(f.Blacklisted,g)
assert(h,'Aimbot.Whitelist: User '..g..' is not blacklisted.')ak(f.Blacklisted,h
)end aN.Load=e setmetatable(aN,{__call=e})return aN end function a.e()return
function(aa)local ab,ac,ad=a.load'a',a.load'c',a.load'd'local ae,af,ag,ah=ab.
Assets,ab.Colors,ac.shared,ac.team local ai,aj,ak,al,am,an=ah.enemy,ah.friendly,
ad.Aimbot,ad.Triggerbot,ad.FOVSettings,ab:Window{Title=aa.Name,Keybind=Enum.
KeyCode.RightControl}local ao={Legit=an:Tab{Name='Legit',Image=ae.ShieldCheck},
Visuals=an:Tab{Name='Visuals',Image=ae.Bolt},Cfg=an:Tab{Name='Cfg',Image=ae.
Archive}}do local ap=ao.Legit do local aq=ap:Section{Name='Aimbot'}do local ar=
aq:Section{Name='Aimbot Settings'}ar:Toggle{Name='Enabled',Description=
'enables aimbot',State=false,Callback=function(as,at)ak.Enabled=at end}:
Continue()ar:Keybind{Bind=Enum.UserInputType.MouseButton2,Blacklist={Enum.
UserInputType.MouseButton1},onHeld=function(as,at,au)if au then return end ak.
SetState(at)end}ar:Dropdown{Name='Wall Check',Description=
'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
'Always On'},Limit=1,Minimum=1,Callback=function(as,at)ak.WallCheck=({Off=1,
Sticky=2,['Always On']=3})[at[1] ]end}ar:Toggle{Name='Team Check',Description=
'whether to ignore friendlys',State=true,Callback=function(as,at)ak.TeamCheck=at
end}ar:Toggle{Name='Alive Check',Description='whether to ignore corpses',State=
true,Callback=function(as,at)ak.AliveCheck=at end}:Continue()ar:Slider{Name=
'Smoothing',Description='aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=
0.1,Precision=1,Callback=function(as,at)ak.Sensitivity=(at-1)/(as.Settings.
Maximum-1)*0.15 ak.Sensitivity2=at end}ar:Dropdown{Name='Bone',Description=
'selects the bone to aim at',Options={'Head','Torso'},Value={'Head'},Limit=1,
Minimum=1,Callback=function(as,at)local au=at[1]=='Torso'and'HumanoidRootPart'or
at[1]ak.LockPart=au end}ar:Dropdown{Name='Lock Method',Description=
'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
'Camera'},Limit=1,Minimum=1,Callback=function(as,at)ak.LockMode=({Camera=1,Mouse
=2})[at[1] ]end}ar:Slider{Name='Max Distance',Description=
'the distance aimbot stops locking onto players',Value=500,Minimum=1,Maximum=
2000,Step=1,Precision=0,Callback=function(as,at)ak.MaxDistance=at end}:Continue(
)end do local ar=aq:Section{Name='FOV Settings'}ar:Toggle{Name='Enabled',
Description='whether the aimbot radius limit is active',State=true,Callback=
function(as,at)am.Enabled=at end}ar:Toggle{Name='Visible',Description=
'draws a circle representing the aimbot FOV radius',State=true,Callback=function
(as,at)am.Visible=at end}:Continue():Colorpicker{Description='Unlocked Color',
AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
function(as)am.Color=as end}:Continue():Colorpicker{Description='Locked Color',
AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},SuggestionColors={{
Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
function(as)am.LockedColor=as end}ar:Slider{Name='Radius',Description=
'aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,Precision=0,
Callback=function(as,at)am.Radius=at end}ar:Slider{Name='Circle Sides',
Description='the amount of points the drawn circle has',Value=45,Minimum=3,
Maximum=80,Step=1,Precision=0,Callback=function(as,at)am.NumSides=at end}:
Continue()end end do local aq=ap:Section{Name='Triggerbot'}aq:Toggle{Name=
'Enabled',Description='enables triggerbot',State=false,Callback=function(ar,as)
al.Enabled=as end}aq:Slider{Name='Reaction Time',Description=
'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
Maximum=500,Step=1,Precision=0,Callback=function(ar,as)al.Delay=as/1000 end}aq:
Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
Callback=function(ar,as)al.TeamCheck=as end}aq:Toggle{Name='Alive Check',
Description='whether to ignore corpses',State=true,Callback=function(ar,as)ak.
AliveCheck=as end}:Continue()end end do local ap=ao.Visuals do local aq=ap:
Section{Name='ESP'}aq:Slider{Name='Text Font',Description=
'the font ESP text uses',Value=3,Minimum=0,Maximum=3,Step=1,Precision=0,Callback
=function(ar,as)ag.textFont=as end}aq:Slider{Name='Text Size',Description=
'the size of ESP text',Value=13,Minimum=1,Maximum=20,Step=1,Precision=0,Callback
=function(ar,as)ag.textSize=as end}aq:Toggle{Name='Use Team Color',Description=
'enables ESP team color',State=false,Callback=function(ar,as)ag.useTeamColor=as
end}aq:Toggle{Name='Limit Enabled',Description='enables distance limit',State=
false,Callback=function(ar,as)ag.limitDistance=as end}:Continue()aq:Slider{Name=
'Max Distance',Description='the maximum distance that ESP will render at',Value=
500,Minimum=1,Maximum=2000,Step=1,Precision=0,Callback=function(ar,as)ag.
maxDistance=as end}:Continue()local ar=function(ar)an:VisualPreview{HealthBar={
Visible=ar.healthBar,Color={ar.healthyColor}},Name={Visible=ar.name,Color={ar.
nameColor[1],ar.nameColor[2]}},Distance={Visible=ar.distance,Color={ar.
distanceColor[1],ar.distanceColor[2]}},Health={Visible=ar.healthText,Color={ar.
healthTextColor[1],ar.healthTextColor[2]}},Weapon={Visible=ar.weapon,Color={ar.
weaponColor[1],ar.weaponColor[2]}},BoundingBox={Visible=ar.box,Color={ar.
boxColor[1],ar.boxColor[2]}},CornerBox={Visible=ar.cornerBox,Color={ar.
cornerBoxColor[1],ar.cornerBoxColor[2]}},FillBox={Visible=ar.boxFill,Color={ar.
boxFillColor[1],ar.boxFillColor[2]}}}end local as,at=function(as,at)at:Toggle{
Name='Enabled',Description='enables ESP',State=false,Callback=function(au,av)as.
enabled=av end}at:Toggle{Name='Bounding Box',Description=
'enables bounding box ESP',State=false,Callback=function(au,av)as.box=av ar(as)
end}:Continue():Colorpicker{Color={Color3.fromRGB(77,92,143),0.5},
SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(au,av)as.boxColor[1],as.boxColor[2]=au,1-av as.
boxOutlineColor[2]=1-av ar(as)end}at:Toggle{Name='Box Fill',Description=
'enables box fill ESP',State=false,Callback=function(au,av)as.boxFill=av ar(as)
end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),0.8},SuggestionColors={
{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,
246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
function(au,av)as.boxFillColor[1],as.boxFillColor[2]=au,1-av ar(as)end}at:Toggle
{Name='Corner Box',Description='enables corner box ESP',State=false,Callback=
function(au,av)as.cornerBox=av ar(as)end}:Continue():Colorpicker{Color={Color3.
fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.cornerBoxColor[1],as.
cornerBoxColor[2]=au,1-av ar(as)end}at:Toggle{Name='3D Bounding Box',Description
='enables 3d bounding box ESP',State=false,Callback=function(au,av)as.box3d=av
ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(141,149,192),0},
SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(au,av)as.box3dColor[1],as.box3dColor[2]=au,1-av ar(
as)end}at:Toggle{Name='Chams',Description='enables player chams ESP',State=false
,Callback=function(au,av)as.chams=av end}:Continue():Colorpicker{Description=
'Fill Color',Color={Color3.fromRGB(100,120,250),0.8},SuggestionColors={{Color3.
fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au
,av)as.chamsFillColor[1],as.chamsFillColor[2]=au,av ar(as)end}:Continue():
Colorpicker{Description='Outline Color',Color={Color3.fromRGB(25,85,255),0.5},
SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(au,av)as.chamsOutlineColor[1],as.chamsOutlineColor[
2]=au,av ar(as)end}at:Toggle{Name='Tracers',Description='enables tracers ESP',
State=false,Callback=function(au,av)as.tracer=av end}:Continue():Colorpicker{
Color={Color3.fromRGB(123,124,243),0},SuggestionColors={{Color3.fromRGB(171,81,
83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.
tracerColor[1],as.tracerColor[2]=au,1-av as.tracerOutlineColor[2]=1-av ar(as)end
}at:Dropdown{Name='Tracers Origin',Description=
'selects the starting port of tracers',Options={'Top','Middle','Bottom','Mouse'}
,Value={'Top'},Limit=1,Minimum=1,Callback=function(au,av)as.tracerOrigin=av[1]
end}at:Toggle{Name='Health Bar',Description='enables health bar ESP',State=false
,Callback=function(au,av)as.healthBar=av ar(as)end}:Continue():Colorpicker{
Description='Healthy Color',AlphaEnabled=false,Color={Color3.fromRGB(58,161,47),
0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(au)as.healthyColor=au ar(as)end}:Continue():
Colorpicker{Description='Dying Color',AlphaEnabled=false,Color={Color3.fromRGB(
161,47,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,
124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
fromRGB(49,220,195)}},Callback=function(au)as.dyingColor=au ar(as)end}at:Toggle{
Name='Off Screen Arrows',Description='enables off screen arrow ESP',State=false,
Callback=function(au,av)as.offScreenArrow=av end}:Continue():Colorpicker{Color={
Color3.fromRGB(255,255,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{
Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.
offScreenArrowColor[1],as.offScreenArrowColor[2]=au,1-av as.
offScreenArrowOutlineColor[2]=1-av ar(as)end}:Continue()at:Slider{Name=
'Arrow Size',Description='changes the size of the individual off screen arrows',
Value=15,Minimum=1,Maximum=50,Step=1,Precision=0,Callback=function(au,av)ag.
offScreenArrowSize=av end}:Continue()at:Slider{Name='Radius',Description=
'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
Step=1,Precision=0,Callback=function(au,av)ag.offScreenArrowRadius=av end}at:
Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
function(au,av)as.name=av ar(as)end}:Continue():Colorpicker{Color={Color3.
fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.nameColor[1],as.
nameColor[2]=au,1-av ar(as)end}at:Toggle{Name='Distance',Description=
'enables distance text ESP',State=false,Callback=function(au,av)as.distance=av
ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(au,av)as.distanceColor[1],as.distanceColor[2]=au,1-
av ar(as)end}at:Toggle{Name='Weapon',Description='enables weapon text ESP',State
=false,Callback=function(au,av)as.weapon=av ar(as)end}:Continue():Colorpicker{
Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.fromRGB(171,81,
83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(au,av)as.
weaponColor[1],as.weaponColor[2]=au,1-av ar(as)end}at:Toggle{Name='Health',
Description='enables health text ESP',State=false,Callback=function(au,av)as.
healthText=av ar(as)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,173,
182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
fromRGB(49,220,195)}},Callback=function(au,av)as.healthTextColor[1],as.
healthTextColor[2]=au,1-av ar(as)end}:Continue()end,aq:Section{Name='Enemies'}
as(ai,at)local au=aq:Section{Name='Friendlies'}as(aj,au)end end do local ap=ao.
Cfg ap:Toggle{Name='Visual preview',Description=
'enables a visual preview of your esp',State=true,Callback=function(aq,ar)an:
VisualPreview{Visible=ar}end}:Continue()ap:Keybind{Bind=an.Settings.Keybind,
Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
onChanged=function(aq,ar)an:UpdateSettings{Keybind=ar}end}:Continue()ap:Button{
Color=af.SystemDarkRed,Name='Unload Menu',Callback=function(aq)ab:Unload()end}:
Continue()end ac.Load()ad.Load()ao.Legit:Select()ab:Notification{Title=`RIOT V2 - {
aa.Name} | getriot.cc`,Description=`RIOT V2 Loaded!`,Lifetime=5}end end function
a.f()return function(aa)local ab,ac=game:GetService'ReplicatedFirst':
WaitForChild'NewLoader',game:GetService'ReplicatedStorage':WaitForChild
'Functions':WaitForChild'Ping'do local ad ad=hookfunction(getrenv().task.spawn,
newcclosure(function(ae,...)local af={...}if af[1]==ac and debug.info(ae,'n')==
'InvokeServer'then return task.wait(9e9)end return ad(ae,...)end))end do local
ad ad=hookmetamethod(game,'__namecall',newcclosure(function(ae,af,...)if ae.
Parent==nil and not checkcaller()and getnamecallmethod()=='Fire'and typeof(af)==
'table'then local ag,ah=next(af)if typeof(ag)=='userdata'then hookmetamethod(
game,'__namecall',ad)return task.wait(9e9)end end return ad(ae,af,...)end))end
do local ad ad=hookmetamethod(game,'__namecall',newcclosure(function(ae,af,...)
if ae==game and not checkcaller()and getnamecallmethod()=='FindService'and af==
'VirtualUser'then hookmetamethod(game,'__namecall',ad)return task.wait(9e9)end
return ad(ae,af,...)end))end do local ad ad=hookmetamethod(game,'__newindex',
newcclosure(function(ae,af,ag)if ae==ab and not checkcaller()then return task.
wait(9e9)end return ad(ae,af,ag)end))end end end function a.g()local aa,ab,ac,ad
,ae,af=game,workspace,Vector2.new,Color3.fromRGB,Drawing.new,table.find local ag
=getrawmetatable and getrawmetatable(aa)or{__index=function(ag,ah)return ag[ah]
end,__newindex=function(ag,ah,ai)ag[ah]=ai end}local ah=ag.__index local ai=ah(
aa,'GetService')local aj,ak,al=ai(aa,'RunService'),ai(aa,'UserInputService'),ai(
aa,'Players')local am,an,ao,ap,aq=ah(al,'LocalPlayer'),ah(ab,'CurrentCamera'),
ah(aa,'FindFirstChild'),ah(aa,'FindFirstChildOfClass'),ah(aa,'GetDescendants')
local ar,as,at,au,av,aw=ah(an,'WorldToViewportPoint'),ah(an,
'GetPartsObscuringTarget'),ah(ak,'GetMouseLocation'),ah(al,'GetPlayers'),false,{
DeveloperSettings={UpdateMode='RenderStepped',TeamCheckOption='Team'},SilentAim=
{Locked=nil,Enabled=true,LockPart='Head',RandomLockPart=false,HitChance=100,
MaxDistance=250,WallCheck=true,TeamCheck=true,AliveCheck=true,FOVSettings={
Enabled=true,Visible=true,Radius=90,NumSides=60,Thickness=2,Filled=false,Color={
ad(255,150,150),0},OutlineColor={ad(0,0,0),0}},SnaplineSettings={Enabled=true,
Thickness=2,Color={ad(255,0,0),0},OutlineColor={ad(0,0,0),0}}},Blacklisted={},
FOVCircleOutline=ae'Circle',FOVCircle=ae'Circle',SnaplineOutline=ae'Line',
Snapline=ae'Line'}function aw.SilentAim.SetState(ax)av=ax end local ax=function(
ax)return ac(ax.X,ax.Y)end local ay,az,aA,aB=function()local ay=aw.SilentAim
local az=ay.RandomLockPart and({'Head','HumanoidRootPart'})[math.random(1,2)]or
ay.LockPart if not ay.Locked then local aA=ay.FOVSettings.Enabled and ay.
FOVSettings.Radius or 2000 for aB,aC in next,au(al)do local aD=ah(aC,'Character'
)local aE=aD and ap(aD,'Humanoid')if aC~=am and not af(aw.Blacklisted,ah(aC,
'Name'))and aD and ao(aD,az)and aE then local aF=ah(aD[az],'Position')if ay.
MaxDistance and(an.CFrame.Position-aF).Magnitude>ay.MaxDistance then continue
end if ay.TeamCheck and ah(aC,aw.DeveloperSettings.TeamCheckOption)and ah(aC,aw.
DeveloperSettings.TeamCheckOption)==ah(am,aw.DeveloperSettings.TeamCheckOption)
then continue end if ay.AliveCheck and ah(aE,'Health')<=0 then continue end if
ay.WallCheck then local aG=aq(ah(am,'Character'))for aH,aI in next,aq(aD)do aG[#
aG+1]=aI end if#as(an,{aF},aG)>0 then continue end end local aG,aH=ar(an,aF)aG=
ax(aG)local aI=(at(ak)-aG).Magnitude if aI<aA and aH then aA,aw.Locked=aI,aC if
ay.LockContinueTrigger then task.spawn(ay.LockContinueTrigger,aC)end return aD[
az]end end end else local aA,aB=ah(aw.Locked,'Character'),ay.FOVSettings.Enabled
and ay.FOVSettings.Radius or 2000 if aA then local aC=ao(aA,az)if not aC then ay
.Locked=nil return nil end local aD=ah(aC,'Position')if ay.MaxDistance and(an.
CFrame.Position-aD).Magnitude>ay.MaxDistance then ay.Locked=nil return nil end
if ay.WallCheck then local aE=aq(ah(am,'Character'))for aF,aG in next,aq(aA)do
aE[#aE+1]=aG end if#as(an,{aD},aE)>0 then ay.Locked=nil return nil end end local
aE,aF=ar(an,aD)aE=ax(aE)local aG=(at(ak)-aE).Magnitude if aG>aB or not aF then
ay.Locked=nil return nil end if ay.LockContinueTrigger then task.spawn(ay.
LockContinueTrigger,Value)end return aC else ay.Locked=nil return nil end end
return nil end,function()if aw.SilentAim.Enabled and aw.SilentAim.FOVSettings.
Enabled then aw.FOVCircle.Color=aw.SilentAim.FOVSettings.Color[1]aw.
FOVCircleOutline.Color=aw.SilentAim.FOVSettings.OutlineColor[1]aw.FOVCircle.
Transparency=aw.SilentAim.FOVSettings.Color[2]aw.FOVCircleOutline.Transparency=
aw.SilentAim.FOVSettings.OutlineColor[2]aw.FOVCircle.Thickness=aw.SilentAim.
FOVSettings.Thickness aw.FOVCircleOutline.Thickness=aw.SilentAim.FOVSettings.
Thickness+2 aw.FOVCircle.Position=at(ak)aw.FOVCircleOutline.Position=at(ak)aw.
FOVCircle.NumSides=aw.SilentAim.FOVSettings.NumSides aw.FOVCircleOutline.
NumSides=aw.SilentAim.FOVSettings.NumSides aw.FOVCircle.Radius=aw.SilentAim.
FOVSettings.Radius aw.FOVCircleOutline.Radius=aw.SilentAim.FOVSettings.Radius aw
.FOVCircle.Visible=aw.SilentAim.FOVSettings.Visible aw.FOVCircleOutline.Visible=
aw.SilentAim.FOVSettings.Visible else aw.FOVCircle.Visible=false aw.
FOVCircleOutline.Visible=false end end,function(ay)if av and aw.SilentAim.
Enabled and aw.SilentAim.SnaplineSettings.Enabled and ay then local az=at(ak)aw.
SnaplineOutline.From=az aw.SnaplineOutline.To=ay aw.SnaplineOutline.Color=aw.
SilentAim.SnaplineSettings.OutlineColor[1]aw.SnaplineOutline.Transparency=aw.
SilentAim.SnaplineSettings.OutlineColor[2]aw.SnaplineOutline.Thickness=aw.
SilentAim.SnaplineSettings.Thickness+2 aw.SnaplineOutline.Visible=true aw.
Snapline.From=az aw.Snapline.To=ay aw.Snapline.Color=aw.SilentAim.
SnaplineSettings.Color[1]aw.Snapline.Transparency=aw.SilentAim.SnaplineSettings.
Color[2]aw.Snapline.Thickness=aw.SilentAim.SnaplineSettings.Thickness aw.
Snapline.Visible=true else aw.Snapline.Visible=false aw.SnaplineOutline.Visible=
false end end aj.RenderStepped:Connect(function()az()aB=nil if av and aw.
SilentAim.Enabled then aB=ay()local aC if aB and aw.SilentAim.SnaplineSettings.
Enabled then local aD,aE=ar(an,aB.Position)if aE then aC=ac(aD.X,aD.Y)end end
aA(aC)end end)local aC aC=hookmetamethod(aa,'__index',newcclosure(function(aD,aE
)if av and aw.SilentAim.Enabled and aD==an and aE=='CoordinateFrame'and string.
match(debug.info(3,'s'),'Client.Functions.Weapons')and debug.info(debug.info(3,
'f'),'n')~='RotCamera'then if math.random(1,100)<=aw.SilentAim.HitChance and aB
then return CFrame.new(an.CFrame.Position,aB.Position)end end return aC(aD,aE)
end))return aw end function a.h()return function(aa)local ab,ac,ad,ae,af,ag=a.
load'f',a.load'b',a.load'a',a.load'c',a.load'd',a.load'g'local ah,ai,aj,ak,al=ad
.Components,ad.Assets,ad.Colors,ae.shared,ae.team local am,an,ao,ap,aq,ar=al.
enemy,al.friendly,af.Aimbot,af.Triggerbot,af.FOVSettings,ag.SilentAim local as,
at,au,av=ar.FOVSettings,ar.SnaplineSettings,ac.GetPlayer(),ac.SecureService
local aw,ax,ay,az,aA=av'RunService',av'Workspace',av'Players',av
'ReplicatedStorage',ad:Window{Title=aa.Name,Keybind=Enum.KeyCode.RightControl}
local aB={Legit=aA:Tab{Name='Legit',Image=ai.ShieldCheck},Rage=aA:Tab{Name=
'Rage',Image=ai.Shield},Visuals=aA:Tab{Name='Visuals',Image=ai.Bolt},Misc=aA:Tab
{Name='Misc',Image=ai.Folder},Cfg=aA:Tab{Name='Cfg',Image=ai.Archive}}do local
aC=aB.Legit do local aD=aC:Section{Name='Aimbot'}do local aE=aD:Section{Name=
'Aimbot Settings'}aE:Toggle{Name='Enabled',Description='enables aimbot',State=
false,Callback=function(aF,aG)ao.Enabled=aG end}:Continue()aE:Keybind{Bind=Enum.
UserInputType.MouseButton2,Blacklist={Enum.UserInputType.MouseButton1},onHeld=
function(aF,aG,aH)if aH then return end ao.SetState(aG)end}aE:Dropdown{Name=
'Wall Check',Description='the method used by wall check',Options={'Off','Sticky'
,'Always On'},Value={'Always On'},Limit=1,Minimum=1,Callback=function(aF,aG)ao.
WallCheck=({Off=1,Sticky=2,['Always On']=3})[aG[1] ]end}aE:Toggle{Name=
'Team Check',Description='whether to ignore friendlys',State=true,Callback=
function(aF,aG)ao.TeamCheck=aG end}aE:Toggle{Name='Alive Check',Description=
'whether to ignore corpses',State=true,Callback=function(aF,aG)ao.AliveCheck=aG
end}:Continue()aE:Slider{Name='Smoothing',Description='aimbot smoothness',Value=
1,Minimum=1,Maximum=20,Step=0.1,Precision=1,Callback=function(aF,aG)ao.
Sensitivity=(aG-1)/(aF.Settings.Maximum-1)*0.15 ao.Sensitivity2=aG end}aE:
Dropdown{Name='Bone',Description='selects the bone to aim at',Options={'Head',
'Torso'},Value={'Head'},Limit=1,Minimum=1,Callback=function(aF,aG)local aH=aG[1]
=='Torso'and'HumanoidRootPart'or aG[1]ao.LockPart=aH end}aE:Dropdown{Name=
'Lock Method',Description='the input used to lock onto a player',Options={
'Camera','Mouse'},Value={'Camera'},Limit=1,Minimum=1,Callback=function(aF,aG)ao.
LockMode=({Camera=1,Mouse=2})[aG[1] ]end}aE:Slider{Name='Max Distance',
Description='the distance aimbot stops locking onto players',Value=500,Minimum=1
,Maximum=2000,Step=1,Precision=0,Callback=function(aF,aG)ao.MaxDistance=aG end}:
Continue()end do local aE=aD:Section{Name='FOV Settings'}aE:Toggle{Name=
'Enabled',Description='whether the aimbot radius limit is active',State=true,
Callback=function(aF,aG)aq.Enabled=aG end}aE:Toggle{Name='Visible',Description=
'draws a circle representing the aimbot FOV radius',State=true,Callback=function
(aF,aG)aq.Visible=aG end}:Continue():Colorpicker{Description='Unlocked Color',
AlphaEnabled=false,Color={Color3.fromRGB(255,150,150),0},SuggestionColors={{
Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
function(aF)aq.Color=aF end}:Continue():Colorpicker{Description='Locked Color',
AlphaEnabled=false,Color={Color3.fromRGB(150,255,150),0},SuggestionColors={{
Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246
,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=
function(aF)aq.LockedColor=aF end}aE:Slider{Name='Radius',Description=
'aimbot FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,Precision=0,
Callback=function(aF,aG)aq.Radius=aG end}aE:Slider{Name='Circle Sides',
Description='the amount of points the drawn circle has',Value=45,Minimum=3,
Maximum=80,Step=1,Precision=0,Callback=function(aF,aG)aq.NumSides=aG end}:
Continue()end end do local aD=aC:Section{Name='Triggerbot'}aD:Toggle{Name=
'Enabled',Description='enables triggerbot',State=false,Callback=function(aE,aF)
ap.Enabled=aF end}aD:Slider{Name='Reaction Time',Description=
'the time it takes for triggerbot to react to targets (ms)',Value=0,Minimum=0,
Maximum=500,Step=1,Precision=0,Callback=function(aE,aF)ap.Delay=aF/1000 end}aD:
Toggle{Name='Team Check',Description='whether to ignore friendlys',State=true,
Callback=function(aE,aF)ap.TeamCheck=aF end}aD:Toggle{Name='Alive Check',
Description='whether to ignore corpses',State=true,Callback=function(aE,aF)ao.
AliveCheck=aF end}:Continue()end end do local aC=aB.Rage do local aD=aC:Section{
Name='Silent Aim'}do local aE=aD:Section{Name='Silent Aim Settings'}aE:Toggle{
Name='Enabled',Description='enables silent aim',State=false,Callback=function(aF
,aG)ar.Enabled=aG ar.SetState(aG)end}aE:Toggle{Name='Trigger In Bounds',
Description=
[[fires your gun while a target is within bounds
Functions similar to triggerbot.]]
,State=false,Callback=function(aF,aG)ar.LockContinueTrigger=function()if aG then
ap:Trigger()end end end}aE:Toggle{Name='Wall Check',Description=
'enables wall check',State=true,Callback=function(aF,aG)ar.WallCheck=aG end}aE:
Toggle{Name='Team Check',Description='enables team check',State=true,Callback=
function(aF,aG)ar.TeamCheck=aG end}aE:Toggle{Name='Alive Check',Description=
'enables alive check',State=true,Callback=function(aF,aG)ar.AliveCheck=aG end}aE
:Dropdown{Name='Bone',Description='selects the bone bullets redirect to',Options
={'Head','Torso','Random'},Value={'Head'},Limit=1,Minimum=1,Callback=function(aF
,aG)if aG[1]=='Random'then ar.RandomLockPart=true return end ar.RandomLockPart=
false local aH=aG[1]=='Torso'and'HumanoidRootPart'or aG[1]ar.LockPart=aH end}aE:
Slider{Name='Hit Chance',Description=
'the chance bullets will hit when shot with silent aim',Value=100,Minimum=0,
Maximum=100,Step=1,Precision=0,Filter=function(aF)return tostring(aF)..'%'end,
Callback=function(aF,aG)ar.HitChance=aG end}aE:Slider{Name='Max Distance',
Description='the distance silent aim stops redirecting bullets',Value=500,
Minimum=1,Maximum=2000,Step=1,Precision=0,Callback=function(aF,aG)ar.MaxDistance
=aG end}:Continue()end do local aE=aD:Section{Name='FOV Settings'}aE:Toggle{Name
='Enabled',Description='whether the silent aim radius limit is active',State=
true,Callback=function(aF,aG)as.Enabled=aG end}aE:Toggle{Name='Visible',
Description='draws a circle representing the silent aim FOV radius',State=true,
Callback=function(aF,aG)as.Visible=aG end}:Continue():Colorpicker{Color={Color3.
fromRGB(100,50,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(aF,aG)as.Color[1],as.Color[2]=
aF,1-aG as.OutlineColor[2]=1-aG end}aE:Slider{Name='Radius',Description=
'silent aim FOV limit radius',Value=120,Minimum=1,Maximum=500,Step=1,Precision=0
,Callback=function(aF,aG)as.Radius=aG end}aE:Slider{Name='Circle Sides',
Description='the amount of points the drawn circle has',Value=45,Minimum=3,
Maximum=80,Step=1,Precision=0,Callback=function(aF,aG)as.NumSides=aG end}:
Continue()end do local aE=aD:Section{Name='Snaplines Settings'}aE:Toggle{Name=
'Enabled',Description='whether snapping point lines are enabled',State=true,
Callback=function(aF,aG)at.Enabled=aG end}:Continue():Colorpicker{Color={Color3.
fromRGB(200,230,255),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(aF,aG)at.Color[1],at.Color[2]=
aF,1-aG at.OutlineColor[2]=1-aG end}aE:Slider{Name='Thickness',Description=
'how thick the snapping point line is',Value=2,Minimum=1,Maximum=6,Step=1,
Precision=0,Callback=function(aF,aG)at.Thickness=aG end}:Continue()end end do
local aD,aE,aF=aC:Section{Name='Gun Modifications'},{},{}local aG,aH=function(aG
,aH,aI)local aJ,aK=game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.
Weapons,az:FindFirstChild'Weapons'if aI then if aJ and getsenv(aJ)[aG]then aF[aG
]=getsenv(aJ)[aG]getsenv(aJ)[aG]=aH end else if aK then for aL,aM in pairs(aK:
GetDescendants())do if aM.Name==aG and aM.Parent.Parent==aK and aM:IsA
'ValueBase'then if aE[aM]==nil then aE[aM]=aM.Value end if typeof(aH)==
'function'then aM.Value=aH(typeof(aM.Value),aE[aM])else aM.Value=aH end end end
end end end,function(aG,aH)local aI,aJ=game.Players.LocalPlayer.PlayerGui.GUI.
Client.Functions.Weapons,az:FindFirstChild'Weapons'if aH then if aI and aF[aG]
then getsenv(aI)[aG]=aF[aG]end else if aJ then for aK,aL in pairs(aJ:
GetDescendants())do if aL.Name==aG and aE[aL]~=nil then aL.Value=aE[aL]aE[aL]=
nil end end end end end aD:Slider{Name='Bullet Multiplier',Description=
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
Callback=function(aI,aJ)local aK=az:FindFirstChild'wkspc'local aL=aK and aK:
FindFirstChild'CurrentCurse'if aL and aL.Value and aJ then aL.Value=
'Infinite Ammo'elseif not aJ then aL.Value=''end end}aD:Toggle{Name='Rapid Fire'
,Description='enables rapid fire rate',State=false,Callback=function(aI,aJ)if aJ
then aG('FireRate',0.02)else aH'FireRate'end end}aD:Toggle{Name='No Equip Timer'
,Description='removes the delay from equipping to shooting',State=false,Callback
=function(aI,aJ)if aJ then aG('EquipTime',0)else aH'EquipTime'end end}aD:Toggle{
Name='Instant Reload',Description='removes reload timer',State=false,Callback=
function(aI,aJ)if aJ then aG('ReloadTime',0)else aH'ReloadTime'end end}aD:Toggle
{Name='No Spread',Description='removes gun spread',State=false,Callback=function
(aI,aJ)if aJ then aG('MaxSpread',0)aG('Spread',0)else aH'MaxSpread'aH'Spread'end
end}aD:Toggle{Name='No Recoil',Description='removes gun recoil',State=false,
Callback=function(aI,aJ)if aJ then aG('recoil',0,true)aG('RecoilControl',0)else
aH('recoil',true)aH'RecoilControl'end end}aD:Toggle{Name='No Overheating',
Description='removes overheating for the Z80',State=false,Callback=function(aI,
aJ)local aK=au:FindFirstChild'PlayerGui'and au.PlayerGui:FindFirstChild'GUI'
local aL=aK and aK:FindFirstChild'Client'local aM=aL and aL:FindFirstChild
'Variables'local aN=aM and aM:FindFirstChild'overheat'if not aN then return end
if aI._OverheatConn then aI._OverheatConn:Disconnect()aI._OverheatConn=nil end
if aJ then aI._OverheatConn=aN:GetPropertyChangedSignal'Value':Connect(function(
)if aN.Value>0 then aN.Value=0 end end)end end}aD:Toggle{Name=
'No Projectile Charging',Description='removes charge timer for projectiles',
State=false,Callback=function(aI,aJ)if aJ then aG('ChargeTime',0)else aH
'ChargeTime'end end}aD:Toggle{Name='Haste',Description='removes player slowdown'
,State=false,Callback=function(aI,aJ)if aJ then aG('Speed%',-150)else aH'Speed%'
end end}:Continue()end end do local aC=aB.Visuals do local aD=aC:Section{Name=
'ESP'}aD:Slider{Name='Text Font',Description='the font ESP text uses',Value=3,
Minimum=0,Maximum=3,Step=1,Precision=0,Callback=function(aE,aF)ak.textFont=aF
end}aD:Slider{Name='Text Size',Description='the size of ESP text',Value=13,
Minimum=1,Maximum=20,Step=1,Precision=0,Callback=function(aE,aF)ak.textSize=aF
end}aD:Toggle{Name='Use Team Color',Description='enables ESP team color',State=
false,Callback=function(aE,aF)ak.useTeamColor=aF end}aD:Toggle{Name=
'Limit Enabled',Description='enables distance limit',State=false,Callback=
function(aE,aF)ak.limitDistance=aF end}:Continue()aD:Slider{Name='Max Distance',
Description='the maximum distance that ESP will render at',Value=500,Minimum=1,
Maximum=2000,Step=1,Precision=0,Callback=function(aE,aF)ak.maxDistance=aF end}:
Continue()local aE=function(aE)aA:VisualPreview{HealthBar={Visible=aE.healthBar,
Color={aE.healthyColor}},Name={Visible=aE.name,Color={aE.nameColor[1],aE.
nameColor[2]}},Distance={Visible=aE.distance,Color={aE.distanceColor[1],aE.
distanceColor[2]}},Health={Visible=aE.healthText,Color={aE.healthTextColor[1],aE
.healthTextColor[2]}},Weapon={Visible=aE.weapon,Color={aE.weaponColor[1],aE.
weaponColor[2]}},BoundingBox={Visible=aE.box,Color={aE.boxColor[1],aE.boxColor[2
]}},CornerBox={Visible=aE.cornerBox,Color={aE.cornerBoxColor[1],aE.
cornerBoxColor[2]}},FillBox={Visible=aE.boxFill,Color={aE.boxFillColor[1],aE.
boxFillColor[2]}}}end local aF,aG=function(aF,aG)aG:Toggle{Name='Enabled',
Description='enables ESP',State=false,Callback=function(aH,aI)aF.enabled=aI end}
aG:Toggle{Name='Bounding Box',Description='enables bounding box ESP',State=false
,Callback=function(aH,aI)aF.box=aI aE(aF)end}:Continue():Colorpicker{Color={
Color3.fromRGB(77,92,143),0.5},SuggestionColors={{Color3.fromRGB(171,81,83)},{
Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,
197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.boxColor[1],
aF.boxColor[2]=aH,1-aI aF.boxOutlineColor[2]=1-aI aE(aF)end}aG:Toggle{Name=
'Box Fill',Description='enables box fill ESP',State=false,Callback=function(aH,
aI)aF.boxFill=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(0,0,0),
0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)}
,{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(aH,aI)aF.boxFillColor[1],aF.boxFillColor[2]=aH,1-aI
aE(aF)end}aG:Toggle{Name='Corner Box',Description='enables corner box ESP',State
=false,Callback=function(aH,aI)aF.cornerBox=aI aE(aF)end}:Continue():Colorpicker
{Color={Color3.fromRGB(123,124,2433),0},SuggestionColors={{Color3.fromRGB(171,81
,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.
cornerBoxColor[1],aF.cornerBoxColor[2]=aH,1-aI aE(aF)end}aG:Toggle{Name=
'3D Bounding Box',Description='enables 3d bounding box ESP',State=false,Callback
=function(aH,aI)aF.box3d=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
fromRGB(141,149,192),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.box3dColor[1],aF.
box3dColor[2]=aH,1-aI aE(aF)end}aG:Toggle{Name='Chams',Description=
'enables player chams ESP',State=false,Callback=function(aH,aI)aF.chams=aI end}:
Continue():Colorpicker{Description='Fill Color',Color={Color3.fromRGB(100,120,
250),0.8},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
fromRGB(49,220,195)}},Callback=function(aH,aI)aF.chamsFillColor[1],aF.
chamsFillColor[2]=aH,aI aE(aF)end}:Continue():Colorpicker{Description=
'Outline Color',Color={Color3.fromRGB(25,85,255),0.5},SuggestionColors={{Color3.
fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},
{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH
,aI)aF.chamsOutlineColor[1],aF.chamsOutlineColor[2]=aH,aI aE(aF)end}aG:Toggle{
Name='Tracers',Description='enables tracers ESP',State=false,Callback=function(
aH,aI)aF.tracer=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(123,124,243
),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)}
,{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(aH,aI)aF.tracerColor[1],aF.tracerColor[2]=aH,1-aI
aF.tracerOutlineColor[2]=1-aI aE(aF)end}aG:Dropdown{Name='Tracers Origin',
Description='selects the starting port of tracers',Options={'Top','Middle',
'Bottom','Mouse'},Value={'Top'},Limit=1,Minimum=1,Callback=function(aH,aI)aF.
tracerOrigin=aI[1]end}aG:Toggle{Name='Health Bar',Description=
'enables health bar ESP',State=false,Callback=function(aH,aI)aF.healthBar=aI aE(
aF)end}:Continue():Colorpicker{Description='Healthy Color',AlphaEnabled=false,
Color={Color3.fromRGB(58,161,47),0},SuggestionColors={{Color3.fromRGB(171,81,83)
},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(
255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH)aF.healthyColor
=aH aE(aF)end}:Continue():Colorpicker{Description='Dying Color',AlphaEnabled=
false,Color={Color3.fromRGB(161,47,47),0},SuggestionColors={{Color3.fromRGB(171,
81,83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH)aF.
dyingColor=aH aE(aF)end}aG:Toggle{Name='Off Screen Arrows',Description=
'enables off screen arrow ESP',State=false,Callback=function(aH,aI)aF.
offScreenArrow=aI end}:Continue():Colorpicker{Color={Color3.fromRGB(255,255,255)
,0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},
{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(aH,aI)aF.offScreenArrowColor[1],aF.
offScreenArrowColor[2]=aH,1-aI aF.offScreenArrowOutlineColor[2]=1-aI aE(aF)end}:
Continue()aG:Slider{Name='Arrow Size',Description=
'changes the size of the individual off screen arrows',Value=15,Minimum=1,
Maximum=50,Step=1,Precision=0,Callback=function(aH,aI)ak.offScreenArrowSize=aI
end}:Continue()aG:Slider{Name='Radius',Description=
'changes the radius limit of offscreen arrows',Value=150,Minimum=1,Maximum=500,
Step=1,Precision=0,Callback=function(aH,aI)ak.offScreenArrowRadius=aI end}aG:
Toggle{Name='Name',Description='enables name text ESP',State=false,Callback=
function(aH,aI)aF.name=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.
fromRGB(221,215,148),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.
fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)
},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.nameColor[1],aF.
nameColor[2]=aH,1-aI aE(aF)end}aG:Toggle{Name='Distance',Description=
'enables distance text ESP',State=false,Callback=function(aH,aI)aF.distance=aI
aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(221,215,148),0},
SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,243)},{
Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.fromRGB(49,
220,195)}},Callback=function(aH,aI)aF.distanceColor[1],aF.distanceColor[2]=aH,1-
aI aE(aF)end}aG:Toggle{Name='Weapon',Description='enables weapon text ESP',State
=false,Callback=function(aH,aI)aF.weapon=aI aE(aF)end}:Continue():Colorpicker{
Color={Color3.fromRGB(200,173,182),0},SuggestionColors={{Color3.fromRGB(171,81,
83)},{Color3.fromRGB(123,124,243)},{Color3.fromRGB(208,246,111)},{Color3.
fromRGB(255,197,100)},{Color3.fromRGB(49,220,195)}},Callback=function(aH,aI)aF.
weaponColor[1],aF.weaponColor[2]=aH,1-aI aE(aF)end}aG:Toggle{Name='Health',
Description='enables health text ESP',State=false,Callback=function(aH,aI)aF.
healthText=aI aE(aF)end}:Continue():Colorpicker{Color={Color3.fromRGB(200,173,
182),0},SuggestionColors={{Color3.fromRGB(171,81,83)},{Color3.fromRGB(123,124,
243)},{Color3.fromRGB(208,246,111)},{Color3.fromRGB(255,197,100)},{Color3.
fromRGB(49,220,195)}},Callback=function(aH,aI)aF.healthTextColor[1],aF.
healthTextColor[2]=aH,1-aI aE(aF)end}:Continue()end,aD:Section{Name='Enemies'}
aF(am,aG)local aH=aD:Section{Name='Friendlies'}aF(an,aH)end end do local aC=aB.
Misc end do local aC=aB.Cfg aC:Toggle{Name='Visual preview',Description=
'enables a visual preview of your esp',State=true,Callback=function(aD,aE)aA:
VisualPreview{Visible=aE}end}:Continue()aC:Keybind{Bind=aA.Settings.Keybind,
Blacklist={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2},
onChanged=function(aD,aE)aA:UpdateSettings{Keybind=aE}end}:Continue()aC:Button{
Color=aj.SystemDarkRed,Name='Unload Menu',Callback=function(aD)ad:Unload()end}:
Continue()end ab()aB.Legit:Select()ad:Notification{Title=`RIOT V2 - {aa.Name} | getriot.cc`
,Description=`RIOT V2 Loaded!`,Lifetime=5}do ae.Load()ae.getWeapon=function(aC)
local aD='None'if aC then local aE=aC:FindFirstChild'NRPBS'local aF=aE and aE:
FindFirstChild'EquippedTool'if aF and aF.Value then aD=aF.Value end end return
string.upper(aD)end ae.getHealth=function(aC)local aD=aC:FindFirstChild'NRPBS'
local aE,aF=aD and aD:FindFirstChild'Health',aD and aD:FindFirstChild'MaxHealth'
if aE and aF then return aE.Value,aF.Value end return 100,100 end end do af.
Load()af.PlayerAlive=function(aC)local aD=aC:FindFirstChild'NRPBS'local aE=aD
and aD:FindFirstChild'Health'return aE and aE.Value<0 end end end end end local
aa={Universal={Name='Universal',Load=a.load'e'},Arsenal={Name='Arsenal',Load=a.
load'h',Places={286090429}}}for ab,ac in pairs(aa)do if ac.Places then for ad,ae
in ipairs(ac.Places)do if ae==game.PlaceId then ac:Load()return end end end end
aa.Universal:Load()]================================================================================])
