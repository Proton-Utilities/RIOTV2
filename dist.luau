--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    RIOT V2

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.SecureService=
newcclosure(function(c)local d=cloneref and cloneref(game)or game local e,f=
pcall(function()return cloneref and cloneref(d:GetService(c))or d:GetService(c)
end)return e and f or error('Unable to retrieve service: '..c)end)function b.
GetPlayer()local c,d=pcall(function()return(b.SecureService'Players')end)return
c and(d).LocalPlayer or nil end function b.GetCharacter(c)local d,e=pcall(
function()return c and c.Character or nil end)return d and e or nil end function
b.GetHumanoid(c)local d,e=pcall(function()local d=b.GetCharacter(c)return d and
d:FindFirstChildOfClass'Humanoid'or nil end)return d and e or nil end return b
end function a.b()local b={Version='1.3.2',Author='Depso',License='MIT',
Repository='https://github.com/depthso/Dear-ReGui/',Debug=false,PrefabsId=
117781589903262,DefaultTitle='ReGui',ContainerName='riUi',DoubleClickThreshold=
0.3,Container=nil,Prefabs=nil,Tooltip=nil,ActiveWindow=nil,ThemeConfigs={},
Elements={},Animation={DefaultTweenInfo=TweenInfo.new(0.08)},_FlagCache={},
Windows={},AnimationConnections={},MouseEvents={DoubleClick={},Click={}}}b.Icons
={Dot='rbxasset://textures/whiteCircle.png',Arrow='rbxassetid://4731371527',
Close='rbxasset://textures/AnimationEditor/icon_close.png',Checkmark=
'rbxasset://textures/AnimationEditor/icon_checkmark.png',Cat=
'rbxassetid://16211812161',Script='rbxassetid://11570895459',Settings=
'rbxassetid://9743465390',Info='rbxassetid://18754976792',Move=
'rbxassetid://6710235139',Roblox='rbxassetid://7414445494',Warning=
'rbxassetid://11745872910',Audio='rbxassetid://302250236',Shop=
'rbxassetid://6473525198',CharacterDance='rbxassetid://11932783331',Pants=
'rbxassetid://10098755331',Home='rbxassetid://4034483344',Robux=
'rbxassetid://5986143282',Badge='rbxassetid://16170504068',SpawnLocation=
'rbxassetid://6400507398',Sword='rbxassetid://7485051715',Clover=
'rbxassetid://11999300014',Star='rbxassetid://3057073083',Code=
'rbxassetid://11348555035',Paw='rbxassetid://13001190533',Shield=
'rbxassetid://7461510428',Shield2='rbxassetid://7169354142',File=
'rbxassetid://7276823330',Book='rbxassetid://16061686835',Location=
'rbxassetid://13549782519',Puzzle='rbxassetid://8898417863',Discord=
'rbxassetid://84828491431270',Premium='rbxassetid://6487178625',Friend=
'rbxassetid://10885655986',User='rbxassetid://18854794412',Duplicate=
'rbxassetid://11833749507',ChatBox='rbxassetid://15839118471',ChatBox2=
'rbxassetid://15839116089',Devices='rbxassetid://4458812712',Weight=
'rbxassetid://9855685269',Image='rbxassetid://4669770840',Profile=
'rbxassetid://13585614795',Admin='rbxassetid://11656483170',PaintBrush=
'rbxassetid://12111879608',Speed='rbxassetid://12641434961',NoConnection=
'rbxassetid://9795340967',Connection='rbxassetid://119759670842477',Globe=
'rbxassetid://18870359747',Box='rbxassetid://140217940575618',Crown=
'rbxassetid://18826490498',Control='rbxassetid://18979524646',Send=
'rbxassetid://18940312887',FastForward='rbxassetid://112963221295680',Pause=
'rbxassetid://109949100737970',Reload='rbxassetid://11570018242',Joystick=
'rbxassetid://18749336354',Controller='rbxassetid://11894535915',Lock=
'rbxassetid://17783082088',Calculator='rbxassetid://85861816563977',Sun=
'rbxassetid://13492317832',Moon='rbxassetid://8498174594',Prohibited=
'rbxassetid://5248916036',Flag='rbxassetid://251346532',Website=
'rbxassetid://98455290625865',Telegram='rbxassetid://115860270107061',MusicNote=
'rbxassetid://18187351229',Music='rbxassetid://253830398',Headphones=
'rbxassetid://1311321471',Phone='rbxassetid://8411963035',Smartphone=
'rbxassetid://14040313879',Desktop='rbxassetid://3120635703',Desktop2=
'rbxassetid://4728059490',Laptop='rbxassetid://4728059725',Server=
'rbxassetid://9692125126',Wedge='rbxassetid://9086583059',Drill=
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}b.Accent={Light=
Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),White=Color3.fromRGB(
240,240,240),Gray=Color3.fromRGB(127,126,129),Black=Color3.fromRGB(15,19,24),
Yellow=Color3.fromRGB(230,180,0),Orange=Color3.fromRGB(230,150,0),Green=Color3.
fromRGB(130,188,91),Red=Color3.fromRGB(255,69,69),ImGui={Light=Color3.fromRGB(66
,150,250),Dark=Color3.fromRGB(41,74,122),Black=Color3.fromRGB(15,15,15),Gray=
Color3.fromRGB(36,36,36)}}local c=b.ThemeConfigs c.DarkTheme={Values={
AnimationTweenInfo=TweenInfo.new(0.08),TextFont=Font.fromName'Inconsolata',
TextSize=13,Text=b.Accent.White,TextDisabled=b.Accent.Gray,ErrorText=b.Accent.
Red,FrameBg=b.Accent.Dark,FrameBgTransparency=0.4,FrameBgActive=b.Accent.Light,
FrameBgTransparencyActive=0.4,SliderGrab=b.Accent.Light,ButtonsBg=b.Accent.Light
,CollapsingHeaderBg=b.Accent.Light,CollapsingHeaderText=b.Accent.White,CheckMark
=b.Accent.Light,RadioButtonHoveredBg=b.Accent.Light,ResizeGrab=b.Accent.Light,
HeaderBg=b.Accent.Gray,HeaderBgTransparency=0.6,HistogramBar=b.Accent.Yellow,
ProgressBar=b.Accent.Yellow,RegionBg=b.Accent.Dark,RegionBgTransparency=0.1,
Separator=b.Accent.Gray,SeparatorTransparency=0.5,TabTextPaddingTop=UDim.new(0,3
),TabTextPaddingBottom=UDim.new(0,8),TabText=b.Accent.Gray,TabBg=b.Accent.Dark,
TabTextActive=b.Accent.White,TabBgActive=b.Accent.Light,TabsBarBg=Color3.
fromRGB(36,36,36),TabsBarBgTransparency=1,TabPadding=UDim.new(0,8),
ModalWindowDimBg=Color3.fromRGB(230,230,230),ModalWindowDimTweenInfo=TweenInfo.
new(0.2),WindowBg=b.Accent.Black,WindowBgTransparency=0.05,Border=b.Accent.Gray,
BorderTransparency=0.7,BorderTransparencyActive=0.4,Title=b.Accent.White,
TitleAlign=Enum.TextXAlignment.Left,TitleBarBg=b.Accent.Black,
TitleBarTransparency=0,TitleActive=b.Accent.White,TitleBarBgActive=b.Accent.Dark
,TitleBarTransparencyActive=0.05,TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6}}c.LightTheme={BaseTheme=c.DarkTheme,Values={
Text=b.Accent.Black,TextFont=Font.fromName'Ubuntu',TextSize=14,FrameBg=b.Accent.
Gray,FrameBgTransparency=0.4,FrameBgActive=b.Accent.Gray,
FrameBgTransparencyActive=0,SliderGrab=b.Accent.White,ButtonsBg=b.Accent.Gray,
CollapsingHeaderBg=b.Accent.Gray,CollapsingHeaderText=b.Accent.Black,CheckMark=b
.Accent.Black,RadioButtonHoveredBg=b.Accent.Black,Separator=b.Accent.Black,
TabText=b.Accent.Black,TabBg=b.Accent.White,TabTextActive=b.Accent.Black,
TabBgActive=b.Accent.Gray,WindowBg=b.Accent.White,Border=b.Accent.Gray,
ResizeGrab=b.Accent.Gray,Title=b.Accent.White,TitleAlign=Enum.TextXAlignment.
Center,TitleBarBg=b.Accent.Black,TitleActive=b.Accent.Black,TitleBarBgActive=b.
Accent.Gray}}c.Classic={BaseTheme=c.DarkTheme,Values={AnimationTweenInfo=
TweenInfo.new(0),Text=Color3.fromRGB(255,255,255),FrameBg=b.Accent.ImGui.Dark,
FrameBgTransparency=0.4,FrameBgActive=b.Accent.ImGui.Light,
FrameBgTransparencyActive=0.5,ButtonsBg=b.Accent.ImGui.Light,CollapsingHeaderBg=
b.Accent.ImGui.Light,CollapsingHeaderText=b.Accent.White,CheckMark=b.Accent.
ImGui.Light,RadioButtonHoveredBg=b.Accent.ImGui.Light,ResizeGrab=b.Accent.ImGui.
Light,TabTextPaddingTop=UDim.new(0,0),TabText=b.Accent.Gray,TabBg=b.Accent.ImGui
.Gray,TabTextActive=b.Accent.White,TabBgActive=b.Accent.ImGui.Gray,TabsBarBg=b.
Accent.ImGui.Gray,TabsBarBgTransparency=0,WindowBg=b.Accent.ImGui.Black,
WindowBgTransparency=0.05,Border=b.Accent.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=b.Accent.White,TitleBarBg=b.Accent.ImGui.
Black,TitleBarTransparency=0,TitleBarBgActive=b.Accent.ImGui.Dark,
TitleBarTransparencyActive=0}}b.ElementColors={ModalWindowDim={BackgroundColor3=
'ModalWindowDimBg'},Selectable={BackgroundColor3='ButtonsBg',FontFace='TextFont'
,TextSize='TextSize'},Separator={BackgroundColor3='Separator',
BackgroundTransparency='SeparatorTransparency'},Region={BackgroundColor3=
'RegionBg',BackgroundTransparency='RegionBgTransparency'},Label={TextColor3=
'Text',FontFace='TextFont',TextSize='TextSize'},ConsoleText={TextColor3='Text',
FontFace='TextFont',TextSize='TextSize'},LabelDisabled={TextColor3=
'TextDisabled',FontFace='TextFont',TextSize='TextSize'},Plot={BackgroundColor3=
'HistogramBar'},Header={BackgroundColor3='HeaderBg',BackgroundTransparency=
'HeaderBgTransparency'},WindowTitle={TextXAlignment='TitleAlign',FontFace=
'TextFont',TextSize='TextSize'},TitleBar={BackgroundColor3='TitleBarBgActive'},
Window={BackgroundColor3='WindowBg',BackgroundTransparency=
'WindowBgTransparency'},TitleBarBgCollapsed={BackgroundColor3=
'TitleBarBgCollapsed',BackgroundTransparency='TitleBarTransparencyCollapsed'},
TitleBarBgActive={BackgroundColor3='TitleBarBgActive',BackgroundTransparency=
'TitleBarTransparencyActive'},TitleBarBg={BackgroundColor3='TitleBarBg',
BackgroundTransparency='TitleBarTransparency'},TabSelectorTabsBar={
BackgroundColor3='TabsBarBg',BackgroundTransparency='TabsBarBgTransparency'},
Border={Color='Border',Transparency='BorderTransparency'},ResizeGrab={TextColor3
='ResizeGrab'},BorderActive={Transparency='BorderTransparencyActive'},Frame={
BackgroundColor3='FrameBg',BackgroundTransparency='FrameBgTransparency',
TextColor3='Text',FontFace='TextFont',TextSize='TextSize'},FrameActive={
BackgroundColor3='FrameBgActive',BackgroundTransparency=
'FrameBgTransparencyActive'},SliderGrab={BackgroundColor3='SliderGrab'},Button={
BackgroundColor3='ButtonsBg',TextColor3='Text',FontFace='TextFont',TextSize=
'TextSize'},CollapsingHeader={FontFace='TextFont',TextSize='TextSize',TextColor3
='CollapsingHeaderText',BackgroundColor3='CollapsingHeaderBg'},Checkbox={
BackgroundColor3='FrameBg'},CheckMark={ImageColor3='CheckMark',BackgroundColor3=
'CheckMark'},RadioButton={BackgroundColor3='RadioButtonHoveredBg'}}b.Styles={
RadioButton={Animation='RadioButtons',CornerRadius=UDim.new(1,0)},Button={
Animation='Buttons'},CollapsingHeader={Animation='Buttons'},TreeNode={Animation=
'TransparentButtons'},TransparentButton={Animation='TransparentButtons'}}b.
Animations={Invisible={Connections={MouseEnter={Visible=true},MouseLeave={
Visible=false}},Init='MouseLeave'},Buttons={Connections={MouseEnter={
BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0.7}},Init=
'MouseLeave'},TextButtons={Connections={MouseEnter={TextTransparency=0.3},
MouseLeave={TextTransparency=0.7}},Init='MouseLeave'},TransparentButtons={
Connections={MouseEnter={BackgroundTransparency=0.3},MouseLeave={
BackgroundTransparency=1}},Init='MouseLeave'},RadioButtons={Connections={
MouseEnter={BackgroundTransparency=0.5},MouseLeave={BackgroundTransparency=1}},
Init='MouseLeave'},Inputs={Connections={MouseEnter={BackgroundTransparency=0},
MouseLeave={BackgroundTransparency=0.5}},Init='MouseLeave'},Plots={Connections={
MouseEnter={BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0}},
Init='MouseLeave'},Border={Connections={Selected={Transparency=0,Thickness=1},
Deselected={Transparency=0.7,Thickness=1}},Init='Selected'}}b.ElementFlags={{
Properties={'Center'},Callback=function(d,e,f)local g=e.Position b:
SetProperties(e,{Position=UDim2.new(f:find'X'and 0.5 or g.X.Scale,g.X.Offset,f:
find'Y'and 0.5 or g.Y.Scale,g.Y.Offset),AnchorPoint=Vector2.new(f:find'X'and 0.5
or 0,f:find'Y'and 0.5 or 0)})end},{Properties={'ElementStyle'},Callback=function
(d,e,f)b:ApplyStyle(e,f)end},{Properties={'ColorTag'},Callback=function(d,e,f)
local g,h=d.Class,d.WindowClass local i=g.NoAutoTheme if not h then return end
if i then return end b:UpdateColors{Object=e,Tag=f,NoAnimation=true,Theme=h.
Theme}end},{Properties={'Animation'},Callback=function(d,e,f)local g=d.Class.
NoAnimation if g then return end b:SetAnimation(e,f)end},{Properties={'Icon',
'IconSize','IconRotation'},Callback=function(d,e,f)local g=e:FindFirstChild(
'Icon',true)if not g then return b:Warn('No icon for',e)end local h=d.Class b:
CheckConfig(h,{Icon='',IconSize=UDim2.fromScale(1,1),IconRotation=0})local i,j,k
=h.IconSize,h.Icon,h.IconRotation j=b:CheckAssetUrl(j)b:SetProperties(g,{Visible
=f and true,Image=j,Size=i,Rotation=k})end},{Properties={'BorderThickness',
'Border','BorderColor'},Callback=function(d,e,f)local g=d.Class local h=g.Border
==true b:CheckConfig(g,{BorderThickness=h and 1 or 0,BorderStrokeMode=Enum.
ApplyStrokeMode.Border})local i=b:GetChildOfClass(e,'UIStroke')b:SetProperties(i
,{Thickness=g.BorderThickness,Color=g.BorderColor,ApplyStrokeMode=g.
BorderStrokeMode,Enabled=h})end},{Properties={'Ratio'},Callback=function(d,e,f)
local g=d.Class b:CheckConfig(g,{Ratio=1.3333333333333333,RatioAxis=Enum.
DominantAxis.Height,RatioAspectType=Enum.AspectType.ScaleWithParentSize})local h
,i,j,k=g.Ratio,g.RatioAxis,g.RatioAspectType,b:GetChildOfClass(e,
'UIAspectRatioConstraint')b:SetProperties(k,{DominantAxis=i,AspectType=j,
AspectRatio=h})end},{Properties={'FlexMode'},Callback=function(d,e,f)local g=b:
GetChildOfClass(e,'UIFlexItem')g.FlexMode=f end},{Properties={'CornerRadius'},
Callback=function(d,e,f)local g=b:GetChildOfClass(e,'UICorner')g.CornerRadius=f
end},{Properties={'Fill'},Callback=function(d,e,f)if f~=true then return end
local g=d.Class b:CheckConfig(g,{Size=UDim2.fromScale(1,1),UIFlexMode=Enum.
UIFlexMode.Fill,AutomaticSize=Enum.AutomaticSize.None})local h=b:
GetChildOfClass(e,'UIFlexItem')h.FlexMode=g.UIFlexMode e.Size=g.Size e.
AutomaticSize=g.AutomaticSize end},{Properties={'Label'},Callback=function(d,e,f
)local g=e:FindFirstChild'Label'if not g then return end local h=d.Class
function h:SetLabel(i)g.Text=i return self end g.Text=tostring(f)end},{
Properties={'NoGradient'},WindowProperties={'NoGradients'},Callback=function(d,e
,f)local g=e:FindFirstChildOfClass'UIGradient'if not g then return end g.Enabled
=f end},{Properties={'UiPadding','PaddingBottom','PaddingTop','PaddingRight',
'PaddingTop'},Callback=function(d,e,f)f=f or 0 if typeof(f)=='number'then f=UDim
.new(0,f)end local g=d.Class local h=g.UiPadding if h then b:CheckConfig(g,{
PaddingBottom=f,PaddingLeft=f,PaddingRight=f,PaddingTop=f})end local i=b:
GetChildOfClass(e,'UIPadding')b:SetProperties(i,{PaddingBottom=g.PaddingBottom,
PaddingLeft=g.PaddingLeft,PaddingRight=g.PaddingRight,PaddingTop=g.PaddingTop})
end},{Properties={'Callback'},Callback=function(d,e)local f=d.Class function f:
SetCallback(g)self.Callback=g return self end function f:FireCallback(g)self.
Callback(e)return self end end},{Properties={'Value'},Callback=function(d,e)
local f=d.Class b:CheckConfig(f,{GetValue=function(g)return f.Value end})end}}
local d,e,f=function()end,get_hidden_gui or gethui,cloneref or function(d)return
d end local g=setmetatable({},{__index=function(g,h)local i=game:GetService(h)
return f(i)end})local h,i,j,k=g.Players,g.CoreGui,g.UserInputService,g.
TweenService local l=h.LocalPlayer b.PlayerGui=l.PlayerGui b.Mouse=l:GetMouse()
local m=b.Animation function m:Tween(n)local o,p,q=self.DefaultTweenInfo,n.
Object,n.NoAnimation local r,s,t,u=n.Tweeninfo or o,n.EndProperties,n.
StartProperties,n.Completed if t then b:SetProperties(p,t)end if q then b:
SetProperties(p,s)if u then u()end return end local v for w,x in next,s do local
y={[w]=x}local z,A=pcall(function()return k:Create(p,r,y)end)if not z then b:
SetProperties(p,y)continue end if not v then v=A end A:Play()end if u then if v
then v.Completed:Connect(u)else u()end end return v end function m:Animate(n)
local o,p,q,r,s=n.NoAnimation,n.Objects,n.Tweeninfo,(n.Completed)for t,u in next
,p do local v=self:Tween{NoAnimation=o,Object=t,Tweeninfo=q,EndProperties=u}if
not s then s=v end end if r then s.Completed:Connect(r)end return s end function
m:HeaderCollapseToggle(n)b:CheckConfig(n,{Rotations={Open=90,Closed=0}})local o,
p,q,r,s=n.Toggle,n.NoAnimation,n.Rotations,n.Collapsed,n.Tweeninfo local t=r and
q.Closed or q.Open self:Tween{Tweeninfo=s,NoAnimation=p,Object=o,EndProperties={
Rotation=t}}end function m:HeaderCollapse(n)local o,p,q,r,s,t,u,v,w,x,y=n.
Tweeninfo,n.Collapsed,n.ClosedSize,n.OpenSize,n.Toggle,n.Resize,n.Hide,n.
NoAnimation,n.NoAutomaticSize,n.IconRotations,n.Completed if not w then t.
AutomaticSize=Enum.AutomaticSize.None end if not p then u.Visible=true end self:
HeaderCollapseToggle{Tweeninfo=o,Collapsed=p,NoAnimation=v,Toggle=s,Rotations=x}
local z=self:Tween{Tweeninfo=o,NoAnimation=v,Object=t,StartProperties={Size=p
and r or q},EndProperties={Size=p and q or r},Completed=function()u.Visible=not
p if y then y()end if p then return end if w then return end t.Size=UDim2.
fromScale(1,0)t.AutomaticSize=Enum.AutomaticSize.Y end}return z end function
GetAndRemove(n,o)local p=o[n]if p then o[n]=nil end return p end function Merge(
n,o)for p,q in next,o do n[p]=q end end function Copy(n,o)local p=table.clone(n)
if o then Merge(p,o)end return p end function NewClass(n)n.__index=n return
setmetatable({},n)end function b:Warn(...)warn('[ReGui]::',...)end function b:
IsDoubleClick(n)local o=self.DoubleClickThreshold if n<o then return true end
end function b:Init(n)n=n or{}if self.Initialised then return end Merge(self,n)
Merge(self,{Initialised=true,HasGamepad=self:IsConsoleDevice(),HasTouchScreen=
self:IsMobileDevice()})self:CheckConfig(self,{ContainerParent=function()return
self:ResolveContainerParent()end,Prefabs=function()return self:LoadPrefabs()end}
,true)self:CheckConfig(self,{Container=function()return self:InsertPrefab(
'Container',{Parent=self.ContainerParent,Name=self.ContainerName})end},true)
local o=0 j.InputBegan:Connect(function(p)if not self:IsMouseEvent(p)then return
end local q=tick()local r=q-o self:UpdateWindowFocuses()if self:IsDoubleClick(r)
then self:FireMouseEvents'DoubleClick'o=0 else o=q end end)end function b:
GetVersion()return self.Version end function b:IsMobileDevice()return j.
TouchEnabled end function b:IsConsoleDevice()return j.GamepadEnabled end
function b:GetScreenSize()return workspace.CurrentCamera.ViewportSize end
function b:LoadPrefabs()local n,o=self.PlayerGui,'ReGui-Prefabs'local p=script:
WaitForChild(o,2)if p then return p end local q=n:WaitForChild(o,2)if q then
return q end return nil end function b:ResolveContainerParent()local n,o=self.
PlayerGui,self.Debug local p,q={[1]=function()return e()end,[2]=function()return
i:FindFirstChild'RobloxGui'end,[3]=function()return i end,[4]=function()return n
end},self:CreateInstance'ScreenGui'for r,s in next,p do local t,u=pcall(s)if not
t then continue end local v=pcall(function()q.Parent=u end)if not v then
continue end if o then self:Warn(`Step: {r} was chosen as the parent!: {u}`)end
return u end self:Warn'The ReGui container does not have a parent defined'return
nil end function b:CheckConfig(n,o,p)if not n then return end for q,r in next,o
do if n[q]~=nil then continue end if p then r=r()end n[q]=r end return n end
function b:CheckAssetUrl(n)if tonumber(n)then return`rbxassetid://{n}`end return
n end function b:CreateInstance(n,o,p)local q=Instance.new(n,o)if p then b:
SetProperties(q,p)end return q end function b:ConnectMouseEvent(n,o)local p,q,r,
s,t=o.Callback,o.DoubleClick,o.OnlyMouseHovering,0 if r then t=self:DetectHover(
r)end n.Activated:Connect(function(...)local u=tick()local v=u-s if t and not t.
Hovering then return end if q then if not b:IsDoubleClick(v)then s=u return end
s=0 end p(...)end)end function b:ConnectScreenMouseEvent(n,o)local p,q=self.
MouseEvents,o.DoubleClick local r=q and p.DoubleClick or p.Click o.HoverSignal=
self:DetectHover(n)table.insert(r,o)end function b:FireMouseEvents(n)local o=
self.MouseEvents local p=o[n]for q,r in p do local s,t,u=r.Object,r.Callback,r.
HoverSignal if not u.Hovering then continue end t()end end function b:
GetAnimation(n)return n and self.Animation or TweenInfo.new(0)end function b:
GetDictSize(n)local o=0 for p,q in n do o+=1 end return o end function b:
RemoveAnimationSignals(n)local o=self.AnimationConnections local p=o[n]if not p
then return end for q,r in next,p do r:Disconnect()end end function b:
AddAnimationSignal(n,o)local p=self.AnimationConnections local q=p[n]if not q
then q={}p[n]=q end table.insert(q,o)end function b:SetAnimationsEnabled(n)self.
NoAnimations=not n end function b:SetAnimation(n,o,p)p=p or n local q,r=self.
Animations,o if typeof(o)~='table'then r=q[o]end assert(r,`No animation data for Class {
o}!`)self:RemoveAnimationSignals(p)local s,t,u,v,w,x,y,z,A=r.Init,r.Connections,
r.Tweeninfo,r.NoAnimation,true,{},{}function y:Reset(B)if z then z(B)end end
function y:FireSignal(B)w=B end function y:Refresh(B)if not A then return end x[
A](B)end function y:SetEnabled(B)w=B end for B,C in next,t do local D,E=function
(D)A=B local E=self.NoAnimations if E then return end if not w then return end D
=D==true m:Tween{NoAnimation=D or v,Object=n,Tweeninfo=u,EndProperties=C}end,p[B
]local F=E:Connect(D)self:AddAnimationSignal(p,F)x[B]=D if B==s then z=D end end
y:Reset(true)return y end function b:GetChildOfClass(n,o)local p=n:
FindFirstChildOfClass(o)if not p then p=self:CreateInstance(o,n)end return p end
function b:ConnectDrag(n,o)self:CheckConfig(o,{DragStart=d,DragEnd=d,
DragMovement=d,OnDragStateChange=d})local p,q,r,s,t,u=o.DragStart,o.DragEnd,o.
DragMovement,o.OnDragStateChange,{StartAndEnd={Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch},Movement={Enum.UserInputType.MouseMovement,Enum.
UserInputType.Touch}},false local v,w,x=function(v,w)local x=v.UserInputType
return table.find(t[w],x)end,function(v)local w=v.Position return Vector2.new(w.
X,w.Y)end,function(v)self._DraggingDisabled=v u=v s(v)end local y=function(y)
local z,A,B,C,D,E=y.CheckDraggingDisabled,y.DraggingRequired,y.UpdateState,y.
IsDragging,y.InputType,y.Callback return function(F)if u~=A then return end if z
and self._DraggingDisabled then return end if not v(F,D)then return end if B
then x(C)end local G=w(F)E(G)end end n.InputBegan:Connect(y{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=p})j.InputEnded:Connect(y{DraggingRequired
=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',Callback=q})j.
InputChanged:Connect(y{DraggingRequired=true,InputType='Movement',Callback=r})
end function b:MakeDraggable(n)self:CheckConfig(n,{Enabled=true})local o,p,q,r,s
,t,u=n.Move,n.Grab,n.Enabled,n.OnDragStateChange,{}function s:SetEnabled(v)local
w=n.StateChanged self.Enabled=v if w then w(self)end end function s:CanDrag(v)if
not self.Enabled then return end return true end local v,w,x,y=function(v)if not
s:CanDrag()then return end local w=n.DragBegin u=v w(u)end,function(v)if not s:
CanDrag()then return end local w,x=v-u,n.OnUpdate x(w)end,function(v)t=o.
Position end,function(v)local w=UDim2.new(t.X.Scale,t.X.Offset+v.X,t.Y.Scale,t.Y
.Offset+v.Y)m:Tween{Object=o,EndProperties={Position=w}}end self:CheckConfig(n,{
OnUpdate=y,DragBegin=x})self:ConnectDrag(p,{DragStart=v,DragMovement=w,
OnDragStateChange=r})s:SetEnabled(q)return s end function b:MakeResizable(n)b:
CheckConfig(n,{MinimumSize=Vector2.new(160,90),MaximumSize=Vector2.new(math.huge
,math.huge)})local o,p,q,r,s=n.MaximumSize,n.MinimumSize,n.Resize,(n.OnUpdate)
local t=b:InsertPrefab('ResizeGrab',{Parent=q})local u,v,w=function(u)t.Visible=
u.Enabled end,function(u)local v=s+u local w=UDim2.fromOffset(math.clamp(v.X,p.X
,o.X),math.clamp(v.Y,p.Y,o.Y))if r then r(w)return end m:Tween{Object=q,
EndProperties={Size=w}}end,function(u)s=q.AbsoluteSize end local x=self:
MakeDraggable{Grab=t,OnUpdate=v,DragBegin=w,StateChanged=u}x.Grab=t return x end
function b:IsMouseEvent(n)local o=n.UserInputType.Name return o:find'Touch'or o:
find'Mouse'end function b:DetectHover(n,o)o=o or{}local p,q,r,s,t=o.OnInput,o.
Anykey,o.MouseMove,o.MouseEnter,o.MouseOnly o.Hovering=false local u=function(u,
v,w)if u and t then if not b:IsMouseEvent(u)then return end end if v~=nil then o
.Hovering=v end if not s and w then return end if p then local x=o.Hovering
return p(x,u)end end local v={n.MouseEnter:Connect(function()u(nil,true,true)end
),n.MouseLeave:Connect(function()u(nil,false,true)end)}if q or t then table.
insert(v,j.InputBegan:Connect(function(w)u(w)end))end if r then local w=n.
MouseMoved:Connect(u)table.insert(v,w)end function o:Disconnect()for w,x in next
,v do x:Disconnect()end end return o end function b:StackWindows()local n,o=self
.Windows,20 for p,q in next,n do local r,s=q.WindowFrame,UDim2.fromOffset(o*p,o*
p)q:Center()r.Position+=s end end function b:UpdateColors(n)local o,p,q,r,s,t,u,
v,w=self.ElementColors,self.ThemeConfigs,self.Debug,self._FlagCache,n.Object,n.
Tag,n.NoAnimation,n.TagsList,n.Theme local x,y=o[t],r[s]if typeof(t)=='table'
then x=t elseif v then v[s]=t end if not x then return end local z={}for A,B in
next,x do local C=self:GetThemeKey(w,B)if y and y[A]then continue end if not C
then if q then self:Warn(`Color: '{B}' does not exist!`)end continue end z[A]=C
end m:Tween{Object=s,NoAnimation=u,EndProperties=z}end function b:
MultiUpdateColors(n)local o=n.Objects for p,q in next,o do self:UpdateColors{
TagsList=n.TagsList,Theme=n.Theme,NoAnimation=not n.Animate,Object=p,Tag=q}end
end function b:ApplyStyle(n,o)local p=self.Styles local q=p[o]if not q then
return end self:ApplyFlags{Object=n,Class=q}end function b:MergeMetatables(n,o)
local p,q=self.Debug,{}q.__index=function(r,s)local t=n[s]if t~=nil then return
t end local u,v=pcall(function()return o[s]end)if u then if typeof(v)==
'function'then return function(w,...)return v(o,...)end end return v end return
nil end q.__newindex=function(r,s,u)local v=n[s]~=nil or typeof(u)=='function'if
v then n[s]=u return end xpcall(function()o[s]=u end,function(w)if p then self:
Warn(`Newindex Error: {o}.{s} = {u}\n{w}`)end n[s]=u end)end return
setmetatable({},q)end function b:Concat(n,o)local p=''for q,r in next,n do p..=
tostring(r)..(q~=#n and o or'')end return p end function b:GetValueFromAliases(n
,o)for p,q in n do local r=o[q]if r~=nil then return r end end return nil end
function b:RecursiveCall(n,o)for p,q in next,n:GetDescendants()do o(q)end end
function b:ApplyFlags(n)local o,p,q,r=self.ElementFlags,n.Object,n.Class,n.
WindowClass self:SetProperties(p,q)for s,u in next,o do local v,w,x,y=u.
Properties,u.Callback,u.Recursive,u.WindowProperties local z=self:
GetValueFromAliases(v,q)if r and y and z==nil then z=self:GetValueFromAliases(y,
r)end if z==nil then continue end w(n,p,z)if x then self:RecursiveCall(p,
function(A)w(n,A,z)end)end end end function b:SetProperties(n,o)for p,q in next,
o do pcall(function()n[p]=q end)end end function b:InsertPrefab(n,o)local p=self
.Prefabs local q=p.Prefabs local r=q:WaitForChild(n)local s=r:Clone()if o then
local u=o.UsePropertiesList if not u then self:SetProperties(s,o)else self:
ApplyFlags{Object=s,Class=o}end end return s end function b:GetContentSize(n,o)
local p,q,r,s=n:FindFirstChildOfClass'UIListLayout',n:FindFirstChildOfClass
'UIPadding',(n:FindFirstChildOfClass'UIStroke')if p and not o then s=p.
AbsoluteContentSize else s=n.AbsoluteSize end if q then local u,v,w,x=q.
PaddingTop.Offset,q.PaddingBottom.Offset,q.PaddingLeft.Offset,q.PaddingRight.
Offset s+=Vector2.new(w+x,u+v)end if r then local u=r.Thickness s+=Vector2.new(u
/2,u/2)end return s end function b:MakeCanvas(n)local o,p,q,r,s=self.Elements,
self.Debug,n.Element,n.WindowClass,n.Class if not r and p then self:Warn(`No WindowClass for {
q}`)print(n)end local u=NewClass(o)u.ParentCanvas=q u.WindowClass=r or false
local v={__index=function(v,w)local x=u[w]if x~=nil then return x end local y=s[
w]if y~=nil then return y end return q[w]end,__newindex=function(v,w,x)local y=s
[w]~=nil if y then s[w]=x else q[w]=x end end}return setmetatable({},v)end
function b:WrapGeneration(n,o)local p,q=o.Base,self._FlagCache return function(r
,s,...)s=s or{}self:CheckConfig(s,p)local u=s.CloneTable if u then s=table.
clone(s)end local v,w=r.WindowClass,r.ParentCanvas self:CheckConfig(s,{Parent=w,
Name=s.ColorTag})if r==self then r=self.Elements end local x,y=n(r,s,...)local z
,A,B=s.NoAutoTag,s.NoAutoFlags,s.ColorTag if Success==false then if r.Error then
r:Error{Parent=w,Text=x}end self:Warn('Class:',x)error(debug.traceback())end if
y==nil then y=x end if y then q[y]=s end if y then if not z and v then v:
TagElements{[y]=B}end if not A then self:ApplyFlags{Object=y,Class=s,WindowClass
=v}end end return x,y end end function b:DefineElement(n,o)local p,q,r=self.
Elements,self.ThemeConfigs,self.ElementColors local s,u,v,w,x,y=q.DarkTheme,o.
Base,o.Create,o.Export,o.ThemeTags,o.ColorData self:CheckConfig(u,{ColorTag=n,
ElementStyle=n,Visible=true})if x then Merge(s,x)end if y then Merge(r,y)end
local z=self:WrapGeneration(v,{Base=u})if w then self[n]=z end p[n]=z return z
end function b:DefineGlobalFlag(n)local o=self.ElementFlags table.insert(o,n)end
function b:DefineTheme(n,o)local p=self.ThemeConfigs self:CheckConfig(o,{
BaseTheme=p.DarkTheme})local q=GetAndRemove('BaseTheme',o)local r={BaseTheme=q,
Values=o}p[n]=r return r end function b:GetMouseLocation()local n=self.Mouse
return n.X,n.Y end function b:SetWindowFocusesEnabled(n)self.
WindowFocusesEnabled=n end function b:UpdateWindowFocuses()local n,o=self.
Windows,self.WindowFocusesEnabled if not o then return end for p,q in n do local
r=q.HoverConnection if not r then continue end local s=r.Hovering if s then self
:SetFocusedWindow(q)return end end self:SetFocusedWindow(nil)end function b:
WindowCanFocus(n)if n.NoSelect then return false end if n.Collapsed then return
false end return true end function b:SetFocusedWindow(n)local o,p=self.
ActiveWindow,self.Windows if o==n then return end self.ActiveWindow=n if n then
local q=self:WindowCanFocus(n)if not q then return end end for q,r in p do local
s=self:WindowCanFocus(r)if not s then continue end local u=r==n r:SetFocused(u)
end end function b:SetTooltip(n)local o=self.Tooltip if not o then return end if
o==n then return end o.Visible=false self.Tooltip=n end function b:
SetItemTooltip(n,o)local p,q=self.Elements,self.Container local r=p:Tooltip{
Visible=false,Parent=q.Overlays}task.spawn(o,r)b:DetectHover(n,{MouseMove=true,
MouseEnter=true,OnInput=function(s,u)r:Update(s)end})end function b:CheckFlags(n
,o)for p,q in next,n do local r=o[p]if not r then continue end q(r)end end
function b:GetThemeKey(n,o)local p=self.ThemeConfigs local q=p.DarkTheme n=n or
q if typeof(n)=='string'then n=p[n]end local r,s=n.BaseTheme,n.Values local u=s[
o]if u then return u end if r then return self:GetThemeKey(r,o)end end local n=b
.Elements n.__index=n function n:GetParent()return self.ParentCanvas end
function n:TagElements(o)local p=self.WindowClass if p then p:TagElements(o)end
end function n:GetThemeKey(o)local p=self.WindowClass if p then return p:
GetThemeKey(o)end return b:GetThemeKey(nil,o)end function n:SetColorTags(o,p)
local r=self.WindowClass if not r then return end local s,u=r.TagsList,r.Theme b
:MultiUpdateColors{Animate=p,Theme=u,TagsList=s,Objects=o}end function n:
SetElementFocused(o,p)local r,s,u,v=self.WindowClass,b.HasTouchScreen,p.Focused,
p.Animation b:SetAnimationsEnabled(not u)if not u and v then v:Refresh()end if
not r then return end if not s then return end local w=r.ContentCanvas w.
Interactable=not u end b:DefineElement('Dropdown',{Base={Disabled=false,MaxSizeY
=220,MinSizeX=100,OnClosed=d,OnSelected=d},Create=function(o,p)p.Parent=b.
Container.Overlays local r,s,u,v,w,x,y=p.Selected,p.ParentObject,p.Items,p.
MaxSizeY,p.MinSizeX,p.OnClosed,p.OnSelected if not s then return end local z,A=o
:OverlayScroll(p)local B=A.UIStroke local C,D,E,F=B.Thickness,s.AbsolutePosition
,b:GetContentSize(s,true),b:DetectHover(A,{MouseOnly=true,OnInput=function(C,D)
if C then return end p:Close()end})function p:Close()if self.Disabled then
return end self.Disabled=true F:Disconnect()A:Remove()x()end local G,H=function(
G)p:Close()y(G)end,A.Parent.AbsolutePosition A.Position=UDim2.fromOffset(D.X-H.X
+C,D.Y-H.Y+E.Y)for I,J in u do local K,L=typeof(I)~='number'and I or J,I==r or J
==r z:Selectable{Text=tostring(K),Selected=L,ZIndex=6,Callback=function()return
G(K)end}end local K=z:GetCanvasSize()local L,M=math.clamp(K.Y,E.Y,v),math.clamp(
E.X-C,w,math.huge)A.Size=UDim2.fromOffset(M,L)return p,A end})b:DefineElement(
'Tooltip',{Base={Offset=15},Create=function(o,p)local r,s=p.Offset,o:Overlay(p)
local u=b:MergeMetatables(p,s)function p:Update(v)s.Visible=v if not v then
return end b:SetTooltip(s)local w,x=b:GetMouseLocation()local y=s.Parent.
AbsolutePosition s.Position=UDim2.fromOffset(w-y.X+r,x-y.Y+r)end return u,s end}
)b:DefineElement('OverlayScroll',{Base={},Create=function(o,p)local r,s=o.
WindowClass,b:InsertPrefab('OverlayScroll',p)local u=s.ContentFrame local v=b:
MakeCanvas{Element=u,WindowClass=r,Class=o}function p:GetCanvasSize()return u.
AbsoluteCanvasSize end local w=b:MergeMetatables(p,v)return w,s end})b:
DefineElement('Overlay',{Base={},Create=function(o,p)local r,s=o.WindowClass,b:
InsertPrefab('Overlay',p)local u=b:MakeCanvas{Element=s,WindowClass=r,Class=o}
return u,s end})b:DefineElement('Image',{Base={Image='',Callback=d},Create=
function(o,p)local r=p.Image p.Image=b:CheckAssetUrl(r)local s=b:InsertPrefab(
'Image',p)s.Activated:Connect(function(...)local u=p.Callback return u(s,...)end
)return s end})b:DefineElement('VideoPlayer',{Base={Video='',Callback=d},Create=
function(o,p)local r=p.Video p.Video=b:CheckAssetUrl(r)local s=b:InsertPrefab(
'VideoPlayer',p)return s end})b:DefineElement('Button',{Base={Text='Button',
DoubleClick=false,Callback=d},Create=function(o,p)local r,s=b:InsertPrefab(
'Button',p),p.DoubleClick b:ConnectMouseEvent(r,{DoubleClick=s,Callback=function
(...)local u=p.Callback return u(r,...)end})return r end})b:DefineElement(
'Selectable',{Base={Text='Selectable',Callback=d,Selected=false,Disabled=false,
Size=UDim2.fromScale(1,0),AnimationTags={Selected='Buttons',Unselected=
'TransparentButtons'}},Create=function(o,p)local r,s,u=p.Selected,p.Disabled,b:
InsertPrefab('Button',p)local v=b:MergeMetatables(p,u)u.Activated:Connect(
function(...)local w=p.Callback return w(u,...)end)function p:SetSelected(w)
local x=self.AnimationTags local y=w and x.Selected or x.Unselected self.
Selected=w b:SetAnimation(u,y)end function p:SetDisabled(w)self.Disabled=w u.
Interactable=not w end p:SetSelected(r)p:SetDisabled(s)return v,u end})b:
DefineElement('ImageButton',{Base={ElementStyle='Button',Callback=d},Create=n.
Image})b:DefineElement('SmallButton',{Base={Text='Button',PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),
ColorTag='Button',ElementStyle='Button',Callback=d},Create=n.Button})b:
DefineElement('Keybind',{Base={Label='Keybind',ColorTag='Frame',Value=nil,
DeleteKey=Enum.KeyCode.Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=
false,Callback=d,OnKeybindSet=d,OnBlacklistedKeybindSet=d,KeyBlacklist={},
UiPadding=UDim.new(),AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.4,0,
0,19)},Create=function(o,p)local r,s,u,v,w=p.Value,p.Label,p.Disabled,p.
KeyBlacklist,b:InsertPrefab('Button',p)local x,y=b:MergeMetatables(p,w),Instance
.new'Folder'local z=o:Label{Parent=y,Text=s,Position=UDim2.new(1,5,0.5),
AnchorPoint=Vector2.new(0,0.5)}y.Parent=w local A,B=function(A,...)return A(w,
...)end,function(A)local B=table.find(v,A)return B end function p:SetDisabled(C)
self.Disabled=C w.Interactable=not C o:SetColorTags({[z]=C and'LabelDisabled'or
'Label'},true)end function p:SetValue(C)local D,E=self.OnKeybindSet,self.
DeleteKey if C==E then C=nil end self.Value=C w.Text=C and C.Name or'Not set'A(D
,C)end function p:WaitForNewKey()self._WaitingForNewKey=true w.Text='...'w.
Interactable=false end local C=function(C)local D,E=p.OnBlacklistedKeybindSet,p.
Value if not j.WindowFocused then return end if B(C)then A(D,C)return end w.
Interactable=true p._WaitingForNewKey=false if C.Name=='Unknown'then return p:
SetValue(E)end p:SetValue(C)end local D=function(D,E)local F,G,H,I,J,K=p.
IgnoreGameProcessed,p.DeleteKey,p.Enabled,p.Value,p.Callback,D.KeyCode if p.
_WaitingForNewKey then C(K)return end if not H and w.Interactable then return
end if not F and E then return end if K==G then return end if K~=I then return
end A(J,K)end p:SetValue(r)p:SetDisabled(u)p.Connection=j.InputBegan:Connect(D)w
.Activated:Connect(function()p:WaitForNewKey()end)b:SetAnimation(w,'Inputs')
return x,w end})b:DefineElement('ArrowButton',{Base={Icon=b.Icons.Arrow,
Direction='Left',Size=UDim2.fromOffset(21,21),ColorTag='Button',Rotations={Left=
180,Right=0}},Create=function(o,p)local r,s=p.Direction,p.Rotations local u=s[r]
p.IconRotation=u local v=b:InsertPrefab('ArrowButton',p)v.Activated:Connect(
function(...)local w=p.Callback return w(v,...)end)return v end})b:
DefineElement('Label',{Base={Font='Inconsolata'},Create=function(o,p)local r,s,u
,v,w,x,y,z=p.Bold,p.Italic,p.Font,p.FontFace,Enum.FontWeight.Medium,Enum.
FontWeight.Bold,Enum.FontStyle.Normal,Enum.FontStyle.Italic local A,B,C=r and x
or w,s and z or y,r or s if not v and C then p.FontFace=Font.fromName(u,A,B)end
return b:InsertPrefab('Label',p)end})b:DefineElement('Error',{Base={RichText=
true,TextWrapped=true},ColorData={Error={TextColor3='ErrorText',FontFace=
'TextFont'}},Create=function(o,p)local r=p.Text p.Text=`<b>\u{26d4} Error:</b> {
r}`return o:Label(p)end})local o={ColorTags={BGSelected={[true]='SelectedTab',[
false]='DeselectedTab'},LabelSelected={[true]='SelectedTabLabel',[false]=
'DeselectedTabLabel'}}}function o:UpdateButton(p,r)local s,u=p.IsSelected,p.Tab
local v=u.Button if s==r then return end p.IsSelected=r local w,x,y=self.
NoAnimation,self.WindowClass,self.ColorTags local z,A,B,C=x.Theme,x.TagsList,y.
BGSelected,y.LabelSelected b:MultiUpdateColors{Animate=not w,Theme=z,TagsList=A,
Objects={[v]=B[r],[v.Label]=C[r]}}end function o:SetActiveTab(p)local r,s,u,v,w=
self.Tabs,self.NoAnimation,typeof(p)=='string',false for x,y in next,r do local
z,A,B,C=y.Content,y.Canvas,y.Name,false if u then C=B==p else C=A==p end if C
then v=z.Visible w=z end z.Visible=C self:UpdateButton(y,C)end if s then return
self end if v then return self end if not w then return self end m:Tween{Object=
w,NoAnimation=s,StartProperties={Position=UDim2.fromOffset(0,5)},EndProperties={
Position=UDim2.fromOffset(0,0)}}return self end function o:RemoveTab(p)local r,s
=self.Tabs,typeof(p)=='string'for u,v in r do local w,x,y,z,A=v.Canvas,v.Name,v.
Content,v.Tab,false if s then A=x==p else A=w==p end if not A then continue end
table.remove(r,u)y:Destroy()z:Destroy()end return self end function o:CreateTab(
p)b:CheckConfig(p,{Name='Tab',AutoSize='Y',Closeable=false})local r,s,u,v,w,x,y,
z,A,B=self.AutoSelectNewTabs,self.ParentCanvas,self.WindowClass,self.Templates,
self.TabsBar,self.Body,self.Tabs,p.Name,p.Icon,p.AutoSize local C,D,E=#y<=0 and
r,v.Page,v.TabButton local F=E:Clone()local G=F.Button local H,I=G.Label,b:
GetChildOfClass(G,'UIPadding')H.Text=tostring(z)F.Parent=w F.Visible=true local
J=D:Clone()local K=b:GetChildOfClass(J,'UIPadding')b:SetProperties(J,{Parent=x,
Name=z,Visible=C})local L=b:MakeCanvas{Element=J,WindowClass=u,Class=self}local
M,N,O=function()self:SetActiveTab(L)end,{Name=z,Tab=F,Canvas=L,Content=J},{
Closeable=function()local M=s:RadioButton{Parent=G,Visible=not self.NoClose,Icon
=b.Icons.Close,IconSize=UDim2.fromOffset(11,11),LayoutOrder=3,ZIndex=2,
UsePropertiesList=true,Callback=function()self:RemoveTab(L)end}local N=M.Icon b:
SetAnimation(N,{Connections={MouseEnter={ImageTransparency=0},MouseLeave={
ImageTransparency=1}},Init='MouseLeave'},F)end}G.Activated:Connect(M)b:
CheckFlags(O,p)table.insert(y,N)u:TagElements{[G]='Tab',[H]='TabLabel',[I]=
'TabSelectorTabPadding',[K]='TabSelectorPagePadding'}b:SetProperties(J,{
AutomaticSize=Enum.AutomaticSize[B],Size=UDim2.fromScale(B=='Y'and 1 or 0,B=='X'
and 1 or 0)})b:SetAnimation(G,'Buttons')b:ApplyFlags{Object=G,Class={Icon=A}}
self:UpdateButton(N,C)return L end b:DefineElement('TabSelector',{Base={
NoTabsBar=false,AutoSelectNewTabs=true},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabSelectorLine={Color=
'TabBgActive'},TabSelectorTabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabSelectorPagePadding={PaddingBottom=
'TabPadding',PaddingLeft='TabPadding',PaddingRight='TabPadding',PaddingTop=
'TabPadding'}},Create=function(p,r)local s,u,v,w=p.WindowClass,r.NoTabsBar,b:
InsertPrefab('TabSelector',r),NewClass(o)local x,y=v.TabsBar,v.Body local z,A,B=
x.TemplateButton,y.PageTemplate,x:FindFirstChildOfClass'UIStroke'z.Visible=false
A.Visible=false x.Visible=not u Merge(w,r)Merge(w,{Templates={TabButton=z,Page=A
},ParentCanvas=p,WindowClass=s,Body=y,TabsBar=x,Tabs={}})p:TagElements{[x]=
'TabSelectorTabsBar',[B]='TabSelectorLine'}return w,v end})b:DefineElement(
'RadioButton',{Base={Callback=d},Create=function(p,r)local s=b:InsertPrefab(
'RadioButton',r)s.Activated:Connect(function(...)local u=r.Callback return u(s,
...)end)return s end})b:DefineElement('Checkbox',{Base={Label='Checkbox',IsRadio
=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.fromScale(1,1),
UntickedImageSize=UDim2.fromScale(0,0),Callback=d,Disabled=false},Create=
function(p,r)local s,u,v,w,x,y,z=r.IsRadio,r.Value,r.Label,r.TickedImageSize,r.
UntickedImageSize,r.Disabled,b:InsertPrefab('CheckBox',r)local A,B=b:
MergeMetatables(r,z),z.Tickbox local C=B.Tick C.Image=b.Icons.Checkmark local D,
E,F,G=B:FindFirstChildOfClass'UIPadding',b:GetChildOfClass(B,'UICorner'),p:Label
{Text=v,Parent=z,LayoutOrder=2},UDim.new(0,3)if s then C.ImageTransparency=1 C.
BackgroundTransparency=0 E.CornerRadius=UDim.new(1,0)else G=UDim.new(0,2)end b:
SetProperties(D,{PaddingBottom=G,PaddingLeft=G,PaddingRight=G,PaddingTop=G})
local H,I=function(...)local H=r.Callback return H(A,...)end,function(H,I)local
J,K=p:GetThemeKey'AnimationTweenInfo',H and w or x m:Tween{Object=C,Tweeninfo=J,
NoAnimation=I,EndProperties={Size=K}}end function r:SetDisabled(J)self.Disabled=
J z.Interactable=not J p:SetColorTags({[F]=J and'LabelDisabled'or'Label'},true)
end function r:SetTicked(J,K)self.Value=J I(J,K)H(J)return self end function r:
Toggle()local J=not self.Value self.Value=J self:SetTicked(J)return self end
local J=function()r:Toggle()end z.Activated:Connect(J)B.Activated:Connect(J)r:
SetTicked(u,true)r:SetDisabled(y)b:SetAnimation(B,'Buttons',z)p:TagElements{[C]=
'CheckMark',[B]='Checkbox'}return A,z end})b:DefineElement('Radiobox',{Base={
IsRadio=true,CornerRadius=UDim.new(1,0)},Create=function(p,r)return p:Checkbox(r
)end})b:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label='Histogram'}
,Create=function(p,r)local s,u,v=r.Label,r.Points,b:InsertPrefab('Histogram',r)
local w,x=b:MergeMetatables(r,v),v.Canvas local y=x.PointTemplate y.Visible=
false local z=(p:Label{Text=s,Parent=v,Position=UDim2.new(1,5)})b:
SetItemTooltip(v,function(A)ValueLabel=A:Label()end)Merge(r,{_Plots={},_Cache={}
})function r:GetBaseValues()local A,B=self.Minimum,self.Maximum if A and B then
return A,B end local C=self._Plots for D,E in C do local F=E.Value if not A or F
<A then A=F end if not B or F>B then B=F end end return A,B end function r:
UpdateGraph()local A,B,C=self._Plots,self:GetBaseValues()if not B or not C then
return end local D=C-B for E,F in A do local G,H=F.Point,F.Value local I=(H-B)/D
I=math.clamp(I,0.05,1)G.Size=UDim2.fromScale(1,I)end return self end function r:
Plot(A)local B,C,D=self._Plots,{},y:Clone()local E=D.Bar b:SetProperties(D,{
Parent=x,Visible=true})local F,G=b:DetectHover(D,{MouseEnter=true,OnInput=
function()C:UpdateTooltip()end}),{Object=D,Point=E,Value=A}function C:
UpdateTooltip()local H=C:GetPointIndex()ValueLabel.Text=`{H}:\t{G.Value}`end
function C:SetValue(H)G.Value=H r:UpdateGraph()if F.Hovering then self:
UpdateTooltip()end end function C:GetPointIndex()return table.find(B,G)end
function C:Remove(H)table.remove(B,self:GetPointIndex())D:Remove()r:UpdateGraph(
)end table.insert(B,G)self:UpdateGraph()b:SetAnimation(E,'Plots',D)p:TagElements
{[E]='Plot'}return C end function r:PlotGraph(A)local B=self._Cache local C=#B-#
A if C>=1 then for D=1,C do local E=table.remove(B,D)if E then E:Remove()end end
end for D,E in A do local F=B[D]if F then F:SetValue(E)continue end B[D]=self:
Plot(E)end return self end if u then r:PlotGraph(u)end return w,v end})b:
DefineElement('Viewport',{Base={IsRadio=true},Create=function(p,r)local s=b:
InsertPrefab('Viewport',r)local u,v=b:MergeMetatables(r,s),s.Viewport local w,x,
y=v.WorldModel,r.Model,r.Camera if not y then y=b:CreateInstance('Camera',v)y.
CFrame=CFrame.new(0,0,0)end Merge(r,{Camera=y,WorldModel=w,Viewport=v})function
r:SetCamera(z)v.CurrentCamera=z self.Camera=z return self end function r:
SetModel(z,A)local B=self.Clone w:ClearAllChildren()if B then z=z:Clone()end if
A then z:PivotTo(A)end z.Parent=w self.Model=z return z end if x then r:
SetModel(x)end r:SetCamera(y)return u end})b:DefineElement('InputText',{Base={
Value='',Placeholder='',Label='Input text',Callback=d,MultiLine=false,NoAutoTag=
true,Disabled=false},Create=function(p,r)local s,u,v,w,x=r.MultiLine,r.
Placeholder,r.Label,r.Disabled,b:InsertPrefab('InputBox',r)local y=x.Frame local
z,A=y.Input,b:MergeMetatables(r,x)p:Label{Parent=x,Text=v,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,5),LayoutOrder=
2}b:SetProperties(z,{PlaceholderText=u,MultiLine=s})local B=function(...)local B
=r.Callback B(A,...)end function r:SetValue(C)z.Text=tostring(C)self.Value=C
return self end function r:SetDisabled(C)self.Disabled=C x.Interactable=not C p:
SetColorTags({[v]=C and'LabelDisabled'or'Label'},true)end function r:Clear()z.
Text=''return self end local C=function()local C=z.Text r.Value=C B(C)end z:
GetPropertyChangedSignal'Text':Connect(C)r:SetDisabled(w)p:TagElements{[z]=
'Frame'}return A,x end})b:DefineElement('InputInt',{Base={Value=0,Increment=1,
Placeholder='',Label='Input Int',Callback=d},Create=function(p,r)local s,u,v,w,x
,y=r.Value,r.Placeholder,r.Label,r.Disabled,r.NoButtons,b:InsertPrefab(
'InputBox',r)local z,A=b:MergeMetatables(r,y),y.Frame local B=A.Input B.
PlaceholderText=u local C,D,E,F=p:Button{Text='-',Parent=A,LayoutOrder=2,Ratio=1
,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.
fromScale(1,1),Visible=not x,Callback=function()r:Decrease()end},p:Button{Text=
'+',Parent=A,LayoutOrder=3,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,
FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not x,Callback=
function()r:Increase()end},p:Label{Parent=y,Text=v,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,5),LayoutOrder=
4},function(...)local C=r.Callback C(z,...)end function r:Increase()local G,H=
self.Value,self.Increment r:SetValue(G+H)end function r:Decrease()local G,H=self
.Value,self.Increment r:SetValue(G-H)end function r:SetDisabled(G)self.Disabled=
G y.Interactable=not G p:SetColorTags({[E]=G and'LabelDisabled'or'Label'},true)
end function r:SetValue(G)local H,I,J=self.Value,self.Minimum,self.Maximum G=
tonumber(G)if not G then G=H end if I and J then G=math.clamp(G,I,J)end B.Text=G
r.Value=G F(G)return self end local G=function()local G=B.Text r:SetValue(G)end
r:SetValue(s)r:SetDisabled(w)B.FocusLost:Connect(G)p:TagElements{[D]='Button',[C
]='Button',[B]='Frame'}return z,y end})b:DefineElement('InputTextMultiline',{
Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,ColorTag='Frame'},Create=
function(p,r)return p:Console(r)end})b:DefineElement('Console',{Base={Enabled=
true,ReadOnly=false,Value='',TextWrapped=false,RichText=false,LineNumbers=false,
LinesFormat='%s',Callback=d},Create=function(p,r)local s,u,v,w,x,y=r.ReadOnly,r.
LineNumbers,r.Fill,r.Value,r.Placeholder,b:InsertPrefab('Console',r)local z,A,B=
b:MergeMetatables(r,y),y.Source,y.Lines b:SetProperties(A,r)b:SetProperties(A,{
TextEditable=not s,Parent=y,PlaceholderText=x})B.Visible=u function r:
UpdateLineNumbers()local C,D=self.LineNumbers,self.LinesFormat if not C then
return end local E=#A.Text:split'\n'B.Text=''for F=1,E do local G,H=D:format(F),
F~=E and'\n'or''B.Text..=`{G}{H}`end local F=B.AbsoluteSize.X A.Size=UDim2.new(1
,-F,0,0)return self end function r:CheckLineCount()local C=r.MaxLines if not C
then return end local D=A.Text local E=D:split'\n'if#E>C then local F=`{E[1]}\\n`
local G=D:sub(#F)self:SetValue(G)end return self end function r:UpdateScroll()
local C=y.AbsoluteCanvasSize y.CanvasPosition=Vector2.new(0,C.Y)return self end
function r:SetValue(C)if not self.Enabled then return end A.Text=tostring(C)self
:Update()return self end function r:GetValue()return A.Text end function r:Clear
()A.Text=''self:Update()return self end function r:AppendText(...)local C,D='\n'
..b:Concat({...},' '),self:GetValue()self:SetValue(D..C)self:CheckLineCount()
return self end function r:Update()local C=r.AutoScroll r:UpdateLineNumbers()if
C then r:UpdateScroll()end end local C=function()local C=r:GetValue()r:Update()r
.Callback(C)end r:SetValue(w)p:TagElements{[A]='ConsoleText'}A:
GetPropertyChangedSignal'Text':Connect(C)return z,y end})b:DefineElement('Table'
,{Base={VerticalAlignment=Enum.VerticalAlignment.Top,RowBackground=false,
RowBgTransparency=0.87,Border=false},Create=function(p,r)local s,u,v,w,x,y,z=p.
WindowClass,r.RowBgTransparency,r.RowBackground,r.Border,r.VerticalAlignment,r.
MaxColumns,b:InsertPrefab('Table',r)local A,B,C,D=b:MergeMetatables(r,z),z.
RowTemp,0,{}function r:Row(E)E=E or{}local F,G,H,I=E.IsHeader,0,{},B:Clone()b:
SetProperties(I,{Name='Row',Visible=true,Parent=z})local J=I:
FindFirstChildOfClass'UIListLayout'J.VerticalAlignment=x if F then p:TagElements
{[I]='Header'}else C+=1 end if v and not F then local K=C%2~=1 and u or 1 I.
BackgroundTransparency=K end local K={}function K:Column(L)local M=I.ColumnTemp:
Clone()b:SetProperties(M,{Visible=true,Parent=I,Name='Column'})local N=M:
FindFirstChildOfClass'UIStroke'N.Enabled=w return b:MakeCanvas{Element=M,
WindowClass=s,Class=A}end function K:NextColumn()G+=1 local L=G%y+1 local M=H[L]
if not M then M=self:Column()H[L]=M end return M end table.insert(D,K)local L=b:
MergeMetatables(K,I)return L end function r:NextRow()return self:Row()end
function r:HeaderRow()return self:Row{IsHeader=true}end function r:ClearRows()C=
0 for E,F in next,z:GetChildren()do if not F:IsA'Frame'then continue end if F==B
then continue end F:Destroy()end return r end return A,z end})b:DefineElement(
'List',{Base={Spacing=5,HorizontalFlex=Enum.UIFlexAlignment.None,VerticalFlex=
Enum.UIFlexAlignment.None,HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top},Create=function(p,r)local s,u,v,w,
x,y,z=p.WindowClass,r.Spacing,r.HorizontalFlex,r.VerticalFlex,r.
HorizontalAlignment,r.VerticalAlignment,b:InsertPrefab('List',r)local A,B=b:
MergeMetatables(r,z),z.UIListLayout b:SetProperties(B,{Padding=UDim.new(0,u),
HorizontalFlex=v,VerticalFlex=w,HorizontalAlignment=x,VerticalAlignment=y})local
C=b:MakeCanvas{Element=z,WindowClass=s,Class=A}return C,z end})b:DefineElement(
'CollapsingHeader',{Base={Title='Collapsing Header',Icon=b.Icons.Arrow,Collapsed
=true,Offset=0,NoAutoTag=true,NoAutoFlags=true},Create=function(p,r)local s,u,v,
w,x,y,z,A,B=r.Title,r.Icon,r.Collapsed,r.ElementStyle,r.Offset,r.
TitleBarProperties,r.OpenOnDoubleClick,r.OpenOnArrow,b:InsertPrefab(
'CollapsingHeader',r)local C=B.TitleBar local D=C.Toggle.Icon D.Image=u local E,
F,G=p:Label{ColorTag='CollapsingHeader',Text=s,Parent=C,LayoutOrder=2},p:Indent{
Parent=B,Offset=x,LayoutOrder=2,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.None,PaddingTop=UDim.new(0,4),UsePropertiesList=true}function r:
SetCollapsed(H)self.Collapsed=H local I,J,K=b:GetContentSize(G),F:GetThemeKey
'AnimationTweenInfo',UDim2.fromScale(1,0)local L=K+UDim2.fromOffset(0,I.Y)m:
HeaderCollapse{Tweeninfo=J,Collapsed=H,Toggle=D,Resize=G,Hide=G,ClosedSize=K,
OpenSize=L}return self end local H=function()r:SetCollapsed(not r.Collapsed)end
if y then b:ApplyFlags{Object=C,Class=y}end if not A then b:ConnectMouseEvent(C,
{DoubleClick=z,Callback=H})end D.Activated:Connect(H)r:SetCollapsed(v)b:
ApplyStyle(C,w)F:TagElements{[C]='CollapsingHeader'}return F,B end})b:
DefineElement('TreeNode',{Base={Offset=21,TitleBarProperties={Size=UDim2.new(1,0
,0,14)}},Create=function(p,r)return p:CollapsingHeader(r)end})b:DefineElement(
'Separator',{Base={NoAutoTag=true,NoAutoTheme=true},Create=function(p,r)local s,
u=r.Text,b:InsertPrefab('SeparatorText',r)p:Label{Text=tostring(s),Visible=s~=
nil,Parent=u,LayoutOrder=2,Size=UDim2.new(),PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4)}p:TagElements{[u.Left]='Separator',[u.Right]=
'Separator'}return u end})b:DefineElement('Canvas',{Base={Scroll=false},Create=
function(p,r)local s,u=p.WindowClass,r.Scroll local v=u and'ScrollingCanvas'or
'Canvas'local w=b:InsertPrefab(v,r)local x=b:MakeCanvas{Element=w,WindowClass=s,
Class=r}return x,w end})b:DefineElement('Region',{Base={Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y},Create=function(p,r)local s,u=p.WindowClass,
r.Scroll local v=u and'ScrollingCanvas'or'Canvas'local w=b:InsertPrefab(v,r)
local x=b:MakeCanvas{Element=w,WindowClass=s,Class=r}return x,w end})b:
DefineElement('Group',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},
Create=function(p,r)local s,u=p.WindowClass,b:InsertPrefab('Group',r)local v=b:
MakeCanvas{Element=u,WindowClass=s,Class=r}return v,u end})b:DefineElement(
'Indent',{Base={Offset=15,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),
PaddingRight=UDim.new()},Create=function(p,r)local s=r.Offset r.PaddingLeft=UDim
.new(0,s)return p:Canvas(r)end})b:DefineElement('BulletText',{Base={},Create=
function(p,r)local s=r.Rows for u,v in next,s do local w=p:Bullet(r)w:Label{Text
=tostring(v),LayoutOrder=2,Size=UDim2.fromOffset(0,14)}end end})b:DefineElement(
'Bullet',{Base={Padding=3,Icon=b.Icons.Dot,IconSize=UDim2.fromOffset(5,5)},
Create=function(p,r)local s,u,v=p.WindowClass,r.Padding,b:InsertPrefab('Bullet',
r)local w,x=b:MakeCanvas{Element=v,WindowClass=s,Class=p},v.UIListLayout x.
Padding=UDim.new(0,u)return w,v end})b:DefineElement('Row',{Base={Spacing=4,
Expanded=false},Create=function(p,r)local s,u,v,w=p.WindowClass,r.Spacing,r.
Expanded,b:InsertPrefab('Row',r)local x,y=b:MergeMetatables(r,w),w:
FindFirstChildOfClass'UIListLayout'y.Padding=UDim.new(0,u)function r:Expand()y.
HorizontalFlex=Enum.UIFlexAlignment.Fill return self end local z=b:MakeCanvas{
Element=w,WindowClass=s,Class=x}if v then r:Expand()end return z,w end})b:
DefineElement('SliderBase',{Base={Format='%.f',Label='',Type='Slider',Callback=d
,NoGrab=false,NoClick=false,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=
false},Create=function(p,r)local s,u,v,w,x,y,z,A,B=r.Value or r.Minimum,r.Format
,r.Label,r.NoAnimation,r.NoGrab,r.NoClick,r.Type,r.Disabled,b:InsertPrefab
'Slider'local C=B.Track local D,E,F,G=C.Grab,C.ValueText,C:FindFirstChildOfClass
'UIPadding',b:MergeMetatables(r,B)local H,I,J=D.AbsoluteSize,b:SetAnimation(B,
'Inputs'),p:Label{Parent=B,Text=v,Position=UDim2.new(1,5),Size=UDim2.fromScale(0
,1)}Merge(r,{Grab=D,Name=v})if z=='Slider'then C.Position=UDim2.fromOffset(H.X/2
,0)C.Size=UDim2.new(1,-H.X,1,0)end local K,L={Slider=function(K)return{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(K,0.5)}end,Progress=
function(K)return{Size=UDim2.fromScale(K,1)}end,Snap=function(K,L,M,N)local O=(
math.round(L)-M)/N return{Size=UDim2.fromScale(1/N,1),Position=UDim2.fromScale(O
,0.5)}end},function(...)local K=r.Callback return K(G,...)end function r:
SetDisabled(M)self.Disabled=M B.Interactable=not M p:SetColorTags({[J]=M and
'LabelDisabled'or'Label'},true)end function r:SetValueText(M)E.Text=tostring(M)
end function r:SetValue(M,N)local O,P,Q,R=p:GetThemeKey'AnimationTweenInfo',r.
Minimum,r.Maximum,M local S=Q-P if not N then R=(M-P)/S else M=P+(S*R)end R=math
.clamp(R,0,1)local T=K[z](R,M,P,Q)m:Tween{Object=D,Tweeninfo=O,NoAnimation=w,
EndProperties=T}self.Value=M self:SetValueText(u:format(M,Q))L(M)return self end
local M,N=function(M)p:SetColorTags({[B]=M and'FrameActive'or'Frame'},true)p:
SetElementFocused(B,{Focused=M,Animation=I})end,function()if r.Disabled then
return end if r.ReadOnly then return end return true end local O=function(O)if
not N()then return end local P,Q,R=C.AbsolutePosition.X,C.AbsoluteSize.X,O.X
local S=R-P local T=math.clamp(S/Q,0,1)r:SetValue(T,true)end local P,Q=function(
...)if not N()then return end M(true)if not y then O(...)end end,function()M(
false)end D.Visible=not x r:SetValue(s)r:SetDisabled(A)p:TagElements{[E]='Label'
,[D]='SliderGrab'}b:ConnectDrag(C,{DragStart=P,DragMovement=O,DragEnd=Q})return
G,B end})b:DefineElement('SliderEnum',{Base={Items={},Label='Slider Enum',Type=
'Snap',Minimum=1,Maximum=10,Value=1,Callback=d,ColorTag='Frame'},Create=function
(p,r)local s,u=r.Callback,r.Value local v=function(v,w)w=math.round(w)local x=v.
Items v.Maximum=#x return x[w]end r.Callback=function(w,x,y)local z=v(w,x)w:
SetValueText(z)r.Value=z return s(w,z)end v(r,u)return p:SliderBase(r)end})b:
DefineElement('SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create=n.
SliderBase})b:DefineElement('SliderFloat',{Base={Label='Slider Float',Format=
'%.3f',ColorTag='Frame'},Create=n.SliderBase})b:DefineElement('DragInt',{Base={
Format='%.f',Label='Drag Int',Callback=d,Minimum=0,Maximum=100,ColorTag='Frame',
Disabled=false},Create=function(p,r)local s,u,v,w,x=r.Value or r.Minimum,r.
Format,r.Label,r.Disabled,b:InsertPrefab'Slider'local y,z=b:MergeMetatables(r,x)
,x.Track local A,B=z.ValueText,z.Grab B.Visible=false local C,D,E,F,G,H=b:
GetChildOfClass(z,'UIDragDetector'),p:Label{Parent=x,Text=v,Position=UDim2.new(1
,7),Size=UDim2.fromScale(0,1)},0,0,b:SetAnimation(x,'Inputs'),function(...)local
C=r.Callback return C(y,...)end function r:SetValue(I,J)local K,L=self.Minimum,
self.Maximum local M=L-K if not J then E=((I-K)/M)*100 else I=K+(M*(E/100))end I
=math.clamp(I,K,L)self.Value=I A.Text=u:format(I,L)H(I)return self end function
r:SetDisabled(I)self.Disabled=I p:SetColorTags({[D]=I and'LabelDisabled'or
'Label'},true)end local I,J=function(I)p:SetColorTags({[x]=I and'FrameActive'or
'Frame'},true)p:SetElementFocused(x,{Focused=I,Animation=G})end,function()if r.
Disabled then return end if r.ReadOnly then return end return true end local K,L
,M=function(K)if not J()then return end I(true)InputBeganPosition=K F=E end,
function(K)if not J()then return end local L=K.X-InputBeganPosition.X local M=F+
(L/2)E=math.clamp(M,0,100)r:SetValue(E,true)end,function()I(false)end r:
SetValue(s)r:SetDisabled(w)b:ConnectDrag(z,{DragStart=K,DragEnd=M,DragMovement=L
})return y,x end})b:DefineElement('DragFloat',{Base={Format='%.3f',Label=
'Drag Float',ColorTag='Frame'},Create=n.DragInt})b:DefineElement('MultiElement',
{Base={Callback=d,Label='',Disabled=false,BaseInputConfig={},InputConfigs={},
Value={},Minimum={},Maximum={},MultiCallback=d},Create=function(p,r)local s,u,v,
w,x,y,z,A=r.Label,r.BaseInputConfig,r.InputConfigs,r.InputType,r.Disabled,r.
Value,r.Minimum,r.Maximum assert(w,'No input type provided for MultiElement')
local B=p:Row{Spacing=5}local C,D,E,F=B:Row{Size=UDim2.fromScale(0.65,0),
Expanded=true},B:Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=s},b:
MergeMetatables(r,B),{}local G=function()local G={}for H,I in F do G[H]=I:
GetValue()end r.Value=G return G end local H=function()local H=r.MultiCallback
if#F~=#v then return end local I=G()H(E,I)end function r:SetDisabled(I)self.
Disabled=I p:SetColorTags({[D]=I and'LabelDisabled'or'Label'},true)for J,K in F
do K:SetDisabled(I)end end function r:SetValue(I)for J,K in I do local L=F[J]
assert(L,`No input object for index: {J}`)L:SetValue(K)end end u=Copy(u,{Size=
UDim2.new(1,0,0,19),Label='',Callback=H})for I,J in v do local K=Copy(u,J)b:
CheckConfig(K,{Minimum=z[I],Maximum=A[I]})local L=C[w](C,K)table.insert(F,L)end
H()Merge(r,{Row=C,Inputs=F})r:SetDisabled(x)r:SetValue(y)return E,B end})local p
=function(p,r,s,u)b:DefineElement(p,{Base={Label=p,Callback=d,InputType=r,
InputConfigs=table.create(s,{}),BaseInputConfig={}},Create=function(v,w)local x=
(w.BaseInputConfig)if u then Merge(x,u)end b:CheckConfig(x,{ReadOnly=w.ReadOnly,
Format=w.Format})w.MultiCallback=function(...)local y=w.Callback y(...)end
return v:MultiElement(w)end})end local r=function(r,s,u,v)b:DefineElement(r,{
Base={Label=r,Callback=d,Value=b.Accent.Light,Disabled=false,Minimum={0,0,0},
Maximum={255,255,255},BaseInputConfig={},InputConfigs={[1]={Format='R: %.f'},[2]
={Format='G: %.f'},[3]={Format='B: %.f'}}},Create=function(w,x)local y,z,A,B=x.
BaseInputConfig,x.Value,x.Disabled,Copy(x,{Value={1,1,1},Callback=function(y,...
)if x.ValueChanged then x:ValueChanged(...)end end})local C=w[s](w,B)local D,E=b
:MergeMetatables(x,C),C.Row local F,G=E:Button{BackgroundTransparency=0,Size=
UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=1,ColorTag='',ElementStyle=''}
,function(...)local F=x.Callback return F(D,...)end local H=function(H)F.
BackgroundColor3=H G(H)end function x:ValueChanged(I)local J,K,L=I[1],I[2],I[3]
local M=Color3.fromRGB(J,K,L)self.Value=M H(M)end function x:SetValue(I)self.
Value=I H(I)C:SetValue{math.round(I.R*255),math.round(I.G*255),math.round(I.B*
255)}end x:SetValue(z)return D,E end})end local s=function(s,u,v,w)b:
DefineElement(s,{Base={Label=s,Callback=d,Disabled=false,Value=CFrame.new(10,10,
10),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),BaseInputConfig={}
,InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]={Format='Z: %.f'}
}},Create=function(x,y)local z,A,B,C,D=y.BaseInputConfig,y.Value,y.Disabled,y.
Maximum,y.Minimum local E=Copy(y,{Maximum={C.X,C.Y,C.Z},Minimum={D.X,D.Y,D.Z},
Value={A.X,A.Y,A.Z},Callback=function(E,...)if y.ValueChanged then y:
ValueChanged(...)end end})local F=x[u](x,E)local G,H=b:MergeMetatables(y,F),F.
Row local I=function(...)local I=y.Callback return I(G,...)end function y:
ValueChanged(J)local K,L,M=J[1],J[2],J[3]local N=CFrame.new(K,L,M)self.Value=N
I(N)end function y:SetValue(J)self.Value=J F:SetValue{math.round(J.X),math.
round(J.Y),math.round(J.Z)}end y:SetValue(A)return G,H end})end p('InputInt2',
'InputInt',2,{NoButtons=true})p('InputInt3','InputInt',3,{NoButtons=true})p(
'InputInt4','InputInt',4,{NoButtons=true})p('SliderInt2','SliderInt',2)p(
'SliderInt3','SliderInt',3)p('SliderInt4','SliderInt',4)p('SliderFloat2',
'SliderFloat',2)p('SliderFloat3','SliderFloat',3)p('SliderFloat4','SliderFloat',
4)p('DragInt2','DragInt',2)p('DragInt3','DragInt',3)p('DragInt4','DragInt',4)p(
'DragFloat2','DragFloat',2)p('DragFloat3','DragFloat',3)p('DragFloat4',
'DragFloat',4)r('InputColor3','InputInt3')r('SliderColor3','SliderInt3')r(
'DragColor3','DragInt3')s('InputCFrame','InputInt3')s('SliderCFrame',
'SliderInt3')s('DragCFrame','DragInt3')b:DefineElement('SliderProgress',{Base={
Label='Slider Progress',Type='Progress',ColorTag='Frame'},Create=n.SliderBase})b
:DefineElement('ProgressBar',{Base={Label='Progress Bar',Type='Progress',
ReadOnly=true,MinValue=0,MaxValue=100,Format='% i%%',Interactable=false,ColorTag
='Frame'},Create=function(u,v)function v:SetPercentage(w)v:SetValue(w)end local
w,x=u:SliderBase(v)local y=w.Grab u:TagElements{[y]={BackgroundColor3=
'ProgressBar'}}return w,x end})b:DefineElement('Combo',{Base={Value='',
Placeholder='',Callback=d,Items={},Disabled=false,WidthFitPreview=false,Label=
'Combo'},Create=function(u,v)local w,x,y,z,A,B,C=v.Placeholder,v.NoAnimation,v.
Selected,v.Label,v.Disabled,v.WidthFitPreview,b:InsertPrefab('Combo',v)local D,E
,F=b:MergeMetatables(v,C),C.Combo,(b:DetectHover(C))local G,H,I=u:Label{Text=
tostring(w),Parent=E,Name='ValueText'},u:ArrowButton{Parent=E,Ratio=1,
Interactable=false,Size=UDim2.fromScale(0,0),LayoutOrder=2},u:Label{Text=z,
Parent=C,LayoutOrder=2}if B then b:SetProperties(C,{AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.new(0,0,0,20)})b:SetProperties(E,{AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromScale(0,1)})end local J,K=function(J,...)local K=
v.Callback v:SetOpen(false)return K(D,J,...)end,function(J,K)local L=u:
GetThemeKey'AnimationTweenInfo'C.Interactable=not J m:HeaderCollapseToggle{
Tweeninfo=L,NoAnimation=K,Collapsed=not J,Toggle=H.Icon}end local function L()
local M,N=v.GetItems,v.Items if M then return M()end return N end function v:
SetValueText(M)G.Text=tostring(M)end function v:SetDisabled(M)self.Disabled=M C.
Interactable=not M u:SetColorTags({[I]=M and'LabelDisabled'or'Label'},true)end
function v:SetValue(M)local N=L()local O=N[M]local P=O or M self._Selected=M
self.Value=P if typeof(M)=='number'then self:SetValueText(P)else self:
SetValueText(M)end return J(M,P)end function v:SetOpen(M)local N=self._Selected
self.Open=M K(M,x)if not M then if Dropdown then Dropdown:Close()end return end
Dropdown=u:Dropdown{ParentObject=E,Items=L(),Selected=N,OnSelected=function(...)
v:SetValue(...)end,OnClosed=function()self:SetOpen(false)end}return self end
local M=function()local M=v.Open v:SetOpen(not M)end E.Activated:Connect(M)K(
false,true)v:SetDisabled(A)if y then v:SetValue(y)end b:SetAnimation(E,'Inputs')
u:TagElements{[E]='Frame'}return D,C end})local u={TileBarConfig={Close={Image=b
.Icons.Close,IconSize=UDim2.fromOffset(11,11)},Collapse={Image=b.Icons.Arrow,
IconSize=UDim2.fromScale(1,1)}},CloseCallback=d,Collapsible=true,Open=true,
Focused=false}function u:Tween(v)b:CheckConfig(v,{Tweeninfo=self:GetThemeKey
'AnimationTweenInfo'})return m:Tween(v)end function u:TagElements(v)local w=b.
Debug if not u then if w then b:Warn('No WindowClass for objects registor:',v)
end return end local x,y=self.TagsList,self.Theme b:MultiUpdateColors{Theme=y,
TagsList=x,Objects=v}end function u:MakeTitleBarCanvas()local v=self.TitleBar
local w=b:MakeCanvas{WindowClass=self,Element=v}self.TitleBarCanvas=w return w
end function u:AddDefaultTitleButtons()local v,w=self.TileBarConfig,self.
TitleBar local x,y,z=v.Collapse,v.Close,self.TitleBarCanvas if not z then z=self
:MakeTitleBarCanvas()end b:CheckConfig(self,{Toggle=z:RadioButton{Icon=x.Image,
IconSize=x.IconSize,LayoutOrder=1,Ratio=1,Size=UDim2.new(0,0),Callback=function(
)self:ToggleCollapsed()end},CloseButton=z:RadioButton{Icon=y.Image,IconSize=y.
IconSize,LayoutOrder=3,Ratio=1,Size=UDim2.new(0,0),Callback=function()self:
Close()end},TitleLabel=z:Label{ColorTag='Title',LayoutOrder=2,Size=UDim2.new(1,0
),Active=false,Fill=true,AutomaticSize=Enum.AutomaticSize.XY}})self:TagElements{
[self.TitleLabel]='WindowTitle'}end function u:Close()local v=self.CloseCallback
if v then local w=v(self)if w==false then return end end self:Remove()end
function u:GetWindowSize()local v=self.WindowFrame return v.AbsoluteSize end
function u:GetTitleBarSizeY()local v=self.TitleBar if not v.Visible then return
0 end return b:GetContentSize(v,true).Y end function u:SetVisible(v)local w,x=
self.WindowFrame,self.NoFocusOnAppearing self.Visible=v w.Visible=v if v and not
x then b:SetFocusedWindow(self)end return self end function u:SetTitle(v)local w
=self.TitleLabel w.Text=tostring(v)return self end function u:Remove()local v=
self.WindowFrame v:Destroy()end function u:SetPosition(v)local w=self.
WindowFrame w.Position=v return self end function u:SetSize(v,w)local x=self.
WindowFrame if typeof(v)=='Vector2'then v=UDim2.fromOffset(v.X,v.Y)end self:
Tween{Object=x,NoAnimation=w,EndProperties={Size=v}}self.Size=v return self end
function u:Center()local v=self:GetWindowSize()/2 local w=UDim2.new(0.5,-v.X,0.5
,-v.Y)self:SetPosition(w)return self end function u:SetTheme(v)local w,x,y=b.
ThemeConfigs,self.TagsList,self.Focused if not v then v=self.Theme end assert(w[
v],`{v} is not a valid theme!`)self.Theme=v b:MultiUpdateColors{Animate=false,
Theme=v,Objects=x}self:SetFocused(y)return self end function u:SetFocused(v)v=v
==nil and true or v self.Focused=v if v then b:SetFocusedWindow(self)end local w
,x,y,z,A,B=self.ContentFrame,self.TitleBar,self.Theme,self.TitleLabel,self.
Collapsed,self.WindowFrame:FindFirstChildOfClass'UIStroke'local C={Focused={[B]=
'BorderActive',[x]='TitleBarBgActive',[z]={TextColor3='TitleActive'}},UnFocused=
{[B]='Border',[x]='TitleBarBg',[z]={TextColor3='Title'}},Collapsed={[B]='Border'
,[x]='TitleBarBgCollapsed',[z]={TextColor3='Title'}}}local D=v and C.Focused or
C.UnFocused if A then D=C.Collapsed end b:MultiUpdateColors{Animate=true,Objects
=D,Theme=y}end function u:GetThemeKey(v)return b:GetThemeKey(self.Theme,v)end
function u:ResetColors()local v,w,x=b.Theme,self.Theme,self.TagsList table.
clear(w)b:MultiUpdateColors{Animate=false,Theme=v,Objects=x}return u end
function u:SetCollapsible(v)self.Collapsible=v return self end function u:
ToggleCollapsed(v)local w,x=self.Collapsed,self.Collapsible if not v and not x
then return self end self:SetCollapsed(not w)return self end function u:
SetCollapsed(v,w)local x,y,z,A,B,C,D,E,F=self.WindowFrame,self.Body,self.Toggle,
self.ResizeGrab,self.Size,self.AutoSize,self:GetThemeKey'AnimationTweenInfo',
self:GetWindowSize(),self:GetTitleBarSizeY()local G,H=z.Icon,UDim2.fromOffset(E.
X,F)self.Collapsed=v self:SetCollapsible(false)self:SetFocused(not v)m:
HeaderCollapse{Tweeninfo=D,NoAnimation=w,Collapsed=v,Toggle=G,Resize=x,
NoAutomaticSize=not C,Hide=y,ClosedSize=H,OpenSize=B,Completed=function()self:
SetCollapsible(true)end}self:Tween{Object=A,NoAnimation=w,EndProperties={
TextTransparency=v and 1 or 0.6,Interactable=not v}}return self end function u:
UpdateConfig(v)local w={NoTitleBar=function(w)local x=self.TitleBar x.Visible=
not w end,NoClose=function(w)local x=self.CloseButton x.Visible=not w end,
NoCollapse=function(w)local x=self.Toggle x.Visible=not w end,NoTabsBar=function
(w)local x=self.WindowTabSelector if not x then return end local y=x.TabsBar y.
Visible=not w end,NoScrollBar=function(w)local x,y,z,A=w and 0 or 9,self.
NoScroll,self.WindowTabSelector,self.ContentCanvas if z then z.Body.
ScrollBarThickness=x end if not y then A.ScrollBarThickness=x end end,
NoScrolling=function(w)local x,y,z=self.NoScroll,self.WindowTabSelector,self.
ContentCanvas if y then y.Body.ScrollingEnabled=not w end if not x then z.
ScrollingEnabled=not w end end,NoMove=function(w)local x=self.DragConnection x:
SetEnabled(not w)end,NoResize=function(w)local x=self.ResizeConnection x:
SetEnabled(not w)end,NoBackground=function(w)local x,y=self:GetThemeKey
'WindowBgTransparency',self.CanvasFrame y.BackgroundTransparency=w and 1 or x
end}Merge(self,v)for x,y in v do local z=w[x]if z then z(y)end end return self
end b:DefineElement('Window',{Export=true,Base={Theme='DarkTheme',NoSelect=false
,NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize=false,MinSize=
Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,NoWindowRegistor=
false,IsDragging=false},Create=function(v,w)b:CheckConfig(w,{Parent=b.Container.
Windows,Title=b.DefaultTitle})local x,y,z,A,B,C,D,E,F,G,H,I,J=b.Windows,w.
NoDefaultTitleBarButtons,w.Collapsed,w.MinSize,w.Title,w.NoTabs,w.NoScroll,w.
Theme,w.AutomaticSize,w.NoWindowRegistor,w.AutoSelectNewTabs,w.OpenOnDoubleClick
,w.NoCollapse local K={Scroll=not D,Fill=not F and true or nil,UiPadding=UDim.
new(0,C and 8 or 0),AutoSelectNewTabs=H}if F then Merge(K,{AutomaticSize=F,Size=
UDim2.new(1,0)})end local L=b:InsertPrefab('Window',w)local M=L.Content local N,
O=M.TitleBar,NewClass(u)local P,Q,R,S,T=b:MakeResizable{MinimumSize=A,Resize=L,
OnUpdate=function(P)O:SetSize(P,true)end},(b:MakeCanvas{Element=M,WindowClass=O,
Class=O})local U,V=Q:Canvas(Copy(K,{Parent=M}))Merge(O,w)Merge(O,{WindowFrame=L,
ContentFrame=M,CanvasFrame=V,ResizeGrab=P.Grab,TitleBar=N,Elements=n,TagsList={}
,ResizeConnection=P,HoverConnection=b:DetectHover(M),DragConnection=b:
MakeDraggable{Move=L,Grab=M,OnDragStateChange=function(W)O.IsDragging=W V.
Interactable=not W if W then b:SetFocusedWindow(T)end b:SetWindowFocusesEnabled(
not W)end}})if C then R,S=U,V else R,S=U:TabSelector(K)O.WindowTabSelector=R end
Merge(O,{Body=S,ContentCanvas=R})b:ConnectMouseEvent(M,{DoubleClick=true,
OnlyMouseHovering=N,Callback=function(...)if not O.OpenOnDoubleClick then return
end if O.NoCollapse then return end O:ToggleCollapsed()end})if not y then O:
AddDefaultTitleButtons()end O:SetTitle(B)O:SetCollapsed(z,true)O:SetTheme(E)O:
UpdateConfig(w)O:SetFocused()T=b:MergeMetatables(O,R)if not G then table.insert(
x,T)end local W=P.Grab b:SetAnimation(W,'TextButtons')T:TagElements{[W]=
'ResizeGrab',[N]='TitleBar',[V]='Window'}return T,L end})b:DefineElement(
'TabsWindow',{Export=true,Base={NoTabs=false,AutoSelectNewTabs=true},Create=
function(v,w)return v:Window(w)end})b:DefineElement('PopupCanvas',{Base={Scroll=
false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(v,w)local x,y=v.
WindowClass,w.Scroll local z=y and'ScrollingCanvas'or'Canvas'local A=b:
InsertPrefab(z,w)function w:ClosePopup()A:Destroy()end function w:ShowPopup()A.
Visible=true end local B,C=b:DetectHover(A,{MouseOnly=true,OnInput=function(B,C)
if B then return end w:ClosePopup()end}),b:MakeCanvas{Element=A,WindowClass=x,
Class=w}return C,A end})b:DefineElement('PopupModal',{Export=true,Base={
NoAnimation=false,NoCollapse=true,NoClose=true,NoResize=true,NoSelect=true,
NoAutoFlags=true,NoWindowRegistor=true,NoScroll=true},Create=function(v,w)local
x,y,z=v.WindowClass,(w.NoAnimation)w.Parent=b.Container.Overlays if x then z=x:
GetThemeKey'ModalWindowDimTweenInfo'w.Theme=x.Theme end local A=b:InsertPrefab(
'ModalEffect',w)local B=v:Window(Copy(w,{Parent=A,AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(372,38),NoAutoFlags
=false,AutomaticSize=Enum.AutomaticSize.Y}))function w:ClosePopup()m:Tween{
Object=A,Tweeninfo=z,NoAnimation=y,EndProperties={BackgroundTransparency=1},
Completed=function()A:Destroy()end}B:Close()end m:Tween{Object=A,Tweeninfo=z,
NoAnimation=y,StartProperties={BackgroundTransparency=1},EndProperties={
BackgroundTransparency=0.8}}v:TagElements{[A]='ModalWindowDim'}local C=b:
MergeMetatables(w,B)return C,A end})local v=`rbxassetid://`..b.PrefabsId b:Init{
Prefabs=game:GetService'InsertService':LoadLocalAsset(v)}return b end function a
.c()local b=a.load'a'.SecureService local c,d,e,f,g=b'RunService',b'Players',b
'Workspace',b'UserInputService',b'CoreGui'local h,i=d.LocalPlayer,e.
CurrentCamera local j,k,l,m,n,o,p,r,s,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M=i.
ViewportSize,math.floor,math.round,math.sin,math.cos,table.clear,table.unpack,
table.find,table.create,CFrame.fromMatrix,i.WorldToViewportPoint,e.IsA,e.
GetPivot,e.FindFirstChild,e.FindFirstChildOfClass,e.GetChildren,CFrame.identity.
PointToObjectSpace,Color3.new().Lerp,Vector2.zero.Min,Vector2.zero.Max,Vector2.
zero.Lerp,Vector3.zero.Min,Vector3.zero.Max,Vector2.new(7,0),Vector2.new(0,1),
Vector2.new(0,2),Vector2.new(5,0),{Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),
Vector3.new(-1,1,1),Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1
),Vector3.new(1,1,1),Vector3.new(1,-1,1)}local N,O=function(N)local O,P for Q=1,
#N do local R=N[Q]local S,T=R.CFrame,R.Size O=G(O or S.Position,(S-T*0.5).
Position)P=H(P or S.Position,(S+T*0.5).Position)end local Q=(O+P)*0.5 local R=
Vector3.new(Q.X,Q.Y,P.Z)return CFrame.new(Q,R),P-O end,function(N)local O,P=v(i,
N)return Vector2.new(O.X,O.Y),P,O.Z end local P,Q,R,S=function(P,Q)local R=s(#M)
for S=1,#M do R[S]=O((P+Q*0.5*M[S]).Position)end local S,T=D(j,p(R)),E(Vector2.
zero,p(R))return{corners=R,topLeft=Vector2.new(k(S.X),k(S.Y)),topRight=Vector2.
new(k(T.X),k(S.Y)),bottomLeft=Vector2.new(k(S.X),k(T.Y)),bottomRight=Vector2.
new(k(T.X),k(T.Y))}end,function(P,Q)local R,S,T,U=P.X,P.Y,n(Q),m(Q)return
Vector2.new(R*T-S*U,R*U+S*T)end,function(P,Q,R)if Q=='Team Color'or(P.interface.
shared.useTeamColor and not R)then return P.interface.getTeamColor(P.player)or
Color3.new(1,1,1)end return Q end,{}S.__index=S function S.new(T,U)local V=
setmetatable({},S)V.player=assert(T,'Missing argument #1 (Player expected)')V.
interface=assert(U,'Missing argument #2 (table expected)')V:Construct()return V
end function S:_create(T,U)local V=Drawing.new(T)for W,X in next,U do pcall(
function()V[W]=X end)end self.bin[#self.bin+1]=V return V end function S:
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
_create('Square',{Thickness=1,Visible=false}),healthBarOutline=self:_create(
'Line',{Thickness=6,Visible=false}),healthBar=self:_create('Line',{Thickness=4,
Visible=false}),healthText=self:_create('Text',{Center=true,Visible=false}),name
=self:_create('Text',{Text=string.upper(self.player.DisplayName),Center=true,
Visible=false}),distance=self:_create('Text',{Center=true,Visible=false}),weapon
=self:_create('Text',{Center=true,Visible=false})},hidden={arrowOutline=self:
_create('Triangle',{Thickness=3,Visible=false}),arrow=self:_create('Triangle',{
Filled=true,Visible=false})}}self.renderConnection=c.RenderStepped:Connect(
function(T)self:Update(T)self:Render(T)end)end function S:Destruct()self.
renderConnection:Disconnect()for T=1,#self.bin do self.bin[T]:Remove()end o(self
)end function S:Update()local T=self.interface self.options=T.team[T.isFriendly(
self.player)and'friendly'or'enemy']self.character=T.getCharacter(self.player)
self.health,self.maxHealth=T.getHealth(self.player)self.weapon=T.getWeapon(self.
player)self.enabled=self.options.enabled and self.character and not(#T.whitelist
>0 and not r(T.whitelist,self.player.UserId))local U=self.enabled and y(self.
character,'Head')if not U then self.charCache={}self.onScreen=false return end
local V,W,X=O(U.Position)self.onScreen=W self.distance=X if T.shared.
limitDistance and X>T.shared.maxDistance then self.onScreen=false end if self.
onScreen then local Y,Z=self.charCache,A(self.character)if not Y[1]or self.
childCount~=#Z then o(Y)for _=1,#Z do local aa=Z[_]if w(aa,'BasePart')and T.
isBodyPart(aa.Name)then Y[#Y+1]=aa end end self.childCount=#Z end self.corners=
P(N(Y))elseif self.options.offScreenArrow then local aa=i.CFrame local Y=u(aa.
Position,aa.RightVector,Vector3.yAxis)local Z=B(Y,U.Position)self.direction=
Vector2.new(Z.X,Z.Z).Unit end end function S:Render()local aa,T,U,V,W,X,Y,Z=self
.onScreen or false,self.enabled or false,self.drawings.visible,self.drawings.
hidden,self.drawings.box3d,self.interface,self.options,self.corners U.box.
Visible=T and aa and Y.box U.boxOutline.Visible=U.box.Visible and Y.boxOutline
if U.box.Visible then local _=U.box _.Position=Z.topLeft _.Size=Z.bottomRight-Z.
topLeft _.Color=R(self,Y.boxColor[1])_.Transparency=Y.boxColor[2]local ab=U.
boxOutline ab.Position=_.Position ab.Size=_.Size ab.Color=R(self,Y.
boxOutlineColor[1],true)ab.Transparency=Y.boxOutlineColor[2]end U.boxFill.
Visible=T and aa and Y.boxFill if U.boxFill.Visible then local ab=U.boxFill ab.
Position=Z.topLeft ab.Size=Z.bottomRight-Z.topLeft ab.Color=R(self,Y.
boxFillColor[1])ab.Transparency=Y.boxFillColor[2]end U.healthBar.Visible=T and
aa and Y.healthBar U.healthBarOutline.Visible=U.healthBar.Visible and Y.
healthBarOutline if U.healthBar.Visible then local ab,_,ac=Z.topLeft-I,Z.
bottomLeft-I,U.healthBar ac.To=_ ac.From=F(_,ab,self.health/self.maxHealth)ac.
Color=C(Y.dyingColor,Y.healthyColor,self.health/self.maxHealth)local ad=U.
healthBarOutline ad.To=_+J ad.From=ab-J ad.Color=R(self,Y.healthBarOutlineColor[
1],true)ad.Transparency=Y.healthBarOutlineColor[2]end U.name.Visible=T and aa
and Y.name if U.name.Visible then local ab=U.name ab.Size=X.shared.textSize ab.
Font=X.shared.textFont ab.Color=R(self,Y.nameColor[1])ab.Transparency=Y.
nameColor[2]ab.Outline=Y.nameOutline ab.OutlineColor=R(self,Y.nameOutlineColor,
true)ab.Position=(Z.topLeft+Z.topRight)*0.5-Vector2.yAxis*ab.TextBounds.Y-K end
local ab=Z and Z.topRight.Y or 0 U.distance.Visible=T and aa and self.distance
and Y.distance if U.distance.Visible then local ac=U.distance ac.Text=l(self.
distance*0.28)..'M'ac.Size=X.shared.textSize ac.Font=X.shared.textFont ac.Color=
R(self,Y.distanceColor[1])ac.Transparency=Y.distanceColor[2]ac.Outline=Y.
distanceOutline ac.OutlineColor=R(self,Y.distanceOutlineColor,true)ac.Position=
Vector2.new(Z.topRight.X+L.X+ac.TextBounds.X*0.5,ab-ac.TextBounds.Y*0.5-L.Y)ab=
ab+ac.TextBounds.Y+L.Y end U.weapon.Visible=T and aa and Y.weapon if U.weapon.
Visible then local ac=U.weapon ac.Text=self.weapon ac.Size=X.shared.textSize ac.
Font=X.shared.textFont ac.Color=R(self,Y.weaponColor[1])ac.Transparency=Y.
weaponColor[2]ac.Outline=Y.weaponOutline ac.OutlineColor=R(self,Y.
weaponOutlineColor,true)ac.Position=Vector2.new(Z.topRight.X+L.X+ac.TextBounds.X
*0.5,ab-ac.TextBounds.Y*0.5)ab=ab+ac.TextBounds.Y+L.Y end U.healthText.Visible=T
and aa and Y.healthText if U.healthText.Visible then local ac=U.healthText ac.
Text=l(self.health)..'HP'ac.Size=X.shared.textSize ac.Font=X.shared.textFont ac.
Color=R(self,Y.healthTextColor[1])ac.Transparency=Y.healthTextColor[2]ac.Outline
=Y.healthTextOutline ac.OutlineColor=R(self,Y.healthTextOutlineColor,true)ac.
Position=Vector2.new(Z.topRight.X+L.X+ac.TextBounds.X*0.5,ab-ac.TextBounds.Y*0.5
)end U.tracer.Visible=T and aa and Y.tracer U.tracerOutline.Visible=U.tracer.
Visible and Y.tracerOutline if U.tracer.Visible then local ac=U.tracer ac.Color=
R(self,Y.tracerColor[1])ac.Transparency=Y.tracerColor[2]ac.To=(Z.bottomLeft+Z.
bottomRight)*0.5 ac.From=Y.tracerOrigin=='Middle'and j*0.5 or Y.tracerOrigin==
'Top'and j*Vector2.new(0.5,0)or Y.tracerOrigin=='Bottom'and j*Vector2.new(0.5,1)
or Y.tracerOrigin=='Mouse'and f:GetMouseLocation()local ad=U.tracerOutline ad.
Color=R(self,Y.tracerOutlineColor[1],true)ad.Transparency=Y.tracerOutlineColor[2
]ad.To=ac.To ad.From=ac.From end V.arrow.Visible=T and(not aa)and Y.
offScreenArrow V.arrowOutline.Visible=V.arrow.Visible and Y.
offScreenArrowOutline if V.arrow.Visible and self.direction then local ac=V.
arrow ac.PointA=D(E(j*0.5+self.direction*Y.offScreenArrowRadius,Vector2.one*25),
j-Vector2.one*25)ac.PointB=ac.PointA-Q(self.direction,0.45)*Y.offScreenArrowSize
ac.PointC=ac.PointA-Q(self.direction,-0.45)*Y.offScreenArrowSize ac.Color=R(self
,Y.offScreenArrowColor[1])ac.Transparency=Y.offScreenArrowColor[2]local ad=V.
arrowOutline ad.PointA=ac.PointA ad.PointB=ac.PointB ad.PointC=ac.PointC ad.
Color=R(self,Y.offScreenArrowOutlineColor[1],true)ad.Transparency=Y.
offScreenArrowOutlineColor[2]end local ac=T and aa and Y.box3d for ad=1,#W do
local _=W[ad]for ae=1,#_ do local af=_[ae]af.Visible=ac af.Color=R(self,Y.
box3dColor[1])af.Transparency=Y.box3dColor[2]end if ac then local ae=_[1]ae.From
=Z.corners[ad]ae.To=Z.corners[ad==4 and 1 or ad+1]local af=_[2]af.From=Z.corners
[ad==4 and 1 or ad+1]af.To=Z.corners[ad==4 and 5 or ad+5]local ag=_[3]ag.From=Z.
corners[ad==4 and 5 or ad+5]ag.To=Z.corners[ad==4 and 8 or ad+4]end end end
local aa={}aa.__index=aa function aa.new(ab,ac)local ad=setmetatable({},aa)ad.
player=assert(ab,'Missing argument #1 (Player expected)')ad.interface=assert(ac,
'Missing argument #2 (table expected)')ad:Construct()return ad end function aa:
Construct()self.highlight=Instance.new('Highlight',g)self.updateConnection=c.
RenderStepped:Connect(function()self:Update()end)end function aa:Destruct()self.
updateConnection:Disconnect()self.highlight:Destroy()o(self)end function aa:
Update()local ab,ac=self.highlight,self.interface local ad,ae=ac.getCharacter(
self.player),ac.team[ac.isFriendly(self.player)and'friendly'or'enemy']local af=
ae.enabled and ad and not(#ac.whitelist>0 and not r(ac.whitelist,self.player.
UserId))ab.Enabled=af and ae.chams if ab.Enabled then ab.Adornee=ad ab.FillColor
=R(self,ae.chamsFillColor[1])ab.FillTransparency=ae.chamsFillColor[2]ab.
OutlineColor=R(self,ae.chamsOutlineColor[1],true)ab.OutlineTransparency=ae.
chamsOutlineColor[2]ab.DepthMode=ae.chamsVisibleOnly and'Occluded'or
'AlwaysOnTop'end end local ab={}ab.__index=ab function ab.new(ac,ad)local ae=
setmetatable({},ab)ae.instance=assert(ac,
'Missing argument #1 (Instance Expected)')ae.options=assert(ad,
'Missing argument #2 (table expected)')ae:Construct()return ae end function ab:
Construct()local ac=self.options ac.enabled=ac.enabled==nil and true or ac.
enabled ac.text=ac.text or'{name}'ac.textColor=ac.textColor or{Color3.new(1,1,1)
,1}ac.textOutline=ac.textOutline==nil and true or ac.textOutline ac.
textOutlineColor=ac.textOutlineColor or Color3.new()ac.textSize=ac.textSize or
13 ac.textFont=ac.textFont or 2 ac.limitDistance=ac.limitDistance or false ac.
maxDistance=ac.maxDistance or 150 self.text=Drawing.new'Text'self.text.Center=
true self.renderConnection=c.Stepped:Connect(function(ad)self:Render(ad)end)end
function ab:Destruct()self.renderConnection:Disconnect()self.text:Remove()end
function ab:Render()local ac=self.instance if not ac or not ac.Parent then
return self:Destruct()end local ad,ae=self.text,self.options if not ae.enabled
then ad.Visible=false return end local af=x(ac).Position local ag,T,U=O(af)if ae
.limitDistance and U>ae.maxDistance then T=false end ad.Visible=T if ad.Visible
then ad.Position=ag ad.Color=ae.textColor[1]ad.Transparency=ae.textColor[2]ad.
Outline=ae.textOutline ad.OutlineColor=ae.textOutlineColor ad.Size=ae.textSize
ad.Font=ae.textFont ad.Text=ae.text:gsub('{name}',string.upper(ac.Name)):gsub(
'{distance}',l(U*0.28)..'M'):gsub('{position}',string.upper(tostring(af)))end
return nil end local ac={_hasLoaded=false,_objectCache={},whitelist={},shared={
textSize=13,textFont=4,limitDistance=false,maxDistance=150,useTeamColor=false,
includeLocalPlayer=false},team={enemy={enabled=false,box=false,boxColor={Color3.
new(1,0,0),1},boxOutline=true,boxOutlineColor={Color3.new(),1},boxFill=false,
boxFillColor={Color3.new(1,0,0),0.5},healthBar=false,healthyColor=Color3.
fromRGB(58,161,47),dyingColor=Color3.fromRGB(161,47,47),healthBarOutline=true,
healthBarOutlineColor={Color3.new(),0.5},healthText=false,healthTextColor={
Color3.new(1,1,1),1},healthTextOutline=true,healthTextOutlineColor=Color3.new(),
box3d=false,box3dColor={Color3.new(1,0,0),1},name=false,nameColor={Color3.new(1,
1,1),1},nameOutline=true,nameOutlineColor=Color3.new(),weapon=false,weaponColor=
{Color3.new(1,1,1),1},weaponOutline=true,weaponOutlineColor=Color3.new(),
distance=false,distanceColor={Color3.new(1,1,1),1},distanceOutline=true,
distanceOutlineColor=Color3.new(),tracer=false,tracerOrigin='Bottom',tracerColor
={Color3.new(1,0,0),1},tracerOutline=true,tracerOutlineColor={Color3.new(),1},
offScreenArrow=false,offScreenArrowColor={Color3.new(1,1,1),1},
offScreenArrowSize=15,offScreenArrowRadius=150,offScreenArrowOutline=true,
offScreenArrowOutlineColor={Color3.new(),1},chams=false,chamsVisibleOnly=false,
chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},chamsOutlineColor={Color3.new(1,0,0
),0}},friendly={enabled=false,box=false,boxColor={Color3.new(0,1,0),1},
boxOutline=true,boxOutlineColor={Color3.new(),1},boxFill=false,boxFillColor={
Color3.new(0,1,0),0.5},healthBar=false,healthyColor=Color3.new(0,1,0),dyingColor
=Color3.new(1,0,0),healthBarOutline=true,healthBarOutlineColor={Color3.new(),0.5
},healthText=false,healthTextColor={Color3.new(1,1,1),1},healthTextOutline=true,
healthTextOutlineColor=Color3.new(),box3d=false,box3dColor={Color3.new(0,1,0),1}
,name=false,nameColor={Color3.new(1,1,1),1},nameOutline=true,nameOutlineColor=
Color3.new(),weapon=false,weaponColor={Color3.new(1,1,1),1},weaponOutline=true,
weaponOutlineColor=Color3.new(),distance=false,distanceColor={Color3.new(1,1,1),
1},distanceOutline=true,distanceOutlineColor=Color3.new(),tracer=false,
tracerOrigin='Bottom',tracerColor={Color3.new(0,1,0),1},tracerOutline=true,
tracerOutlineColor={Color3.new(),1},offScreenArrow=false,offScreenArrowColor={
Color3.new(1,1,1),1},offScreenArrowSize=15,offScreenArrowRadius=150,
offScreenArrowOutline=true,offScreenArrowOutlineColor={Color3.new(),1},chams=
false,chamsVisibleOnly=false,chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
chamsOutlineColor={Color3.new(0,1,0),0}}}}function ac.AddInstance(ad,ae)local af
=ac._objectCache if af[ad]then warn'Instance handler already exists.'else af[ad]
={ab.new(ad,ae)}end return af[ad][1]end function ac.Load()assert(not ac.
_hasLoaded,'Esp has already been loaded.')local ad,ae,af=function(ad)ac.
_objectCache[ad]={S.new(ad,ac),aa.new(ad,ac)}end,function(ad)local ae=ac.
_objectCache[ad]if ae then for af=1,#ae do ae[af]:Destruct()end ac._objectCache[
ad]=nil end end,d:GetPlayers()for ag=ac.shared.includeLocalPlayer and 1 or 2,#af
do ad(af[ag])end ac.playerAdded=d.PlayerAdded:Connect(ad)ac.playerRemoving=d.
PlayerRemoving:Connect(ae)ac._hasLoaded=true end function ac.Unload()assert(ac.
_hasLoaded,'Esp has not been loaded yet.')for ad,ae in next,ac._objectCache do
for af=1,#ae do ae[af]:Destruct()end ac._objectCache[ad]=nil end ac.playerAdded:
Disconnect()ac.playerRemoving:Disconnect()ac._hasLoaded=false end function ac.
getWeapon(ad)local ae='None'if ad and ad.Character then local af=ad.Character:
FindFirstChildOfClass'Tool'if af then ae=af.Name end end return string.upper(ae)
end function ac.isFriendly(ad)return ad.Team and ad.Team==h.Team end function ac
.getTeamColor(ad)return ad.Team and ad.Team.TeamColor and ad.Team.TeamColor.
Color end function ac.getCharacter(ad)return ad.Character end function ac.
isBodyPart(ad)return ad=='Head'or ad:find'Torso'or ad:find'Leg'or ad:find'Arm'
end function ac.getHealth(ad)local ae=ad and ac.getCharacter(ad)local af=ae and
z(ae,'Humanoid')if af then return af.Health,af.MaxHealth end return 100,100 end
return ac end function a.d()local aa,ab,ac,ad,ae,af,ag,b,c,d,e,f,g,h=game,
workspace,Vector2.new,Vector3.zero,CFrame.new,Color3.fromRGB,Drawing.new,
TweenInfo.new,mousemoverel or(Input and Input.MouseMove),table.find,table.remove
,string.lower,string.sub,math.clamp local i=getrawmetatable and getrawmetatable(
aa)or{__index=function(i,j)return i[j]end,__newindex=function(i,j,k)i[j]=k end}
local j,k=i.__index,i.__newindex local l=j(aa,'GetService')local m,n,o,p=l(aa,
'RunService'),l(aa,'UserInputService'),l(aa,'TweenService'),l(aa,'Players')local
r,s,u,v,w=j(p,'LocalPlayer'),j(ab,'CurrentCamera'),j(aa,'FindFirstChild'),j(aa,
'FindFirstChildOfClass'),j(aa,'GetDescendants')local x,y,z,A,B,C,D,E,F,G,H,I,J=
j(s,'WorldToViewportPoint'),j(s,'GetPartsObscuringTarget'),j(n,
'GetMouseLocation'),j(p,'GetPlayers'),2000,false,false,{},j(aa,'DescendantAdded'
).Connect,{DeveloperSettings={UpdateMode='RenderStepped',TeamCheckOption='Team'}
,Settings={Enabled=true,AutoStateLabel=function(x)return end,AutoLockedLabel=
function(x)return end,TeamCheck=false,AliveCheck=true,WallCheck=false,
OffsetToMoveDirection=false,OffsetIncrement=15,Sensitivity=0,Sensitivity2=3.5,
ShakeMultiplier=0.1,LockMode=2,LockPart='Head',TriggerKey=Enum.UserInputType.
MouseButton2,Toggle=false},FOVSettings={Enabled=true,Visible=true,Radius=90,
NumSides=60,Thickness=2,Transparency=1,Filled=false,RainbowColor=false,
RainbowOutlineColor=false,Color=af(255,255,255),OutlineColor=af(0,0,0),
LockedColor=af(255,150,150)},Blacklisted={},FOVCircleOutline=ag'Circle',
FOVCircle=ag'Circle'}local K=G K.FOVSettings.Visible=false K.FOVSettings.Visible
=false local L,M,N=function(L)local M for N,O in next,A(p)do local P=j(O,'Name')
if g(f(P),1,#L)==f(L)then M=P end end return M end,function(L)return ac(L.X,L.Y)
end,function()K.Locked=nil local L=K.FOVCircle L.Color=K.FOVSettings.Color k(n,
'MouseDeltaSensitivity',I)if H then H:Cancel()end K.Settings.AutoLockedLabel(nil
)end local O=function()local O=K.Settings local P=O.LockPart if not K.Locked
then B=K.FOVSettings.Enabled and K.FOVSettings.Radius or 2000 for Q,R in next,A(
p)do local S=j(R,'Character')local T=S and v(S,'Humanoid')if R~=r and not d(K.
Blacklisted,j(R,'Name'))and S and u(S,P)and T then local U,V=j(S[P],'Position'),
K.DeveloperSettings.TeamCheckOption if O.TeamCheck and j(R,V)and j(R,V)==j(r,V)
then continue end if O.AliveCheck and j(T,'Health')<=0 then continue end if O.
WallCheck then local W=w(j(r,'Character'))for X,Y in next,w(S)do W[#W+1]=Y end
if#y(s,{U},W)>0 then continue end end local W,X,Y=x(s,U)W=M(W)Y=(z(n)-W).
Magnitude if Y<B and X then B,K.Locked=Y,R O.AutoLockedLabel(R)end end end
elseif(z(n)-M(x(s,j(j(j(K.Locked,'Character'),P),'Position')))).Magnitude>B then
N()end end local ah=function()I=j(n,'MouseDeltaSensitivity')local P,Q,R,S,T=K.
Settings,K.FOVCircle,K.FOVCircleOutline,(K.FOVSettings)E.RenderSteppedConnection
=F(j(m,K.DeveloperSettings.UpdateMode),function()local U,V,W=P.
OffsetToMoveDirection,P.LockPart,P.ShakeMultiplier if S.Enabled and P.Enabled
then Q.Color=(K.Locked and S.LockedColor)or S.Color R.Color=S.OutlineColor Q.
Thickness=S.Thickness R.Thickness=S.Thickness+1 Q.Position=z(n)R.Position=z(n)Q.
NumSides=S.NumSides R.NumSides=S.NumSides Q.Radius=S.Radius R.Radius=S.Radius Q.
Transparency=1-S.Transparency R.Transparency=1-S.Transparency Q.Visible=S.
Visible R.Visible=S.Visible else Q.Visible=false R.Visible=false end if D and P.
Enabled then O()T=U and j(v(j(K.Locked,'Character'),'Humanoid'),'MoveDirection')
*(h(P.OffsetIncrement,1,30)/10)or ad if K.Locked then local X=j(j(K.Locked,
'Character')[V],'Position')local Y=x(s,X+T)local Z,_,ah,ai=(Y.X-z(n).X)/P.
Sensitivity2,(Y.Y-z(n).Y)/P.Sensitivity2,math.random()*W-(W/2),math.random()*W-(
W/2)if K.Settings.LockMode==2 then c(Z+ah,_+ai)else if P.Sensitivity>0 then H=o:
Create(s,b(K.Settings.Sensitivity,Enum.EasingStyle.Sine,Enum.EasingDirection.Out
),{CFrame=ae(s.CFrame.Position,X+T+Vector3.new(ah,ai,0))})H:Play()else k(s,
'CFrame',ae(s.CFrame.Position,X+T+Vector3.new(ah,ai,0)))end end end end end)E.
InputBeganConnection=F(j(n,'InputBegan'),function(ah)local ai,U=P.TriggerKey,P.
Toggle if C then return end if ah.UserInputType==Enum.UserInputType.Keyboard and
ah.KeyCode==ai or ah.UserInputType==ai then if U then D=not D if not D then N()
end else D=true end P.AutoStateLabel(D)end end)E.InputEndedConnection=F(j(n,
'InputEnded'),function(ah)local ai,U=P.TriggerKey,P.Toggle if U or C then return
end if ah.UserInputType==Enum.UserInputType.Keyboard and ah.KeyCode==ai or ah.
UserInputType==ai then D=false P.AutoStateLabel(D)N()end end)end E.
TypingStartedConnection=F(j(n,'TextBoxFocused'),function()C=true end)E.
TypingEndedConnection=F(j(n,'TextBoxFocusReleased'),function()C=false end)
function K.Exit(ai)assert(ai,'Aimbot.Exit: Missing parameter #1 "self" <table>.'
)for P,Q in next,E do J(E[P])end ah=nil M=nil N=nil O=nil L=nil ai.FOVCircle:
Remove()ai.FOVCircleOutline:Remove()end function K.Restart()for ai,P in next,E
do J(E[ai])end ah()end function K.Blacklist(ai,P)assert(ai,
'Aimbot.Blacklist: Missing parameter #1 "self" <table>.')assert(P,
'Aimbot.Blacklist: Missing parameter #2 "Username" <string>.')P=L(P)assert(ai,
'Aimbot.Blacklist: User '..P.." couldn't be found.")ai.Blacklisted[#ai.
Blacklisted+1]=P end function K.Whitelist(ai,P)assert(ai,
'Aimbot.Whitelist: Missing parameter #1 "self" <table>.')assert(P,
'Aimbot.Whitelist: Missing parameter #2 "Username" <string>.')P=L(P)assert(P,
'Aimbot.Whitelist: User '..P.." couldn't be found.")local Q=d(ai.Blacklisted,P)
assert(Q,'Aimbot.Whitelist: User '..P..' is not blacklisted.')e(ai.Blacklisted,Q
)end function K.GetClosestPlayer()O()local ai=K.Locked N()return ai end K.Load=
ah setmetatable(K,{__call=ah})return K end function a.e()local aa,ab={},a.load
'a'GetService=ab.SecureService local ac=a.load'b'UIName='RIOT V2'local ad=a.load
'c'ESP_E=ad.team.enemy ESP_F=ad.team.friendly local ae=a.load'd'Aimbot_S=ae.
Settings Aimbot_F=ae.FOVSettings function aa.init(af)local ag,ah,ai=ac:
TabsWindow{Title=UIName..' | '..af..' - getriot.cc',Size=UDim2.new(0,350,0,550),
Position=UDim2.new(0.5,0,0,70)},{Success=`<font color="rgb(40, 240, 10)">[Success]</font>`
,Init=`<font color="rgb(240, 140, 10)">[Init]</font>`,Info=`<font color="rgb(10, 140, 240)">[Info]</font>`
}local b={Console=ag:CreateTab{Name='Console'},Combat=ag:CreateTab{Name='Combat'
},Visuals=ag:CreateTab{Name='Visuals'},Settings=ag:CreateTab{Name='Settings'}}ai
=b.Console:Console{Value=ah.Init..' UI Initialized',ReadOnly=true,AutoScroll=
true,RichText=true,MaxLines=250,Size=UDim2.new(1,0,0,480)}local c,d=function(...
)return ai:AppendText(...)end,b.Combat:TabSelector{Size=UDim2.new(1,0,0,500)}
local e=d:CreateTab{Name='Aimbot'}e:Separator{Text='Aimbot Settings'}local f,g={
[true]='Active: <font color="rgb(40, 240, 10)">true</font>',[false]=
'Active: <font color="rgb(240, 40, 10)">false</font>'}local h=e:Checkbox{Label=
'Enabled',Value=false,Callback=function(h,i)Aimbot_S.Enabled=i if g and g.Text==
f[true]and i==false then g.Text=f[false]end c(ah.Info,h.Label,':',i)end}g=e:
Label{RichText=true,Text=f[false]}Aimbot_S.AutoStateLabel=function(i)if h.Value
then g.Text=f[i]end end local i=e:Label{RichText=true,Text=
'Locked to: <font color="rgb(240, 40, 10)">none</font>'}Aimbot_S.AutoLockedLabel
=function(j)if j then i.Text=string.format(
'Locked to: <font color="rgb(40, 240, 10)">%q</font>',j.Name)else i.Text=
'Locked to: <font color="rgb(240, 40, 10)">None</font>'end end e:Keybind{Label=
'Trigger Keybind',Value=Enum.KeyCode.E,IgnoreGameProcessed=false,OnKeybindSet=
function(j,k)Aimbot_S.TriggerKey=k end}e:Checkbox{Label='Toggle',Value=true,
Callback=function(j,k)Aimbot_S.Toggle=k c(ah.Info,j.Label,':',k)end}e:Combo{
Selected='Head',Label='Aiming Bone',Items={'Head','Torso'},Callback=function(j,k
)Aimbot_S.LockPart=k c(ah.Info,j.Label,':',k)end}e:Checkbox{Label='Team Check',
Value=true,Callback=function(j,k)Aimbot_S.TeamCheck=k c(ah.Info,j.Label,':',k)
end}e:Checkbox{Label='Alive Check',Value=true,Callback=function(j,k)Aimbot_S.
AliveCheck=k c(ah.Info,j.Label,':',k)end}e:Checkbox{Label='Wall Check',Value=
true,Callback=function(j,k)Aimbot_S.WallCheck=k c(ah.Info,j.Label,':',k)end}e:
SliderFloat{Label='Smoothing',Minimum=1,Maximum=20,Value=2,Format=
'Smoothing = %.3f',Callback=function(j,k)Aimbot_S.Sensitivity2=k c(ah.Info,j.
Label,':',k)end}e:SliderFloat{Label='Shake Multiplier',Minimum=0,Maximum=10,
Value=0,Format='Multiplier = %.1f',Callback=function(j,k)Aimbot_S.
ShakeMultiplier=k c(ah.Info,j.Label,':',k)end}e:Separator{Text='FOV Settings'}e:
Checkbox{Label='Enabled',Value=true,Callback=function(j,k)Aimbot_F.Enabled=k c(
ah.Info,j.Label,':',k)end}e:Checkbox{Label='Visible',Value=true,Callback=
function(j,k)Aimbot_F.Visible=k c(ah.Info,j.Label,':',k)end}e:SliderFloat{Label=
'Radius',Minimum=0,Maximum=500,Value=120,Format='Radius = %.0f',Callback=
function(j,k)Aimbot_F.Radius=k c(ah.Info,j.Label,':',k)end}e:SliderFloat{Label=
'Circle Sides',Minimum=3,Maximum=80,Value=25,Format='Sides = %.0f',Callback=
function(j,k)Aimbot_F.NumSides=k c(ah.Info,j.Label,':',k)end}e:SliderFloat{Label
='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(j,k)Aimbot_F.Transparency=k c(ah.Info,j.Label,':',k)end}e:
DragColor3{Value=Color3.fromRGB(240,40,10),Label='Color',Callback=function(j,k)
Aimbot_F.Color=k c(ah.Info,j.Label,':',k)end}e:DragColor3{Value=Color3.fromRGB(
40,240,10),Label='Color (Locked)',Callback=function(j,k)Aimbot_F.LockedColor=k
c(ah.Info,j.Label,':',k)end}b.Visuals:Separator{Text='Shared Settings'}local j
local k=b.Visuals:Checkbox{Label='Limit Distance',Value=false,Callback=function(
k,l)ad.shared.limitDistance=l if j then j:SetDisabled(not l)end c(ah.Info,k.
Label,':',l)end}j=b.Visuals:SliderFloat{Label='Limit',Minimum=1,Maximum=500,
Value=150,Format='Distance Limit = %.0f',Callback=function(l,m)ad.shared.
maxDistance=m c(ah.Info,l.Label,':',m)end}j:SetDisabled(not k.Value)b.Visuals:
Separator{Text='ESP'}local l,m=b.Visuals:TabSelector{Size=UDim2.new(1,0,0,400)},
function(l,m)m:Checkbox{Label='Enabled',Value=false,Callback=function(n,o)l.
enabled=o c(ah.Info,n.Label,':',o)end}m:Separator{Text='Boxes'}m:Checkbox{Label=
'Enabled',Value=true,Callback=function(n,o)l.box=o c(ah.Info,n.Label,':',o)end}m
:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',Callback=function(n,o)
l.boxColor[1]=o c(ah.Info,n.Label,':',o)end}m:SliderFloat{Label='Transparency',
Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(n,o)l
.boxColor[2]=1-o l.boxOutlineColor[2]=1-o c(ah.Info,n.Label,':',o)end}m:
Separator{Text='Box Fill'}m:Checkbox{Label='Enabled',Value=true,Callback=
function(n,o)l.boxFill=o c(ah.Info,n.Label,':',o)end}m:DragColor3{Value=Color3.
fromRGB(0,0,0),Label='Color',Callback=function(n,o)l.boxFillColor[1]=o c(ah.Info
,n.Label,':',o)end}m:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=
0.2,Format='Transparency = %.3f',Callback=function(n,o)l.boxFillColor[2]=o c(ah.
Info,n.Label,':',o)end}m:Separator{Text='Chams'}m:Checkbox{Label='Enabled',Value
=true,Callback=function(n,o)l.chams=o c(ah.Info,n.Label,':',o)end}m:Checkbox{
Label='Always On Top',Value=true,Callback=function(n,o)l.chamsVisibleOnly=not o
c(ah.Info,n.Label,':',o)end}m:DragColor3{Value=Color3.fromRGB(100,120,250),Label
='Color (Fill)',Callback=function(n,o)l.chamsFillColor[1]=o c(ah.Info,n.Label,
':',o)end}m:SliderFloat{Label='Transparency (Fill)',Minimum=0,Maximum=1,Value=
0.8,Format='Transparency = %.3f',Callback=function(n,o)l.chamsFillColor[2]=o c(
ah.Info,n.Label,':',o)end}m:DragColor3{Value=Color3.fromRGB(25,85,255),Label=
'Color (Outline)',Callback=function(n,o)l.chamsOutlineColor[1]=o c(ah.Info,n.
Label,':',o)end}m:SliderFloat{Label='Transparency (Outline)',Minimum=0,Maximum=1
,Value=0,Format='Transparency = %.3f',Callback=function(n,o)l.chamsOutlineColor[
2]=o c(ah.Info,n.Label,':',o)end}m:Separator{Text='Tracers'}m:Checkbox{Label=
'Enabled',Value=true,Callback=function(n,o)l.tracer=o c(ah.Info,n.Label,':',o)
end}m:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',Callback=function
(n,o)l.tracerColor[1]=o c(ah.Info,n.Label,':',o)end}m:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback
=function(n,o)l.tracerColor[2]=1-o l.tracerOutlineColor[2]=1-o c(ah.Info,n.Label
,':',o)end}m:Combo{Selected='Top',Label='Tracer Origin',Items={'Top','Middle',
'Bottom','Mouse'},Callback=function(n,o)l.tracerOrigin=o c(ah.Info,n.Label,':',o
)end}m:Separator{Text='Health Bars'}m:Checkbox{Label='Enabled',Value=true,
Callback=function(n,o)l.healthBar=o c(ah.Info,n.Label,':',o)end}m:DragColor3{
Value=Color3.fromRGB(58,161,47),Label='Healthy Color',Callback=function(n,o)l.
healthyColor=o end}m:DragColor3{Value=Color3.fromRGB(161,47,47),Label=
'Dying Color',Callback=function(n,o)l.dyingColor=o c(ah.Info,n.Label,':',o)end}m
:Separator{Text='Off Screen Arrows'}m:Checkbox{Label='Enabled',Value=true,
Callback=function(n,o)l.offScreenArrow=o c(ah.Info,n.Label,':',o)end}m:
DragColor3{Value=Color3.fromRGB(255,255,255),Label='Color',Callback=function(n,o
)l.offScreenArrowColor[1]=o c(ah.Info,n.Label,':',o)end}m:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback
=function(n,o)l.offScreenArrowColor[2]=1-o l.offScreenArrowOutlineColor[2]=1-o
c(ah.Info,n.Label,':',o)end}m:SliderInt{Label='Size',Value=15,Minimum=1,Maximum=
50,Callback=function(n,o)l.offScreenArrowSize=o c(ah.Info,n.Label,':',o)end}m:
SliderInt{Label='Radius',Value=150,Minimum=1,Maximum=800,Callback=function(n,o)l
.offScreenArrowRadius=o c(ah.Info,n.Label,':',o)end}m:Separator{Text='Names'}m:
Checkbox{Label='Enabled',Value=true,Callback=function(n,o)l.name=o c(ah.Info,n.
Label,':',o)end}m:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',
Callback=function(n,o)l.nameColor[1]=o c(ah.Info,n.Label,':',o)end}m:SliderFloat
{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(n,o)l.nameColor[2]=1-o c(ah.Info,n.Label,':',o)end}m:Separator
{Text='Distance Text'}m:Checkbox{Label='Enabled',Value=true,Callback=function(n,
o)l.distance=o c(ah.Info,n.Label,':',o)end}m:DragColor3{Value=Color3.fromRGB(221
,215,148),Label='Color',Callback=function(n,o)l.distanceColor[1]=o c(ah.Info,n.
Label,':',o)end}m:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,
Format='Transparency = %.3f',Callback=function(n,o)l.distanceColor[2]=1-o c(ah.
Info,n.Label,':',o)end}m:Separator{Text='Weapon Text'}m:Checkbox{Label=
'Weapon Text',Value=true,Callback=function(n,o)l.weapon=o c(ah.Info,n.Label,':',
o)end}m:DragColor3{Value=Color3.fromRGB(200,173,182),Label='Color',Callback=
function(n,o)l.weaponColor[1]=o c(ah.Info,n.Label,':',o)end}m:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback
=function(n,o)l.weaponColor[2]=1-o c(ah.Info,n.Label,':',o)end}m:Separator{Text=
'Health Text'}m:Checkbox{Label='Health Text',Value=true,Callback=function(n,o)l.
healthText=o c(ah.Info,n.Label,':',o)end}m:DragColor3{Value=Color3.fromRGB(200,
173,182),Label='Color',Callback=function(n,o)l.healthTextColor[1]=o c(ah.Info,n.
Label,':',o)end}m:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,
Format='Transparency = %.3f',Callback=function(n,o)l.healthTextColor[2]=1-o c(ah
.Info,n.Label,':',o)end}end local n=l:CreateTab{Name='Enemy'}m(ESP_E,n)local o=l
:CreateTab{Name='Friendly'}m(ESP_F,o)b.Settings:Keybind{Label='Menu Keybind',
Value=Enum.KeyCode.Home,IgnoreGameProcessed=false,Callback=function(p,r)ag:
SetVisible(not ag.Visible)end}ad.Load()ae.Load()c(ah.Success,UIName..
' loaded successfully.')end return aa end function a.f()local aa,ab={},a.load'a'
GetService=ab.SecureService local ac=a.load'b'UIName='RIOT V2'local ad=a.load'c'
ESP_E=ad.team.enemy ESP_F=ad.team.friendly local ae=a.load'd'Aimbot_S=ae.
Settings Aimbot_F=ae.FOVSettings local af,ag=GetService'ReplicatedStorage',
GetService'Workspace'local ah=af:FindFirstChild'Skorpio_Engine'local ai,b=ah and
ah:FindFirstChild'GunModels',ag:FindFirstChild'SE_Workspace'local c=b and b:
FindFirstChild'Drones'ActiveDronesESP={Settings={},Objects={}}local d=ag:
FindFirstChild'Gadgets'ActiveGadgetsESP={Settings={},Objects={}}local e=b and b:
FindFirstChild'Cameras'ActiveCamerasESP={Settings={},Objects={}}local f=ag:
FindFirstChild'Objective'ActiveBombsESP={Settings={},Objects={}}local g=function
(g,h,i,j,k)for l,m in pairs(g)do if m[h]and m[h][i]~=nil then if k and typeof(m[
h][i])=='table'then m[h][i][k]=j else m[h][i]=j end end end return i,j end
function aa.init(h)local i,j,k=ac:TabsWindow{Title=string.format(
'%q | %q - getriot.cc',tostring(UIName),tostring(h)),Size=UDim2.new(0,350,0,550)
,Position=UDim2.new(0.5,0,0,70)},{Success=`<font color="rgb(40, 240, 10)">[Success]</font>`
,Init=`<font color="rgb(240, 140, 10)">[Init]</font>`,Info=`<font color="rgb(10, 140, 240)">[Info]</font>`
}local l={Console=i:CreateTab{Name='Console'},Combat=i:CreateTab{Name='Combat'},
Visuals=i:CreateTab{Name='Visuals'},Misc=i:CreateTab{Name='Misc'},Settings=i:
CreateTab{Name='Settings'}}k=l.Console:Console{Value=j.Init..' UI Initialized',
ReadOnly=true,AutoScroll=true,RichText=true,MaxLines=250,Size=UDim2.new(1,0,0,
480)}local m,n=function(...)return k:AppendText(...)end,l.Combat:TabSelector{
Size=UDim2.new(1,0,0,500)}local o=n:CreateTab{Name='Aimbot'}o:Separator{Text=
'Aimbot Settings'}local p,r={[true]=
'Active: <font color="rgb(40, 240, 10)">true</font>',[false]=
'Active: <font color="rgb(240, 40, 10)">false</font>'}local s=o:Checkbox{Label=
'Enabled',Value=false,Callback=function(s,u)Aimbot_S.Enabled=u if r and r.Text==
p[true]and u==false then r.Text=p[false]end m(j.Info,s.Label,':',u)end}r=o:Label
{RichText=true,Text=p[false]}Aimbot_S.AutoStateLabel=function(u)if s.Value then
r.Text=p[u]end end local u=o:Label{RichText=true,Text=
'Locked to: <font color="rgb(240, 40, 10)">none</font>'}Aimbot_S.AutoLockedLabel
=function(v)if v then u.Text=string.format(
'Locked to: <font color="rgb(40, 240, 10)">%q</font>',v.Name)else u.Text=
'Locked to: <font color="rgb(240, 40, 10)">None</font>'end end local v,w o:Combo
{Selected='Mouse',Label='Lock Mode',Items={'Camera','Mouse'},Callback=function(x
,y)local z={Camera=1,Mouse=2}Aimbot_S.LockMode=z[y]local A=function(A,B)if v and
w then v:SetDisabled(A)w:SetDisabled(B)end end if y=='Camera'then A(false,true)
elseif y=='Mouse'then A(true,false)end m(j.Info,x.Label,':',y)end}o:Keybind{
Label='Trigger Keybind',Value=Enum.KeyCode.E,IgnoreGameProcessed=false,
OnKeybindSet=function(x,y)Aimbot_S.TriggerKey=y end}o:Checkbox{Label=
'Toggle Activation',Value=true,Callback=function(x,y)Aimbot_S.Toggle=y m(j.Info,
x.Label,':',y)end}o:Combo{Selected='Head',Label='Aiming Bone',Items={'Head',
'Torso'},Callback=function(x,y)Aimbot_S.LockPart=y m(j.Info,x.Label,':',y)end}o:
Checkbox{Label='Team Check',Value=true,Callback=function(x,y)Aimbot_S.TeamCheck=
y m(j.Info,x.Label,':',y)end}o:Checkbox{Label='Alive Check',Value=true,Callback=
function(x,y)Aimbot_S.AliveCheck=y m(j.Info,x.Label,':',y)end}o:Checkbox{Label=
'Wall Check',Value=true,Callback=function(x,y)Aimbot_S.WallCheck=y m(j.Info,x.
Label,':',y)end}v=o:SliderFloat{Label='Smoothing (Camera)',Minimum=0,Maximum=1,
Value=0,Format='Smoothing = %.3f',Callback=function(x,y)Aimbot_S.Sensitivity=y
m(j.Info,x.Label,':',y)end}v:SetDisabled(true)w=o:SliderFloat{Label=
'Smoothing (Mouse)',Minimum=1,Maximum=20,Value=1,Format='Smoothing = %.1f',
Callback=function(x,y)Aimbot_S.Sensitivity2=y m(j.Info,x.Label,':',y)end}o:
Separator{Text='FOV Settings'}o:Checkbox{Label='Enabled',Value=true,Callback=
function(x,y)Aimbot_F.Enabled=y m(j.Info,x.Label,':',y)end}o:Checkbox{Label=
'Visible',Value=true,Callback=function(x,y)Aimbot_F.Visible=y m(j.Info,x.Label,
':',y)end}o:SliderFloat{Label='Radius',Minimum=0,Maximum=500,Value=120,Format=
'Radius = %.0f',Callback=function(x,y)Aimbot_F.Radius=y m(j.Info,x.Label,':',y)
end}o:SliderFloat{Label='Circle Sides',Minimum=3,Maximum=80,Value=25,Format=
'Sides = %.0f',Callback=function(x,y)Aimbot_F.NumSides=y m(j.Info,x.Label,':',y)
end}o:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(x,y)Aimbot_F.Transparency=y m(j.Info,x.
Label,':',y)end}o:DragColor3{Value=Color3.fromRGB(240,40,10),Label='Color',
Callback=function(x,y)Aimbot_F.Color=y m(j.Info,x.Label,':',y)end}o:DragColor3{
Value=Color3.fromRGB(40,240,10),Label='Color (Locked)',Callback=function(x,y)
Aimbot_F.LockedColor=y m(j.Info,x.Label,':',y)end}l.Visuals:Separator{Text=
'Shared Settings'}local x local y=l.Visuals:Checkbox{Label='Limit Distance',
Value=false,Callback=function(y,z)ad.shared.limitDistance=z if x then x:
SetDisabled(not z)end m(j.Info,y.Label,':',z)end}x=l.Visuals:SliderFloat{Label=
'Limit',Minimum=1,Maximum=500,Value=150,Format='Distance Limit = %.0f',Callback=
function(z,A)ad.shared.maxDistance=A m(j.Info,z.Label,':',A)end}x:SetDisabled(
not y.Value)l.Visuals:Separator{Text='ESP'}local z,A=l.Visuals:TabSelector{Size=
UDim2.new(1,0,0,400)},function(z,A)A:Checkbox{Label='Enabled',Value=false,
Callback=function(B,C)z.enabled=C m(j.Info,B.Label,':',C)end}A:Separator{Text=
'Boxes'}A:Checkbox{Label='Enabled',Value=true,Callback=function(B,C)z.box=C m(j.
Info,B.Label,':',C)end}A:DragColor3{Value=Color3.fromRGB(77,92,143),Label=
'Color',Callback=function(B,C)z.boxColor[1]=C m(j.Info,B.Label,':',C)end}A:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(B,C)z.boxColor[2]=1-C z.boxOutlineColor[
2]=1-C m(j.Info,B.Label,':',C)end}A:Separator{Text='Box Fill'}A:Checkbox{Label=
'Enabled',Value=true,Callback=function(B,C)z.boxFill=C m(j.Info,B.Label,':',C)
end}A:DragColor3{Value=Color3.fromRGB(0,0,0),Label='Color',Callback=function(B,C
)z.boxFillColor[1]=C m(j.Info,B.Label,':',C)end}A:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0.2,Format='Transparency = %.3f',
Callback=function(B,C)z.boxFillColor[2]=C m(j.Info,B.Label,':',C)end}A:Separator
{Text='Chams'}A:Checkbox{Label='Enabled',Value=true,Callback=function(B,C)z.
chams=C m(j.Info,B.Label,':',C)end}A:Checkbox{Label='Always On Top',Value=true,
Callback=function(B,C)z.chamsVisibleOnly=not C m(j.Info,B.Label,':',C)end}A:
DragColor3{Value=Color3.fromRGB(100,120,250),Label='Color (Fill)',Callback=
function(B,C)z.chamsFillColor[1]=C m(j.Info,B.Label,':',C)end}A:SliderFloat{
Label='Transparency (Fill)',Minimum=0,Maximum=1,Value=0.8,Format=
'Transparency = %.3f',Callback=function(B,C)z.chamsFillColor[2]=C m(j.Info,B.
Label,':',C)end}A:DragColor3{Value=Color3.fromRGB(25,85,255),Label=
'Color (Outline)',Callback=function(B,C)z.chamsOutlineColor[1]=C m(j.Info,B.
Label,':',C)end}A:SliderFloat{Label='Transparency (Outline)',Minimum=0,Maximum=1
,Value=0.5,Format='Transparency = %.3f',Callback=function(B,C)z.
chamsOutlineColor[2]=C m(j.Info,B.Label,':',C)end}A:Separator{Text='Tracers'}A:
Checkbox{Label='Enabled',Value=true,Callback=function(B,C)z.tracer=C m(j.Info,B.
Label,':',C)end}A:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',
Callback=function(B,C)z.tracerColor[1]=C m(j.Info,B.Label,':',C)end}A:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(B,C)z.tracerColor[2]=1-C z.
tracerOutlineColor[2]=1-C m(j.Info,B.Label,':',C)end}A:Combo{Selected='Top',
Label='Tracer Origin',Items={'Top','Middle','Bottom','Mouse'},Callback=function(
B,C)z.tracerOrigin=C m(j.Info,B.Label,':',C)end}A:Separator{Text='Health Bars'}A
:Checkbox{Label='Enabled',Value=true,Callback=function(B,C)z.healthBar=C m(j.
Info,B.Label,':',C)end}A:DragColor3{Value=Color3.fromRGB(58,161,47),Label=
'Healthy Color',Callback=function(B,C)z.healthyColor=C end}A:DragColor3{Value=
Color3.fromRGB(161,47,47),Label='Dying Color',Callback=function(B,C)z.dyingColor
=C m(j.Info,B.Label,':',C)end}A:Separator{Text='Off Screen Arrows'}A:Checkbox{
Label='Enabled',Value=true,Callback=function(B,C)z.offScreenArrow=C m(j.Info,B.
Label,':',C)end}A:DragColor3{Value=Color3.fromRGB(255,255,255),Label='Color',
Callback=function(B,C)z.offScreenArrowColor[1]=C m(j.Info,B.Label,':',C)end}A:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(B,C)z.offScreenArrowColor[2]=1-C z.
offScreenArrowOutlineColor[2]=1-C m(j.Info,B.Label,':',C)end}A:SliderInt{Label=
'Size',Value=15,Minimum=1,Maximum=50,Callback=function(B,C)z.offScreenArrowSize=
C m(j.Info,B.Label,':',C)end}A:SliderInt{Label='Radius',Value=150,Minimum=1,
Maximum=800,Callback=function(B,C)z.offScreenArrowRadius=C m(j.Info,B.Label,':',
C)end}A:Separator{Text='Names'}A:Checkbox{Label='Enabled',Value=true,Callback=
function(B,C)z.name=C m(j.Info,B.Label,':',C)end}A:DragColor3{Value=Color3.
fromRGB(221,215,148),Label='Color',Callback=function(B,C)z.nameColor[1]=C m(j.
Info,B.Label,':',C)end}A:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(B,C)z.nameColor[2]=1-C m(
j.Info,B.Label,':',C)end}A:Separator{Text='Distance Text'}A:Checkbox{Label=
'Enabled',Value=true,Callback=function(B,C)z.distance=C m(j.Info,B.Label,':',C)
end}A:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',Callback=
function(B,C)z.distanceColor[1]=C m(j.Info,B.Label,':',C)end}A:SliderFloat{Label
='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(B,C)z.distanceColor[2]=1-C m(j.Info,B.Label,':',C)end}A:
Separator{Text='Weapon Text'}A:Checkbox{Label='Weapon Text',Value=true,Callback=
function(B,C)z.weapon=C m(j.Info,B.Label,':',C)end}A:DragColor3{Value=Color3.
fromRGB(200,173,182),Label='Color',Callback=function(B,C)z.weaponColor[1]=C m(j.
Info,B.Label,':',C)end}A:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(B,C)z.weaponColor[2]=1-C
m(j.Info,B.Label,':',C)end}A:Separator{Text='Health Text'}A:Checkbox{Label=
'Health Text',Value=true,Callback=function(B,C)z.healthText=C m(j.Info,B.Label,
':',C)end}A:DragColor3{Value=Color3.fromRGB(200,173,182),Label='Color',Callback=
function(B,C)z.healthTextColor[1]=C m(j.Info,B.Label,':',C)end}A:SliderFloat{
Label='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(B,C)z.healthTextColor[2]=1-C m(j.Info,B.Label,':',C)end}end
local B=z:CreateTab{Name='Enemy'}A(ESP_E,B)local C=z:CreateTab{Name='Friendly'}
A(ESP_F,C)local D,E=function(D,E)local F=function(F)table.insert(E.Objects,ad.
AddInstance(F,{enabled=E.Settings.enabled or false,text='{name} | {distance}',
textColor=E.Settings.textColor or{Color3.new(1,1,1),1},textOutline=E.Settings.
textOutline or true,textOutlineColor=E.Settings.textOutlineColor or{Color3.new(0
,0,0),1},textSize=E.Settings.textSize or 13,textFont=4,limitDistance=ad.shared.
limitDistance or false,maxDistance=ad.shared.maxDistance or 150}))end if D then
for G,H in pairs(D:GetChildren())do F(H)end D.ChildAdded:Connect(function(I)F(I)
end)end end,function(D,E)D:Checkbox{Label='Enabled',Value=false,Callback=
function(F,G)local H,I=g(E.Objects,'options','enabled',G)E.Settings[H]=I m(j.
Info,F.Label,':',G)end}D:DragColor3{Value=Color3.fromRGB(255,255,255),Label=
'Text Color',Callback=function(F,G)local H,I=g(E.Objects,'options','textColor',G
,1)E.Settings[H]=I m(j.Info,F.Label,':',G)end}D:SliderFloat{Label=
'Text Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(F,G)local H,I=g(E.Objects,'options','textColor',1-G,2)E.
Settings[H]=I m(j.Info,F.Label,':',G)end}D:Checkbox{Label='Text Outline',Value=
true,Callback=function(F,G)local H,I=g(E.Objects,'options','textOutline',G)E.
Settings[H]=I m(j.Info,F.Label,':',G)end}D:DragColor3{Value=Color3.fromRGB(0,0,0
),Label='Text Outline Color',Callback=function(F,G)local H,I=g(E.Objects,
'options','textOutlineColor',G,1)E.Settings[H]=I m(j.Info,F.Label,':',G)end}D:
SliderFloat{Label='Text Outline Transparency',Minimum=0,Maximum=1,Value=0,Format
='Transparency = %.3f',Callback=function(F,G)local H,I=g(E.Objects,'options',
'textOutlineColor',1-G,2)E.Settings[H]=I m(j.Info,F.Label,':',G)end}end D(c,
ActiveDronesESP)D(d,ActiveGadgetsESP)D(e,ActiveCamerasESP)D(f,ActiveBombsESP)
local F=z:CreateTab{Name='Drones'}E(F,ActiveDronesESP)local G=z:CreateTab{Name=
'Gadgets'}E(G,ActiveGadgetsESP)local H=z:CreateTab{Name='Cameras'}E(H,
ActiveCamerasESP)local I=z:CreateTab{Name='Bombs'}E(I,ActiveBombsESP)local J l.
Misc:Checkbox{Label='Spam Reload Sound',Value=false,Callback=function(K,L)if L
then J=task.spawn(function()while K.Value do ah.Events.ReloadSound:FireServer
'AR'task.wait(0.05)end end)else if J then task.cancel(J)end end m(j.Info,K.Label
,':',L)end}l.Settings:Keybind{Label='Menu Keybind',Value=Enum.KeyCode.Home,
IgnoreGameProcessed=false,Callback=function(K,L)i:SetVisible(not i.Visible)end}
ad.getWeapon=function(K)local L,M='None',ab.GetCharacter(K)if K and M then local
N=M:FindFirstChildOfClass'Model'local O=N and string.sub(N.Name,2)if N and ai
and ai:FindFirstChild(O)then L=O end end return string.upper(L)end ad.Load()ae.
Load()m(j.Success,UIName..' loaded successfully.')end return aa end end local aa
=cloneref(game)local ab,ac=aa.PlaceId,{Universal={File=a.load'e'},Arsenal={File=
a.load'f',Places={286090429}},['Operations: Siege']={File=a.load'g',Places={
13997018456,13997264379}}}for ad,ae in pairs(ac)do if ae.Places then for af,ag
in ipairs(ae.Places)do if ag==ab then ae.File.init(ad)return end end end end ac.
Universal.File.init'Universal'