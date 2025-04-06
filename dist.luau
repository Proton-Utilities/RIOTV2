--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/RIOTV2

    @author biggaboy212
    @name RIOT V2
    @version v1.0-alpha.1

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.ProtectGui=function(c)
local d=cloneref and cloneref(game)or game local e,f=pcall(function()c.Parent=
gethui and gethui()or cloneref and cloneref(d:GetService'CoreGui')or d:
GetService'CoreGui'end)return e and c or error('Failed to protect GUI: '..
tostring(f))end b.ProtectGui=newcclosure and newcclosure(b.ProtectGui)or b.
ProtectGui b.SecureService=function(c)local d=cloneref and cloneref(game)or game
local e,f=pcall(function()return cloneref and cloneref(d:GetService(c))or d:
GetService(c)end)return e and f or error('Unable to retrieve service: '..c)end b
.SecureService=newcclosure and newcclosure(b.SecureService)or b.SecureService
function b.GetPlayer()local c,d=pcall(function()return(b.SecureService'Players')
end)return c and(d).LocalPlayer or nil end function b.GetCharacter(c)local d,e=
pcall(function()return c and c.Character or nil end)return d and e or nil end
function b.GetHumanoid(c)local d,e=pcall(function()local d=b.GetCharacter(c)
return d and d:FindFirstChildOfClass'Humanoid'or nil end)return d and e or nil
end return b end function a.b()local b={}b.GetUI=function()return loadstring(
game:HttpGetAsync
[[https://raw.githubusercontent.com/biggaboy212/LinoriaLib/refs/heads/main/Library.lua]]
)()end b.GetSaveManager=function()return loadstring(game:HttpGetAsync
[[https://raw.githubusercontent.com/biggaboy212/LinoriaLib/refs/heads/main/addons/SaveManager.lua]]
)()end b.GetThemeManager=function()local c,d=game:GetService'HttpService',{}do d
.Folder='LinoriaLibSettings'd.Library=nil d.BuiltInThemes={Default={1,c:
JSONDecode
[[{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"81b8e6","BackgroundColor":"141414","OutlineColor":"323232"}]]
},BBot={2,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}]]
},Fatality={3,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}]]
},Jester={4,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},Mint={5,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},['Tokyo Night']={6,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}]]
},Ubuntu={7,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}]]
},Quartz={8,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}]]
}}function d:ApplyTheme(e)local f=self:GetCustomTheme(e)local g=f or self.
BuiltInThemes[e]if not g then return end local h=g[2]for i,j in next,f or h do
self.Library[i]=Color3.fromHex(j)if Options[i]then Options[i]:SetValueRGB(Color3
.fromHex(j))end end self:ThemeUpdate()end function d:ThemeUpdate()local e={
'FontColor','MainColor','AccentColor','BackgroundColor','OutlineColor'}for f,g
in next,e do if Options and Options[g]then self.Library[g]=Options[g].Value end
end self.Library.AccentColorDark=self.Library:GetDarkerColor(self.Library.
AccentColor)self.Library:UpdateColorsUsingRegistry()end function d:LoadDefault()
local e,f,g='Default',isfile(self.Folder..'/themes/default.txt')and readfile(
self.Folder..'/themes/default.txt'),true if f then if self.BuiltInThemes[f]then
e=f elseif self:GetCustomTheme(f)then e=f g=false end elseif self.BuiltInThemes[
self.DefaultTheme]then e=self.DefaultTheme end if g then Options.
ThemeManager_ThemeList:SetValue(e)else self:ApplyTheme(e)end end function d:
SaveDefault(e)writefile(self.Folder..'/themes/default.txt',e)end function d:
CreateThemeManager(e)e:AddLabel'Background color':AddColorPicker(
'BackgroundColor',{Default=self.Library.BackgroundColor})e:AddLabel'Main color':
AddColorPicker('MainColor',{Default=self.Library.MainColor})e:AddLabel
'Accent color':AddColorPicker('AccentColor',{Default=self.Library.AccentColor})e
:AddLabel'Outline color':AddColorPicker('OutlineColor',{Default=self.Library.
OutlineColor})e:AddLabel'Font color':AddColorPicker('FontColor',{Default=self.
Library.FontColor})local f={}for g,h in next,self.BuiltInThemes do table.insert(
f,g)end table.sort(f,function(g,h)return self.BuiltInThemes[g][1]<self.
BuiltInThemes[h][1]end)e:AddDivider()e:AddDropdown('ThemeManager_ThemeList',{
Text='Theme list',Values=f,Default=1})e:AddButton('Set as default',function()
self:SaveDefault(Options.ThemeManager_ThemeList.Value)self.Library:Notify(string
.format('Set default theme to %q',Options.ThemeManager_ThemeList.Value))end)
Options.ThemeManager_ThemeList:OnChanged(function()self:ApplyTheme(Options.
ThemeManager_ThemeList.Value)end)e:AddDivider()e:AddInput(
'ThemeManager_CustomThemeName',{Text='Custom theme name'})e:AddDropdown(
'ThemeManager_CustomThemeList',{Text='Custom themes',Values=self:
ReloadCustomThemes(),AllowNull=true,Default=1})e:AddDivider()e:AddButton(
'Save theme',function()self:SaveCustomTheme(Options.ThemeManager_CustomThemeName
.Value)Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
Options.ThemeManager_CustomThemeList:SetValue(nil)end):AddButton('Load theme',
function()self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value)end)e:
AddButton('Refresh list',function()Options.ThemeManager_CustomThemeList:
SetValues(self:ReloadCustomThemes())Options.ThemeManager_CustomThemeList:
SetValue(nil)end)e:AddButton('Set as default',function()if Options.
ThemeManager_CustomThemeList.Value~=nil and Options.ThemeManager_CustomThemeList
.Value~=''then self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)self.
Library:Notify(string.format('Set default theme to %q',Options.
ThemeManager_CustomThemeList.Value))end end)d:LoadDefault()local g=function()
self:ThemeUpdate()end Options.BackgroundColor:OnChanged(g)Options.MainColor:
OnChanged(g)Options.AccentColor:OnChanged(g)Options.OutlineColor:OnChanged(g)
Options.FontColor:OnChanged(g)end function d:GetCustomTheme(e)local f=self.
Folder..'/themes/'..e if not isfile(f)then return nil end local g=readfile(f)
local h,i=pcall(c.JSONDecode,c,g)if not h then return nil end return i end
function d:SaveCustomTheme(e)if e:gsub(' ','')==''then return self.Library:
Notify('Invalid file name for theme (empty)',3)end local f,g={},{'FontColor',
'MainColor','AccentColor','BackgroundColor','OutlineColor'}for h,i in next,g do
f[i]=Options[i].Value:ToHex()end writefile(self.Folder..'/themes/'..e..'.json',c
:JSONEncode(f))end function d:ReloadCustomThemes()local e,f=listfiles(self.
Folder..'/themes'),{}for g=1,#e do local h=e[g]if h:sub(-5)=='.json'then local i
=h:find('.json',1,true)local j=h:sub(i,i)while j~='/'and j~='\\'and j~=''do i=i-
1 j=h:sub(i,i)end if j=='/'or j=='\\'then table.insert(f,h:sub(i+1))end end end
return f end function d:SetLibrary(e)self.Library=e end function d:
BuildFolderTree()local e,f={},self.Folder:split'/'for g=1,#f do e[#e+1]=table.
concat(f,'/',1,g)end table.insert(e,self.Folder..'/themes')table.insert(e,self.
Folder..'/settings')for g=1,#e do local h=e[g]if not isfolder(h)then makefolder(
h)end end end function d:SetFolder(e)self.Folder=e self:BuildFolderTree()end
function d:CreateGroupBox(e)assert(self.Library,
'Must set ThemeManager.Library first!')return e:AddLeftGroupbox'Themes'end
function d:ApplyToTab(e)assert(self.Library,
'Must set ThemeManager.Library first!')local f=self:CreateGroupBox(e)self:
CreateThemeManager(f)end function d:ApplyToGroupbox(e)assert(self.Library,
'Must set ThemeManager.Library first!')self:CreateThemeManager(e)end d:
BuildFolderTree()end return d end return b end function a.c()local b=a.load'a'.
SecureService local c,d,e,f,g=b'RunService',b'Players',b'Workspace',b
'UserInputService',b'CoreGui'local h,i=d.LocalPlayer,e.CurrentCamera local j,k,l
,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K=i.ViewportSize,math.floor,
math.round,math.sin,math.cos,table.clear,table.unpack,table.find,table.create,
CFrame.fromMatrix,i.WorldToViewportPoint,e.IsA,e.GetPivot,e.FindFirstChild,e.
FindFirstChildOfClass,e.GetChildren,CFrame.identity.PointToObjectSpace,Color3.
new().Lerp,Vector2.zero.Min,Vector2.zero.Max,Vector2.zero.Lerp,Vector3.zero.Min,
Vector3.zero.Max,Vector2.new(7,0),Vector2.new(0,1),Vector2.new(0,2),Vector2.new(
5,0),{Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),Vector3.
new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3
.new(1,-1,1)}local L,M=function(L)local M,N for O=1,#L do local P=L[O]local Q,R=
P.CFrame,P.Size M=E(M or Q.Position,(Q-R*0.5).Position)N=F(N or Q.Position,(Q+R*
0.5).Position)end local O=(M+N)*0.5 local P=Vector3.new(O.X,O.Y,N.Z)return
CFrame.new(O,P),N-M end,function(L)local M,N=t(i,L)return Vector2.new(M.X,M.Y),N
,M.Z end local N,O,P,Q=function(N,O)local P=r(#K)for Q=1,#K do P[Q]=M((N+O*0.5*K
[Q]).Position)end local Q,R=B(j,p(P)),C(Vector2.zero,p(P))return{corners=P,
topLeft=Vector2.new(k(Q.X),k(Q.Y)),topRight=Vector2.new(k(R.X),k(Q.Y)),
bottomLeft=Vector2.new(k(Q.X),k(R.Y)),bottomRight=Vector2.new(k(R.X),k(R.Y))}end
,function(N,O)local P,Q,R,S=N.X,N.Y,n(O),m(O)return Vector2.new(P*R-Q*S,P*S+Q*R)
end,function(N,O,P)if O=='Team Color'or(N.interface.shared.useTeamColor and not
P)then return N.interface.getTeamColor(N.player)or Color3.new(1,1,1)end return O
end,{}Q.__index=Q function Q.new(R,S)local T=setmetatable({},Q)T.player=assert(R
,'Missing argument #1 (Player expected)')T.interface=assert(S,
'Missing argument #2 (table expected)')T:Construct()return T end function Q:
_create(R,S)local T=Drawing.new(R)for U,V in next,S do pcall(function()T[U]=V
end)end self.bin[#self.bin+1]=T return T end function Q:Construct()self.
charCache={}self.childCount=0 self.bin={}self.drawings={box3d={{self:_create(
'Line',{Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=
false}),self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
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
function(R)self:Update(R)self:Render(R)end)end function Q:Destruct()self.
renderConnection:Disconnect()for R=1,#self.bin do self.bin[R]:Remove()end o(self
)end function Q:Update()local R=self.interface self.options=R.team[R.isFriendly(
self.player)and'friendly'or'enemy']self.character=R.getCharacter(self.player)
self.health,self.maxHealth=R.getHealth(self.player)self.weapon=R.getWeapon(self.
player)self.enabled=self.options.enabled and self.character and not(#R.whitelist
>0 and not q(R.whitelist,self.player.UserId))local S=self.enabled and w(self.
character,'Head')if not S then self.charCache={}self.onScreen=false return end
local T,U,V=M(S.Position)self.onScreen=U self.distance=V if R.shared.
limitDistance and V>R.shared.maxDistance then self.onScreen=false end if self.
onScreen then local W,X=self.charCache,y(self.character)if not W[1]or self.
childCount~=#X then o(W)for Y=1,#X do local Z=X[Y]if u(Z,'BasePart')and R.
isBodyPart(Z.Name)then W[#W+1]=Z end end self.childCount=#X end self.corners=N(
L(W))elseif self.options.offScreenArrow then local W=i.CFrame local X=s(W.
Position,W.RightVector,Vector3.yAxis)local Y=z(X,S.Position)self.direction=
Vector2.new(Y.X,Y.Z).Unit end end function Q:Render()local R,S,T,U,V,W,X,Y=self.
onScreen or false,self.enabled or false,self.drawings.visible,self.drawings.
hidden,self.drawings.box3d,self.interface,self.options,self.corners T.box.
Visible=S and R and X.box T.boxOutline.Visible=T.box.Visible and X.boxOutline if
T.box.Visible then local Z=T.box Z.Position=Y.topLeft Z.Size=Y.bottomRight-Y.
topLeft Z.Color=P(self,X.boxColor[1])Z.Transparency=X.boxColor[2]local _=T.
boxOutline _.Position=Z.Position _.Size=Z.Size _.Color=P(self,X.boxOutlineColor[
1],true)_.Transparency=X.boxOutlineColor[2]end T.boxFill.Visible=S and R and X.
boxFill if T.boxFill.Visible then local Z=T.boxFill Z.Position=Y.topLeft Z.Size=
Y.bottomRight-Y.topLeft Z.Color=P(self,X.boxFillColor[1])Z.Transparency=X.
boxFillColor[2]end T.healthBar.Visible=S and R and X.healthBar T.
healthBarOutline.Visible=T.healthBar.Visible and X.healthBarOutline if T.
healthBar.Visible then local Z,_,aa=Y.topLeft-G,Y.bottomLeft-G,T.healthBar aa.To
=_ aa.From=D(_,Z,self.health/self.maxHealth)aa.Color=A(X.dyingColor,X.
healthyColor,self.health/self.maxHealth)local ab=T.healthBarOutline ab.To=_+H ab
.From=Z-H ab.Color=P(self,X.healthBarOutlineColor[1],true)ab.Transparency=X.
healthBarOutlineColor[2]end T.name.Visible=S and R and X.name if T.name.Visible
then local aa=T.name aa.Size=W.shared.textSize aa.Font=W.shared.textFont aa.
Color=P(self,X.nameColor[1])aa.Transparency=X.nameColor[2]aa.Outline=X.
nameOutline aa.OutlineColor=P(self,X.nameOutlineColor,true)aa.Position=(Y.
topLeft+Y.topRight)*0.5-Vector2.yAxis*aa.TextBounds.Y-I end local aa=Y and Y.
topRight.Y or 0 T.distance.Visible=S and R and self.distance and X.distance if T
.distance.Visible then local ab=T.distance ab.Text=l(self.distance*0.28)..'M'ab.
Size=W.shared.textSize ab.Font=W.shared.textFont ab.Color=P(self,X.distanceColor
[1])ab.Transparency=X.distanceColor[2]ab.Outline=X.distanceOutline ab.
OutlineColor=P(self,X.distanceOutlineColor,true)ab.Position=Vector2.new(Y.
topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5-J.Y)aa=aa+ab.
TextBounds.Y+J.Y end T.weapon.Visible=S and R and X.weapon if T.weapon.Visible
then local ab=T.weapon ab.Text=self.weapon ab.Size=W.shared.textSize ab.Font=W.
shared.textFont ab.Color=P(self,X.weaponColor[1])ab.Transparency=X.weaponColor[2
]ab.Outline=X.weaponOutline ab.OutlineColor=P(self,X.weaponOutlineColor,true)ab.
Position=Vector2.new(Y.topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5
)aa=aa+ab.TextBounds.Y+J.Y end T.healthText.Visible=S and R and X.healthText if
T.healthText.Visible then local ab=T.healthText ab.Text=l(self.health)..'HP'ab.
Size=W.shared.textSize ab.Font=W.shared.textFont ab.Color=P(self,X.
healthTextColor[1])ab.Transparency=X.healthTextColor[2]ab.Outline=X.
healthTextOutline ab.OutlineColor=P(self,X.healthTextOutlineColor,true)ab.
Position=Vector2.new(Y.topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5
)end T.tracer.Visible=S and R and X.tracer T.tracerOutline.Visible=T.tracer.
Visible and X.tracerOutline if T.tracer.Visible then local ab=T.tracer ab.Color=
P(self,X.tracerColor[1])ab.Transparency=X.tracerColor[2]ab.To=(Y.bottomLeft+Y.
bottomRight)*0.5 ab.From=X.tracerOrigin=='Middle'and j*0.5 or X.tracerOrigin==
'Top'and j*Vector2.new(0.5,0)or X.tracerOrigin=='Bottom'and j*Vector2.new(0.5,1)
or X.tracerOrigin=='Mouse'and f:GetMouseLocation()local Z=T.tracerOutline Z.
Color=P(self,X.tracerOutlineColor[1],true)Z.Transparency=X.tracerOutlineColor[2]
Z.To=ab.To Z.From=ab.From end U.arrow.Visible=S and(not R)and X.offScreenArrow U
.arrowOutline.Visible=U.arrow.Visible and X.offScreenArrowOutline if U.arrow.
Visible and self.direction then local ab=U.arrow ab.PointA=B(C(j*0.5+self.
direction*X.offScreenArrowRadius,Vector2.one*25),j-Vector2.one*25)ab.PointB=ab.
PointA-O(self.direction,0.45)*X.offScreenArrowSize ab.PointC=ab.PointA-O(self.
direction,-0.45)*X.offScreenArrowSize ab.Color=P(self,X.offScreenArrowColor[1])
ab.Transparency=X.offScreenArrowColor[2]local Z=U.arrowOutline Z.PointA=ab.
PointA Z.PointB=ab.PointB Z.PointC=ab.PointC Z.Color=P(self,X.
offScreenArrowOutlineColor[1],true)Z.Transparency=X.offScreenArrowOutlineColor[2
]end local ab=S and R and X.box3d for Z=1,#V do local _=V[Z]for ac=1,#_ do local
ad=_[ac]ad.Visible=ab ad.Color=P(self,X.box3dColor[1])ad.Transparency=X.
box3dColor[2]end if ab then local ac=_[1]ac.From=Y.corners[Z]ac.To=Y.corners[Z==
4 and 1 or Z+1]local ad=_[2]ad.From=Y.corners[Z==4 and 1 or Z+1]ad.To=Y.corners[
Z==4 and 5 or Z+5]local ae=_[3]ae.From=Y.corners[Z==4 and 5 or Z+5]ae.To=Y.
corners[Z==4 and 8 or Z+4]end end end local aa={}aa.__index=aa function aa.new(
ab,ac)local ad=setmetatable({},aa)ad.player=assert(ab,
'Missing argument #1 (Player expected)')ad.interface=assert(ac,
'Missing argument #2 (table expected)')ad:Construct()return ad end function aa:
Construct()self.highlight=Instance.new('Highlight',g)self.updateConnection=c.
RenderStepped:Connect(function()self:Update()end)end function aa:Destruct()self.
updateConnection:Disconnect()self.highlight:Destroy()o(self)end function aa:
Update()local ab,ac=self.highlight,self.interface local ad,ae=ac.getCharacter(
self.player),ac.team[ac.isFriendly(self.player)and'friendly'or'enemy']local R=ae
.enabled and ad and not(#ac.whitelist>0 and not q(ac.whitelist,self.player.
UserId))ab.Enabled=R and ae.chams if ab.Enabled then ab.Adornee=ad ab.FillColor=
P(self,ae.chamsFillColor[1])ab.FillTransparency=ae.chamsFillColor[2]ab.
OutlineColor=P(self,ae.chamsOutlineColor[1],true)ab.OutlineTransparency=ae.
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
then ad.Visible=false return end local R=v(ac).Position local S,T,U=M(R)if ae.
limitDistance and U>ae.maxDistance then T=false end ad.Visible=T if ad.Visible
then ad.Position=S ad.Color=ae.textColor[1]ad.Transparency=ae.textColor[2]ad.
Outline=ae.textOutline ad.OutlineColor=ae.textOutlineColor ad.Size=ae.textSize
ad.Font=ae.textFont ad.Text=ae.text:gsub('{name}',string.upper(ac.Name)):gsub(
'{distance}',l(U*0.28)..'M'):gsub('{position}',string.upper(tostring(R)))end
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
chamsOutlineColor={Color3.new(0,1,0),0}}}}function ac.AddInstance(ad,ae)local R=
ac._objectCache if R[ad]then warn'Instance handler already exists.'else R[ad]={
ab.new(ad,ae)}end return R[ad][1]end function ac.Load()assert(not ac._hasLoaded,
'Esp has already been loaded.')local ad,ae,R=function(ad)ac._objectCache[ad]={Q.
new(ad,ac),aa.new(ad,ac)}end,function(ad)local ae=ac._objectCache[ad]if ae then
for R=1,#ae do ae[R]:Destruct()end ac._objectCache[ad]=nil end end,d:GetPlayers(
)for S=ac.shared.includeLocalPlayer and 1 or 2,#R do ad(R[S])end ac.playerAdded=
d.PlayerAdded:Connect(ad)ac.playerRemoving=d.PlayerRemoving:Connect(ae)ac.
_hasLoaded=true end function ac.Unload()assert(ac._hasLoaded,
'Esp has not been loaded yet.')for ad,ae in next,ac._objectCache do for R=1,#ae
do ae[R]:Destruct()end ac._objectCache[ad]=nil end ac.playerAdded:Disconnect()ac
.playerRemoving:Disconnect()ac._hasLoaded=false end function ac.getWeapon(ad)
local ae='None'if ad and ad.Character then local R=ad.Character:
FindFirstChildOfClass'Tool'if R then ae=R.Name end end return string.upper(ae)
end function ac.isFriendly(ad)return ad.Team and ad.Team==h.Team end function ac
.getTeamColor(ad)return ad.Team and ad.Team.TeamColor and ad.Team.TeamColor.
Color end function ac.getCharacter(ad)return ad.Character end function ac.
isBodyPart(ad)return ad=='Head'or ad:find'Torso'or ad:find'Leg'or ad:find'Arm'
end function ac.getHealth(ad)local ae=ad and ac.getCharacter(ad)local R=ae and
x(ae,'Humanoid')if R then return R.Health,R.MaxHealth end return 100,100 end
return ac end function a.d()local aa,ab,ac,ad,ae,b,c,d,e,f,g,h,i,j=game,
workspace,Vector2.new,Vector3.zero,CFrame.new,Color3.fromRGB,Drawing.new,
TweenInfo.new,mousemoverel or(Input and Input.MouseMove),table.find,table.remove
,string.lower,string.sub,math.clamp local k=getrawmetatable and getrawmetatable(
aa)or{__index=function(k,l)return k[l]end,__newindex=function(k,l,m)k[l]=m end}
local l,m=k.__index,k.__newindex local n=l(aa,'GetService')local o,p,q,r=n(aa,
'RunService'),n(aa,'UserInputService'),n(aa,'TweenService'),n(aa,'Players')local
s,t,u,v,w=l(r,'LocalPlayer'),l(ab,'CurrentCamera'),l(aa,'FindFirstChild'),l(aa,
'FindFirstChildOfClass'),l(aa,'GetDescendants')local x,y,z,A,B,C,D,E,F,G,H,I=l(t
,'WorldToViewportPoint'),l(t,'GetPartsObscuringTarget'),l(p,'GetMouseLocation'),
l(r,'GetPlayers'),2000,false,{},l(aa,'DescendantAdded').Connect,{
DeveloperSettings={UpdateMode='RenderStepped',TeamCheckOption='Team'},Triggerbot
={Enabled=false,TeamCheck=true,AliveCheck=true,WeaponCheck=true,Delay=0,
TargetChanged=function(x)return end},Aimbot={Enabled=false,LockMode=2,LockPart=
'Head',TeamCheck=true,AliveCheck=true,WallCheck=1,Sensitivity=0,Sensitivity2=1,
OffsetToMoveDirection=false,OffsetIncrement=15},FOVSettings={Enabled=false,
Visible=true,Radius=90,NumSides=60,Thickness=2,Transparency=1,Filled=false,Color
=b(255,255,255),OutlineColor=b(0,0,0),LockedColor=b(255,150,150)},Blacklisted={}
,FOVCircleOutline=c'Circle',FOVCircle=c'Circle'}local J,K,L=F,function(J)local K
for L,M in next,A(r)do local N=l(M,'Name')if i(h(N),1,#J)==h(J)then K=N end end
return K end,function(J)return ac(J.X,J.Y)end local M=function()J.Locked=nil
local M=J.FOVCircle M.Color=J.FOVSettings.Color m(p,'MouseDeltaSensitivity',H)if
G then G:Cancel()end end function J.Aimbot.SetState(N)C=N if not N then M()end
end local N,O=function()local N=J.Aimbot local O=N.LockPart if not J.Locked then
B=J.FOVSettings.Enabled and J.FOVSettings.Radius or 2000 for P,Q in next,A(r)do
local R=l(Q,'Character')local S=R and v(R,'Humanoid')if Q~=s and not f(J.
Blacklisted,l(Q,'Name'))and R and u(R,O)and S then local T,U=l(R[O],'Position'),
J.DeveloperSettings.TeamCheckOption if N.TeamCheck and l(Q,U)and l(Q,U)==l(s,U)
then continue end if N.AliveCheck and l(S,'Health')<=0 then continue end if N.
WallCheck==2 or N.WallCheck==3 then local V=w(l(s,'Character'))for W,X in next,
w(R)do V[#V+1]=X end if#y(t,{T},V)>0 then continue end end local V,W,X=x(t,T)V=
L(V)X=(z(p)-V).Magnitude if X<B and W then B,J.Locked=X,Q end end end else local
P=l(J.Locked,'Character')if P then local Q=u(P,O)if not Q then M()return end
local R=l(P[O],'Position')local S,T=x(t,R)S=L(S)local U=(z(p)-S).Magnitude if N.
WallCheck==3 then local V=w(l(s,'Character'))for W,X in next,w(P)do V[#V+1]=X
end if#y(t,{R},V)>0 then M()return end end if(U>B or not T)then M()end else M()
end end end,function()local N=J.Triggerbot if not N.Enabled then N.
TargetChanged()return end local O=l(s,'GetMouse')and s:GetMouse()if not O then N
.TargetChanged()return end local P=ab.CurrentCamera local Q,R,S=Ray.new(P.CFrame
.Position,(O.Hit.Position-P.CFrame.Position).Unit*1000),{s.Character,P},
RaycastParams.new()S.FilterDescendantsInstances=R S.FilterType=Enum.
RaycastFilterType.Blacklist local T=ab:Raycast(Q.Origin,Q.Direction,S)if not T
then N.TargetChanged()return end local U=T.Instance local V=U:
FindFirstAncestorOfClass'Model'if not V then N.TargetChanged()return end local W
,X={},false for Y,Z in pairs(V:GetChildren())do if Z.Name=='Head'or Z.Name:find
'Torso'or Z.Name:find'Leg'or Z.Name:find'Arm'then table.insert(W,Z)end end X=
table.find(W,U)or U:IsDescendantOf(table.find(W,U))if not X then N.
TargetChanged()return end local Y=r:GetPlayerFromCharacter(V)if not Y or Y==s
then N.TargetChanged()return end local Z=J.DeveloperSettings.TeamCheckOption if
N.TeamCheck and l(Y,Z)and l(Y,Z)==l(s,Z)then N.TargetChanged()return end if N.
AliveCheck then local _=v(V,'Humanoid')if l(_,'Health')<=0 then N.TargetChanged(
)return end end N.TargetChanged(Y)task.wait(N.Delay)mouse1press()task.wait()
mouse1release()end local P=function()H=l(p,'MouseDeltaSensitivity')local P,Q,R,S
,T,U=J.Aimbot,J.Triggerbot,J.FOVCircle,J.FOVCircleOutline,(J.FOVSettings)D.
RenderSteppedConnection=E(l(o,J.DeveloperSettings.UpdateMode),function()local V,
W=P.OffsetToMoveDirection,P.LockPart if T.Enabled and P.Enabled then R.Color=(J.
Locked and T.LockedColor)or T.Color S.Color=T.OutlineColor R.Thickness=T.
Thickness S.Thickness=T.Thickness+1 R.Position=z(p)S.Position=z(p)R.NumSides=T.
NumSides S.NumSides=T.NumSides R.Radius=T.Radius S.Radius=T.Radius R.
Transparency=1-T.Transparency S.Transparency=1-T.Transparency R.Visible=T.
Visible S.Visible=T.Visible else R.Visible=false S.Visible=false end if Q.
Enabled then O()end if C and P.Enabled then N()U=V and l(v(l(J.Locked,
'Character'),'Humanoid'),'MoveDirection')*(j(P.OffsetIncrement,1,30)/10)or ad if
J.Locked then local X=l(l(J.Locked,'Character')[W],'Position')local Y=x(t,X+U)
local Z,_=(Y.X-z(p).X)/P.Sensitivity2,(Y.Y-z(p).Y)/P.Sensitivity2 if J.Aimbot.
LockMode==2 then e(Z,_)else if P.Sensitivity>0 then G=q:Create(t,d(J.Aimbot.
Sensitivity,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{CFrame=ae(t.CFrame.
Position,X+U)})G:Play()else m(t,'CFrame',ae(t.CFrame.Position,X+U))end end end
end end)end function J.Exit(Q)assert(Q,
'Aimbot.Exit: Missing parameter #1 "self" <table>.')for R,S in next,D do I(D[R])
end P=nil L=nil M=nil N=nil K=nil Q.FOVCircle:Remove()Q.FOVCircleOutline:Remove(
)end function J.Restart()for Q,R in next,D do I(D[Q])end P()end function J.
Blacklist(Q,R)assert(Q,'Aimbot.Blacklist: Missing parameter #1 "self" <table>.')
assert(R,'Aimbot.Blacklist: Missing parameter #2 "Username" <string>.')R=K(R)
assert(Q,'Aimbot.Blacklist: User '..R.." couldn't be found.")Q.Blacklisted[#Q.
Blacklisted+1]=R end function J.Whitelist(Q,R)assert(Q,
'Aimbot.Whitelist: Missing parameter #1 "self" <table>.')assert(R,
'Aimbot.Whitelist: Missing parameter #2 "Username" <string>.')R=K(R)assert(R,
'Aimbot.Whitelist: User '..R.." couldn't be found.")local S=f(Q.Blacklisted,R)
assert(S,'Aimbot.Whitelist: User '..R..' is not blacklisted.')g(Q.Blacklisted,S)
end J.Load=P setmetatable(J,{__call=P})return J end function a.e()return
function(aa)local ab,ac=a.load'a',a.load'b'local ad,ae,b,c,d,e,f=ac.GetUI(),ac.
GetSaveManager(),ac.GetThemeManager(),a.load'c',a.load'd',getgenv().Options,
getgenv().Toggles local g,h=c.shared,c.team local i,j,k,l,m,n=h.enemy,h.friendly
,d.Aimbot,d.Triggerbot,d.FOVSettings,ab.SecureService local o,p,q=n'Stats',n
'RunService',ad:CreateWindow{Title=`RIOT V2 | {aa.Name} - getriot.cc`,Center=
true,AutoShow=true,TabPadding=5,MenuFadeTime=0.1}local r={Combat=q:AddTab
'Combat',Visuals=q:AddTab'Visuals',Settings=q:AddTab'Settings'}do local s={
Aimbot=r.Combat:AddGroupbox{Side=1,Name='Aimbot'}}s.Aimbot:AddToggle(
'AimbotEnabled',{Text='Enabled',Default=false,Callback=function(t)k.Enabled=t
end}):AddKeyPicker('AimbotEnabledKeybind',{Default='MB2',Mode='Hold',Text=
'Aimbot',NoUI=false,Callback=function(t)k.SetState(t)end})s.Aimbot:AddDropdown(
'AimbotLockMethod',{Values={'Camera','Mouse'},Default=1,Multi=false,Text=
'Lock Method',Tooltip=
[[Camera: Orients your camera to face the player | Mouse: Moves your mouse to the player]]
,Callback=function(t)k.LockMode=({Camera=1,Mouse=2})[t]end})s.Aimbot:AddSlider(
'AimbotSmoothingCamera',{Text='Smoothing (Camera)',Tooltip=
'Smoothing for the Camera lock method',Default=0,Min=0,Max=0.5,Rounding=3,
Callback=function(t)k.Sensitivity=t end})s.Aimbot:AddSlider(
'AimbotSmoothingMouse',{Text='Smoothing (Mouse)',Tooltip=
'Smoothing for the Mouse lock method',Default=1,Min=1,Max=20,Rounding=1,Callback
=function(t)k.Sensitivity2=t end})s.Aimbot:AddDropdown('AimbotWallCheckMode',{
Values={'Off','Sticky','Always On'},Default=3,Multi=false,Text='Wall Check',
Callback=function(t)local u=table.find(e.AimbotWallCheckMode.Values,t)if u then
k.WallCheck=u end end})s.Aimbot:AddDropdown('AimbotAimingBone',{Values={'Head',
'Torso'},Default=1,Multi=false,Text='Lock Bone',Tooltip=
'The bone aimbot locks to',Callback=function(t)k.LockPart=t end})s.Aimbot:
AddDivider()s.Aimbot:AddToggle('AimbotFOVEnabled',{Text='FOV Enabled',Default=
true,Callback=function(t)m.Enabled=t end})s.Aimbot:AddToggle('AimbotFOVVisible',
{Text='FOV Visible',Default=true,Callback=function(t)m.Visible=t end}):
AddColorPicker('AimbotFOVLockedColor',{Default=Color3.new(0,1,0),Title=
'Locked color',Callback=function(t)m.LockedColor=t end}):AddColorPicker(
'AimbotFOVUnlockedColor',{Default=Color3.new(1,0,0),Title='Unlocked color',
Callback=function(t)m.Color=t end})s.Aimbot:AddSlider('AimbotFOVCirclePoints',{
Text='FOV Circle Points',Tooltip='The amount of points the circle is made of',
Default=60,Min=3,Max=60,Rounding=0,Callback=function(t)m.NumSides=t end})s.
Aimbot:AddSlider('AimbotFOVCircleTransparency',{Text='FOV Circle Transparency',
Tooltip='The transparency of the circle',Default=0,Min=0,Max=1,Rounding=3,
Callback=function(t)m.Transparency=t end})end do local s={Menu=r.Settings:
AddGroupbox{Side=1,Name='Menu'}}s.Menu:AddButton('Unload',function()ad:Unload()
end)s.Menu:AddLabel'Menu bind':AddKeyPicker('MenuKeybind',{Default='End',NoUI=
true,Text='Menu keybind'})end local s,t,u=tick(),0,60 local v,w=p.RenderStepped:
Connect(function()t+=1 if(tick()-s)>=1 then u=t s=tick()t=0 end ad:SetWatermark(
`RIOT V2 | framerate: {math.floor(u)} fps | rtt: {math.round(o.Network.
ServerStatsItem['Data Ping']:GetValue())}ms`)end),function(v)for w,x in pairs(v)
do if x.Callback then if x.Type=='KeyPicker'then x.Challback(false)elseif x.
Value then x.Callback(x.Value)end end end end w(f)w(e)c.Load()d.Load()ad.
KeybindFrame.Visible=true ad.ToggleKeybind=e.MenuKeybind ad:
SetWatermarkVisibility(true)b:SetLibrary(ad)ae:SetLibrary(ad)ae:
IgnoreThemeSettings()ae:SetIgnoreIndexes{'MenuKeybind'}b:SetFolder(`RIOTV2`)ae:
SetFolder(`RIOTV2/{aa.Name}`)ae:BuildConfigSection(r.Settings)b:ApplyToTab(r.
Settings)ae:LoadAutoloadConfig()ad:OnUnload(function()v:Disconnect()end)end end
function a.f()local aa,ab={Components={},Assets={DefaultImage=
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
KeyCode.Space]='VK_SPACE'},GetService=function(aa)return cloneref and cloneref(
game:GetService(aa))or game:GetService(aa)end}local ac={_players=ab.GetService
'Players',_runService=ab.GetService'RunService',_userInputService=ab.GetService
'UserInputService',_tweenService=ab.GetService'TweenService',_workspace=ab.
GetService'Workspace'}local ad={tween=function(ad,ae,b)return ac._tweenService:
Create(ad,ae,b)end,callback=function(ad,...)local ae={...}task.spawn(function()
ad(table.unpack(ae))end)end,parseKeyCode=function(ad)if ab.KeyMap_Spec[ad]then
return ab.KeyMap_Spec[ad]end if ad.Name then return'VK_'..ad.Name:upper()end
return'VK_UNKNOWN'end,secureGui=function(ad)local ae=Instance.new'ScreenGui'for
b,c in pairs(ad)do if b~='Parent'then pcall(function()ae[b]=c end)end end ae.
Parent=(ac._runService:IsStudio()and ab.localPlayer:FindFirstChild'PlayerGui'or
gethui and gethui()or ab.GetService'CoreGui')return ae end,mouseInFrame=function
(ad)local ae,b,c=ac._userInputService:GetMouseLocation(),ad.AbsolutePosition,ad.
AbsoluteSize return ae.X>=b.X and ae.X<=b.X+c.X and ae.Y>=b.Y and ae.Y<=b.Y+c.Y
end,makeDraggable=function(ad,ae)assert(ad,
'Expected a base frame for makeDraggable')ae=ae or ad local b,c,d,e=false local
f=function(f)local g=f.Position-c ad.Position=UDim2.new(d.X.Scale,d.X.Offset+g.X
,d.Y.Scale,d.Y.Offset+g.Y)end ae.InputBegan:Connect(function(g)if g.
UserInputType==Enum.UserInputType.MouseButton1 or g.UserInputType==Enum.
UserInputType.Touch then b=true c=g.Position d=ad.Position g.Changed:Connect(
function()if g.UserInputState==Enum.UserInputState.End then b=false end end)end
end)ae.InputChanged:Connect(function(g)if g.UserInputType==Enum.UserInputType.
MouseMovement or g.UserInputType==Enum.UserInputType.Touch then e=g end end)ac.
_userInputService.InputChanged:Connect(function(g)if b and g==e and ad.Visible
then f(g)end end)end,subParser={None=function(ad)return ad end,Numeric=function(
ad)return ad:gsub('%D','')end,Alphabetic=function(ad)return ad:gsub('[^a-zA-Z ]'
,'')end,Alphanumeric=function(ad)return ad:gsub('[^a-zA-Z0-9]','')end,
FloatNumeric=function(ad)return ad:gsub('[^-%.%d]',''):gsub('^(%-?)0+','%1'):
gsub('(%-?)%.','%10.'):gsub('(%..*)%.','%1'):gsub('(%-.)','%1')end,Mathematic=
function(ad)ad=ad:gsub('[^%d%.%+%-%*/%^%%%(%)]','')local ae,b=function(ae)local
b,c={},''for d in ae:gmatch'.'do if d:match'[%d%.]'then c=c..d else if c~=''then
table.insert(b,c)c=''end table.insert(b,d)end end if c~=''then table.insert(b,c)
end return b end,{['+']=1,['-']=1,['*']=2,['/']=2,['%']=2,['^']=3}local c,d=
function(c)local d,e={},{}for f,g in ipairs(c)do if tonumber(g)then table.
insert(d,g)elseif g=='('then table.insert(e,g)elseif g==')'then while#e>0 and e[
#e]~='('do table.insert(d,table.remove(e))end table.remove(e)else while#e>0 and
b[e[#e] ]and b[e[#e] ]>=b[g]do table.insert(d,table.remove(e))end table.insert(e
,g)end end while#e>0 do table.insert(d,table.remove(e))end return d end,function
(c)local d={}for e,f in ipairs(c)do if tonumber(f)then table.insert(d,tonumber(f
))else local g,h=table.remove(d),table.remove(d)if not h or not g then return ad
end if f=='+'then table.insert(d,h+g)elseif f=='-'then table.insert(d,h-g)elseif
f=='*'then table.insert(d,h*g)elseif f=='/'then table.insert(d,h/g)elseif f=='%'
then table.insert(d,h%g)elseif f=='^'then table.insert(d,h^g)end end end return
tostring(d[1]or ad)end return d(c(ae(ad)))end}}function aa:Window(ae)local b={
Settings=ae}assert(b.Settings.Title and type(b.Settings.Title)=='string',
'Missing window title or wrong type')b.Settings.Keybind=b.Settings.Keybind or
Enum.KeyCode.RightControl local c=Instance.new'ImageLabel'c.BackgroundColor3=
Color3.fromRGB(17,17,17)c.BorderColor3=Color3.fromRGB(0,0,0)c.BorderSizePixel=0
c.ClipsDescendants=true c.Image='rbxassetid://17365187482'c.ImageTransparency=
0.96 c.ScaleType=Enum.ScaleType.Tile c.Size=UDim2.fromOffset(400,672)c.TileSize=
UDim2.fromOffset(500,325)local d=Instance.new'Frame'd.AutomaticSize=Enum.
AutomaticSize.XY d.BackgroundColor3=Color3.fromRGB(255,255,255)d.
BackgroundTransparency=1 d.BorderColor3=Color3.fromRGB(0,0,0)d.BorderSizePixel=0
local e=Instance.new'TextLabel'e.AutomaticSize=Enum.AutomaticSize.XY e.
BackgroundColor3=Color3.fromRGB(255,255,255)e.BackgroundTransparency=1 e.
BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0 e.FontFace=Font.new(
'rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.FontStyle.Normal)e.
RichText=true e.Text=b.Settings.Title e.TextColor3=Color3.fromRGB(255,255,255)e.
TextSize=35 e.TextWrapped=true e.TextXAlignment=Enum.TextXAlignment.Left e.
Parent=d local f=Instance.new'UIPadding'f.PaddingLeft=UDim.new(0,25)f.
PaddingRight=UDim.new(0,25)f.Parent=d local g=Instance.new'Frame'g.AnchorPoint=
Vector2.new(0,1)g.BackgroundColor3=Color3.fromRGB(255,255,255)g.
BackgroundTransparency=0.9 g.BorderColor3=Color3.fromRGB(0,0,0)g.BorderSizePixel
=0 g.Position=UDim2.new(0,0,1,10)g.Size=UDim2.new(0.95,0,0,1)local h=Instance.
new'Frame'h.BackgroundColor3=Color3.fromRGB(185,228,255)h.BorderColor3=Color3.
fromRGB(0,0,0)h.BorderSizePixel=0 h.Size=UDim2.new(0.5,0,0,1)h.Parent=g g.Parent
=d local i=Instance.new'UIListLayout'i.Padding=UDim.new(0,10)i.SortOrder=Enum.
SortOrder.LayoutOrder i.VerticalAlignment=Enum.VerticalAlignment.Center i.Parent
=d d.Parent=c local j=Instance.new'UICorner'j.CornerRadius=UDim.new(0,15)j.
Parent=c local k=Instance.new'UIPadding'k.PaddingBottom=UDim.new(0,25)k.
PaddingTop=UDim.new(0,25)k.Parent=c local l=Instance.new'Frame'l.AnchorPoint=
Vector2.new(0,1)l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
l.ClipsDescendants=true l.LayoutOrder=1 l.Position=UDim2.fromScale(0,1)l.Size=
UDim2.new(1,0,1,-55)local m=Instance.new'ScrollingFrame'm.Active=true m.
AutomaticCanvasSize=Enum.AutomaticSize.X m.AutomaticSize=Enum.AutomaticSize.Y m.
BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.CanvasSize=UDim2.new()m.
ScrollBarImageTransparency=1 m.ScrollBarThickness=1 m.ScrollingDirection=Enum.
ScrollingDirection.X m.Size=UDim2.fromScale(1,0)local n=Instance.new
'UIListLayout'n.FillDirection=Enum.FillDirection.Horizontal n.Padding=UDim.new(0
,10)n.SortOrder=Enum.SortOrder.LayoutOrder n.Parent=m local o=Instance.new
'UIPadding'o.PaddingBottom=UDim.new(0,10)o.PaddingLeft=UDim.new(0,26)o.
PaddingRight=UDim.new(0,26)o.PaddingTop=UDim.new(0,1)o.Parent=m m.Parent=l local
p=Instance.new'UIListLayout'p.Padding=UDim.new(0,25)p.SortOrder=Enum.SortOrder.
LayoutOrder p.Parent=l local q=Instance.new'Frame'q.BackgroundColor3=Color3.
fromRGB(255,255,255)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0
,0)q.BorderSizePixel=0 q.Size=UDim2.new(1,0,1,-104)q.Parent=l l.Parent=c local r
=Instance.new'UIListLayout'r.Padding=UDim.new(0,30)r.SortOrder=Enum.SortOrder.
LayoutOrder r.Parent=c c.Parent=ab.overlay local s=Instance.new'UIPadding's.
PaddingBottom=UDim.new(0,15)s.PaddingLeft=UDim.new(0,15)s.PaddingRight=UDim.new(
0,15)s.PaddingTop=UDim.new(0,15)s.Parent=ab.overlay local t=Instance.new
'ImageLabel't.BackgroundColor3=Color3.fromRGB(17,17,17)t.BorderColor3=Color3.
fromRGB(0,0,0)t.BorderSizePixel=0 t.ClipsDescendants=true t.Image=
'rbxassetid://17365187482't.ImageTransparency=0.96 t.ScaleType=Enum.ScaleType.
Tile t.Size=UDim2.fromOffset(400,570)t.TileSize=UDim2.fromOffset(500,325)t.
Visible=false t.ZIndex=0 t.Position=UDim2.fromOffset(c.AbsoluteSize.X+15,0)local
u=Instance.new'UICorner'u.CornerRadius=UDim.new(0,15)u.Parent=t local v=Instance
.new'UIPadding'v.PaddingBottom=UDim.new(0,25)v.PaddingLeft=UDim.new(0,25)v.
PaddingRight=UDim.new(0,15)v.PaddingTop=UDim.new(0,20)v.Parent=t local w=
Instance.new'Frame'w.AutomaticSize=Enum.AutomaticSize.XY w.BackgroundColor3=
Color3.fromRGB(255,255,255)w.BackgroundTransparency=1 w.BorderColor3=Color3.
fromRGB(0,0,0)w.BorderSizePixel=0 local x=Instance.new'TextLabel'x.AutomaticSize
=Enum.AutomaticSize.XY x.BackgroundColor3=Color3.fromRGB(255,255,255)x.
BackgroundTransparency=1 x.BorderColor3=Color3.fromRGB(0,0,0)x.BorderSizePixel=0
x.FontFace=Font.new('rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.
FontStyle.Normal)x.Text='Visual Preview'x.TextColor3=Color3.fromRGB(255,255,255)
x.TextSize=30 x.TextWrapped=true x.TextXAlignment=Enum.TextXAlignment.Left x.
Parent=w local y=Instance.new'Frame'y.AnchorPoint=Vector2.new(0,1)y.
BackgroundColor3=Color3.fromRGB(255,255,255)y.BackgroundTransparency=0.9 y.
BorderColor3=Color3.fromRGB(0,0,0)y.BorderSizePixel=0 y.Position=UDim2.new(0,0,1
,10)y.Size=UDim2.new(0.95,0,0,1)local z=Instance.new'Frame'z.BackgroundColor3=
Color3.fromRGB(185,228,255)z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel
=0 z.Size=UDim2.new(0.5,0,0,1)z.Parent=y y.Parent=w w.Parent=t local A=Instance.
new'UIListLayout'A.Padding=UDim.new(0,40)A.SortOrder=Enum.SortOrder.LayoutOrder
A.Parent=t local B=Instance.new'Frame'B.AnchorPoint=Vector2.new(0,1)B.
BackgroundColor3=Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B.
BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.LayoutOrder=1 B.Position
=UDim2.fromScale(0,1)B.Size=UDim2.new(1,0,1,-70)local C=Instance.new'Frame'C.
BackgroundColor3=Color3.fromRGB(255,255,255)C.BackgroundTransparency=1 C.
BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0 C.LayoutOrder=1 C.Size=
UDim2.new(1,0,1,-18)local D=Instance.new'Frame'D.AnchorPoint=Vector2.new(1,0)D.
BackgroundColor3=Color3.fromRGB(58,161,47)D.BorderColor3=Color3.fromRGB(0,0,0)D.
BorderSizePixel=0 D.Position=UDim2.fromOffset(-10,0)D.Size=UDim2.new(0,12,1,0)D.
Visible=false D.Parent=C local E=Instance.new'Frame'E.AnchorPoint=Vector2.new(
0.5,1)E.BackgroundColor3=Color3.fromRGB(15,15,15)E.BorderColor3=Color3.fromRGB(0
,0,0)E.BorderSizePixel=0 E.LayoutOrder=1 E.Position=UDim2.fromScale(0.5,1)E.Size
=UDim2.fromScale(1,1)local F=Instance.new'Frame'F.BackgroundColor3=Color3.
fromRGB(255,255,255)F.BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0
,0)F.BorderSizePixel=0 F.Size=UDim2.fromScale(1,1)F.Visible=false F.ZIndex=2
local G=Instance.new'Frame'G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0 G.Size=UDim2.fromOffset(2,
30)G.Parent=F local H=Instance.new'Frame'H.BackgroundColor3=Color3.fromRGB(255,
255,255)H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0 H.Size=UDim2.
fromOffset(30,2)H.Parent=F local I=Instance.new'Frame'I.AnchorPoint=Vector2.new(
0,1)I.BackgroundColor3=Color3.fromRGB(255,255,255)I.BorderColor3=Color3.fromRGB(
0,0,0)I.BorderSizePixel=0 I.Position=UDim2.fromScale(0,1)I.Size=UDim2.
fromOffset(30,2)I.Parent=F local J=Instance.new'Frame'J.AnchorPoint=Vector2.new(
0,1)J.BackgroundColor3=Color3.fromRGB(255,255,255)J.BorderColor3=Color3.fromRGB(
0,0,0)J.BorderSizePixel=0 J.Position=UDim2.fromScale(0,1)J.Size=UDim2.
fromOffset(2,30)J.Parent=F local K=Instance.new'Frame'K.AnchorPoint=Vector2.new(
1,1)K.BackgroundColor3=Color3.fromRGB(255,255,255)K.BorderColor3=Color3.fromRGB(
0,0,0)K.BorderSizePixel=0 K.Position=UDim2.fromScale(1,1)K.Size=UDim2.
fromOffset(2,30)K.Parent=F local L=Instance.new'Frame'L.AnchorPoint=Vector2.new(
1,1)L.BackgroundColor3=Color3.fromRGB(255,255,255)L.BorderColor3=Color3.fromRGB(
0,0,0)L.BorderSizePixel=0 L.Position=UDim2.fromScale(1,1)L.Size=UDim2.
fromOffset(30,2)L.Parent=F local M=Instance.new'Frame'M.AnchorPoint=Vector2.new(
1,0)M.BackgroundColor3=Color3.fromRGB(255,255,255)M.BorderColor3=Color3.fromRGB(
0,0,0)M.BorderSizePixel=0 M.Position=UDim2.fromScale(1,0)M.Size=UDim2.
fromOffset(2,30)M.Parent=F local N=Instance.new'Frame'N.AnchorPoint=Vector2.new(
1,0)N.BackgroundColor3=Color3.fromRGB(255,255,255)N.BorderColor3=Color3.fromRGB(
0,0,0)N.BorderSizePixel=0 N.Position=UDim2.fromScale(1,0)N.Size=UDim2.
fromOffset(30,2)N.Parent=F F.Parent=E local O=Instance.new'ImageLabel'O.
AnchorPoint=Vector2.new(0.5,0.5)O.BackgroundColor3=Color3.fromRGB(255,255,255)O.
BackgroundTransparency=1 O.BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0
O.Image='rbxassetid://109289851861610'O.Position=UDim2.fromScale(0.5,0.5)O.
ScaleType=Enum.ScaleType.Fit O.Size=UDim2.new(1,-20,1,-20)local P=Instance.new
'UIGradient'P.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(101,143,175)),ColorSequenceKeypoint.new(1,Color3.fromRGB(197,173,128))}P
.Offset=Vector2.new(0,0.15)P.Rotation=90 P.Parent=O O.Parent=E local Q=Instance.
new'TextLabel'Q.AnchorPoint=Vector2.new(0,1)Q.AutomaticSize=Enum.AutomaticSize.
XY Q.BackgroundColor3=Color3.fromRGB(255,255,255)Q.BackgroundTransparency=1 Q.
BorderColor3=Color3.fromRGB(0,0,0)Q.BorderSizePixel=0 Q.FontFace=Font.new(
'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)Q.
Position=UDim2.fromOffset(0,-5)Q.Size=UDim2.fromScale(1,0)Q.Text=
'RIOTPLAYER987123'Q.TextColor3=Color3.fromRGB(255,255,255)Q.TextSize=13 Q.
TextWrapped=true Q.TextYAlignment=Enum.TextYAlignment.Top Q.Visible=false local
R=Instance.new'UIPadding'R.PaddingLeft=UDim.new(0,20)R.Parent=Q Q.Parent=E local
S=Instance.new'Frame'S.AnchorPoint=Vector2.new(0.5,0.5)S.BackgroundColor3=Color3
.fromRGB(255,255,255)S.BackgroundTransparency=1 S.BorderColor3=Color3.fromRGB(0,
0,0)S.BorderSizePixel=0 S.Position=UDim2.fromScale(0.5,0.5)S.Size=UDim2.new(1,-2
,1,-2)S.Visible=false local T=Instance.new'UIStroke'T.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border T.Color=Color3.fromRGB(255,255,255)T.Parent=S S.Parent=E
local U=Instance.new'Frame'U.BackgroundColor3=Color3.fromRGB(0,0,0)U.
BackgroundTransparency=1 U.BorderColor3=Color3.fromRGB(0,0,0)U.BorderSizePixel=0
U.Size=UDim2.fromScale(1,1)U.Visible=false U.Parent=E E.Parent=C local V=
Instance.new'Frame'V.AutomaticSize=Enum.AutomaticSize.XY V.BackgroundColor3=
Color3.fromRGB(255,255,255)V.BackgroundTransparency=1 V.BorderColor3=Color3.
fromRGB(0,0,0)V.BorderSizePixel=0 V.LayoutOrder=2 V.Position=UDim2.new(1,5,0,10)
V.Size=UDim2.fromOffset(50,0)V.Visible=true local W=Instance.new'TextLabel'W.
AnchorPoint=Vector2.new(0,1)W.AutomaticSize=Enum.AutomaticSize.XY W.
BackgroundColor3=Color3.fromRGB(255,255,255)W.BackgroundTransparency=1 W.
BorderColor3=Color3.fromRGB(0,0,0)W.BorderSizePixel=0 W.FontFace=Font.new(
'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)W.
Position=UDim2.fromOffset(0,-5)W.RichText=true W.Text='100M'W.TextColor3=Color3.
fromRGB(255,255,255)W.TextSize=13 W.TextWrapped=true W.TextXAlignment=Enum.
TextXAlignment.Left W.TextYAlignment=Enum.TextYAlignment.Top W.Parent=V W.
Visible=false local X=Instance.new'TextLabel'X.AnchorPoint=Vector2.new(0,1)X.
AutomaticSize=Enum.AutomaticSize.XY X.BackgroundColor3=Color3.fromRGB(255,255,
255)X.BackgroundTransparency=1 X.BorderColor3=Color3.fromRGB(0,0,0)X.
BorderSizePixel=0 X.FontFace=Font.new('rbxassetid://12187362578',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)X.LayoutOrder=1 X.Position=UDim2.fromOffset(0,-5
)X.RichText=true X.Text='BF 30'X.TextColor3=Color3.fromRGB(255,255,255)X.
TextSize=13 X.TextWrapped=true X.TextXAlignment=Enum.TextXAlignment.Left X.
TextYAlignment=Enum.TextYAlignment.Top X.Parent=V X.Visible=false local Y=
Instance.new'TextLabel'Y.AnchorPoint=Vector2.new(0,1)Y.AutomaticSize=Enum.
AutomaticSize.XY Y.BackgroundColor3=Color3.fromRGB(255,255,255)Y.
BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0,0)Y.BorderSizePixel=0
Y.ClipsDescendants=true Y.FontFace=Font.new('rbxassetid://12187362578',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)Y.LayoutOrder=2 Y.Position=UDim2.
fromOffset(0,-5)Y.RichText=true Y.Text='140HP'Y.TextColor3=Color3.fromRGB(255,
255,255)Y.TextSize=13 Y.TextWrapped=true Y.TextXAlignment=Enum.TextXAlignment.
Left Y.TextYAlignment=Enum.TextYAlignment.Top Y.Parent=V Y.Visible=false local Z
=Instance.new'UIListLayout'Z.SortOrder=Enum.SortOrder.LayoutOrder Z.Parent=V V.
Parent=C local _=Instance.new'UIListLayout'_.FillDirection=Enum.FillDirection.
Horizontal _.HorizontalFlex=Enum.UIFlexAlignment.Fill _.Padding=UDim.new(0,10)_.
SortOrder=Enum.SortOrder.LayoutOrder _.Parent=C C.Parent=B B.Parent=t t.Parent=
ab.overlay ad.makeDraggable(t)ad.makeDraggable(c)ac._userInputService.InputEnded
:Connect(function(af,ag)if ag then return end if af.KeyCode==b.Settings.Keybind
then ab.overlay.Visible=not ab.overlay.Visible end end)local af=function()local
af=d.AbsoluteSize.Y+9 l.Size=UDim2.new(1,0,1,-af)l.Position=UDim2.new(0,0,0,af)
end d:GetPropertyChangedSignal'AbsoluteSize':Connect(af)af()function b:
UpdateSettings(ag)if ag.Title then b.Settings.Title=ag.Title e.Text=ag.Title end
if ag.Keybind then b.Settings.Keybind=ag.Keybind end end function b:Tab(ag)local
ah={Settings=ag}assert(ah.Settings.Name and type(ah.Settings.Name)=='string',
'Missing string or wrong type')if not ah.Settings.Image or ah.Settings.Image==''
then ah.Settings.Image=aa:GetAsset'DefaultImage'end ab.tabSystem.tabIndex+=1
local ai=Instance.new'Frame'ai.AutomaticSize=Enum.AutomaticSize.Y ai.
BackgroundColor3=Color3.fromRGB(30,34,47)ai.BackgroundTransparency=1 ai.
BorderColor3=Color3.fromRGB(0,0,0)ai.BorderSizePixel=0 ai.Size=UDim2.fromOffset(
50,50)ai.Parent=m ai.LayoutOrder=ab.tabSystem.tabIndex local aj=Instance.new
'TextLabel'aj.AutomaticSize=Enum.AutomaticSize.Y aj.BackgroundColor3=Color3.
fromRGB(255,255,255)aj.BackgroundTransparency=1 aj.BorderColor3=Color3.fromRGB(0
,0,0)aj.BorderSizePixel=0 aj.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.Bold,Enum.FontStyle.Normal)aj.LayoutOrder=1 aj.Position=UDim2.new(0,0
,1,10)aj.RichText=true aj.Size=UDim2.fromScale(1,0)aj.Text=ah.Settings.Name:
upper()aj.TextColor3=Color3.fromRGB(150,150,150)aj.TextSize=11 aj.TextWrapped=
true aj.Parent=ai local ak=Instance.new'TextButton'ak.AutoButtonColor=false ak.
BackgroundColor3=Color3.fromRGB(30,34,47)ak.BorderColor3=Color3.fromRGB(0,0,0)ak
.BorderSizePixel=0 ak.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'ak.Size=UDim2.fromOffset(50,50)ak.
Text=''ak.TextColor3=Color3.fromRGB(0,0,0)ak.TextSize=14 local al=Instance.new
'UICorner'al.CornerRadius=UDim.new(0,13)al.Parent=ak local am=Instance.new
'UIStroke'am.ApplyStrokeMode=Enum.ApplyStrokeMode.Border am.Color=Color3.
fromRGB(185,228,255)am.Transparency=1 am.Parent=ak local an=Instance.new
'ImageLabel'an.AnchorPoint=Vector2.new(0.5,0.5)an.BackgroundColor3=Color3.
fromRGB(255,255,255)an.BackgroundTransparency=1 an.BorderColor3=Color3.fromRGB(0
,0,0)an.BorderSizePixel=0 an.Image=ah.Settings.Image an.ImageColor3=Color3.
fromRGB(150,150,150)an.Position=UDim2.fromScale(0.5,0.5)an.ScaleType=Enum.
ScaleType.Crop an.Size=UDim2.fromOffset(28,28)an.Parent=ak ak.Parent=ai local ao
=Instance.new'UIListLayout'ao.Padding=UDim.new(0,10)ao.SortOrder=Enum.SortOrder.
LayoutOrder ao.Parent=ai local ap=Instance.new'ScrollingFrame'ap.Name=
'TabContent'ap.AutomaticCanvasSize=Enum.AutomaticSize.Y ap.BackgroundColor3=
Color3.fromRGB(255,255,255)ap.BackgroundTransparency=1 ap.BorderColor3=Color3.
fromRGB(0,0,0)ap.BorderSizePixel=0 ap.CanvasSize=UDim2.new()ap.
ScrollBarImageTransparency=1 ap.ScrollBarThickness=1 ap.Size=UDim2.fromScale(1,1
)local aq=Instance.new'UIListLayout'aq.Name='UIListLayout'aq.Padding=UDim.new(0,
10)aq.SortOrder=Enum.SortOrder.LayoutOrder aq.Parent=ap local ar=Instance.new
'UIPadding'ar.Name='UIPadding'ar.PaddingBottom=UDim.new(0,20)ar.PaddingLeft=UDim
.new(0,25)ar.PaddingRight=UDim.new(0,25)ar.Parent=ap ab.tabSystem.tabInstances[
ai]={Name=aj,Stroke=am,Icon=an,TabContent=ap}function ah:Select()if ab.tabSystem
.tabInstances[ab.tabSystem.currentTab]then local as=ab.tabSystem.tabInstances[ab
.tabSystem.currentTab]ad.tween(as.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),
{TextColor3=Color3.fromRGB(150,150,150)}):Play()ad.tween(as.Icon,TweenInfo.new(
0.1,Enum.EasingStyle.Sine),{ImageColor3=Color3.fromRGB(150,150,150)}):Play()ad.
tween(as.Stroke,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=1}):Play(
)if ab.tabSystem.currentContent then ab.tabSystem.currentContent.Parent=nil end
end if ab.tabSystem.tabInstances[ai]then local as=ab.tabSystem.tabInstances[ai]
ad.tween(as.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=Color3.
fromRGB(168,193,225)}):Play()ad.tween(as.Icon,TweenInfo.new(0.1,Enum.EasingStyle
.Sine),{ImageColor3=Color3.fromRGB(133,192,228)}):Play()ad.tween(as.Stroke,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=0}):Play()ab.tabSystem.
currentTab=ai ap.Parent=q ab.tabSystem.currentContent=ap end end ak.
MouseButton1Click:Connect(function()ah:Select()end)function ah:Button(as,at)
local au={Settings=as}assert(au.Settings.Name and type(au.Settings.Name)==
'string','Missing button name or wrong type')local av=Instance.new'Frame'av.
AutomaticSize=Enum.AutomaticSize.Y av.BackgroundColor3=au.Settings.Color or
Color3.fromRGB(30,30,30)av.BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel=
0 av.Size=UDim2.new(1,0,0,40)av.Visible=au.Settings.Visible==nil and true or au.
Settings.Visible av.Parent=ap local aw=Instance.new'UICorner'aw.CornerRadius=
UDim.new(0,5)aw.Parent=av local ax=Instance.new'TextButton'ax.AutoButtonColor=
false ax.AutomaticSize=Enum.AutomaticSize.Y ax.BackgroundColor3=Color3.fromRGB(
255,255,255)ax.BackgroundTransparency=1 ax.BorderColor3=Color3.fromRGB(0,0,0)ax.
BorderSizePixel=0 ax.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)ax.RichText=true ax.Size=UDim2.new(1,0
,0,40)ax.Text=au.Settings.Name ax.TextColor3=Color3.fromRGB(156,156,156)ax.
TextSize=15 ax.TextWrapped=true ax.TextXAlignment=Enum.TextXAlignment.Center
local ay=Instance.new'UIPadding'ay.PaddingBottom=UDim.new(0,12)ay.PaddingLeft=
UDim.new(0,15)ay.PaddingRight=UDim.new(0,15)ay.PaddingTop=UDim.new(0,12)ay.
Parent=ax ax.Parent=av function au:UpdateSettings(az)if az.Name then au.Settings
.Name=az.Name ax.Text=az.Name end if az.Color then au.Settings.Color=az.Color av
.BackgroundColor3=az.Color end if az.Callback then au.Settings.Callback=az.
Callback end if az.Visible~=nil then au.Settings.Visible=az.Visible av.Visible=
az.Visible end return au end local az=Instance.new'Frame'az.BackgroundColor3=
Color3.fromRGB(30,30,30)az.BorderColor3=Color3.fromRGB(0,0,0)az.BorderSizePixel=
0 az.Size=UDim2.new(1,0,0,1)az.Parent=ap function au:Continue()az.Visible=false
return au end function au:End()az.Visible=true return au end local aA=function()
if au.Settings.Callback then ad.callback(au.Settings.Callback)end end ax.
MouseButton1Click:Connect(aA)if at then aa.Components[at]=au end return au:End()
end function ah:Toggle(as,at)local au={Settings=as,Type='Toggle'}assert(au.
Settings.Name and type(au.Settings.Name)=='string','Missing name or wrong type')
local av=Instance.new'Frame'av.AutomaticSize=Enum.AutomaticSize.Y av.
BackgroundColor3=Color3.fromRGB(255,255,255)av.BackgroundTransparency=1 av.
BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel=0 av.Size=UDim2.fromScale(1
,0)av.Parent=ap av.Visible=au.Settings.Visible==nil and true or au.Settings.
Visible local aw=Instance.new'Frame'aw.AutomaticSize=Enum.AutomaticSize.Y aw.
BackgroundColor3=Color3.fromRGB(255,255,255)aw.BackgroundTransparency=1 aw.
BorderColor3=Color3.fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Size=UDim2.new(1,-50,0
,33)local ax=Instance.new'TextLabel'ax.AutomaticSize=Enum.AutomaticSize.XY ax.
BackgroundColor3=Color3.fromRGB(255,255,255)ax.BackgroundTransparency=1 ax.
BorderColor3=Color3.fromRGB(0,0,0)ax.BorderSizePixel=0 ax.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ax.
RichText=true ax.TextColor3=Color3.fromRGB(225,225,225)ax.TextSize=16 ax.
TextWrapped=true ax.TextXAlignment=Enum.TextXAlignment.Left ax.Parent=aw ax.Text
=au.Settings.Name local ay=Instance.new'UIListLayout'ay.Name='UIListLayout'ay.
Padding=UDim.new(0,5)ay.SortOrder=Enum.SortOrder.LayoutOrder ay.
VerticalAlignment=Enum.VerticalAlignment.Center ay.Parent=aw local az=Instance.
new'TextLabel'az.AutomaticSize=Enum.AutomaticSize.XY az.BackgroundColor3=Color3.
fromRGB(255,255,255)az.BackgroundTransparency=1 az.BorderColor3=Color3.fromRGB(0
,0,0)az.BorderSizePixel=0 az.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)az.LayoutOrder=1 az.RichText=true az.
Text=au.Settings.Description or''az.TextColor3=Color3.fromRGB(80,80,80)az.
TextSize=12 az.TextWrapped=true az.TextXAlignment=Enum.TextXAlignment.Left az.
Parent=aw az.Visible=au.Settings.Description and true or false aw.Parent=av
local aA=Instance.new'ImageLabel'aA.AnchorPoint=Vector2.new(1,0.5)aA.
BackgroundColor3=Color3.fromRGB(37,37,46)aA.BackgroundTransparency=1 aA.
BorderColor3=Color3.fromRGB(0,0,0)aA.BorderSizePixel=0 aA.Image=
'rbxassetid://86699956318312'aA.ImageColor3=Color3.fromRGB(33,36,45)aA.Position=
UDim2.fromScale(1,0.5)aA.Size=UDim2.fromOffset(35,10)local aB=Instance.new
'UIPadding'aB.Name='ToggleUIPadding'aB.PaddingBottom=UDim.new(0,1)aB.PaddingLeft
=UDim.new(0,-8)aB.PaddingTop=UDim.new(0,1)aB.Parent=aA local aC=Instance.new
'ImageLabel'aC.AnchorPoint=Vector2.new(1,0.5)aC.BackgroundColor3=Color3.fromRGB(
30,34,47)aC.BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.
BorderSizePixel=0 aC.Image='rbxassetid://83379579183005'aC.ImageColor3=Color3.
fromRGB(156,156,156)aC.Position=UDim2.fromScale(0.5,0.5)aC.Size=UDim2.
fromOffset(14,14)aC.Parent=aA aA.Parent=av local aD=Instance.new'UIPadding'aD.
PaddingBottom=UDim.new(0,8)aD.PaddingTop=UDim.new(0,8)aD.Parent=av local aE=
Instance.new'TextButton'aE.AutoButtonColor=false aE.BackgroundTransparency=1 aE.
Size=UDim2.fromScale(1,1)aE.Text=''aE.Parent=av au.Settings.State=au.Settings.
State or false local aF=function()ad.tween(aC,TweenInfo.new(0.2,Enum.EasingStyle
.Exponential),{Position=UDim2.fromScale(au.Settings.State and 1 or 0.5,0.5),
ImageColor3=au.Settings.State and Color3.fromRGB(138,193,227)or Color3.fromRGB(
156,156,156)}):Play()if au.Settings.Callback then ad.callback(au.Settings.
Callback,au,au.Settings.State)end end aE.MouseButton1Click:Connect(function()au.
Settings.State=not au.Settings.State aF()end)function au:UpdateSettings(aG)if aG
.Name then au.Settings.Name=aG.Name ax.Text=aG.Name end if aG.Description~=nil
then au.Settings.Description=aG.Description az.Text=aG.Description or''az.
Visible=aG.Description and true or false end if aG.State~=nil then au.Settings.
State=aG.State aF()end if aG.Callback then au.Settings.Callback=aG.Callback end
if aG.Visible~=nil then au.Settings.Visible=aG.Visible aF.Visible=aG.Visible end
end local aG=Instance.new'Frame'aG.BackgroundColor3=Color3.fromRGB(30,30,30)aG.
BorderColor3=Color3.fromRGB(0,0,0)aG.BorderSizePixel=0 aG.Size=UDim2.new(1,0,0,1
)aG.Parent=ap function au:Continue()aG.Visible=false return au end function au:
End()aG.Visible=true return au end aF()if at then aa.Components[at]=au end
return au:End()end function ah:Slider(as,at)local au={Settings=as,Type='Slider'}
assert(au.Settings.Name and type(au.Settings.Name)=='string',
'Missing name or wrong type')assert(au.Settings.Value and type(au.Settings.Value
)=='number','Missing value or wrong type')assert(au.Settings.Minimum and type(au
.Settings.Minimum)=='number','Missing minimum or wrong type')assert(au.Settings.
Maximum and type(au.Settings.Maximum)=='number','Missing maximum or wrong type')
assert(au.Settings.Minimum<=au.Settings.Maximum,
'Minimum should be less than Maximum')assert(au.Settings.Maximum>=au.Settings.
Minimum,'Maximum should be greater than Minimum')local aw=Instance.new'Frame'aw.
AutomaticSize=Enum.AutomaticSize.Y aw.BackgroundColor3=Color3.fromRGB(255,255,
255)aw.BackgroundTransparency=1 aw.BorderColor3=Color3.fromRGB(0,0,0)aw.
BorderSizePixel=0 aw.Size=UDim2.fromScale(1,0)aw.Visible=au.Settings.Visible==
nil and true or au.Settings.Visible aw.Parent=ap local ax=Instance.new
'UIPadding'ax.PaddingBottom=UDim.new(0,8)ax.PaddingTop=UDim.new(0,8)ax.Parent=aw
local ay=Instance.new'Frame'ay.AutomaticSize=Enum.AutomaticSize.Y ay.
BackgroundColor3=Color3.fromRGB(255,255,255)ay.BackgroundTransparency=1 ay.
BorderColor3=Color3.fromRGB(0,0,0)ay.BorderSizePixel=0 ay.Size=UDim2.fromScale(1
,0)local az=Instance.new'Frame'az.AnchorPoint=Vector2.new(1,0.5)az.AutomaticSize
=Enum.AutomaticSize.XY az.BackgroundColor3=Color3.fromRGB(255,255,255)az.
BackgroundTransparency=1 az.BorderColor3=Color3.fromRGB(0,0,0)az.BorderSizePixel
=0 az.LayoutOrder=1 az.Position=UDim2.fromScale(1,0.5)local aA=Instance.new
'ImageLabel'aA.AnchorPoint=Vector2.new(1,0.5)aA.BackgroundColor3=Color3.fromRGB(
30,34,47)aA.BackgroundTransparency=1 aA.BorderColor3=Color3.fromRGB(0,0,0)aA.
BorderSizePixel=0 aA.Image='rbxassetid://82545477110166'aA.ImageColor3=Color3.
fromRGB(150,150,150)aA.Position=UDim2.fromScale(1,0.5)aA.Size=UDim2.fromOffset(
20,20)aA.Parent=az local aB=Instance.new'UIListLayout'aB.FillDirection=Enum.
FillDirection.Horizontal aB.HorizontalAlignment=Enum.HorizontalAlignment.Right
aB.Padding=UDim.new(0,6)aB.SortOrder=Enum.SortOrder.LayoutOrder aB.
VerticalAlignment=Enum.VerticalAlignment.Center aB.Parent=az local aC=Instance.
new'TextLabel'aC.AnchorPoint=Vector2.new(0,0.5)aC.AutomaticSize=Enum.
AutomaticSize.XY aC.BackgroundColor3=Color3.fromRGB(255,255,255)aC.
BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel
=0 aC.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum
.FontStyle.Normal)aC.LayoutOrder=1 aC.Position=UDim2.fromScale(0,0.5)aC.RichText
=true aC.Text='0'aC.TextColor3=Color3.fromRGB(150,150,150)aC.TextSize=16 aC.
TextWrapped=true aC.TextXAlignment=Enum.TextXAlignment.Left aC.Parent=az az.
Parent=ay local aD=Instance.new'Frame'aD.AutomaticSize=Enum.AutomaticSize.Y aD.
BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1 aD.
BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.Size=UDim2.new(1,-80,0
,0)local aE=Instance.new'TextLabel'aE.AutomaticSize=Enum.AutomaticSize.XY aE.
BackgroundColor3=Color3.fromRGB(255,255,255)aE.BackgroundTransparency=1 aE.
BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel=0 aE.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)aE.
RichText=true aE.Text=au.Settings.Name aE.TextColor3=Color3.fromRGB(225,225,225)
aE.TextSize=16 aE.TextWrapped=true aE.TextXAlignment=Enum.TextXAlignment.Left aE
.Parent=aD local aF=Instance.new'UIListLayout'aF.Name='UIListLayout'aF.Padding=
UDim.new(0,5)aF.SortOrder=Enum.SortOrder.LayoutOrder aF.VerticalAlignment=Enum.
VerticalAlignment.Center aF.Parent=aD local aG=Instance.new'TextLabel'aG.
AutomaticSize=Enum.AutomaticSize.XY aG.BackgroundColor3=Color3.fromRGB(255,255,
255)aG.BackgroundTransparency=1 aG.BorderColor3=Color3.fromRGB(0,0,0)aG.
BorderSizePixel=0 aG.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)aG.LayoutOrder=1 aG.RichText=true aG.
Text=au.Settings.Description or''aG.TextColor3=Color3.fromRGB(80,80,80)aG.
TextSize=12 aG.TextWrapped=true aG.TextXAlignment=Enum.TextXAlignment.Left aG.
Parent=aD aG.Visible=au.Settings.Description and true or false aD.Parent=ay
local aH=Instance.new'UIListLayout'aH.Name='UIListLayout'aH.FillDirection=Enum.
FillDirection.Horizontal aH.HorizontalAlignment=Enum.HorizontalAlignment.Center
aH.HorizontalFlex=Enum.UIFlexAlignment.Fill aH.Padding=UDim.new(0,5)aH.SortOrder
=Enum.SortOrder.LayoutOrder aH.VerticalAlignment=Enum.VerticalAlignment.Center
aH.Parent=ay ay.Parent=aw local aI=Instance.new'UIListLayout'aI.Name=
'UIListLayout'aI.Padding=UDim.new(0,15)aI.SortOrder=Enum.SortOrder.LayoutOrder
aI.Parent=aw local aJ=Instance.new'TextButton'aJ.BackgroundColor3=Color3.
fromRGB(37,37,46)aJ.BorderColor3=Color3.fromRGB(0,0,0)aJ.BorderSizePixel=0 aJ.
Size=UDim2.new(1,0,0,10)aJ.Text=''aJ.AutoButtonColor=false local aK=Instance.new
'UICorner'aK.Name='UICorner'aK.CornerRadius=UDim.new(0,15)aK.Parent=aJ local aL=
Instance.new'Frame'aL.BackgroundColor3=Color3.fromRGB(138,193,227)aL.
BorderColor3=Color3.fromRGB(0,0,0)aL.BorderSizePixel=0 aL.Size=UDim2.new(0,0,0,
10)local aM=Instance.new'UICorner'aM.Name='UICorner'aM.CornerRadius=UDim.new(0,
15)aM.Parent=aL local aN=Instance.new'ImageLabel'aN.AnchorPoint=Vector2.new(0.5,
0.5)aN.BackgroundColor3=Color3.fromRGB(255,255,255)aN.BackgroundTransparency=1
aN.BorderColor3=Color3.fromRGB(0,0,0)aN.BorderSizePixel=0 aN.Image=
'rbxassetid://127947626656649'aN.ImageColor3=Color3.fromRGB(20,20,20)aN.Position
=UDim2.fromScale(1,0.5)aN.Size=UDim2.fromOffset(26,20)aN.ZIndex=2 local aO=
Instance.new'ImageLabel'aO.AnchorPoint=Vector2.new(0.5,0.5)aO.BackgroundColor3=
Color3.fromRGB(255,255,255)aO.BackgroundTransparency=1 aO.BorderColor3=Color3.
fromRGB(0,0,0)aO.BorderSizePixel=0 aO.Image='rbxassetid://98639906538385'aO.
ImageColor3=Color3.fromRGB(225,225,225)aO.Position=UDim2.fromScale(0.5,0.5)aO.
Size=UDim2.fromOffset(18,18)aO.Parent=aN aN.Parent=aJ aL.Parent=aJ aJ.Parent=aw
local aP=function()aL.Size=UDim2.new((au.Settings.Value-au.Settings.Minimum)/(au
.Settings.Maximum-au.Settings.Minimum),0,0,10)aN.Position=UDim2.new((au.Settings
.Value-au.Settings.Minimum)/(au.Settings.Maximum-au.Settings.Minimum),0,0.5,0)
local aP=tonumber(string.format('%.'..(au.Settings.Precision or 0)..'f',au.
Settings.Value))local aQ=au.Settings.Filter and au.Settings.Filter(aP,au.
Settings.Minimum,au.Settings.Maximum)aC.Text=aQ or aP end local aQ,aR=function(
aQ)local aR,aS=aQ.Position.X,aO.AbsoluteSize.X/2 local aT,aU,aV=aR-(aS*0.5),aJ.
AbsolutePosition.X,aJ.AbsoluteSize.X aT=math.clamp(aT-aU,0,aV)local aW=aT/aV aW=
au.Settings.Minimum+aW*(au.Settings.Maximum-au.Settings.Minimum)local aX=au.
Settings.Step or 0 if aX>0 then au.Settings.Value=math.round(aW/aX)*aX else au.
Settings.Value=aW end aP()if au.Settings.Callback then ad.callback(au.Settings.
Callback,au,au.Settings.Value)end end,false aJ.InputBegan:Connect(function(aS)if
aS.UserInputType==Enum.UserInputType.MouseButton1 then aR=true aQ(aS)if au.
Settings.inputChanged then ad.callback(au.Settings.inputChanged,au,au.Settings.
Value,aR)end end end)aJ.InputEnded:Connect(function(aS)if aS.UserInputType==Enum
.UserInputType.MouseButton1 then aR=false if au.Settings.inputChanged then ad.
callback(au.Settings.inputChanged,au,au.Settings.Value,aR)end end end)ac.
_userInputService.InputChanged:Connect(function(aS)if aR and aS.UserInputType==
Enum.UserInputType.MouseMovement then aQ(aS)end end)function au:UpdateSettings(
aS)if aS.Visible~=nil then au.Settings.Visible=aS.Visible aw.Visible=aS.Visible
end if aS.Name then au.Settings.Name=aS.Name aE.Text=aS.Name end if aS.
Description~=nil then au.Settings.Description=aS.Description aG.Text=aS.
Description or''aG.Visible=aS.Description and true or false end if aS.Value then
au.Settings.Value=aS.Value aP()if au.Settings.Callback then ad.callback(au.
Settings.Callback,au,au.Settings.Value)end end if aS.Minimum then au.Settings.
Minimum=aS.Minimum end if aS.Maximum then au.Settings.Maximum=aS.Maximum end if
aS.Step~=nil then au.Settings.Step=aS.Step end if aS.Precision~=nil then au.
Settings.Precision=aS.Precision end if aS.Filter then au.Settings.Filter=aS.
Filter end if aS.Callback then au.Settings.Callback=aS.Callback end if aS.
inputChanged then au.Settings.inputChanged=aS.inputChanged end end local aS=
Instance.new'Frame'aS.BackgroundColor3=Color3.fromRGB(30,30,30)aS.BorderColor3=
Color3.fromRGB(0,0,0)aS.BorderSizePixel=0 aS.Size=UDim2.new(1,0,0,1)aS.Parent=ap
function au:Continue()aS.Visible=false return au end function au:End()aS.Visible
=true return au end au:UpdateSettings(au.Settings)if at then aa.Components[at]=
au end return au:End()end function ah:Input(as,at)local au,aw={Settings=as,Type=
'Input'},Instance.new'Frame'aw.BackgroundColor3=Color3.fromRGB(30,30,30)aw.
BorderColor3=Color3.fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Size=UDim2.new(1,0,0,
40)aw.Visible=au.Settings.Visible==nil and true or au.Settings.Visible aw.Parent
=ap local ax=Instance.new'UICorner'ax.CornerRadius=UDim.new(0,5)ax.Parent=aw
local ay=Instance.new'UIListLayout'ay.FillDirection=Enum.FillDirection.
Horizontal ay.Padding=UDim.new(0,15)ay.SortOrder=Enum.SortOrder.LayoutOrder ay.
VerticalAlignment=Enum.VerticalAlignment.Center ay.Parent=aw local az=Instance.
new'UIPadding'az.PaddingLeft=UDim.new(0,15)az.Parent=aw local aA=Instance.new
'TextBox'aA.AnchorPoint=Vector2.new(0,0.5)aA.BackgroundColor3=Color3.fromRGB(255
,255,255)aA.BackgroundTransparency=1 aA.BorderColor3=Color3.fromRGB(0,0,0)aA.
BorderSizePixel=0 aA.ClearTextOnFocus=false aA.ClipsDescendants=true aA.
CursorPosition=-1 aA.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)aA.LayoutOrder=1 aA.PlaceholderColor3=
Color3.fromRGB(120,120,120)aA.PlaceholderText=au.Settings.Placeholder or'...'aA.
Size=UDim2.new(1,-50,1,0)aA.Text=au.Settings.Text or''aA.TextColor3=Color3.
fromRGB(156,156,156)aA.TextSize=15 aA.TextXAlignment=Enum.TextXAlignment.Left aA
.Parent=aw local aB=Instance.new'ImageLabel'aB.BackgroundColor3=Color3.fromRGB(
255,255,255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.
BorderSizePixel=0 aB.Image='rbxassetid://98129527229953'aB.ImageColor3=Color3.
fromRGB(156,156,156)aB.Size=UDim2.fromOffset(20,20)aB.Parent=aw local aC=au.
Settings.CharacterSub aA.FocusLost:Connect(function()if au.Settings.CharacterSub
=='Mathematic'then aA.Text=ad.subParser[au.Settings.CharacterSub](aA.Text)end if
au.Settings.Callback then ad.callback(au.Settings.Callback,au,aA.Text)end end)aA
:GetPropertyChangedSignal'Text':Connect(function()if au.Settings.CharacterSub
and au.Settings.CharacterSub~='Mathematic'and ad.subParser[au.Settings.
CharacterSub]then aA.Text=ad.subParser[au.Settings.CharacterSub](aA.Text)elseif
type(au.Settings.CharacterSub)=='function'then aA.Text=au.Settings.CharacterSub(
aA.Text)end if au.Settings.CharacterLimit then if string.len(aA.Text)>au.
Settings.CharacterLimit then aA.Text=string.sub(aA.Text,1,au.Settings.
CharacterLimit)end end au.Settings.Text=aA.Text if au.Settings.onTextChanged
then ad.callback(au.Settings.onTextChanged,au,aA.Text)end end)function au:
UpdateSettings(aD)if aD.Text then au.Settings.Text=aD.Text aA.Text=aD.Text if au
.Settings.Callback then ad.callback(au.Settings.Callback,au,aA.Text)end end if
aD.Placeholder then au.Settings.Placeholder=aD.Placeholder aA.PlaceholderText=aD
.Placeholder end if aD.Callback then au.Settings.Callback=aD.Callback end if aD.
onTextChanged then au.Settings.onTextChanged=aD.onTextChanged end if aD.Visible
~=nil then au.Settings.Visible=aD.Visible aw.Visible=aD.Visible end end local aD
=Instance.new'Frame'aD.BackgroundColor3=Color3.fromRGB(30,30,30)aD.BorderColor3=
Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.Size=UDim2.new(1,0,0,1)aD.Parent=ap
function au:Continue()aD.Visible=false return au end function au:End()aD.Visible
=true return au end au:UpdateSettings(au.Settings)if at then aa.Components[at]=
au end return au:End()end function ah:MultiInput(as,at)local au,aw={Settings=as,
Type='MultiInput'},Instance.new'Frame'aw.BackgroundColor3=Color3.fromRGB(30,30,
30)aw.BackgroundTransparency=1 aw.BorderColor3=Color3.fromRGB(0,0,0)aw.
BorderSizePixel=0 aw.Size=UDim2.new(1,0,0,40)aw.Parent=ap local ax=Instance.new
'UIListLayout'ax.FillDirection=Enum.FillDirection.Horizontal ax.HorizontalFlex=
Enum.UIFlexAlignment.Fill ax.Padding=UDim.new(0,5)ax.SortOrder=Enum.SortOrder.
LayoutOrder ax.VerticalAlignment=Enum.VerticalAlignment.Center ax.Parent=aw
local ay={}for az,aA in ipairs(au.Settings.Inputs)do local aB=Instance.new
'TextBox'aB.BackgroundColor3=Color3.fromRGB(30,30,30)aB.BorderColor3=Color3.
fromRGB(0,0,0)aB.BorderSizePixel=0 aB.ClearTextOnFocus=false aB.ClipsDescendants
=true aB.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal)aB.LayoutOrder=1 aB.PlaceholderColor3=Color3.fromRGB(120,
120,120)aB.PlaceholderText=aA.Placeholder or'...'aB.Size=UDim2.fromScale(1,1)aB.
Text=aA.Text or''aB.TextColor3=Color3.fromRGB(156,156,156)aB.TextSize=15 aB.
TextXAlignment=Enum.TextXAlignment.Left aB.Parent=aw ay[az]={inputBox=aB}local
aC=Instance.new'UIPadding'aC.PaddingLeft=UDim.new(0,10)aC.PaddingRight=UDim.new(
0,10)aC.Parent=aB local aD=Instance.new'UICorner'aD.CornerRadius=UDim.new(0,5)aD
.Parent=aB local aE=aA.CharacterSub or'None'aB.FocusLost:Connect(function()if au
.Settings.Callback then ad.callback(au.Settings.Callback,au,az,aB.Text)end end)
aB:GetPropertyChangedSignal'Text':Connect(function()if aE and type(aE)=='string'
and ad.subParser[aE]then aB.Text=ad.subParser[aE](aB.Text)elseif aE and type(aE)
=='function'then aB.Text=aA.CharacterSub(aB.Text)end if aA.CharacterLimit then
if string.len(aB.Text)>aA.CharacterLimit then aB.Text=string.sub(aB.Text,1,aA.
CharacterLimit)end end aA.Text=aB.Text if au.Settings.onTextChanged then ad.
callback(au.Settings.onTextChanged,au,az,aB.Text)end end)end function au:
UpdateSettings(az,aA)local aB,aC=au.Settings.Inputs[az],ay[az]if aB and aC then
if aA.Text~=nil then aB.Text=aA.Text aC.inputBox.Text=aA.Text if au.Settings.
Callback then ad.callback(au.Settings.Callback,au,az,aA.Text)end end if aA.
Placeholder~=nil then aB.Placeholder=aA.Placeholder aC.inputBox.PlaceholderText=
aA.Placeholder end end if aA.Callback~=nil then au.Settings.Callback=aA.Callback
end if aA.onTextChanged~=nil then au.Settings.onTextChanged=aA.onTextChanged end
if aA.Visible~=nil then au.Settings.Visible=aA.Visible aw.Visible=aA.Visible end
end local az=Instance.new'Frame'az.BackgroundColor3=Color3.fromRGB(30,30,30)az.
BorderColor3=Color3.fromRGB(0,0,0)az.BorderSizePixel=0 az.Size=UDim2.new(1,0,0,1
)az.Parent=ap function au:Continue()az.Visible=false return au end function au:
End()az.Visible=true return au end for aA,aB in pairs(au.Settings.Inputs)do au:
UpdateSettings(aA,aB)end if at then aa.Components[at]=au end return au:End()end
function ah:Dropdown(as,at)local au={Settings=as,Type='Dropdown'}assert(au.
Settings.Name and type(au.Settings.Name)=='string','Missing name or wrong type')
local aw=Instance.new'Frame'aw.AutomaticSize=Enum.AutomaticSize.Y aw.
BackgroundColor3=Color3.fromRGB(255,255,255)aw.BackgroundTransparency=1 aw.
BorderColor3=Color3.fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Size=UDim2.fromScale(1
,0)aw.Parent=ap local ax=Instance.new'UIPadding'ax.PaddingBottom=UDim.new(0,8)ax
.PaddingTop=UDim.new(0,8)ax.Parent=aw local ay=Instance.new'UIListLayout'ay.
Padding=UDim.new(0,15)ay.SortOrder=Enum.SortOrder.LayoutOrder ay.Parent=aw local
az=Instance.new'TextButton'az.AutoButtonColor=false az.AutomaticSize=Enum.
AutomaticSize.Y az.BackgroundColor3=Color3.fromRGB(30,30,30)az.BorderColor3=
Color3.fromRGB(0,0,0)az.BorderSizePixel=0 az.ClipsDescendants=true az.FontFace=
Font.new('rbxassetid://12187365364',Enum.FontWeight.Bold,Enum.FontStyle.Normal)
az.LayoutOrder=1 az.Position=UDim2.fromScale(0,0.16)az.Size=UDim2.new(1,0,0,40)
az.Text=''az.TextColor3=Color3.fromRGB(156,156,156)az.TextSize=15 az.
TextXAlignment=Enum.TextXAlignment.Left az.TextYAlignment=Enum.TextYAlignment.
Top local aA=Instance.new'UIPadding'aA.PaddingBottom=UDim.new(0,10)aA.
PaddingLeft=UDim.new(0,15)aA.PaddingRight=UDim.new(0,15)aA.PaddingTop=UDim.new(0
,10)aA.Parent=az local aB=Instance.new'UICorner'aB.CornerRadius=UDim.new(0,5)aB.
Parent=az local aC=Instance.new'Frame'aC.AutomaticSize=Enum.AutomaticSize.Y aC.
BackgroundColor3=Color3.fromRGB(255,255,255)aC.BackgroundTransparency=1 aC.
BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel=0 aC.Size=UDim2.fromScale(1
,0)local aD=Instance.new'ImageLabel'aD.AnchorPoint=Vector2.new(1,0.5)aD.
BackgroundColor3=Color3.fromRGB(30,34,47)aD.BackgroundTransparency=1 aD.
BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.Image=
'rbxassetid://77136690433593'aD.ImageColor3=Color3.fromRGB(150,150,150)aD.
LayoutOrder=1 aD.Position=UDim2.fromScale(1,0.5)aD.Size=UDim2.fromOffset(18,18)
aD.Parent=aC local aE=Instance.new'TextLabel'aE.AutomaticSize=Enum.AutomaticSize
.Y aE.BackgroundColor3=Color3.fromRGB(255,255,255)aE.BackgroundTransparency=1 aE
.BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel=0 aE.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)aE.
RichText=true aE.Size=UDim2.new(1,-35,0,20)aE.Text='...'aE.TextColor3=Color3.
fromRGB(156,156,156)aE.TextSize=15 aE.TextWrapped=true aE.TextXAlignment=Enum.
TextXAlignment.Left aE.Parent=aC aC.Parent=az az.Parent=aw local aF=Instance.new
'Frame'aF.AutomaticSize=Enum.AutomaticSize.Y aF.BackgroundColor3=Color3.fromRGB(
255,255,255)aF.BackgroundTransparency=1 aF.BorderColor3=Color3.fromRGB(0,0,0)aF.
BorderSizePixel=0 aF.Size=UDim2.new(1,0,0,33)local aG=Instance.new'TextLabel'aG.
AutomaticSize=Enum.AutomaticSize.XY aG.BackgroundColor3=Color3.fromRGB(255,255,
255)aG.BackgroundTransparency=1 aG.BorderColor3=Color3.fromRGB(0,0,0)aG.
BorderSizePixel=0 aG.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)aG.RichText=true aG.Text='Name'aG.
TextColor3=Color3.fromRGB(225,225,225)aG.TextSize=16 aG.TextWrapped=true aG.
TextXAlignment=Enum.TextXAlignment.Left aG.Parent=aF local aH=Instance.new
'UIListLayout'aH.Padding=UDim.new(0,5)aH.SortOrder=Enum.SortOrder.LayoutOrder aH
.VerticalAlignment=Enum.VerticalAlignment.Center aH.Parent=aF local aI=Instance.
new'TextLabel'aI.AutomaticSize=Enum.AutomaticSize.XY aI.BackgroundColor3=Color3.
fromRGB(255,255,255)aI.BackgroundTransparency=1 aI.BorderColor3=Color3.fromRGB(0
,0,0)aI.BorderSizePixel=0 aI.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)aI.LayoutOrder=1 aI.RichText=true aI.
Text='description'aI.TextColor3=Color3.fromRGB(80,80,80)aI.TextSize=12 aI.
TextWrapped=true aI.TextXAlignment=Enum.TextXAlignment.Left aI.Parent=aF aI.
Visible=au.Settings.Description and true or false aF.Parent=aw local aJ=Instance
.new'Frame'aJ.Name='dropdownFrame'aJ.BackgroundColor3=Color3.fromRGB(30,30,30)aJ
.BorderColor3=Color3.fromRGB(0,0,0)aJ.BorderSizePixel=0 aJ.Size=UDim2.
fromOffset(350,150)local aK=Instance.new'ScrollingFrame'aK.Name=
'dropdownContent'aK.Active=true aK.AutomaticCanvasSize=Enum.AutomaticSize.Y aK.
BackgroundColor3=Color3.fromRGB(30,30,30)aK.BackgroundTransparency=1 aK.
BorderColor3=Color3.fromRGB(0,0,0)aK.BorderSizePixel=0 aK.CanvasSize=UDim2.new()
aK.ScrollBarImageTransparency=0.7 aK.ScrollBarThickness=3 aK.Size=UDim2.
fromScale(1,1)local aL=Instance.new'UIListLayout'aL.Name='UIListLayout'aL.
SortOrder=Enum.SortOrder.LayoutOrder aL.Parent=aK local aM=Instance.new
'UIPadding'aM.Name='UIPadding'aM.PaddingRight=UDim.new(0,15)aM.Parent=aK aK.
Parent=aJ local aN=Instance.new'UIPadding'aN.Name='UIPadding'aN.PaddingBottom=
UDim.new(0,10)aN.PaddingLeft=UDim.new(0,15)aN.PaddingTop=UDim.new(0,3)aN.Parent=
aJ local aO=Instance.new'UICorner'aO.Name='UICorner'aO.CornerRadius=UDim.new(0,5
)aO.Parent=aJ local aP,aQ,aR,aS,aT,aU=false,false,false,{},{},{Selected=Color3.
fromRGB(225,225,225),Unselected=Color3.fromRGB(156,156,156)}table.insert(ab.
dropdownFrames,aJ)local aV=function(aV)local aW,aX='...',{}for aY,aZ in ipairs(
aS)do local a_=aT[aZ].Text table.insert(aX,a_)end if#aX==1 then aW=aX[1]elseif#
aX>1 then aW=table.concat(aX,', ')end aE.Text=aW au.Settings.Value=aX if aV and
au.Settings.Callback then ad.callback(au.Settings.Callback,au,aX)end end local
aW=function(aW)local aX,aY=au.Settings.Limit,au.Settings.Minimum or 0 if table.
find(aS,aW)then if#aS-1<aY then return end table.remove(aS,table.find(aS,aW))ad.
tween(aT[aW],TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=aU.Unselected}
):Play()else if aX and#aS>=aX then local aZ=table.remove(aS,1)ad.tween(aT[aZ],
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=aU.Unselected}):Play()end
table.insert(aS,aW)ad.tween(aT[aW],TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
TextColor3=aU.Selected}):Play()end aV(true)end local aX,aY=function(aX)for aY,aZ
in ipairs(aX)do local a_=Instance.new'TextButton'a_.Name='Button'a_.
AutoButtonColor=false a_.AutomaticSize=Enum.AutomaticSize.Y a_.
BackgroundTransparency=1 a_.BorderSizePixel=0 a_.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)a_.
RichText=true a_.Size=UDim2.fromScale(1,0)a_.Text=aZ a_.TextColor3=Color3.
fromRGB(156,156,156)a_.TextSize=15 a_.TextWrapped=true a_.TextXAlignment=Enum.
TextXAlignment.Left a_.Parent=aK a_.LayoutOrder=aY local a0=Instance.new
'UIPadding'a0.Name='UIPadding'a0.PaddingBottom=UDim.new(0,15)a0.PaddingTop=UDim.
new(0,15)a0.Parent=a_ a_.MouseButton1Click:Connect(function()aW(aZ)end)aT[aZ]=a_
end end,function()local aX,aY=az.AbsolutePosition,az.AbsoluteSize local aZ,a_=aX
.Y+(aY.Y*2)+5,aX.X aJ.Position=UDim2.new(0,a_,0,aZ)end local aZ=function()if aR
then return end aR=true if aQ then ad.tween(aD,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Rotation=0}):Play()local aZ=ad.tween(aJ,TweenInfo.new(0.1,
Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(az.AbsoluteSize.X,0)})aZ:Play()aZ.
Completed:Wait()aJ.Parent=nil aQ=false else ad.tween(aD,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Rotation=180}):Play()for aZ,a_ in pairs(ab.dropdownFrames)do
if a_==aJ then a_.Size=UDim2.fromOffset(az.AbsoluteSize.X,0)a_.Parent=ab.gui ad.
tween(a_,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(az.
AbsoluteSize.X,150)}):Play()aY()else local a0=ad.tween(a_,TweenInfo.new(0.1,Enum
.EasingStyle.Sine),{Size=UDim2.fromOffset(az.AbsoluteSize.X,0)})a0:Play()a0.
Completed:Wait()a_.Parent=nil end end aQ=true end aR=false end az.
MouseButton1Click:Connect(aZ)az:GetPropertyChangedSignal'AbsolutePosition':
Connect(aY)az:GetPropertyChangedSignal'AbsoluteSize':Connect(aY)aJ.MouseEnter:
Connect(function()aP=true end)aJ.MouseLeave:Connect(function()aP=false end)ac.
_userInputService.InputBegan:Connect(function(a_)if a_.UserInputType==Enum.
UserInputType.MouseButton1 and not aP and aJ.Parent then aZ()end end)function au
:Insert(a_)aX(a_)end function au:Remove(a_)for a0,a1 in ipairs(a_)do for a2=#au.
Settings.Options,1,-1 do if au.Settings.Options[a2]==a1 then table.remove(au.
Settings.Options,a2)end end if aT[a1]then aT[a1]:Destroy()aT[a1]=nil end for a2=
#aS,1,-1 do if aS[a2]==a1 then table.remove(aS,a2)end end aV()end end function
au:UpdateSettings(a_)if a_.Visible~=nil then aw=a_.Visible end if a_.Name then
au.Settings.Name=a_.Name aG.Text=a_.Name end if a_.Description~=nil then au.
Settings.Description=a_.Description aI.Text=a_.Description or''aI.Visible=a_.
Description and true or false end if a_.Limit~=nil then au.Settings.Limit=a_.
Limit end if a_.Minimum then au.Settings.Minimum=a_.Minimum end if a_.Callback
then au.Settings.Callback=a_.Callback end if a_.Options then au.Settings.Options
=a_.Options for a0,a1 in pairs(aT)do a1:Destroy()end aT={}aX(a_.Options)end if
a_.Value~=nil then if type(a_.Value)=='string'then aW(a_.Value)elseif type(a_.
Value)=='table'then for a0,a1 in pairs(a_.Value)do aW(a1)end end end end local
a_=Instance.new'Frame'a_.BackgroundColor3=Color3.fromRGB(30,30,30)a_.
BorderColor3=Color3.fromRGB(0,0,0)a_.BorderSizePixel=0 a_.Size=UDim2.new(1,0,0,1
)a_.Parent=ap function au:Continue()a_.Visible=false return au end function au:
End()a_.Visible=true return au end au:UpdateSettings(au.Settings)if at then aa.
Components[at]=au end return au:End()end function ah:Colorpicker(as,at)local au=
{Settings=as,Type='Colorpicker'}function au:UpdateSettings(aw)end local aw=
Instance.new'Frame'aw.BackgroundColor3=Color3.fromRGB(30,30,30)aw.BorderColor3=
Color3.fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Size=UDim2.new(1,0,0,1)aw.Parent=ap
function au:Continue()aw.Visible=false return au end function au:End()aw.Visible
=true return au end if at then aa.Components[at]=au end return au:End()end
function ah:Keybind(as,at)local au,aw={Settings=as,Type='Keybind'},Instance.new
'Frame'aw.AutomaticSize=Enum.AutomaticSize.Y aw.BackgroundColor3=Color3.fromRGB(
0,0,0)aw.BackgroundTransparency=1 aw.BorderColor3=Color3.fromRGB(0,0,0)aw.
BorderSizePixel=0 aw.Size=UDim2.fromScale(1,0)aw.Visible=au.Settings.Visible==
nil and true or au.Settings.Visible aw.Parent=ap local az=Instance.new
'TextButton'az.AutoButtonColor=false az.AutomaticSize=Enum.AutomaticSize.Y az.
BackgroundColor3=Color3.fromRGB(30,30,30)az.BorderColor3=Color3.fromRGB(0,0,0)az
.BorderSizePixel=0 az.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'az.Size=UDim2.new(1,0,0,40)az.Text
=''az.TextColor3=Color3.fromRGB(0,0,0)az.TextSize=14 local aC=Instance.new
'TextLabel'aC.AnchorPoint=Vector2.new(0,0.5)aC.AutomaticSize=Enum.AutomaticSize.
XY aC.BackgroundColor3=Color3.fromRGB(255,255,255)aC.BackgroundTransparency=1 aC
.BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel=0 aC.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)aC.
LayoutOrder=1 aC.Position=UDim2.fromScale(0,0.5)aC.TextColor3=Color3.fromRGB(156
,156,156)aC.TextSize=15 aC.TextWrapped=true aC.TextXAlignment=Enum.
TextXAlignment.Left aC.Text='Unbinded'local aD=Instance.new'UIPadding'aD.
PaddingBottom=UDim.new(0,10)aD.PaddingRight=UDim.new(0,50)aD.PaddingTop=UDim.
new(0,10)aD.Parent=aC aC.Parent=az local aE=Instance.new'UIPadding'aE.
PaddingLeft=UDim.new(0,15)aE.Parent=az local aF=Instance.new'UIListLayout'aF.
FillDirection=Enum.FillDirection.Horizontal aF.Padding=UDim.new(0,15)aF.
SortOrder=Enum.SortOrder.LayoutOrder aF.VerticalAlignment=Enum.VerticalAlignment
.Center aF.Parent=az local aG=Instance.new'ImageLabel'aG.BackgroundColor3=Color3
.fromRGB(255,255,255)aG.BackgroundTransparency=1 aG.BorderColor3=Color3.fromRGB(
0,0,0)aG.BorderSizePixel=0 aG.Image='rbxassetid://94052787260057'aG.ImageColor3=
Color3.fromRGB(156,156,156)aG.Size=UDim2.fromOffset(20,20)aG.Parent=az local aH=
Instance.new'UICorner'aH.CornerRadius=UDim.new(0,5)aH.Parent=az az.Parent=aw
local aI,aJ=false,function(aI)if aI then aG.Visible=false aC.Text='Press a key'
aC.Size=UDim2.fromScale(1,0)aC.TextXAlignment=Enum.TextXAlignment.Center aD.
PaddingRight=UDim.new(0,15)az.Active=false az.Interactable=false elseif aI==
false then aG.Visible=true aC.Size=UDim2.fromScale(0,0)aC.TextXAlignment=Enum.
TextXAlignment.Left aD.PaddingRight=UDim.new(0,50)az.Active=true az.Interactable
=true else aG.Visible=true aC.Text='Unbinded'aC.Size=UDim2.fromScale(0,0)aC.
TextXAlignment=Enum.TextXAlignment.Left aD.PaddingRight=UDim.new(0,50)az.Active=
true az.Interactable=true end end if au.Settings.Bind then aJ(false)if au.
Settings.Bind.EnumType==Enum.KeyCode then aC.Text=ad.parseKeyCode(au.Settings.
Bind)elseif au.Settings.Bind==Enum.UserInputType.MouseButton1 or au.Settings.
Bind==Enum.UserInputType.MouseButton2 then aC.Text=ad.parseKeyCode(au.Settings.
Bind)end else aJ(nil)end az.InputEnded:Connect(function(aK)if aK.UserInputType==
Enum.UserInputType.MouseButton1 or aK.UserInputType==Enum.UserInputType.Touch
then aI=true aJ(true)end end)ac._userInputService.InputBegan:Connect(function(aK
,aL)if aI and not aL and not(au.Settings.Blacklist and(table.find(au.Settings.
Blacklist,aK.KeyCode)or table.find(au.Settings.Blacklist,aK.UserInputType)))then
if aK.UserInputType==Enum.UserInputType.Keyboard then au.Settings.Bind=aK.
KeyCode aC.Text=ad.parseKeyCode(aK.KeyCode)aJ(false)if au.Settings.onChanged
then ad.callback(au.Settings.onChanged,au,au.Settings.Bind)end aI=false elseif
aK.UserInputType==Enum.UserInputType.MouseButton1 or aK.UserInputType==Enum.
UserInputType.MouseButton2 then au.Settings.Bind=aK.UserInputType aC.Text=ad.
parseKeyCode(aK.UserInputType)aJ(false)if au.Settings.onChanged then ad.
callback(au.Settings.onChanged,au,au.Settings.Bind)end aI=false end end end)ac.
_userInputService.InputBegan:Connect(function(aK,aL)if not aI then if aK.KeyCode
==au.Settings.Bind or aK.UserInputType==au.Settings.Bind then if au.Settings.
Callback then ad.callback(au.Settings.Callback,au,aL)end if au.Settings.onHeld
then ad.callback(au.Settings.onHeld,au,true,aL)end end end end)ac.
_userInputService.InputEnded:Connect(function(aK,aL)if not aI and(aK.KeyCode==au
.Settings.Bind or aK.UserInputType==au.Settings.Bind)then if au.Settings.onHeld
then ad.callback(au.Settings.onHeld,au,false,aL)end end end)function au:
UpdateSettings(aK)if aK.Visible~=nil then au.Settings.Visible=aK.Visible aw.
Visible=aK.Visible end if aK.Bind then au.Settings.Bind=aK.Bind aJ(false)if au.
Settings.Bind.EnumType==Enum.KeyCode then aC.Text=ad.parseKeyCode(au.Settings.
Bind)elseif au.Settings.Bind==Enum.UserInputType.MouseButton1 or au.Settings.
Bind==Enum.UserInputType.MouseButton2 then aC.Text=ad.parseKeyCode(au.Settings.
Bind)end if aK.Callback then ad.callback(au.Settings.Callback,au,false)end end
if aK.Callback then au.Settings.Callback=aK.Callback end if aK.onHeld then au.
Settings.onHeld=aK.onHeld end if aK.onChanged then au.Settings.onChanged=aK.
onChanged end end local aK=Instance.new'Frame'aK.BackgroundColor3=Color3.
fromRGB(30,30,30)aK.BorderColor3=Color3.fromRGB(0,0,0)aK.BorderSizePixel=0 aK.
Size=UDim2.new(1,0,0,1)aK.Parent=ap function au:Continue()aK.Visible=false
return au end function au:End()aK.Visible=true return au end au:UpdateSettings(
au.Settings)if at then aa.Components[at]=au end return au:End()end function ah:
Header(as,at)local au,aw={Settings=as},Instance.new'Frame'aw.AutomaticSize=Enum.
AutomaticSize.Y aw.BackgroundColor3=Color3.fromRGB(255,255,255)aw.
BackgroundTransparency=1 aw.BorderColor3=Color3.fromRGB(0,0,0)aw.BorderSizePixel
=0 aw.Size=UDim2.fromScale(1,0)aw.Parent=ap local az=Instance.new'UIPadding'az.
PaddingBottom=UDim.new(0,0)az.PaddingTop=UDim.new(0,8)az.Parent=aw local aC=
Instance.new'UIListLayout'aC.Padding=UDim.new(0,5)aC.SortOrder=Enum.SortOrder.
LayoutOrder aC.VerticalAlignment=Enum.VerticalAlignment.Center aC.Parent=aw
local aD=Instance.new'TextLabel'aD.AutomaticSize=Enum.AutomaticSize.XY aD.
BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1 aD.
BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.FontFace=Font.new(
'rbxassetid://16658237174',Enum.FontWeight.Bold,Enum.FontStyle.Normal)aD.
RichText=true aD.TextColor3=Color3.fromRGB(225,225,225)aD.TextSize=22 aD.
TextWrapped=true aD.TextXAlignment=Enum.TextXAlignment.Left aD.Parent=aw
function au:UpdateSettings(aE)if aE.Text then au.Settings.Text=aE.Text aD.Text=
aE.Text end if aE.Visible~=nil then au.Settings.Visible=aE.Visible aw.Visible=aE
.Visible end end au:UpdateSettings(au.Settings)if at then aa.Components[at]=au
end return au end function ah:Divider(as,at)local au,aw={Settings=as},Instance.
new'Frame'aw.BackgroundColor3=Color3.fromRGB(30,30,30)aw.BorderColor3=Color3.
fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Size=UDim2.new(1,0,0,1)aw.Parent=ap aw.
Visible=au.Settings and(au.Settings.Visible==nil and true or au.Settings.Visible
)or true function au:UpdateSettings(az)if az.Visible~=nil then au.Settings.
Visible=az.Visible aw.Visible=az.Visible end end if at then aa.Components[at]=au
end return au end return ah end function b:VisualPreview(ag)local ah={I,J,L,K,N,
M,H,G}if ag.Enabled~=nil then local ai=ag.Enabled D.Visible=ai W.Visible=ai Y.
Visible=ai X.Visible=ai Q.Visible=ai U.Visible=ai S.Visible=ai F.Visible=ai for
aj,ak in ipairs(ah)do ak.Visible=ai end if not ai then return end end if ag.
Visible~=nil then t.Visible=ag.Visible end if ag.HealthBar and ag.HealthBar.
Visible~=nil then D.Visible=ag.HealthBar.Visible end if ag.Distance then if ag.
Distance.Visible~=nil then W.Visible=ag.Distance.Visible end if ag.Distance.
Color then W.TextColor3=ag.Distance.Color end end if ag.Health then if ag.Health
.Visible~=nil then Y.Visible=ag.Health.Visible end if ag.Health.Color then Y.
TextColor3=ag.Health.Color end end if ag.Weapon then if ag.Weapon.Visible~=nil
then X.Visible=ag.Weapon.Visible end if ag.Weapon.Color then X.TextColor3=ag.
Weapon.Color end end if ag.Name then if ag.Name.Visible~=nil then Q.Visible=ag.
Name.Visible end if ag.Name.Color then Q.TextColor3=ag.Name.Color end end if ag.
FillBox then if ag.FillBox.Visible~=nil then U.Visible=ag.FillBox.Visible end if
ag.FillBox.Color then U.BackgroundColor3=ag.FillBox.Color[1]or U.
BackgroundColor3 U.BackgroundTransparency=ag.FillBox.Color[2]or U.
BackgroundTransparency end end if ag.BoundingBox then if ag.BoundingBox.Visible
~=nil then S.Visible=ag.BoundingBox.Visible end if ag.BoundingBox.Color then T.
Color=ag.BoundingBox.Color[1]or T.Color T.Transparency=ag.BoundingBox.Color[2]or
T.Transparency end end if ag.CornerBox then if ag.CornerBox.Visible~=nil then F.
Visible=ag.CornerBox.Visible end if ag.CornerBox.Color then for ai,aj in ipairs(
ah)do aj.BackgroundColor3=ag.CornerBox.Color[1]or aj.BackgroundColor3 aj.
BackgroundTransparency=ag.CornerBox.Color[2]or aj.BackgroundTransparency end end
end end return b end function aa:Notification(ae)local af={Settings=ae}assert(af
.Settings.Title and type(af.Settings.Title)=='string',
'Missing notification title or wrong type')local ag=Instance.new'ImageButton'ag.
AnchorPoint=Vector2.new(1,1)ag.AutoButtonColor=false ag.AutomaticSize=Enum.
AutomaticSize.Y ag.BackgroundColor3=Color3.fromRGB(17,17,17)ag.BorderColor3=
Color3.fromRGB(0,0,0)ag.BorderSizePixel=0 ag.Image='rbxassetid://17365187482'ag.
ImageTransparency=0.96 ag.Position=UDim2.fromScale(1,1)ag.ScaleType=Enum.
ScaleType.Tile ag.Size=UDim2.fromOffset(280,0)ag.TileSize=UDim2.fromOffset(500,
325)ag.Position=UDim2.new(1,(ag.AbsoluteSize.X+(ab.notifSystem.uIpadding and ab.
notifSystem.uIpadding.PaddingRight.Offset or 0)),1,0)local ah=Instance.new
'Frame'ah.AutomaticSize=Enum.AutomaticSize.Y ah.BackgroundColor3=Color3.fromRGB(
255,255,255)ah.BackgroundTransparency=1 ah.BorderColor3=Color3.fromRGB(0,0,0)ah.
BorderSizePixel=0 ah.Size=UDim2.fromScale(1,0)local ai=Instance.new'UIPadding'ai
.PaddingBottom=UDim.new(0,13)ai.PaddingLeft=UDim.new(0,13)ai.PaddingRight=UDim.
new(0,af.Settings.Image and 42 or 13)ai.PaddingTop=UDim.new(0,13)ai.Parent=ah
local aj=Instance.new'UIListLayout'aj.Padding=UDim.new(0,5)aj.SortOrder=Enum.
SortOrder.LayoutOrder aj.VerticalAlignment=Enum.VerticalAlignment.Center aj.
Parent=ah local ak=Instance.new'Frame'ak.AutomaticSize=Enum.AutomaticSize.Y ak.
BackgroundColor3=Color3.fromRGB(255,255,255)ak.BackgroundTransparency=1 ak.
BorderColor3=Color3.fromRGB(0,0,0)ak.BorderSizePixel=0 ak.Size=UDim2.fromScale(1
,0)local al=Instance.new'UIListLayout'al.FillDirection=Enum.FillDirection.
Horizontal al.Padding=UDim.new(0,13)al.SortOrder=Enum.SortOrder.LayoutOrder al.
Parent=ak local am=Instance.new'ImageLabel'am.BackgroundColor3=Color3.fromRGB(
255,255,255)am.BackgroundTransparency=1 am.BorderColor3=Color3.fromRGB(0,0,0)am.
BorderSizePixel=0 am.ImageColor3=Color3.fromRGB(225,225,225)am.ScaleType=Enum.
ScaleType.Fit am.Size=UDim2.fromOffset(16,16)am.Parent=ak am.Visible=af.Settings
.Image and af.Settings.Image~=''am.Image=af.Settings.Image or''local an=Instance
.new'Frame'an.AutomaticSize=Enum.AutomaticSize.Y an.BackgroundColor3=Color3.
fromRGB(255,255,255)an.BackgroundTransparency=1 an.BorderColor3=Color3.fromRGB(0
,0,0)an.BorderSizePixel=0 an.LayoutOrder=1 an.Size=UDim2.fromScale(1,0)local ao=
Instance.new'UIListLayout'ao.Padding=UDim.new(0,5)ao.SortOrder=Enum.SortOrder.
LayoutOrder ao.VerticalAlignment=Enum.VerticalAlignment.Center ao.Parent=an
local ap=Instance.new'TextLabel'ap.AutomaticSize=Enum.AutomaticSize.Y ap.
BackgroundColor3=Color3.fromRGB(255,255,255)ap.BackgroundTransparency=1 ap.
BorderColor3=Color3.fromRGB(0,0,0)ap.BorderSizePixel=0 ap.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ap.
LayoutOrder=1 ap.RichText=true ap.Size=UDim2.fromScale(1,0)ap.TextColor3=Color3.
fromRGB(225,225,225)ap.TextSize=16 ap.TextWrapped=true ap.TextXAlignment=Enum.
TextXAlignment.Left ap.TextYAlignment=Enum.TextYAlignment.Top ap.Parent=an ap.
Text=af.Settings.Title local aq=Instance.new'TextLabel'aq.AutomaticSize=Enum.
AutomaticSize.Y aq.BackgroundColor3=Color3.fromRGB(255,255,255)aq.
BackgroundTransparency=1 aq.BorderColor3=Color3.fromRGB(0,0,0)aq.BorderSizePixel
=0 aq.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.
FontStyle.Normal)aq.LayoutOrder=1 aq.RichText=true aq.Size=UDim2.fromScale(1,0)
aq.TextColor3=Color3.fromRGB(100,100,100)aq.TextSize=14 aq.TextWrapped=true aq.
TextXAlignment=Enum.TextXAlignment.Left aq.TextYAlignment=Enum.TextYAlignment.
Top aq.Parent=an aq.Visible=af.Settings.Description and true or false aq.Text=af
.Settings.Description or''local ar=Instance.new'UIPadding'ar.PaddingTop=UDim.
new(0,-1)ar.Parent=an an.Parent=ak local as=Instance.new'UIPadding'as.PaddingTop
=UDim.new(0,1)as.Parent=ak ak.Parent=ah ah.Parent=ag table.insert(ab.notifSystem
.notifInstances,ag)ag.Parent=ab.notifSystem.notifications local at=Instance.new
'UICorner'at.CornerRadius=UDim.new(0,15)at.Parent=ag ad.tween(ag,TweenInfo.new(
0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,0,1,0)}):Play()if af.
Settings.Lifetime and af.Settings.Lifetime>0 then task.delay(af.Settings.
Lifetime,function()af:Cancel()end)end function af:Cancel()local au=table.find(ab
.notifSystem.notifInstances,ag)if not au then return end table.remove(ab.
notifSystem.notifInstances,au)task.spawn(function()ad.tween(ag,TweenInfo.new(
0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,ag.AbsoluteSize.X+(ab.
notifSystem.uIpadding and ab.notifSystem.uIpadding.PaddingRight.Offset or 0),1,
ag.Position.Y.Offset)}):Play()end)task.delay(0.25,function()ag:Destroy()end)for
aw=au-1,1,-1 do task.spawn(function()local az=ab.notifSystem.notifInstances[aw]
ad.tween(az,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=az.
Position+UDim2.new(0,0,0,ag.AbsoluteSize.Y+(ab.notifSystem.uIpadding and ab.
notifSystem.uIpadding.PaddingBottom.Offset or 0))}):Play()end)end end return af
end function aa:Unload()ab.gui:Destroy()end ab.localPlayer=ac._players.
LocalPlayer local ae=function()ab.camera=ac._workspace.CurrentCamera end ae()ac.
_workspace:GetPropertyChangedSignal'CurrentCamera':Connect(ae)ab.gui=ad.
secureGui{ScreenInsets=Enum.ScreenInsets.None,ResetOnSpawn=false,ZIndexBehavior=
Enum.ZIndexBehavior.Sibling,DisplayOrder=2147483647}ab.overlay=Instance.new(
'Frame',ab.gui)ab.overlay.BackgroundColor3=Color3.fromRGB(255,255,255)ab.overlay
.BackgroundTransparency=1 ab.overlay.BorderColor3=Color3.fromRGB(0,0,0)ab.
overlay.BorderSizePixel=0 ab.overlay.Size=UDim2.fromScale(1,1)ab.overlay.Parent=
ab.gui ab.notifSystem.notifications=Instance.new('Frame',ab.gui)ab.notifSystem.
notifications.BackgroundColor3=Color3.fromRGB(255,255,255)ab.notifSystem.
notifications.BackgroundTransparency=1 ab.notifSystem.notifications.BorderColor3
=Color3.fromRGB(0,0,0)ab.notifSystem.notifications.BorderSizePixel=0 ab.
notifSystem.notifications.Size=UDim2.fromScale(1,1)ab.notifSystem.notifications.
ZIndex=2 ab.notifSystem.uIpadding=Instance.new('UIPadding',ab.notifSystem.
notifications)ab.notifSystem.uIpadding.PaddingBottom=UDim.new(0,15)ab.
notifSystem.uIpadding.PaddingLeft=UDim.new(0,15)ab.notifSystem.uIpadding.
PaddingRight=UDim.new(0,15)ab.notifSystem.uIpadding.PaddingTop=UDim.new(0,15)
local af=function(af)local ag=table.find(ab.notifSystem.notifInstances,af)if ag
then for ah,ai in pairs(ab.notifSystem.notifInstances)do if ah~=ag then ad.
tween(ai,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=ai.Position-
UDim2.new(0,0,0,ab.notifSystem.notifInstances[ag].AbsoluteSize.Y+10)}):Play()end
end end end ab.notifSystem.notifications.ChildAdded:Connect(af)return aa end
function a.g()return function(aa)local ab,ac,ad,ae=a.load'a',a.load'f',a.load'c'
,a.load'd'local af,ag,ah,ai,aj=ac.Components,ac.Assets,ac.Colors,ad.shared,ad.
team local ak,al,am,an,ao,ap,aq=aj.enemy,aj.friendly,ae.Aimbot,ae.Triggerbot,ae.
FOVSettings,ab.SecureService,ac:Window{Title=aa.Name,Keybind=Enum.KeyCode.
RightControl}local ar={Legit=aq:Tab{Name='Legit',Image=ag.ShieldCheck},Rage=aq:
Tab{Name='Rage',Image=ag.Shield},Visuals=aq:Tab{Name='Visuals',Image=ag.Bolt},
Misc=aq:Tab{Name='Misc',Image=ag.Folder},Cfg=aq:Tab{Name='Cfg',Image=ag.Archive}
}do local as=ar.Legit as:Header{Text='Aimbot'}as:Toggle({Name='Enabled',
Description='enables aimbot',State=false,Callback=function(at,au)am.Enabled=au
end},'Aimbot'):Continue()as:Keybind({Bind=Enum.UserInputType.MouseButton2,
Blacklist={Enum.UserInputType.MouseButton1},onHeld=function(at,au,aw)if aw then
return end am.SetState(au)end},'AimbotKeybind')as:Dropdown({Name='Lock Method',
Description=
[[Camera: Orients your camera to face the player
Mouse: Moves your mouse to the player]]
,Options={'Camera','Mouse'},Value={'Camera'},Limit=1,Minimum=1,Callback=function
(at,au)am.LockMode=({Camera=1,Mouse=2})[au[1] ]end},'AimbotLockMethod')as:
Slider({Name='Smoothing',Description='aimbot smoothness',Value=1,Minimum=1,
Maximum=20,Step=0.1,Precision=1,Callback=function(at,au)am.Sensitivity=(au-1)/(
at.Settings.Maximum-1)*0.15 am.Sensitivity2=au end},'AimbotSmoothing')as:
Dropdown({Name='Wall Check',Description=
[[

Off: Disabled
Sticky: Locks when target is in view and stays locked.
Always On: Only locked when target is in view.]]
,Options={'Off','Sticky','Always On'},Value={'Always On'},Limit=1,Minimum=1,
Callback=function(at,au)am.WallCheck=({Off=1,Sticky=2,['Always On']=3})[au[1] ]
end},'AimbotWallCheckMode')for at,au in ipairs{{'Team Check',
'whether to ignore friendlys','TeamCheck',true},{'Alive Check',
'whether to ignore corpses','AliveCheck',true}}do as:Toggle{Name=au[1],
Description=au[2],State=au[4],Callback=function(aw,az)am[au[3] ]=az end}end as:
Dropdown({Name='Bone',Description='selects the bone to aim at',Options={'Head',
'Torso'},Value={'Head'},Limit=1,Minimum=1,Callback=function(at,au)am.LockPart=au
[1]end},'Bone')end ad.Load()ae.Load()ar.Legit:Select()end end function a.h()
local aa={Version='1.3.2',Author='Depso',License='MIT',Repository=
'https://github.com/depthso/Dear-ReGui/',Debug=false,PrefabsId=117781589903262,
DefaultTitle='ReGui',ContainerName='riUi',DoubleClickThreshold=0.3,Container=nil
,Prefabs=nil,Tooltip=nil,ActiveWindow=nil,ThemeConfigs={},Elements={},Animation=
{DefaultTweenInfo=TweenInfo.new(0.08)},_FlagCache={},Windows={},
AnimationConnections={},MouseEvents={DoubleClick={},Click={}}}aa.Icons={
RDefaultImage='rbxassetid://134552883719543',RShieldCheck=
'rbxassetid://72905476505849',RShield='rbxassetid://125424227377940',RArchive=
'rbxassetid://86530498402003',RFolder='rbxassetid://134156031333431',RBolt=
'rbxassetid://99791134265440',RGlobe='rbxassetid://132856339478739',RComputer=
'rbxassetid://136037119434947',RSettings='rbxassetid://71732494649961',Dot=
'rbxasset://textures/whiteCircle.png',Arrow='rbxassetid://4731371527',Close=
'rbxasset://textures/AnimationEditor/icon_close.png',Checkmark=
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
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}aa.Accent={Light
=Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),White=Color3.fromRGB(
240,240,240),Gray=Color3.fromRGB(127,126,129),Black=Color3.fromRGB(15,19,24),
Yellow=Color3.fromRGB(230,180,0),Orange=Color3.fromRGB(230,150,0),Green=Color3.
fromRGB(130,188,91),Red=Color3.fromRGB(255,69,69),ImGui={Light=Color3.fromRGB(66
,150,250),Dark=Color3.fromRGB(41,74,122),Black=Color3.fromRGB(15,15,15),Gray=
Color3.fromRGB(36,36,36)}}local ab=aa.ThemeConfigs ab.DarkTheme={Values={
AnimationTweenInfo=TweenInfo.new(0.08),TextFont=Font.fromName'Inconsolata',
TextSize=13,Text=aa.Accent.White,TextDisabled=aa.Accent.Gray,ErrorText=aa.Accent
.Red,FrameBg=aa.Accent.Dark,FrameBgTransparency=0.4,FrameBgActive=aa.Accent.
Light,FrameBgTransparencyActive=0.4,SliderGrab=aa.Accent.Light,ButtonsBg=aa.
Accent.Light,CollapsingHeaderBg=aa.Accent.Light,CollapsingHeaderText=aa.Accent.
White,CheckMark=aa.Accent.Light,RadioButtonHoveredBg=aa.Accent.Light,ResizeGrab=
aa.Accent.Light,HeaderBg=aa.Accent.Gray,HeaderBgTransparency=0.6,HistogramBar=aa
.Accent.Yellow,ProgressBar=aa.Accent.Yellow,RegionBg=aa.Accent.Dark,
RegionBgTransparency=0.1,Separator=aa.Accent.Gray,SeparatorTransparency=0.5,
TabTextPaddingTop=UDim.new(0,3),TabTextPaddingBottom=UDim.new(0,8),TabText=aa.
Accent.Gray,TabBg=aa.Accent.Dark,TabTextActive=aa.Accent.White,TabBgActive=aa.
Accent.Light,TabsBarBg=Color3.fromRGB(36,36,36),TabsBarBgTransparency=1,
TabPadding=UDim.new(0,8),ModalWindowDimBg=Color3.fromRGB(230,230,230),
ModalWindowDimTweenInfo=TweenInfo.new(0.2),WindowBg=aa.Accent.Black,
WindowBgTransparency=0.05,Border=aa.Accent.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=aa.Accent.White,TitleAlign=Enum.
TextXAlignment.Left,TitleBarBg=aa.Accent.Black,TitleBarTransparency=0,
TitleActive=aa.Accent.White,TitleBarBgActive=aa.Accent.Dark,
TitleBarTransparencyActive=0.05,TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6}}ab.LightTheme={BaseTheme=ab.DarkTheme,Values=
{Text=aa.Accent.Black,TextFont=Font.fromName'Ubuntu',TextSize=14,FrameBg=aa.
Accent.Gray,FrameBgTransparency=0.4,FrameBgActive=aa.Accent.Gray,
FrameBgTransparencyActive=0,SliderGrab=aa.Accent.White,ButtonsBg=aa.Accent.Gray,
CollapsingHeaderBg=aa.Accent.Gray,CollapsingHeaderText=aa.Accent.Black,CheckMark
=aa.Accent.Black,RadioButtonHoveredBg=aa.Accent.Black,Separator=aa.Accent.Black,
TabText=aa.Accent.Black,TabBg=aa.Accent.White,TabTextActive=aa.Accent.Black,
TabBgActive=aa.Accent.Gray,WindowBg=aa.Accent.White,Border=aa.Accent.Gray,
ResizeGrab=aa.Accent.Gray,Title=aa.Accent.White,TitleAlign=Enum.TextXAlignment.
Center,TitleBarBg=aa.Accent.Black,TitleActive=aa.Accent.Black,TitleBarBgActive=
aa.Accent.Gray}}ab.Classic={BaseTheme=ab.DarkTheme,Values={AnimationTweenInfo=
TweenInfo.new(0),Text=Color3.fromRGB(255,255,255),FrameBg=aa.Accent.ImGui.Dark,
FrameBgTransparency=0.4,FrameBgActive=aa.Accent.ImGui.Light,
FrameBgTransparencyActive=0.5,ButtonsBg=aa.Accent.ImGui.Light,CollapsingHeaderBg
=aa.Accent.ImGui.Light,CollapsingHeaderText=aa.Accent.White,CheckMark=aa.Accent.
ImGui.Light,RadioButtonHoveredBg=aa.Accent.ImGui.Light,ResizeGrab=aa.Accent.
ImGui.Light,TabTextPaddingTop=UDim.new(0,0),TabText=aa.Accent.Gray,TabBg=aa.
Accent.ImGui.Gray,TabTextActive=aa.Accent.White,TabBgActive=aa.Accent.ImGui.Gray
,TabsBarBg=aa.Accent.ImGui.Gray,TabsBarBgTransparency=0,WindowBg=aa.Accent.ImGui
.Black,WindowBgTransparency=0.05,Border=aa.Accent.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=aa.Accent.White,TitleBarBg=aa.Accent.ImGui.
Black,TitleBarTransparency=0,TitleBarBgActive=aa.Accent.ImGui.Dark,
TitleBarTransparencyActive=0}}aa.ElementColors={ModalWindowDim={BackgroundColor3
='ModalWindowDimBg'},Selectable={BackgroundColor3='ButtonsBg',FontFace=
'TextFont',TextSize='TextSize'},Separator={BackgroundColor3='Separator',
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
'CheckMark'},RadioButton={BackgroundColor3='RadioButtonHoveredBg'}}aa.Styles={
RadioButton={Animation='RadioButtons',CornerRadius=UDim.new(1,0)},Button={
Animation='Buttons'},CollapsingHeader={Animation='Buttons'},TreeNode={Animation=
'TransparentButtons'},TransparentButton={Animation='TransparentButtons'}}aa.
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
Deselected={Transparency=0.7,Thickness=1}},Init='Selected'}}aa.ElementFlags={{
Properties={'Center'},Callback=function(ac,ad,ae)local af=ad.Position aa:
SetProperties(ad,{Position=UDim2.new(ae:find'X'and 0.5 or af.X.Scale,af.X.Offset
,ae:find'Y'and 0.5 or af.Y.Scale,af.Y.Offset),AnchorPoint=Vector2.new(ae:find'X'
and 0.5 or 0,ae:find'Y'and 0.5 or 0)})end},{Properties={'ElementStyle'},Callback
=function(ac,ad,ae)aa:ApplyStyle(ad,ae)end},{Properties={'ColorTag'},Callback=
function(ac,ad,ae)local af,ag=ac.Class,ac.WindowClass local ah=af.NoAutoTheme if
not ag then return end if ah then return end aa:UpdateColors{Object=ad,Tag=ae,
NoAnimation=true,Theme=ag.Theme}end},{Properties={'Animation'},Callback=function
(ac,ad,ae)local af=ac.Class.NoAnimation if af then return end aa:SetAnimation(ad
,ae)end},{Properties={'Icon','IconSize','IconRotation'},Callback=function(ac,ad,
ae)local af=ad:FindFirstChild('Icon',true)if not af then return aa:Warn(
'No icon for',ad)end local ag=ac.Class aa:CheckConfig(ag,{Icon='',IconSize=UDim2
.fromScale(1,1),IconRotation=0})local ah,ai,aj=ag.IconSize,ag.Icon,ag.
IconRotation ai=aa:CheckAssetUrl(ai)aa:SetProperties(af,{Visible=ae and true,
Image=ai,Size=ah,Rotation=aj})end},{Properties={'BorderThickness','Border',
'BorderColor'},Callback=function(ac,ad,ae)local af=ac.Class local ag=af.Border==
true aa:CheckConfig(af,{BorderThickness=ag and 1 or 0,BorderStrokeMode=Enum.
ApplyStrokeMode.Border})local ah=aa:GetChildOfClass(ad,'UIStroke')aa:
SetProperties(ah,{Thickness=af.BorderThickness,Color=af.BorderColor,
ApplyStrokeMode=af.BorderStrokeMode,Enabled=ag})end},{Properties={'Ratio'},
Callback=function(ac,ad,ae)local af=ac.Class aa:CheckConfig(af,{Ratio=
1.3333333333333333,RatioAxis=Enum.DominantAxis.Height,RatioAspectType=Enum.
AspectType.ScaleWithParentSize})local ag,ah,ai,aj=af.Ratio,af.RatioAxis,af.
RatioAspectType,aa:GetChildOfClass(ad,'UIAspectRatioConstraint')aa:
SetProperties(aj,{DominantAxis=ah,AspectType=ai,AspectRatio=ag})end},{Properties
={'FlexMode'},Callback=function(ac,ad,ae)local af=aa:GetChildOfClass(ad,
'UIFlexItem')af.FlexMode=ae end},{Properties={'CornerRadius'},Callback=function(
ac,ad,ae)local af=aa:GetChildOfClass(ad,'UICorner')af.CornerRadius=ae end},{
Properties={'Fill'},Callback=function(ac,ad,ae)if ae~=true then return end local
af=ac.Class aa:CheckConfig(af,{Size=UDim2.fromScale(1,1),UIFlexMode=Enum.
UIFlexMode.Fill,AutomaticSize=Enum.AutomaticSize.None})local ag=aa:
GetChildOfClass(ad,'UIFlexItem')ag.FlexMode=af.UIFlexMode ad.Size=af.Size ad.
AutomaticSize=af.AutomaticSize end},{Properties={'Label'},Callback=function(ac,
ad,ae)local af=ad:FindFirstChild'Label'if not af then return end local ag=ac.
Class function ag:SetLabel(ah)af.Text=ah return self end af.Text=tostring(ae)end
},{Properties={'NoGradient'},WindowProperties={'NoGradients'},Callback=function(
ac,ad,ae)local af=ad:FindFirstChildOfClass'UIGradient'if not af then return end
af.Enabled=ae end},{Properties={'UiPadding','PaddingBottom','PaddingTop',
'PaddingRight','PaddingTop'},Callback=function(ac,ad,ae)ae=ae or 0 if typeof(ae)
=='number'then ae=UDim.new(0,ae)end local af=ac.Class local ag=af.UiPadding if
ag then aa:CheckConfig(af,{PaddingBottom=ae,PaddingLeft=ae,PaddingRight=ae,
PaddingTop=ae})end local ah=aa:GetChildOfClass(ad,'UIPadding')aa:SetProperties(
ah,{PaddingBottom=af.PaddingBottom,PaddingLeft=af.PaddingLeft,PaddingRight=af.
PaddingRight,PaddingTop=af.PaddingTop})end},{Properties={'Callback'},Callback=
function(ac,ad)local ae=ac.Class function ae:SetCallback(af)self.Callback=af
return self end function ae:FireCallback(af)self.Callback(ad)return self end end
},{Properties={'Value'},Callback=function(ac,ad)local ae=ac.Class aa:
CheckConfig(ae,{GetValue=function(af)return ae.Value end})end}}local ac,ad,ae=
function()end,get_hidden_gui or gethui,cloneref or function(ac)return ac end
local af=setmetatable({},{__index=function(af,ag)local ah=game:GetService(ag)
return ae(ah)end})local ag,ah,ai,aj=af.Players,af.CoreGui,af.UserInputService,af
.TweenService local ak=ag.LocalPlayer aa.PlayerGui=ak.PlayerGui aa.Mouse=ak:
GetMouse()local al=aa.Animation function al:Tween(am)local an,ao,ap=self.
DefaultTweenInfo,am.Object,am.NoAnimation local aq,ar,as,at=am.Tweeninfo or an,
am.EndProperties,am.StartProperties,am.Completed if as then aa:SetProperties(ao,
as)end if ap then aa:SetProperties(ao,ar)if at then at()end return end local au
for aw,az in next,ar do local aC={[aw]=az}local aD,aE=pcall(function()return aj:
Create(ao,aq,aC)end)if not aD then aa:SetProperties(ao,aC)continue end if not au
then au=aE end aE:Play()end if at then if au then au.Completed:Connect(at)else
at()end end return au end function al:Animate(am)local an,ao,ap,aq,ar=am.
NoAnimation,am.Objects,am.Tweeninfo,(am.Completed)for as,at in next,ao do local
au=self:Tween{NoAnimation=an,Object=as,Tweeninfo=ap,EndProperties=at}if not ar
then ar=au end end if aq then ar.Completed:Connect(aq)end return ar end function
al:HeaderCollapseToggle(am)aa:CheckConfig(am,{Rotations={Open=90,Closed=0}})
local an,ao,ap,aq,ar=am.Toggle,am.NoAnimation,am.Rotations,am.Collapsed,am.
Tweeninfo local as=aq and ap.Closed or ap.Open self:Tween{Tweeninfo=ar,
NoAnimation=ao,Object=an,EndProperties={Rotation=as}}end function al:
HeaderCollapse(am)local an,ao,ap,aq,ar,as,at,au,aw,az,aC=am.Tweeninfo,am.
Collapsed,am.ClosedSize,am.OpenSize,am.Toggle,am.Resize,am.Hide,am.NoAnimation,
am.NoAutomaticSize,am.IconRotations,am.Completed if not aw then as.AutomaticSize
=Enum.AutomaticSize.None end if not ao then at.Visible=true end self:
HeaderCollapseToggle{Tweeninfo=an,Collapsed=ao,NoAnimation=au,Toggle=ar,
Rotations=az}local aD=self:Tween{Tweeninfo=an,NoAnimation=au,Object=as,
StartProperties={Size=ao and aq or ap},EndProperties={Size=ao and ap or aq},
Completed=function()at.Visible=not ao if aC then aC()end if ao then return end
if aw then return end as.Size=UDim2.fromScale(1,0)as.AutomaticSize=Enum.
AutomaticSize.Y end}return aD end function GetAndRemove(am,an)local ao=an[am]if
ao then an[am]=nil end return ao end function Merge(am,an)for ao,ap in next,an
do am[ao]=ap end end function Copy(am,an)local ao=table.clone(am)if an then
Merge(ao,an)end return ao end function NewClass(am)am.__index=am return
setmetatable({},am)end function aa:Warn(...)warn('[ReGui]::',...)end function aa
:IsDoubleClick(am)local an=self.DoubleClickThreshold if am<an then return true
end end function aa:Init(am)am=am or{}if self.Initialised then return end Merge(
self,am)Merge(self,{Initialised=true,HasGamepad=self:IsConsoleDevice(),
HasTouchScreen=self:IsMobileDevice()})self:CheckConfig(self,{ContainerParent=
function()return self:ResolveContainerParent()end,Prefabs=function()return self:
LoadPrefabs()end},true)self:CheckConfig(self,{Container=function()return self:
InsertPrefab('Container',{Parent=self.ContainerParent,Name=self.ContainerName})
end},true)local an=0 ai.InputBegan:Connect(function(ao)if not self:IsMouseEvent(
ao)then return end local ap=tick()local aq=ap-an self:UpdateWindowFocuses()if
self:IsDoubleClick(aq)then self:FireMouseEvents'DoubleClick'an=0 else an=ap end
end)end function aa:GetVersion()return self.Version end function aa:
IsMobileDevice()return ai.TouchEnabled end function aa:IsConsoleDevice()return
ai.GamepadEnabled end function aa:GetScreenSize()return workspace.CurrentCamera.
ViewportSize end function aa:LoadPrefabs()local am,an=self.PlayerGui,
'ReGui-Prefabs'local ao=script:WaitForChild(an,2)if ao then return ao end local
ap=am:WaitForChild(an,2)if ap then return ap end return nil end function aa:
ResolveContainerParent()local am,an=self.PlayerGui,self.Debug local ao,ap={[1]=
function()return ad()end,[2]=function()return ah:FindFirstChild'RobloxGui'end,[3
]=function()return ah end,[4]=function()return am end},self:CreateInstance
'ScreenGui'for aq,ar in next,ao do local as,at=pcall(ar)if not as then continue
end local au=pcall(function()ap.Parent=at end)if not au then continue end if an
then self:Warn(`Step: {aq} was chosen as the parent!: {at}`)end return at end
self:Warn'The ReGui container does not have a parent defined'return nil end
function aa:CheckConfig(am,an,ao)if not am then return end for ap,aq in next,an
do if am[ap]~=nil then continue end if ao then aq=aq()end am[ap]=aq end return
am end function aa:CheckAssetUrl(am)if tonumber(am)then return`rbxassetid://{am}`
end return am end function aa:CreateInstance(am,an,ao)local ap=Instance.new(am,
an)if ao then aa:SetProperties(ap,ao)end return ap end function aa:
ConnectMouseEvent(am,an)local ao,ap,aq,ar,as=an.Callback,an.DoubleClick,an.
OnlyMouseHovering,0 if aq then as=self:DetectHover(aq)end am.Activated:Connect(
function(...)local at=tick()local au=at-ar if as and not as.Hovering then return
end if ap then if not aa:IsDoubleClick(au)then ar=at return end ar=0 end ao(...)
end)end function aa:ConnectScreenMouseEvent(am,an)local ao,ap=self.MouseEvents,
an.DoubleClick local aq=ap and ao.DoubleClick or ao.Click an.HoverSignal=self:
DetectHover(am)table.insert(aq,an)end function aa:FireMouseEvents(am)local an=
self.MouseEvents local ao=an[am]for ap,aq in ao do local ar,as,at=aq.Object,aq.
Callback,aq.HoverSignal if not at.Hovering then continue end as()end end
function aa:GetAnimation(am)return am and self.Animation or TweenInfo.new(0)end
function aa:GetDictSize(am)local an=0 for ao,ap in am do an+=1 end return an end
function aa:RemoveAnimationSignals(am)local an=self.AnimationConnections local
ao=an[am]if not ao then return end for ap,aq in next,ao do aq:Disconnect()end
end function aa:AddAnimationSignal(am,an)local ao=self.AnimationConnections
local ap=ao[am]if not ap then ap={}ao[am]=ap end table.insert(ap,an)end function
aa:SetAnimationsEnabled(am)self.NoAnimations=not am end function aa:SetAnimation
(am,an,ao)ao=ao or am local ap,aq=self.Animations,an if typeof(an)~='table'then
aq=ap[an]end assert(aq,`No animation data for Class {an}!`)self:
RemoveAnimationSignals(ao)local ar,as,at,au,aw,az,aC,aD,aE=aq.Init,aq.
Connections,aq.Tweeninfo,aq.NoAnimation,true,{},{}function aC:Reset(aF)if aD
then aD(aF)end end function aC:FireSignal(aF)aw=aF end function aC:Refresh(aF)if
not aE then return end az[aE](aF)end function aC:SetEnabled(aF)aw=aF end for aF,
aG in next,as do local aH,aI=function(aH)aE=aF local aI=self.NoAnimations if aI
then return end if not aw then return end aH=aH==true al:Tween{NoAnimation=aH or
au,Object=am,Tweeninfo=at,EndProperties=aG}end,ao[aF]local aJ=aI:Connect(aH)self
:AddAnimationSignal(ao,aJ)az[aF]=aH if aF==ar then aD=aH end end aC:Reset(true)
return aC end function aa:GetChildOfClass(am,an)local ao=am:
FindFirstChildOfClass(an)if not ao then ao=self:CreateInstance(an,am)end return
ao end function aa:ConnectDrag(am,an)self:CheckConfig(an,{DragStart=ac,DragEnd=
ac,DragMovement=ac,OnDragStateChange=ac})local ao,ap,aq,ar,as,at=an.DragStart,an
.DragEnd,an.DragMovement,an.OnDragStateChange,{StartAndEnd={Enum.UserInputType.
MouseButton1,Enum.UserInputType.Touch},Movement={Enum.UserInputType.
MouseMovement,Enum.UserInputType.Touch}},false local au,aw,az=function(au,aw)
local az=au.UserInputType return table.find(as[aw],az)end,function(au)local aw=
au.Position return Vector2.new(aw.X,aw.Y)end,function(au)self._DraggingDisabled=
au at=au ar(au)end local aC=function(aC)local aD,aE,aF,aG,aH,aI=aC.
CheckDraggingDisabled,aC.DraggingRequired,aC.UpdateState,aC.IsDragging,aC.
InputType,aC.Callback return function(aJ)if at~=aE then return end if aD and
self._DraggingDisabled then return end if not au(aJ,aH)then return end if aF
then az(aG)end local aK=aw(aJ)aI(aK)end end am.InputBegan:Connect(aC{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=ao})ai.InputEnded:Connect(aC{
DraggingRequired=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',
Callback=ap})ai.InputChanged:Connect(aC{DraggingRequired=true,InputType=
'Movement',Callback=aq})end function aa:MakeDraggable(am)self:CheckConfig(am,{
Enabled=true})local an,ao,ap,aq,ar,as,at=am.Move,am.Grab,am.Enabled,am.
OnDragStateChange,{}function ar:SetEnabled(au)local aw=am.StateChanged self.
Enabled=au if aw then aw(self)end end function ar:CanDrag(au)if not self.Enabled
then return end return true end local au,aw,az,aC=function(au)if not ar:CanDrag(
)then return end local aw=am.DragBegin at=au aw(at)end,function(au)if not ar:
CanDrag()then return end local aw,az=au-at,am.OnUpdate az(aw)end,function(au)as=
an.Position end,function(au)local aw=UDim2.new(as.X.Scale,as.X.Offset+au.X,as.Y.
Scale,as.Y.Offset+au.Y)al:Tween{Object=an,EndProperties={Position=aw}}end self:
CheckConfig(am,{OnUpdate=aC,DragBegin=az})self:ConnectDrag(ao,{DragStart=au,
DragMovement=aw,OnDragStateChange=aq})ar:SetEnabled(ap)return ar end function aa
:MakeResizable(am)aa:CheckConfig(am,{MinimumSize=Vector2.new(160,90),MaximumSize
=Vector2.new(math.huge,math.huge)})local an,ao,ap,aq,ar=am.MaximumSize,am.
MinimumSize,am.Resize,(am.OnUpdate)local as=aa:InsertPrefab('ResizeGrab',{Parent
=ap})local at,au,aw=function(at)as.Visible=at.Enabled end,function(at)local au=
ar+at local aw=UDim2.fromOffset(math.clamp(au.X,ao.X,an.X),math.clamp(au.Y,ao.Y,
an.Y))if aq then aq(aw)return end al:Tween{Object=ap,EndProperties={Size=aw}}end
,function(at)ar=ap.AbsoluteSize end local az=self:MakeDraggable{Grab=as,OnUpdate
=au,DragBegin=aw,StateChanged=at}az.Grab=as return az end function aa:
IsMouseEvent(am)local an=am.UserInputType.Name return an:find'Touch'or an:find
'Mouse'end function aa:DetectHover(am,an)an=an or{}local ao,ap,aq,ar,as=an.
OnInput,an.Anykey,an.MouseMove,an.MouseEnter,an.MouseOnly an.Hovering=false
local at=function(at,au,aw)if at and as then if not aa:IsMouseEvent(at)then
return end end if au~=nil then an.Hovering=au end if not ar and aw then return
end if ao then local az=an.Hovering return ao(az,at)end end local au={am.
MouseEnter:Connect(function()at(nil,true,true)end),am.MouseLeave:Connect(
function()at(nil,false,true)end)}if ap or as then table.insert(au,ai.InputBegan:
Connect(function(aw)at(aw)end))end if aq then local aw=am.MouseMoved:Connect(at)
table.insert(au,aw)end function an:Disconnect()for aw,az in next,au do az:
Disconnect()end end return an end function aa:StackWindows()local am,an=self.
Windows,20 for ao,ap in next,am do local aq,ar=ap.WindowFrame,UDim2.fromOffset(
an*ao,an*ao)ap:Center()aq.Position+=ar end end function aa:UpdateColors(am)local
an,ao,ap,aq,ar,as,at,au,aw=self.ElementColors,self.ThemeConfigs,self.Debug,self.
_FlagCache,am.Object,am.Tag,am.NoAnimation,am.TagsList,am.Theme local az,aC=an[
as],aq[ar]if typeof(as)=='table'then az=as elseif au then au[ar]=as end if not
az then return end local aD={}for aE,aF in next,az do local aG=self:GetThemeKey(
aw,aF)if aC and aC[aE]then continue end if not aG then if ap then self:Warn(`Color: '{
aF}' does not exist!`)end continue end aD[aE]=aG end al:Tween{Object=ar,
NoAnimation=at,EndProperties=aD}end function aa:MultiUpdateColors(am)local an=am
.Objects for ao,ap in next,an do self:UpdateColors{TagsList=am.TagsList,Theme=am
.Theme,NoAnimation=not am.Animate,Object=ao,Tag=ap}end end function aa:
ApplyStyle(am,an)local ao=self.Styles local ap=ao[an]if not ap then return end
self:ApplyFlags{Object=am,Class=ap}end function aa:MergeMetatables(am,an)local
ao,ap=self.Debug,{}ap.__index=function(aq,ar)local as=am[ar]if as~=nil then
return as end local at,au=pcall(function()return an[ar]end)if at then if typeof(
au)=='function'then return function(aw,...)return au(an,...)end end return au
end return nil end ap.__newindex=function(aq,ar,at)local au=am[ar]~=nil or
typeof(at)=='function'if au then am[ar]=at return end xpcall(function()an[ar]=at
end,function(aw)if ao then self:Warn(`Newindex Error: {an}.{ar} = {at}\n{aw}`)
end am[ar]=at end)end return setmetatable({},ap)end function aa:Concat(am,an)
local ao=''for ap,aq in next,am do ao..=tostring(aq)..(ap~=#am and an or'')end
return ao end function aa:GetValueFromAliases(am,an)for ao,ap in am do local aq=
an[ap]if aq~=nil then return aq end end return nil end function aa:RecursiveCall
(am,an)for ao,ap in next,am:GetDescendants()do an(ap)end end function aa:
ApplyFlags(am)local an,ao,ap,aq=self.ElementFlags,am.Object,am.Class,am.
WindowClass self:SetProperties(ao,ap)for ar,at in next,an do local au,aw,az,aC=
at.Properties,at.Callback,at.Recursive,at.WindowProperties local aD=self:
GetValueFromAliases(au,ap)if aq and aC and aD==nil then aD=self:
GetValueFromAliases(aC,aq)end if aD==nil then continue end aw(am,ao,aD)if az
then self:RecursiveCall(ao,function(aE)aw(am,aE,aD)end)end end end function aa:
SetProperties(am,an)for ao,ap in next,an do pcall(function()am[ao]=ap end)end
end function aa:InsertPrefab(am,an)local ao=self.Prefabs local ap=ao.Prefabs
local aq=ap:WaitForChild(am)local ar=aq:Clone()if an then local at=an.
UsePropertiesList if not at then self:SetProperties(ar,an)else self:ApplyFlags{
Object=ar,Class=an}end end return ar end function aa:GetContentSize(am,an)local
ao,ap,aq,ar=am:FindFirstChildOfClass'UIListLayout',am:FindFirstChildOfClass
'UIPadding',(am:FindFirstChildOfClass'UIStroke')if ao and not an then ar=ao.
AbsoluteContentSize else ar=am.AbsoluteSize end if ap then local at,au,aw,az=ap.
PaddingTop.Offset,ap.PaddingBottom.Offset,ap.PaddingLeft.Offset,ap.PaddingRight.
Offset ar+=Vector2.new(aw+az,at+au)end if aq then local at=aq.Thickness ar+=
Vector2.new(at/2,at/2)end return ar end function aa:MakeCanvas(am)local an,ao,ap
,aq,ar=self.Elements,self.Debug,am.Element,am.WindowClass,am.Class if not aq and
ao then self:Warn(`No WindowClass for {ap}`)print(am)end local at=NewClass(an)at
.ParentCanvas=ap at.WindowClass=aq or false local au={__index=function(au,aw)
local az=at[aw]if az~=nil then return az end local aC=ar[aw]if aC~=nil then
return aC end return ap[aw]end,__newindex=function(au,aw,az)local aC=ar[aw]~=nil
if aC then ar[aw]=az else ap[aw]=az end end}return setmetatable({},au)end
function aa:WrapGeneration(am,an)local ao,ap=an.Base,self._FlagCache return
function(aq,ar,...)ar=ar or{}self:CheckConfig(ar,ao)local at=ar.CloneTable if at
then ar=table.clone(ar)end local au,aw=aq.WindowClass,aq.ParentCanvas self:
CheckConfig(ar,{Parent=aw,Name=ar.ColorTag})if aq==self then aq=self.Elements
end local az,aC=am(aq,ar,...)local aD,aE,aF=ar.NoAutoTag,ar.NoAutoFlags,ar.
ColorTag if Success==false then if aq.Error then aq:Error{Parent=aw,Text=az}end
self:Warn('Class:',az)error(debug.traceback())end if aC==nil then aC=az end if
aC then ap[aC]=ar end if aC then if not aD and au then au:TagElements{[aC]=aF}
end if not aE then self:ApplyFlags{Object=aC,Class=ar,WindowClass=au}end end
return az,aC end end function aa:DefineElement(am,an)local ao,ap,aq=self.
Elements,self.ThemeConfigs,self.ElementColors local ar,at,au,aw,az,aC=ap.
DarkTheme,an.Base,an.Create,an.Export,an.ThemeTags,an.ColorData self:
CheckConfig(at,{ColorTag=am,ElementStyle=am,Visible=true})if az then Merge(ar,az
)end if aC then Merge(aq,aC)end local aD=self:WrapGeneration(au,{Base=at})if aw
then self[am]=aD end ao[am]=aD return aD end function aa:DefineGlobalFlag(am)
local an=self.ElementFlags table.insert(an,am)end function aa:DefineTheme(am,an)
local ao=self.ThemeConfigs self:CheckConfig(an,{BaseTheme=ao.DarkTheme})local ap
=GetAndRemove('BaseTheme',an)local aq={BaseTheme=ap,Values=an}ao[am]=aq return
aq end function aa:GetMouseLocation()local am=self.Mouse return am.X,am.Y end
function aa:SetWindowFocusesEnabled(am)self.WindowFocusesEnabled=am end function
aa:UpdateWindowFocuses()local am,an=self.Windows,self.WindowFocusesEnabled if
not an then return end for ao,ap in am do local aq=ap.HoverConnection if not aq
then continue end local ar=aq.Hovering if ar then self:SetFocusedWindow(ap)
return end end self:SetFocusedWindow(nil)end function aa:WindowCanFocus(am)if am
.NoSelect then return false end if am.Collapsed then return false end return
true end function aa:SetFocusedWindow(am)local an,ao=self.ActiveWindow,self.
Windows if an==am then return end self.ActiveWindow=am if am then local ap=self:
WindowCanFocus(am)if not ap then return end end for ap,aq in ao do local ar=self
:WindowCanFocus(aq)if not ar then continue end local at=aq==am aq:SetFocused(at)
end end function aa:SetTooltip(am)local an=self.Tooltip if not an then return
end if an==am then return end an.Visible=false self.Tooltip=am end function aa:
SetItemTooltip(am,an)local ao,ap=self.Elements,self.Container local aq=ao:
Tooltip{Visible=false,Parent=ap.Overlays}task.spawn(an,aq)aa:DetectHover(am,{
MouseMove=true,MouseEnter=true,OnInput=function(ar,at)aq:Update(ar)end})end
function aa:CheckFlags(am,an)for ao,ap in next,am do local aq=an[ao]if not aq
then continue end ap(aq)end end function aa:GetThemeKey(am,an)local ao=self.
ThemeConfigs local ap=ao.DarkTheme am=am or ap if typeof(am)=='string'then am=ao
[am]end local aq,ar=am.BaseTheme,am.Values local at=ar[an]if at then return at
end if aq then return self:GetThemeKey(aq,an)end end local am=aa.Elements am.
__index=am function am:GetParent()return self.ParentCanvas end function am:
TagElements(an)local ao=self.WindowClass if ao then ao:TagElements(an)end end
function am:GetThemeKey(an)local ao=self.WindowClass if ao then return ao:
GetThemeKey(an)end return aa:GetThemeKey(nil,an)end function am:SetColorTags(an,
ao)local aq=self.WindowClass if not aq then return end local ar,at=aq.TagsList,
aq.Theme aa:MultiUpdateColors{Animate=ao,Theme=at,TagsList=ar,Objects=an}end
function am:SetElementFocused(an,ao)local aq,ar,at,au=self.WindowClass,aa.
HasTouchScreen,ao.Focused,ao.Animation aa:SetAnimationsEnabled(not at)if not at
and au then au:Refresh()end if not aq then return end if not ar then return end
local aw=aq.ContentCanvas aw.Interactable=not at end aa:DefineElement('Dropdown'
,{Base={Disabled=false,MaxSizeY=220,MinSizeX=100,OnClosed=ac,OnSelected=ac},
Create=function(an,ao)ao.Parent=aa.Container.Overlays local aq,ar,at,au,aw,az,aC
=ao.Selected,ao.ParentObject,ao.Items,ao.MaxSizeY,ao.MinSizeX,ao.OnClosed,ao.
OnSelected if not ar then return end local aD,aE=an:OverlayScroll(ao)local aF=aE
.UIStroke local aG,aH,aI,aJ=aF.Thickness,ar.AbsolutePosition,aa:GetContentSize(
ar,true),aa:DetectHover(aE,{MouseOnly=true,OnInput=function(aG,aH)if aG then
return end ao:Close()end})function ao:Close()if self.Disabled then return end
self.Disabled=true aJ:Disconnect()aE:Remove()az()end local aK,aL=function(aK)ao:
Close()aC(aK)end,aE.Parent.AbsolutePosition aE.Position=UDim2.fromOffset(aH.X-aL
.X+aG,aH.Y-aL.Y+aI.Y)for aM,aN in at do local aO,aP=typeof(aM)~='number'and aM
or aN,aM==aq or aN==aq aD:Selectable{Text=tostring(aO),Selected=aP,ZIndex=6,
Callback=function()return aK(aO)end}end local aM=aD:GetCanvasSize()local aN,aO=
math.clamp(aM.Y,aI.Y,au),math.clamp(aI.X-aG,aw,math.huge)aE.Size=UDim2.
fromOffset(aO,aN)return ao,aE end})aa:DefineElement('Tooltip',{Base={Offset=15},
Create=function(an,ao)local aq,ar=ao.Offset,an:Overlay(ao)local at=aa:
MergeMetatables(ao,ar)function ao:Update(au)ar.Visible=au if not au then return
end aa:SetTooltip(ar)local aw,az=aa:GetMouseLocation()local aC=ar.Parent.
AbsolutePosition ar.Position=UDim2.fromOffset(aw-aC.X+aq,az-aC.Y+aq)end return
at,ar end})aa:DefineElement('OverlayScroll',{Base={},Create=function(an,ao)local
aq,ar=an.WindowClass,aa:InsertPrefab('OverlayScroll',ao)local at=ar.ContentFrame
local au=aa:MakeCanvas{Element=at,WindowClass=aq,Class=an}function ao:
GetCanvasSize()return at.AbsoluteCanvasSize end local aw=aa:MergeMetatables(ao,
au)return aw,ar end})aa:DefineElement('Overlay',{Base={},Create=function(an,ao)
local aq,ar=an.WindowClass,aa:InsertPrefab('Overlay',ao)local at=aa:MakeCanvas{
Element=ar,WindowClass=aq,Class=an}return at,ar end})aa:DefineElement('Image',{
Base={Image='',Callback=ac},Create=function(an,ao)local aq=ao.Image ao.Image=aa:
CheckAssetUrl(aq)local ar=aa:InsertPrefab('Image',ao)ar.Activated:Connect(
function(...)local at=ao.Callback return at(ar,...)end)return ar end})aa:
DefineElement('VideoPlayer',{Base={Video='',Callback=ac},Create=function(an,ao)
local aq=ao.Video ao.Video=aa:CheckAssetUrl(aq)local ar=aa:InsertPrefab(
'VideoPlayer',ao)return ar end})aa:DefineElement('Button',{Base={Text='Button',
DoubleClick=false,Callback=ac},Create=function(an,ao)local aq,ar=aa:
InsertPrefab('Button',ao),ao.DoubleClick aa:ConnectMouseEvent(aq,{DoubleClick=ar
,Callback=function(...)local at=ao.Callback return at(aq,...)end})return aq end}
)aa:DefineElement('Selectable',{Base={Text='Selectable',Callback=ac,Selected=
false,Disabled=false,Size=UDim2.fromScale(1,0),AnimationTags={Selected='Buttons'
,Unselected='TransparentButtons'}},Create=function(an,ao)local aq,ar,at=ao.
Selected,ao.Disabled,aa:InsertPrefab('Button',ao)local au=aa:MergeMetatables(ao,
at)at.Activated:Connect(function(...)local aw=ao.Callback return aw(at,...)end)
function ao:SetSelected(aw)local az=self.AnimationTags local aC=aw and az.
Selected or az.Unselected self.Selected=aw aa:SetAnimation(at,aC)end function ao
:SetDisabled(aw)self.Disabled=aw at.Interactable=not aw end ao:SetSelected(aq)ao
:SetDisabled(ar)return au,at end})aa:DefineElement('ImageButton',{Base={
ElementStyle='Button',Callback=ac},Create=am.Image})aa:DefineElement(
'SmallButton',{Base={Text='Button',PaddingTop=UDim.new(),PaddingBottom=UDim.new(
),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),ColorTag='Button',
ElementStyle='Button',Callback=ac},Create=am.Button})aa:DefineElement('Keybind',
{Base={Label='Keybind',ColorTag='Frame',Value=nil,DeleteKey=Enum.KeyCode.
Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=false,Callback=ac,
OnKeybindSet=ac,OnBlacklistedKeybindSet=ac,KeyBlacklist={},UiPadding=UDim.new(),
AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.4,0,0,19)},Create=
function(an,ao)local aq,ar,at,au,aw=ao.Value,ao.Label,ao.Disabled,ao.
KeyBlacklist,aa:InsertPrefab('Button',ao)local az,aC=aa:MergeMetatables(ao,aw),
Instance.new'Folder'local aD=an:Label{Parent=aC,Text=ar,Position=UDim2.new(1,5,
0.5),AnchorPoint=Vector2.new(0,0.5)}aC.Parent=aw local aE,aF=function(aE,...)
return aE(aw,...)end,function(aE)local aF=table.find(au,aE)return aF end
function ao:SetDisabled(aG)self.Disabled=aG aw.Interactable=not aG an:
SetColorTags({[aD]=aG and'LabelDisabled'or'Label'},true)end function ao:SetValue
(aG)local aH,aI=self.OnKeybindSet,self.DeleteKey if aG==aI then aG=nil end self.
Value=aG aw.Text=aG and aG.Name or'Not set'aE(aH,aG)end function ao:
WaitForNewKey()self._WaitingForNewKey=true aw.Text='...'aw.Interactable=false
end local aG=function(aG)local aH,aI=ao.OnBlacklistedKeybindSet,ao.Value if not
ai.WindowFocused then return end if aF(aG)then aE(aH,aG)return end aw.
Interactable=true ao._WaitingForNewKey=false if aG.Name=='Unknown'then return ao
:SetValue(aI)end ao:SetValue(aG)end local aH=function(aH,aI)local aJ,aK,aL,aM,aN
,aO=ao.IgnoreGameProcessed,ao.DeleteKey,ao.Enabled,ao.Value,ao.Callback,aH.
KeyCode if ao._WaitingForNewKey then aG(aO)return end if not aL and aw.
Interactable then return end if not aJ and aI then return end if aO==aK then
return end if aO~=aM then return end aE(aN,aO)end ao:SetValue(aq)ao:SetDisabled(
at)ao.Connection=ai.InputBegan:Connect(aH)aw.Activated:Connect(function()ao:
WaitForNewKey()end)aa:SetAnimation(aw,'Inputs')return az,aw end})aa:
DefineElement('ArrowButton',{Base={Icon=aa.Icons.Arrow,Direction='Left',Size=
UDim2.fromOffset(21,21),ColorTag='Button',Rotations={Left=180,Right=0}},Create=
function(an,ao)local aq,ar=ao.Direction,ao.Rotations local at=ar[aq]ao.
IconRotation=at local au=aa:InsertPrefab('ArrowButton',ao)au.Activated:Connect(
function(...)local aw=ao.Callback return aw(au,...)end)return au end})aa:
DefineElement('Label',{Base={Font='Inconsolata'},Create=function(an,ao)local aq,
ar,at,au,aw,az,aC,aD=ao.Bold,ao.Italic,ao.Font,ao.FontFace,Enum.FontWeight.
Medium,Enum.FontWeight.Bold,Enum.FontStyle.Normal,Enum.FontStyle.Italic local aE
,aF,aG=aq and az or aw,ar and aD or aC,aq or ar if not au and aG then ao.
FontFace=Font.fromName(at,aE,aF)end return aa:InsertPrefab('Label',ao)end})aa:
DefineElement('Error',{Base={RichText=true,TextWrapped=true},ColorData={Error={
TextColor3='ErrorText',FontFace='TextFont'}},Create=function(an,ao)local aq=ao.
Text ao.Text=`<b>\u{26d4} Error:</b> {aq}`return an:Label(ao)end})local an={
ColorTags={BGSelected={[true]='SelectedTab',[false]='DeselectedTab'},
LabelSelected={[true]='SelectedTabLabel',[false]='DeselectedTabLabel'}}}function
an:UpdateButton(ao,aq)local ar,at=ao.IsSelected,ao.Tab local au=at.Button if ar
==aq then return end ao.IsSelected=aq local aw,az,aC=self.NoAnimation,self.
WindowClass,self.ColorTags local aD,aE,aF,aG=az.Theme,az.TagsList,aC.BGSelected,
aC.LabelSelected aa:MultiUpdateColors{Animate=not aw,Theme=aD,TagsList=aE,
Objects={[au]=aF[aq],[au.Label]=aG[aq]}}end function an:SetActiveTab(ao)local aq
,ar,at,au,aw=self.Tabs,self.NoAnimation,typeof(ao)=='string',false for az,aC in
next,aq do local aD,aE,aF,aG=aC.Content,aC.Canvas,aC.Name,false if at then aG=aF
==ao else aG=aE==ao end if aG then au=aD.Visible aw=aD end aD.Visible=aG self:
UpdateButton(aC,aG)end if ar then return self end if au then return self end if
not aw then return self end al:Tween{Object=aw,NoAnimation=ar,StartProperties={
Position=UDim2.fromOffset(0,5)},EndProperties={Position=UDim2.fromOffset(0,0)}}
return self end function an:RemoveTab(ao)local aq,ar=self.Tabs,typeof(ao)==
'string'for at,au in aq do local aw,az,aC,aD,aE=au.Canvas,au.Name,au.Content,au.
Tab,false if ar then aE=az==ao else aE=aw==ao end if not aE then continue end
table.remove(aq,at)aC:Destroy()aD:Destroy()end return self end function an:
CreateTab(ao)aa:CheckConfig(ao,{Name='Tab',AutoSize='Y',Closeable=false})local
aq,ar,at,au,aw,az,aC,aD,aE,aF=self.AutoSelectNewTabs,self.ParentCanvas,self.
WindowClass,self.Templates,self.TabsBar,self.Body,self.Tabs,ao.Name,ao.Icon,ao.
AutoSize local aG,aH,aI=#aC<=0 and aq,au.Page,au.TabButton local aJ=aI:Clone()
local aK=aJ.Button local aL,aM=aK.Label,aa:GetChildOfClass(aK,'UIPadding')aL.
Text=tostring(aD)aJ.Parent=aw aJ.Visible=true local aN=aH:Clone()local aO=aa:
GetChildOfClass(aN,'UIPadding')aa:SetProperties(aN,{Parent=az,Name=aD,Visible=aG
})local aP=aa:MakeCanvas{Element=aN,WindowClass=at,Class=self}local aQ,aR,aS=
function()self:SetActiveTab(aP)end,{Name=aD,Tab=aJ,Canvas=aP,Content=aN},{
Closeable=function()local aQ=ar:RadioButton{Parent=aK,Visible=not self.NoClose,
Icon=aa.Icons.Close,IconSize=UDim2.fromOffset(11,11),LayoutOrder=3,ZIndex=2,
UsePropertiesList=true,Callback=function()self:RemoveTab(aP)end}local aR=aQ.Icon
aa:SetAnimation(aR,{Connections={MouseEnter={ImageTransparency=0},MouseLeave={
ImageTransparency=1}},Init='MouseLeave'},aJ)end}aK.Activated:Connect(aQ)aa:
CheckFlags(aS,ao)table.insert(aC,aR)at:TagElements{[aK]='Tab',[aL]='TabLabel',[
aM]='TabSelectorTabPadding',[aO]='TabSelectorPagePadding'}aa:SetProperties(aN,{
AutomaticSize=Enum.AutomaticSize[aF],Size=UDim2.fromScale(aF=='Y'and 1 or 0,aF==
'X'and 1 or 0)})aa:SetAnimation(aK,'Buttons')aa:ApplyFlags{Object=aK,Class={Icon
=aE}}self:UpdateButton(aR,aG)return aP end aa:DefineElement('TabSelector',{Base=
{NoTabsBar=false,AutoSelectNewTabs=true},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabSelectorLine={Color=
'TabBgActive'},TabSelectorTabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabSelectorPagePadding={PaddingBottom=
'TabPadding',PaddingLeft='TabPadding',PaddingRight='TabPadding',PaddingTop=
'TabPadding'}},Create=function(ao,aq)local ar,at,au,aw=ao.WindowClass,aq.
NoTabsBar,aa:InsertPrefab('TabSelector',aq),NewClass(an)local az,aC=au.TabsBar,
au.Body local aD,aE,aF=az.TemplateButton,aC.PageTemplate,az:
FindFirstChildOfClass'UIStroke'aD.Visible=false aE.Visible=false az.Visible=not
at Merge(aw,aq)Merge(aw,{Templates={TabButton=aD,Page=aE},ParentCanvas=ao,
WindowClass=ar,Body=aC,TabsBar=az,Tabs={}})ao:TagElements{[az]=
'TabSelectorTabsBar',[aF]='TabSelectorLine'}return aw,au end})aa:DefineElement(
'RadioButton',{Base={Callback=ac},Create=function(ao,aq)local ar=aa:
InsertPrefab('RadioButton',aq)ar.Activated:Connect(function(...)local at=aq.
Callback return at(ar,...)end)return ar end})aa:DefineElement('Checkbox',{Base={
Label='Checkbox',IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.
fromScale(1,1),UntickedImageSize=UDim2.fromScale(0,0),Callback=ac,Disabled=false
},Create=function(ao,aq)local ar,at,au,aw,az,aC,aD=aq.IsRadio,aq.Value,aq.Label,
aq.TickedImageSize,aq.UntickedImageSize,aq.Disabled,aa:InsertPrefab('CheckBox',
aq)local aE,aF=aa:MergeMetatables(aq,aD),aD.Tickbox local aG=aF.Tick aG.Image=aa
.Icons.Checkmark local aH,aI,aJ,aK=aF:FindFirstChildOfClass'UIPadding',aa:
GetChildOfClass(aF,'UICorner'),ao:Label{Text=au,Parent=aD,LayoutOrder=2},UDim.
new(0,3)if ar then aG.ImageTransparency=1 aG.BackgroundTransparency=0 aI.
CornerRadius=UDim.new(1,0)else aK=UDim.new(0,2)end aa:SetProperties(aH,{
PaddingBottom=aK,PaddingLeft=aK,PaddingRight=aK,PaddingTop=aK})local aL,aM=
function(...)local aL=aq.Callback return aL(aE,...)end,function(aL,aM)local aN,
aO=ao:GetThemeKey'AnimationTweenInfo',aL and aw or az al:Tween{Object=aG,
Tweeninfo=aN,NoAnimation=aM,EndProperties={Size=aO}}end function aq:SetDisabled(
aN)self.Disabled=aN aD.Interactable=not aN ao:SetColorTags({[aJ]=aN and
'LabelDisabled'or'Label'},true)end function aq:SetTicked(aN,aO)self.Value=aN aM(
aN,aO)aL(aN)return self end function aq:Toggle()local aN=not self.Value self.
Value=aN self:SetTicked(aN)return self end local aN=function()aq:Toggle()end aD.
Activated:Connect(aN)aF.Activated:Connect(aN)aq:SetTicked(at,true)aq:
SetDisabled(aC)aa:SetAnimation(aF,'Buttons',aD)ao:TagElements{[aG]='CheckMark',[
aF]='Checkbox'}return aE,aD end})aa:DefineElement('Radiobox',{Base={IsRadio=true
,CornerRadius=UDim.new(1,0)},Create=function(ao,aq)return ao:Checkbox(aq)end})aa
:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label='Histogram'},Create
=function(ao,aq)local ar,at,au=aq.Label,aq.Points,aa:InsertPrefab('Histogram',aq
)local aw,az=aa:MergeMetatables(aq,au),au.Canvas local aC=az.PointTemplate aC.
Visible=false local aD=(ao:Label{Text=ar,Parent=au,Position=UDim2.new(1,5)})aa:
SetItemTooltip(au,function(aE)ValueLabel=aE:Label()end)Merge(aq,{_Plots={},
_Cache={}})function aq:GetBaseValues()local aE,aF=self.Minimum,self.Maximum if
aE and aF then return aE,aF end local aG=self._Plots for aH,aI in aG do local aJ
=aI.Value if not aE or aJ<aE then aE=aJ end if not aF or aJ>aF then aF=aJ end
end return aE,aF end function aq:UpdateGraph()local aE,aF,aG=self._Plots,self:
GetBaseValues()if not aF or not aG then return end local aH=aG-aF for aI,aJ in
aE do local aK,aL=aJ.Point,aJ.Value local aM=(aL-aF)/aH aM=math.clamp(aM,0.05,1)
aK.Size=UDim2.fromScale(1,aM)end return self end function aq:Plot(aE)local aF,aG
,aH=self._Plots,{},aC:Clone()local aI=aH.Bar aa:SetProperties(aH,{Parent=az,
Visible=true})local aJ,aK=aa:DetectHover(aH,{MouseEnter=true,OnInput=function()
aG:UpdateTooltip()end}),{Object=aH,Point=aI,Value=aE}function aG:UpdateTooltip()
local aL=aG:GetPointIndex()ValueLabel.Text=`{aL}:\t{aK.Value}`end function aG:
SetValue(aL)aK.Value=aL aq:UpdateGraph()if aJ.Hovering then self:UpdateTooltip()
end end function aG:GetPointIndex()return table.find(aF,aK)end function aG:
Remove(aL)table.remove(aF,self:GetPointIndex())aH:Remove()aq:UpdateGraph()end
table.insert(aF,aK)self:UpdateGraph()aa:SetAnimation(aI,'Plots',aH)ao:
TagElements{[aI]='Plot'}return aG end function aq:PlotGraph(aE)local aF=self.
_Cache local aG=#aF-#aE if aG>=1 then for aH=1,aG do local aI=table.remove(aF,aH
)if aI then aI:Remove()end end end for aH,aI in aE do local aJ=aF[aH]if aJ then
aJ:SetValue(aI)continue end aF[aH]=self:Plot(aI)end return self end if at then
aq:PlotGraph(at)end return aw,au end})aa:DefineElement('Viewport',{Base={IsRadio
=true},Create=function(ao,aq)local ar=aa:InsertPrefab('Viewport',aq)local at,au=
aa:MergeMetatables(aq,ar),ar.Viewport local aw,az,aC=au.WorldModel,aq.Model,aq.
Camera if not aC then aC=aa:CreateInstance('Camera',au)aC.CFrame=CFrame.new(0,0,
0)end Merge(aq,{Camera=aC,WorldModel=aw,Viewport=au})function aq:SetCamera(aD)au
.CurrentCamera=aD self.Camera=aD return self end function aq:SetModel(aD,aE)
local aF=self.Clone aw:ClearAllChildren()if aF then aD=aD:Clone()end if aE then
aD:PivotTo(aE)end aD.Parent=aw self.Model=aD return aD end if az then aq:
SetModel(az)end aq:SetCamera(aC)return at end})aa:DefineElement('InputText',{
Base={Value='',Placeholder='',Label='Input text',Callback=ac,MultiLine=false,
NoAutoTag=true,Disabled=false},Create=function(ao,aq)local ar,at,au,aw,az=aq.
MultiLine,aq.Placeholder,aq.Label,aq.Disabled,aa:InsertPrefab('InputBox',aq)
local aC=az.Frame local aD,aE=aC.Input,aa:MergeMetatables(aq,az)ao:Label{Parent=
az,Text=au,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,5),LayoutOrder=2}aa:SetProperties(aD,{PlaceholderText=at,
MultiLine=ar})local aF=function(...)local aF=aq.Callback aF(aE,...)end function
aq:SetValue(aG)aD.Text=tostring(aG)self.Value=aG return self end function aq:
SetDisabled(aG)self.Disabled=aG az.Interactable=not aG ao:SetColorTags({[au]=aG
and'LabelDisabled'or'Label'},true)end function aq:Clear()aD.Text=''return self
end local aG=function()local aG=aD.Text aq.Value=aG aF(aG)end aD:
GetPropertyChangedSignal'Text':Connect(aG)aq:SetDisabled(aw)ao:TagElements{[aD]=
'Frame'}return aE,az end})aa:DefineElement('InputInt',{Base={Value=0,Increment=1
,Placeholder='',Label='Input Int',Callback=ac},Create=function(ao,aq)local ar,at
,au,aw,az,aC=aq.Value,aq.Placeholder,aq.Label,aq.Disabled,aq.NoButtons,aa:
InsertPrefab('InputBox',aq)local aD,aE=aa:MergeMetatables(aq,aC),aC.Frame local
aF=aE.Input aF.PlaceholderText=at local aG,aH,aI,aJ=ao:Button{Text='-',Parent=aE
,LayoutOrder=2,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.
UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not az,Callback=function()aq:
Decrease()end},ao:Button{Text='+',Parent=aE,LayoutOrder=3,Ratio=1,AutomaticSize=
Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),
Visible=not az,Callback=function()aq:Increase()end},ao:Label{Parent=aC,Text=au,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.
new(1,5),LayoutOrder=4},function(...)local aG=aq.Callback aG(aD,...)end function
aq:Increase()local aK,aL=self.Value,self.Increment aq:SetValue(aK+aL)end
function aq:Decrease()local aK,aL=self.Value,self.Increment aq:SetValue(aK-aL)
end function aq:SetDisabled(aK)self.Disabled=aK aC.Interactable=not aK ao:
SetColorTags({[aI]=aK and'LabelDisabled'or'Label'},true)end function aq:SetValue
(aK)local aL,aM,aN=self.Value,self.Minimum,self.Maximum aK=tonumber(aK)if not aK
then aK=aL end if aM and aN then aK=math.clamp(aK,aM,aN)end aF.Text=aK aq.Value=
aK aJ(aK)return self end local aK=function()local aK=aF.Text aq:SetValue(aK)end
aq:SetValue(ar)aq:SetDisabled(aw)aF.FocusLost:Connect(aK)ao:TagElements{[aH]=
'Button',[aG]='Button',[aF]='Frame'}return aD,aC end})aa:DefineElement(
'InputTextMultiline',{Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,
ColorTag='Frame'},Create=function(ao,aq)return ao:Console(aq)end})aa:
DefineElement('Console',{Base={Enabled=true,ReadOnly=false,Value='',TextWrapped=
false,RichText=false,LineNumbers=false,LinesFormat='%s',Callback=ac},Create=
function(ao,aq)local ar,at,au,aw,az,aC=aq.ReadOnly,aq.LineNumbers,aq.Fill,aq.
Value,aq.Placeholder,aa:InsertPrefab('Console',aq)local aD,aE,aF=aa:
MergeMetatables(aq,aC),aC.Source,aC.Lines aa:SetProperties(aE,aq)aa:
SetProperties(aE,{TextEditable=not ar,Parent=aC,PlaceholderText=az})aF.Visible=
at function aq:UpdateLineNumbers()local aG,aH=self.LineNumbers,self.LinesFormat
if not aG then return end local aI=#aE.Text:split'\n'aF.Text=''for aJ=1,aI do
local aK,aL=aH:format(aJ),aJ~=aI and'\n'or''aF.Text..=`{aK}{aL}`end local aJ=aF.
AbsoluteSize.X aE.Size=UDim2.new(1,-aJ,0,0)return self end function aq:
CheckLineCount()local aG=aq.MaxLines if not aG then return end local aH=aE.Text
local aI=aH:split'\n'if#aI>aG then local aJ=`{aI[1]}\\n`local aK=aH:sub(#aJ)self
:SetValue(aK)end return self end function aq:UpdateScroll()local aG=aC.
AbsoluteCanvasSize aC.CanvasPosition=Vector2.new(0,aG.Y)return self end function
aq:SetValue(aG)if not self.Enabled then return end aE.Text=tostring(aG)self:
Update()return self end function aq:GetValue()return aE.Text end function aq:
Clear()aE.Text=''self:Update()return self end function aq:AppendText(...)local
aG,aH='\n'..aa:Concat({...},' '),self:GetValue()self:SetValue(aH..aG)self:
CheckLineCount()return self end function aq:Update()local aG=aq.AutoScroll aq:
UpdateLineNumbers()if aG then aq:UpdateScroll()end end local aG=function()local
aG=aq:GetValue()aq:Update()aq.Callback(aG)end aq:SetValue(aw)ao:TagElements{[aE]
='ConsoleText'}aE:GetPropertyChangedSignal'Text':Connect(aG)return aD,aC end})aa
:DefineElement('Table',{Base={VerticalAlignment=Enum.VerticalAlignment.Top,
RowBackground=false,RowBgTransparency=0.87,Border=false},Create=function(ao,aq)
local ar,at,au,aw,az,aC,aD=ao.WindowClass,aq.RowBgTransparency,aq.RowBackground,
aq.Border,aq.VerticalAlignment,aq.MaxColumns,aa:InsertPrefab('Table',aq)local aE
,aF,aG,aH=aa:MergeMetatables(aq,aD),aD.RowTemp,0,{}function aq:Row(aI)aI=aI or{}
local aJ,aK,aL,aM=aI.IsHeader,0,{},aF:Clone()aa:SetProperties(aM,{Name='Row',
Visible=true,Parent=aD})local aN=aM:FindFirstChildOfClass'UIListLayout'aN.
VerticalAlignment=az if aJ then ao:TagElements{[aM]='Header'}else aG+=1 end if
au and not aJ then local aO=aG%2~=1 and at or 1 aM.BackgroundTransparency=aO end
local aO={}function aO:Column(aP)local aQ=aM.ColumnTemp:Clone()aa:SetProperties(
aQ,{Visible=true,Parent=aM,Name='Column'})local aR=aQ:FindFirstChildOfClass
'UIStroke'aR.Enabled=aw return aa:MakeCanvas{Element=aQ,WindowClass=ar,Class=aE}
end function aO:NextColumn()aK+=1 local aP=aK%aC+1 local aQ=aL[aP]if not aQ then
aQ=self:Column()aL[aP]=aQ end return aQ end table.insert(aH,aO)local aP=aa:
MergeMetatables(aO,aM)return aP end function aq:NextRow()return self:Row()end
function aq:HeaderRow()return self:Row{IsHeader=true}end function aq:ClearRows()
aG=0 for aI,aJ in next,aD:GetChildren()do if not aJ:IsA'Frame'then continue end
if aJ==aF then continue end aJ:Destroy()end return aq end return aE,aD end})aa:
DefineElement('List',{Base={Spacing=5,HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top},Create=
function(ao,aq)local ar,at,au,aw,az,aC,aD=ao.WindowClass,aq.Spacing,aq.
HorizontalFlex,aq.VerticalFlex,aq.HorizontalAlignment,aq.VerticalAlignment,aa:
InsertPrefab('List',aq)local aE,aF=aa:MergeMetatables(aq,aD),aD.UIListLayout aa:
SetProperties(aF,{Padding=UDim.new(0,at),HorizontalFlex=au,VerticalFlex=aw,
HorizontalAlignment=az,VerticalAlignment=aC})local aG=aa:MakeCanvas{Element=aD,
WindowClass=ar,Class=aE}return aG,aD end})aa:DefineElement('CollapsingHeader',{
Base={Title='Collapsing Header',Icon=aa.Icons.Arrow,Collapsed=true,Offset=0,
NoAutoTag=true,NoAutoFlags=true},Create=function(ao,aq)local ar,at,au,aw,az,aC,
aD,aE,aF=aq.Title,aq.Icon,aq.Collapsed,aq.ElementStyle,aq.Offset,aq.
TitleBarProperties,aq.OpenOnDoubleClick,aq.OpenOnArrow,aa:InsertPrefab(
'CollapsingHeader',aq)local aG=aF.TitleBar local aH=aG.Toggle.Icon aH.Image=at
local aI,aJ,aK=ao:Label{ColorTag='CollapsingHeader',Text=ar,Parent=aG,
LayoutOrder=2},ao:Indent{Parent=aF,Offset=az,LayoutOrder=2,Size=UDim2.fromScale(
1,0),AutomaticSize=Enum.AutomaticSize.None,PaddingTop=UDim.new(0,4),
UsePropertiesList=true}function aq:SetCollapsed(aL)self.Collapsed=aL local aM,aN
,aO=aa:GetContentSize(aK),aJ:GetThemeKey'AnimationTweenInfo',UDim2.fromScale(1,0
)local aP=aO+UDim2.fromOffset(0,aM.Y)al:HeaderCollapse{Tweeninfo=aN,Collapsed=aL
,Toggle=aH,Resize=aK,Hide=aK,ClosedSize=aO,OpenSize=aP}return self end local aL=
function()aq:SetCollapsed(not aq.Collapsed)end if aC then aa:ApplyFlags{Object=
aG,Class=aC}end if not aE then aa:ConnectMouseEvent(aG,{DoubleClick=aD,Callback=
aL})end aH.Activated:Connect(aL)aq:SetCollapsed(au)aa:ApplyStyle(aG,aw)aJ:
TagElements{[aG]='CollapsingHeader'}return aJ,aF end})aa:DefineElement(
'TreeNode',{Base={Offset=21,TitleBarProperties={Size=UDim2.new(1,0,0,14)}},
Create=function(ao,aq)return ao:CollapsingHeader(aq)end})aa:DefineElement(
'Separator',{Base={NoAutoTag=true,NoAutoTheme=true},Create=function(ao,aq)local
ar,at=aq.Text,aa:InsertPrefab('SeparatorText',aq)ao:Label{Text=tostring(ar),
Visible=ar~=nil,Parent=at,LayoutOrder=2,Size=UDim2.new(),PaddingLeft=UDim.new(0,
4),PaddingRight=UDim.new(0,4)}ao:TagElements{[at.Left]='Separator',[at.Right]=
'Separator'}return at end})aa:DefineElement('Canvas',{Base={Scroll=false},Create
=function(ao,aq)local ar,at=ao.WindowClass,aq.Scroll local au=at and
'ScrollingCanvas'or'Canvas'local aw=aa:InsertPrefab(au,aq)local az=aa:MakeCanvas
{Element=aw,WindowClass=ar,Class=aq}return az,aw end})aa:DefineElement('Region',
{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(ao,aq)
local ar,at=ao.WindowClass,aq.Scroll local au=at and'ScrollingCanvas'or'Canvas'
local aw=aa:InsertPrefab(au,aq)local az=aa:MakeCanvas{Element=aw,WindowClass=ar,
Class=aq}return az,aw end})aa:DefineElement('Group',{Base={Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y},Create=function(ao,aq)local ar,at=ao.
WindowClass,aa:InsertPrefab('Group',aq)local au=aa:MakeCanvas{Element=at,
WindowClass=ar,Class=aq}return au,at end})aa:DefineElement('Indent',{Base={
Offset=15,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),PaddingRight=UDim.new()
},Create=function(ao,aq)local ar=aq.Offset aq.PaddingLeft=UDim.new(0,ar)return
ao:Canvas(aq)end})aa:DefineElement('BulletText',{Base={},Create=function(ao,aq)
local ar=aq.Rows for at,au in next,ar do local aw=ao:Bullet(aq)aw:Label{Text=
tostring(au),LayoutOrder=2,Size=UDim2.fromOffset(0,14)}end end})aa:
DefineElement('Bullet',{Base={Padding=3,Icon=aa.Icons.Dot,IconSize=UDim2.
fromOffset(5,5)},Create=function(ao,aq)local ar,at,au=ao.WindowClass,aq.Padding,
aa:InsertPrefab('Bullet',aq)local aw,az=aa:MakeCanvas{Element=au,WindowClass=ar,
Class=ao},au.UIListLayout az.Padding=UDim.new(0,at)return aw,au end})aa:
DefineElement('Row',{Base={Spacing=4,Expanded=false},Create=function(ao,aq)local
ar,at,au,aw=ao.WindowClass,aq.Spacing,aq.Expanded,aa:InsertPrefab('Row',aq)local
az,aC=aa:MergeMetatables(aq,aw),aw:FindFirstChildOfClass'UIListLayout'aC.Padding
=UDim.new(0,at)function aq:Expand()aC.HorizontalFlex=Enum.UIFlexAlignment.Fill
return self end local aD=aa:MakeCanvas{Element=aw,WindowClass=ar,Class=az}if au
then aq:Expand()end return aD,aw end})aa:DefineElement('SliderBase',{Base={
Format='%.f',Label='',Type='Slider',Callback=ac,NoGrab=false,NoClick=false,
Minimum=0,Maximum=100,ColorTag='Frame',Disabled=false},Create=function(ao,aq)
local ar,at,au,aw,az,aC,aD,aE,aF=aq.Value or aq.Minimum,aq.Format,aq.Label,aq.
NoAnimation,aq.NoGrab,aq.NoClick,aq.Type,aq.Disabled,aa:InsertPrefab'Slider'
local aG=aF.Track local aH,aI,aJ,aK=aG.Grab,aG.ValueText,aG:
FindFirstChildOfClass'UIPadding',aa:MergeMetatables(aq,aF)local aL,aM,aN=aH.
AbsoluteSize,aa:SetAnimation(aF,'Inputs'),ao:Label{Parent=aF,Text=au,Position=
UDim2.new(1,5),Size=UDim2.fromScale(0,1)}Merge(aq,{Grab=aH,Name=au})if aD==
'Slider'then aG.Position=UDim2.fromOffset(aL.X/2,0)aG.Size=UDim2.new(1,-aL.X,1,0
)end local aO,aP={Slider=function(aO)return{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(aO,0.5)}end,Progress=function(aO)return{Size=UDim2.
fromScale(aO,1)}end,Snap=function(aO,aP,aQ,aR)local aS=(math.round(aP)-aQ)/aR
return{Size=UDim2.fromScale(1/aR,1),Position=UDim2.fromScale(aS,0.5)}end},
function(...)local aO=aq.Callback return aO(aK,...)end function aq:SetDisabled(
aQ)self.Disabled=aQ aF.Interactable=not aQ ao:SetColorTags({[aN]=aQ and
'LabelDisabled'or'Label'},true)end function aq:SetValueText(aQ)aI.Text=tostring(
aQ)end function aq:SetValue(aQ,aR)local aS,aT,aU,aV=ao:GetThemeKey
'AnimationTweenInfo',aq.Minimum,aq.Maximum,aQ local aW=aU-aT if not aR then aV=(
aQ-aT)/aW else aQ=aT+(aW*aV)end aV=math.clamp(aV,0,1)local aX=aO[aD](aV,aQ,aT,aU
)al:Tween{Object=aH,Tweeninfo=aS,NoAnimation=aw,EndProperties=aX}self.Value=aQ
self:SetValueText(at:format(aQ,aU))aP(aQ)return self end local aQ,aR=function(aQ
)ao:SetColorTags({[aF]=aQ and'FrameActive'or'Frame'},true)ao:SetElementFocused(
aF,{Focused=aQ,Animation=aM})end,function()if aq.Disabled then return end if aq.
ReadOnly then return end return true end local aS=function(aS)if not aR()then
return end local aT,aU,aV=aG.AbsolutePosition.X,aG.AbsoluteSize.X,aS.X local aW=
aV-aT local aX=math.clamp(aW/aU,0,1)aq:SetValue(aX,true)end local aT,aU=function
(...)if not aR()then return end aQ(true)if not aC then aS(...)end end,function()
aQ(false)end aH.Visible=not az aq:SetValue(ar)aq:SetDisabled(aE)ao:TagElements{[
aI]='Label',[aH]='SliderGrab'}aa:ConnectDrag(aG,{DragStart=aT,DragMovement=aS,
DragEnd=aU})return aK,aF end})aa:DefineElement('SliderEnum',{Base={Items={},
Label='Slider Enum',Type='Snap',Minimum=1,Maximum=10,Value=1,Callback=ac,
ColorTag='Frame'},Create=function(ao,aq)local ar,at=aq.Callback,aq.Value local
au=function(au,aw)aw=math.round(aw)local az=au.Items au.Maximum=#az return az[aw
]end aq.Callback=function(aw,az,aC)local aD=au(aw,az)aw:SetValueText(aD)aq.Value
=aD return ar(aw,aD)end au(aq,at)return ao:SliderBase(aq)end})aa:DefineElement(
'SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create=am.SliderBase})aa
:DefineElement('SliderFloat',{Base={Label='Slider Float',Format='%.3f',ColorTag=
'Frame'},Create=am.SliderBase})aa:DefineElement('DragInt',{Base={Format='%.f',
Label='Drag Int',Callback=ac,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=
false},Create=function(ao,aq)local ar,at,au,aw,az=aq.Value or aq.Minimum,aq.
Format,aq.Label,aq.Disabled,aa:InsertPrefab'Slider'local aC,aD=aa:
MergeMetatables(aq,az),az.Track local aE,aF=aD.ValueText,aD.Grab aF.Visible=
false local aG,aH,aI,aJ,aK,aL=aa:GetChildOfClass(aD,'UIDragDetector'),ao:Label{
Parent=az,Text=au,Position=UDim2.new(1,7),Size=UDim2.fromScale(0,1)},0,0,aa:
SetAnimation(az,'Inputs'),function(...)local aG=aq.Callback return aG(aC,...)end
function aq:SetValue(aM,aN)local aO,aP=self.Minimum,self.Maximum local aQ=aP-aO
if not aN then aI=((aM-aO)/aQ)*100 else aM=aO+(aQ*(aI/100))end aM=math.clamp(aM,
aO,aP)self.Value=aM aE.Text=at:format(aM,aP)aL(aM)return self end function aq:
SetDisabled(aM)self.Disabled=aM ao:SetColorTags({[aH]=aM and'LabelDisabled'or
'Label'},true)end local aM,aN=function(aM)ao:SetColorTags({[az]=aM and
'FrameActive'or'Frame'},true)ao:SetElementFocused(az,{Focused=aM,Animation=aK})
end,function()if aq.Disabled then return end if aq.ReadOnly then return end
return true end local aO,aP,aQ=function(aO)if not aN()then return end aM(true)
InputBeganPosition=aO aJ=aI end,function(aO)if not aN()then return end local aP=
aO.X-InputBeganPosition.X local aQ=aJ+(aP/2)aI=math.clamp(aQ,0,100)aq:SetValue(
aI,true)end,function()aM(false)end aq:SetValue(ar)aq:SetDisabled(aw)aa:
ConnectDrag(aD,{DragStart=aO,DragEnd=aQ,DragMovement=aP})return aC,az end})aa:
DefineElement('DragFloat',{Base={Format='%.3f',Label='Drag Float',ColorTag=
'Frame'},Create=am.DragInt})aa:DefineElement('MultiElement',{Base={Callback=ac,
Label='',Disabled=false,BaseInputConfig={},InputConfigs={},Value={},Minimum={},
Maximum={},MultiCallback=ac},Create=function(ao,aq)local ar,at,au,aw,az,aC,aD,aE
=aq.Label,aq.BaseInputConfig,aq.InputConfigs,aq.InputType,aq.Disabled,aq.Value,
aq.Minimum,aq.Maximum assert(aw,'No input type provided for MultiElement')local
aF=ao:Row{Spacing=5}local aG,aH,aI,aJ=aF:Row{Size=UDim2.fromScale(0.65,0),
Expanded=true},aF:Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=ar},aa:
MergeMetatables(aq,aF),{}local aK=function()local aK={}for aL,aM in aJ do aK[aL]
=aM:GetValue()end aq.Value=aK return aK end local aL=function()local aL=aq.
MultiCallback if#aJ~=#au then return end local aM=aK()aL(aI,aM)end function aq:
SetDisabled(aM)self.Disabled=aM ao:SetColorTags({[aH]=aM and'LabelDisabled'or
'Label'},true)for aN,aO in aJ do aO:SetDisabled(aM)end end function aq:SetValue(
aM)for aN,aO in aM do local aP=aJ[aN]assert(aP,`No input object for index: {aN}`
)aP:SetValue(aO)end end at=Copy(at,{Size=UDim2.new(1,0,0,19),Label='',Callback=
aL})for aM,aN in au do local aO=Copy(at,aN)aa:CheckConfig(aO,{Minimum=aD[aM],
Maximum=aE[aM]})local aP=aG[aw](aG,aO)table.insert(aJ,aP)end aL()Merge(aq,{Row=
aG,Inputs=aJ})aq:SetDisabled(az)aq:SetValue(aC)return aI,aF end})local ao,aq,ar,
at=function(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,
InputType=aq,InputConfigs=table.create(ar,{}),BaseInputConfig={}},Create=
function(au,aw)local az=(aw.BaseInputConfig)if at then Merge(az,at)end aa:
CheckConfig(az,{ReadOnly=aw.ReadOnly,Format=aw.Format})aw.MultiCallback=function
(...)local aC=aw.Callback aC(...)end return au:MultiElement(aw)end})end,function
(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,Value=aa.Accent.
Light,Disabled=false,Minimum={0,0,0},Maximum={255,255,255},BaseInputConfig={},
InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]={Format='B: %.f'}}
},Create=function(au,aw)local az,aC,aD,aE=aw.BaseInputConfig,aw.Value,aw.
Disabled,Copy(aw,{Value={1,1,1},Callback=function(az,...)if aw.ValueChanged then
aw:ValueChanged(...)end end})local aF=au[aq](au,aE)local aG,aH=aa:
MergeMetatables(aw,aF),aF.Row local aI,aJ=aH:Button{BackgroundTransparency=0,
Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=1,ColorTag='',
ElementStyle=''},function(...)local aI=aw.Callback return aI(aG,...)end local aK
=function(aK)aI.BackgroundColor3=aK aJ(aK)end function aw:ValueChanged(aL)local
aM,aN,aO=aL[1],aL[2],aL[3]local aP=Color3.fromRGB(aM,aN,aO)self.Value=aP aK(aP)
end function aw:SetValue(aL)self.Value=aL aK(aL)aF:SetValue{math.round(aL.R*255)
,math.round(aL.G*255),math.round(aL.B*255)}end aw:SetValue(aC)return aG,aH end})
end,function(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,Value={
Color=aa.Accent.Light,Transparency=0},Disabled=false,Minimum={0,0,0,0},Maximum={
255,255,255,255},BaseInputConfig={},InputConfigs={[1]={Format='R: %.f'},[2]={
Format='G: %.f'},[3]={Format='B: %.f'},[4]={Format='A: %.f'}}},Create=function(
au,aw)local az,aC,aD,aE=aw.BaseInputConfig,aw.Value,aw.Disabled,Copy(aw,{Value={
Color=Color3.new(1,1,1),Transparency=0},Callback=function(az,...)if aw.
ValueChanged then aw:ValueChanged(...)end end})local aF=au[aq](au,aE)local aG,aH
=aa:MergeMetatables(aw,aF),aF.Row local aI,aJ=aH:Button{BackgroundTransparency=
aw.Value.Transparency,Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=1,
ColorTag='',ElementStyle=''},function(...)local aI=aw.Callback return aI(aG,...)
end local aK=function(aK,aL)aI.BackgroundColor3=aK aI.BackgroundTransparency=aL
aJ{Color=aK,Transparency=aL}end function aw:ValueChanged(aL)local aM,aN,aO,aP=aL
[1],aL[2],aL[3],aL[4]local aQ,aR=Color3.fromRGB(aM,aN,aO),1-(aP/255)self.Value={
Color=aQ,Transparency=aR}aK(aQ,aR)end function aw:SetValue(aL)self.Value=aL aK(
aL.Color,aL.Transparency)aF:SetValue{math.round(aL.Color.R*255),math.round(aL.
Color.G*255),math.round(aL.Color.B*255),math.round((1-aL.Transparency)*255)}end
aw:SetValue(aC)return aG,aH end})end,function(ao,aq,ar,at)aa:DefineElement(ao,{
Base={Label=ao,Callback=ac,Disabled=false,Value=CFrame.new(10,10,10),Minimum=
CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),BaseInputConfig={},
InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]={Format='Z: %.f'}}
},Create=function(au,aw)local az,aC,aD,aE,aF=aw.BaseInputConfig,aw.Value,aw.
Disabled,aw.Maximum,aw.Minimum local aG=Copy(aw,{Maximum={aE.X,aE.Y,aE.Z},
Minimum={aF.X,aF.Y,aF.Z},Value={aC.X,aC.Y,aC.Z},Callback=function(aG,...)if aw.
ValueChanged then aw:ValueChanged(...)end end})local aH=au[aq](au,aG)local aI,aJ
=aa:MergeMetatables(aw,aH),aH.Row local aK=function(...)local aK=aw.Callback
return aK(aI,...)end function aw:ValueChanged(aL)local aM,aN,aO=aL[1],aL[2],aL[3
]local aP=CFrame.new(aM,aN,aO)self.Value=aP aK(aP)end function aw:SetValue(aL)
self.Value=aL aH:SetValue{math.round(aL.X),math.round(aL.Y),math.round(aL.Z)}end
aw:SetValue(aC)return aI,aJ end})end ao('InputInt2','InputInt',2,{NoButtons=true
})ao('InputInt3','InputInt',3,{NoButtons=true})ao('InputInt4','InputInt',4,{
NoButtons=true})ao('SliderInt2','SliderInt',2)ao('SliderInt3','SliderInt',3)ao(
'SliderInt4','SliderInt',4)ao('SliderFloat2','SliderFloat',2)ao('SliderFloat3',
'SliderFloat',3)ao('SliderFloat4','SliderFloat',4)ao('DragInt2','DragInt',2)ao(
'DragInt3','DragInt',3)ao('DragInt4','DragInt',4)ao('DragFloat2','DragFloat',2)
ao('DragFloat3','DragFloat',3)ao('DragFloat4','DragFloat',4)aq('InputColor3',
'InputInt3')aq('SliderColor3','SliderInt3')aq('DragColor3','DragInt3')ar(
'InputColor4','InputInt3')ar('SliderColor4','SliderInt3')ar('DragColor4',
'DragInt3')at('InputCFrame','InputInt3')at('SliderCFrame','SliderInt3')at(
'DragCFrame','DragInt3')aa:DefineElement('SliderProgress',{Base={Label=
'Slider Progress',Type='Progress',ColorTag='Frame'},Create=am.SliderBase})aa:
DefineElement('ProgressBar',{Base={Label='Progress Bar',Type='Progress',ReadOnly
=true,MinValue=0,MaxValue=100,Format='% i%%',Interactable=false,ColorTag='Frame'
},Create=function(au,aw)function aw:SetPercentage(az)aw:SetValue(az)end local az
,aC=au:SliderBase(aw)local aD=az.Grab au:TagElements{[aD]={BackgroundColor3=
'ProgressBar'}}return az,aC end})aa:DefineElement('Combo',{Base={Value='',
Placeholder='',Callback=ac,Items={},Disabled=false,WidthFitPreview=false,Label=
'Combo'},Create=function(au,aw)local az,aC,aD,aE,aF,aG,aH=aw.Placeholder,aw.
NoAnimation,aw.Selected,aw.Label,aw.Disabled,aw.WidthFitPreview,aa:InsertPrefab(
'Combo',aw)local aI,aJ,aK=aa:MergeMetatables(aw,aH),aH.Combo,(aa:DetectHover(aH)
)local aL,aM,aN=au:Label{Text=tostring(az),Parent=aJ,Name='ValueText'},au:
ArrowButton{Parent=aJ,Ratio=1,Interactable=false,Size=UDim2.fromScale(0,0),
LayoutOrder=2},au:Label{Text=aE,Parent=aH,LayoutOrder=2}if aG then aa:
SetProperties(aH,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,20)})
aa:SetProperties(aJ,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromScale(0,1
)})end local aO,aP=function(aO,...)local aP=aw.Callback aw:SetOpen(false)return
aP(aI,aO,...)end,function(aO,aP)local aQ=au:GetThemeKey'AnimationTweenInfo'aH.
Interactable=not aO al:HeaderCollapseToggle{Tweeninfo=aQ,NoAnimation=aP,
Collapsed=not aO,Toggle=aM.Icon}end local function aQ()local aR,aS=aw.GetItems,
aw.Items if aR then return aR()end return aS end function aw:SetValueText(aR)aL.
Text=tostring(aR)end function aw:SetDisabled(aR)self.Disabled=aR aH.Interactable
=not aR au:SetColorTags({[aN]=aR and'LabelDisabled'or'Label'},true)end function
aw:SetValue(aR)local aS=aQ()local aT=aS[aR]local aU=aT or aR self._Selected=aR
self.Value=aU if typeof(aR)=='number'then self:SetValueText(aU)else self:
SetValueText(aR)end return aO(aR,aU)end function aw:SetOpen(aR)local aS=self.
_Selected self.Open=aR aP(aR,aC)if not aR then if Dropdown then Dropdown:Close()
end return end Dropdown=au:Dropdown{ParentObject=aJ,Items=aQ(),Selected=aS,
OnSelected=function(...)aw:SetValue(...)end,OnClosed=function()self:SetOpen(
false)end}return self end local aR=function()local aR=aw.Open aw:SetOpen(not aR)
end aJ.Activated:Connect(aR)aP(false,true)aw:SetDisabled(aF)if aD then aw:
SetValue(aD)end aa:SetAnimation(aJ,'Inputs')au:TagElements{[aJ]='Frame'}return
aI,aH end})local au={TileBarConfig={Close={Image=aa.Icons.Close,IconSize=UDim2.
fromOffset(11,11)},Collapse={Image=aa.Icons.Arrow,IconSize=UDim2.fromScale(1,1)}
},CloseCallback=ac,Collapsible=true,Open=true,Focused=false}function au:Tween(aw
)aa:CheckConfig(aw,{Tweeninfo=self:GetThemeKey'AnimationTweenInfo'})return al:
Tween(aw)end function au:TagElements(aw)local az=aa.Debug if not au then if az
then aa:Warn('No WindowClass for objects registor:',aw)end return end local aC,
aD=self.TagsList,self.Theme aa:MultiUpdateColors{Theme=aD,TagsList=aC,Objects=aw
}end function au:MakeTitleBarCanvas()local aw=self.TitleBar local az=aa:
MakeCanvas{WindowClass=self,Element=aw}self.TitleBarCanvas=az return az end
function au:AddDefaultTitleButtons()local aw,az=self.TileBarConfig,self.TitleBar
local aC,aD,aE=aw.Collapse,aw.Close,self.TitleBarCanvas if not aE then aE=self:
MakeTitleBarCanvas()end aa:CheckConfig(self,{Toggle=aE:RadioButton{Icon=aC.Image
,IconSize=aC.IconSize,LayoutOrder=1,Ratio=1,Size=UDim2.new(0,0),Callback=
function()self:ToggleCollapsed()end},CloseButton=aE:RadioButton{Icon=aD.Image,
IconSize=aD.IconSize,LayoutOrder=3,Ratio=1,Size=UDim2.new(0,0),Callback=function
()self:Close()end},TitleLabel=aE:Label{ColorTag='Title',LayoutOrder=2,Size=UDim2
.new(1,0),Active=false,Fill=true,AutomaticSize=Enum.AutomaticSize.XY}})self:
TagElements{[self.TitleLabel]='WindowTitle'}end function au:Close()local aw=self
.CloseCallback if aw then local az=aw(self)if az==false then return end end self
:Remove()end function au:GetWindowSize()local aw=self.WindowFrame return aw.
AbsoluteSize end function au:GetTitleBarSizeY()local aw=self.TitleBar if not aw.
Visible then return 0 end return aa:GetContentSize(aw,true).Y end function au:
SetVisible(aw)local az,aC=self.WindowFrame,self.NoFocusOnAppearing self.Visible=
aw az.Visible=aw if aw and not aC then aa:SetFocusedWindow(self)end return self
end function au:SetTitle(aw)local az=self.TitleLabel az.Text=tostring(aw)return
self end function au:Remove()local aw=self.WindowFrame aw:Destroy()end function
au:SetPosition(aw)local az=self.WindowFrame az.Position=aw return self end
function au:SetSize(aw,az)local aC=self.WindowFrame if typeof(aw)=='Vector2'then
aw=UDim2.fromOffset(aw.X,aw.Y)end self:Tween{Object=aC,NoAnimation=az,
EndProperties={Size=aw}}self.Size=aw return self end function au:Center()local
aw=self:GetWindowSize()/2 local az=UDim2.new(0.5,-aw.X,0.5,-aw.Y)self:
SetPosition(az)return self end function au:SetTheme(aw)local az,aC,aD=aa.
ThemeConfigs,self.TagsList,self.Focused if not aw then aw=self.Theme end assert(
az[aw],`{aw} is not a valid theme!`)self.Theme=aw aa:MultiUpdateColors{Animate=
false,Theme=aw,Objects=aC}self:SetFocused(aD)return self end function au:
SetFocused(aw)aw=aw==nil and true or aw self.Focused=aw if aw then aa:
SetFocusedWindow(self)end local az,aC,aD,aE,aF,aG=self.ContentFrame,self.
TitleBar,self.Theme,self.TitleLabel,self.Collapsed,self.WindowFrame:
FindFirstChildOfClass'UIStroke'local aH={Focused={[aG]='BorderActive',[aC]=
'TitleBarBgActive',[aE]={TextColor3='TitleActive'}},UnFocused={[aG]='Border',[aC
]='TitleBarBg',[aE]={TextColor3='Title'}},Collapsed={[aG]='Border',[aC]=
'TitleBarBgCollapsed',[aE]={TextColor3='Title'}}}local aI=aw and aH.Focused or
aH.UnFocused if aF then aI=aH.Collapsed end aa:MultiUpdateColors{Animate=true,
Objects=aI,Theme=aD}end function au:GetThemeKey(aw)return aa:GetThemeKey(self.
Theme,aw)end function au:ResetColors()local aw,az,aC=aa.Theme,self.Theme,self.
TagsList table.clear(az)aa:MultiUpdateColors{Animate=false,Theme=aw,Objects=aC}
return au end function au:SetCollapsible(aw)self.Collapsible=aw return self end
function au:ToggleCollapsed(aw)local az,aC=self.Collapsed,self.Collapsible if
not aw and not aC then return self end self:SetCollapsed(not az)return self end
function au:SetCollapsed(aw,az)local aC,aD,aE,aF,aG,aH,aI,aJ,aK=self.WindowFrame
,self.Body,self.Toggle,self.ResizeGrab,self.Size,self.AutoSize,self:GetThemeKey
'AnimationTweenInfo',self:GetWindowSize(),self:GetTitleBarSizeY()local aL,aM=aE.
Icon,UDim2.fromOffset(aJ.X,aK)self.Collapsed=aw self:SetCollapsible(false)self:
SetFocused(not aw)al:HeaderCollapse{Tweeninfo=aI,NoAnimation=az,Collapsed=aw,
Toggle=aL,Resize=aC,NoAutomaticSize=not aH,Hide=aD,ClosedSize=aM,OpenSize=aG,
Completed=function()self:SetCollapsible(true)end}self:Tween{Object=aF,
NoAnimation=az,EndProperties={TextTransparency=aw and 1 or 0.6,Interactable=not
aw}}return self end function au:UpdateConfig(aw)local az={NoTitleBar=function(az
)local aC=self.TitleBar aC.Visible=not az end,NoClose=function(az)local aC=self.
CloseButton aC.Visible=not az end,NoCollapse=function(az)local aC=self.Toggle aC
.Visible=not az end,NoTabsBar=function(az)local aC=self.WindowTabSelector if not
aC then return end local aD=aC.TabsBar aD.Visible=not az end,NoScrollBar=
function(az)local aC,aD,aE,aF=az and 0 or 9,self.NoScroll,self.WindowTabSelector
,self.ContentCanvas if aE then aE.Body.ScrollBarThickness=aC end if not aD then
aF.ScrollBarThickness=aC end end,NoScrolling=function(az)local aC,aD,aE=self.
NoScroll,self.WindowTabSelector,self.ContentCanvas if aD then aD.Body.
ScrollingEnabled=not az end if not aC then aE.ScrollingEnabled=not az end end,
NoMove=function(az)local aC=self.DragConnection aC:SetEnabled(not az)end,
NoResize=function(az)local aC=self.ResizeConnection aC:SetEnabled(not az)end,
NoBackground=function(az)local aC,aD=self:GetThemeKey'WindowBgTransparency',self
.CanvasFrame aD.BackgroundTransparency=az and 1 or aC end}Merge(self,aw)for aC,
aD in aw do local aE=az[aC]if aE then aE(aD)end end return self end aa:
DefineElement('Window',{Export=true,Base={Theme='DarkTheme',NoSelect=false,
NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize=false,MinSize=
Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,NoWindowRegistor=
false,IsDragging=false},Create=function(aw,az)aa:CheckConfig(az,{Parent=aa.
Container.Windows,Title=aa.DefaultTitle})local aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,
aN,aO=aa.Windows,az.NoDefaultTitleBarButtons,az.Collapsed,az.MinSize,az.Title,az
.NoTabs,az.NoScroll,az.Theme,az.AutomaticSize,az.NoWindowRegistor,az.
AutoSelectNewTabs,az.OpenOnDoubleClick,az.NoCollapse local aP={Scroll=not aI,
Fill=not aK and true or nil,UiPadding=UDim.new(0,aH and 8 or 0),
AutoSelectNewTabs=aM}if aK then Merge(aP,{AutomaticSize=aK,Size=UDim2.new(1,0)})
end local aQ=aa:InsertPrefab('Window',az)local aR=aQ.Content local aS,aT=aR.
TitleBar,NewClass(au)local aU,aV,aW,aX,aY=aa:MakeResizable{MinimumSize=aF,Resize
=aQ,OnUpdate=function(aU)aT:SetSize(aU,true)end},(aa:MakeCanvas{Element=aR,
WindowClass=aT,Class=aT})local aZ,a_=aV:Canvas(Copy(aP,{Parent=aR}))Merge(aT,az)
Merge(aT,{WindowFrame=aQ,ContentFrame=aR,CanvasFrame=a_,ResizeGrab=aU.Grab,
TitleBar=aS,Elements=am,TagsList={},ResizeConnection=aU,HoverConnection=aa:
DetectHover(aR),DragConnection=aa:MakeDraggable{Move=aQ,Grab=aR,
OnDragStateChange=function(a0)aT.IsDragging=a0 a_.Interactable=not a0 if a0 then
aa:SetFocusedWindow(aY)end aa:SetWindowFocusesEnabled(not a0)end}})if aH then aW
,aX=aZ,a_ else aW,aX=aZ:TabSelector(aP)aT.WindowTabSelector=aW end Merge(aT,{
Body=aX,ContentCanvas=aW})aa:ConnectMouseEvent(aR,{DoubleClick=true,
OnlyMouseHovering=aS,Callback=function(...)if not aT.OpenOnDoubleClick then
return end if aT.NoCollapse then return end aT:ToggleCollapsed()end})if not aD
then aT:AddDefaultTitleButtons()end aT:SetTitle(aG)aT:SetCollapsed(aE,true)aT:
SetTheme(aJ)aT:UpdateConfig(az)aT:SetFocused()aY=aa:MergeMetatables(aT,aW)if not
aL then table.insert(aC,aY)end local a0=aU.Grab aa:SetAnimation(a0,'TextButtons'
)aY:TagElements{[a0]='ResizeGrab',[aS]='TitleBar',[a_]='Window'}return aY,aQ end
})aa:DefineElement('TabsWindow',{Export=true,Base={NoTabs=false,
AutoSelectNewTabs=true},Create=function(aw,az)return aw:Window(az)end})aa:
DefineElement('PopupCanvas',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize
.Y},Create=function(aw,az)local aC,aD=aw.WindowClass,az.Scroll local aE=aD and
'ScrollingCanvas'or'Canvas'local aF=aa:InsertPrefab(aE,az)function az:ClosePopup
()aF:Destroy()end function az:ShowPopup()aF.Visible=true end local aG,aH=aa:
DetectHover(aF,{MouseOnly=true,OnInput=function(aG,aH)if aG then return end az:
ClosePopup()end}),aa:MakeCanvas{Element=aF,WindowClass=aC,Class=az}return aH,aF
end})aa:DefineElement('PopupModal',{Export=true,Base={NoAnimation=false,
NoCollapse=true,NoClose=true,NoResize=true,NoSelect=true,NoAutoFlags=true,
NoWindowRegistor=true,NoScroll=true},Create=function(aw,az)local aC,aD,aE=aw.
WindowClass,(az.NoAnimation)az.Parent=aa.Container.Overlays if aC then aE=aC:
GetThemeKey'ModalWindowDimTweenInfo'az.Theme=aC.Theme end local aF=aa:
InsertPrefab('ModalEffect',az)local aG=aw:Window(Copy(az,{Parent=aF,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(372
,38),NoAutoFlags=false,AutomaticSize=Enum.AutomaticSize.Y}))function az:
ClosePopup()al:Tween{Object=aF,Tweeninfo=aE,NoAnimation=aD,EndProperties={
BackgroundTransparency=1},Completed=function()aF:Destroy()end}aG:Close()end al:
Tween{Object=aF,Tweeninfo=aE,NoAnimation=aD,StartProperties={
BackgroundTransparency=1},EndProperties={BackgroundTransparency=0.8}}aw:
TagElements{[aF]='ModalWindowDim'}local aH=aa:MergeMetatables(az,aG)return aH,aF
end})local aw=`rbxassetid://`..aa.PrefabsId aa:Init{Prefabs=game:GetService
'InsertService':LoadLocalAsset(aw)}return aa end function a.i()return function(
aa)local ab,ac,ad,ae=a.load'a',a.load'h',a.load'c',a.load'd'local af,ag,ah,ai,aj
,ak,al=ad.team.enemy,ad.team.friendly,ae.Aimbot,ae.Triggerbot,ae.FOVSettings,ab.
SecureService,ac:TabsWindow{Title=`RIOT V2 | {aa} - getriot.cc`,Size=UDim2.new(0
,350,0,550),Position=UDim2.new(0.5,0,0,70)}local am={Combat=al:CreateTab{Name=
'Combat'},Visuals=al:CreateTab{Name='Visuals'},Settings=al:CreateTab{Name=
'Settings'}}local an=am.Combat:TabSelector{Size=UDim2.new(1,0,0,310)}local ao,aq
,ar=an:CreateTab{Name='Aimbot'},{[true]=
'Active: <font color="rgb(40, 240, 10)">true</font>',[false]=
'Active: <font color="rgb(240, 40, 10)">false</font>'}local at=ao:Checkbox{Label
='Enabled',Value=false,Callback=function(at,au)ah.Enabled=au if ar and ar.Text==
aq[true]and not au then ar.Text=aq[false]end end}ar=ao:Label{RichText=true,Text=
aq[false]}ah.AutoStateLabel=function(au)if at.Value then ar.Text=aq[au]end end
local au=ao:Label{RichText=true,Text=
'Target: <font color="rgb(240, 40, 10)">none</font>'}ah.AutoLockedLabel=function
(aw)au.Text=aw and string.format(
'Target: <font color="rgb(40, 240, 10)">%q</font>',aw.Name)or
'Target: <font color="rgb(240, 40, 10)">None</font>'end local aw,az ao:Combo{
Selected='Camera',Label='Lock Mode',Items={'Camera','Mouse'},Callback=function(
aC,aD)ah.LockMode=({Camera=1,Mouse=2})[aD]if aw and az then aw:SetDisabled(aD~=
'Camera')az:SetDisabled(aD~='Mouse')end end}ao:Keybind{Label='Trigger Keybind',
Value=Enum.KeyCode.E,OnKeybindSet=function(aC,aD)ah.TriggerKey=aD end}for aC,aD
in ipairs{{'Toggle Activation','ToggleTrigger',nil},{'Team Check','TeamCheck',
true},{'Alive Check','AliveCheck',true}}do ao:Checkbox{Label=aD[1],Value=aD[3],
Callback=function(aE,aF)ah[aD[2] ]=aF end}end ao:Combo{Label='Wall Check',
Selected='Always On',Items={'Off','Sticky','Always On'},Callback=function(aC,aD)
local aE=table.find(aC.Items,aD)if aE then ah.WallCheck=aE end end}ao:Combo{
Selected='Head',Label='Aiming Bone',Items={'Head','Torso'},Callback=function(aC,
aD)ah.LockPart=aD end}aw=ao:SliderFloat{Label='Smoothing (Camera)',Minimum=0,
Maximum=1,Value=0,Format='Smoothing = %.3f',Callback=function(aC,aD)ah.
Sensitivity=aD end}az=ao:SliderFloat{Label='Smoothing (Mouse)',Minimum=1,Maximum
=20,Value=1,Format='Smoothing = %.1f',Callback=function(aC,aD)ah.Sensitivity2=aD
end}az:SetDisabled(true)local aC=an:CreateTab{Name='Triggerbot'}aC:Checkbox{
Label='Enabled',Value=false,Callback=function(aD,aE)ai.Enabled=aE end}local aD=
aC:Label{RichText=true,Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'}ai.TargetChanged=
function(aE)if not aE then aD.Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'else aD.Text=`Trigger Target: <font color="rgb(40, 240, 10)">{
aE.Name}</font>`end end for aE,aF in ipairs{{'Team Check','TeamCheck',true},{
'Alive Check','AliveCheck',true}}do aC:Checkbox{Label=aF[1],Value=aF[3],Callback
=function(aG,aH)ai[aF[2] ]=aH end}end aC:InputInt{Label='Trigger Delay (ms)',
Value=0,Minimum=0,Increment=25,Callback=function(aE,aF)ai.Delay=aF/1000 end}am.
Combat:Separator{Text='FOV Settings'}for aE,aF in ipairs{{'Enabled','Enabled',
true},{'Visible','Visible',true}}do am.Combat:Checkbox{Label=aF[1],Value=aF[3],
Callback=function(aG,aH)aj[aF[2] ]=aH end}end for aE,aF in ipairs{{'Radius',
'Radius',0,500,120,'%.0f'},{'Circle Sides','NumSides',3,80,25,'%.0f'},{
'Transparency','Transparency',0,1,0,'%.3f'}}do am.Combat:SliderFloat{Label=aF[1]
,Minimum=aF[3],Maximum=aF[4],Value=aF[5],Format=aF[1]..' = '..aF[6],Callback=
function(aG,aH)aj[aF[2] ]=aH end}end for aE,aF in ipairs{{'Color','Color',Color3
.fromRGB(240,40,10)},{'Color (Locked)','LockedColor',Color3.fromRGB(40,240,10)}}
do am.Combat:DragColor3{Label=aF[1],Value=aF[3],Callback=function(aG,aH)aj[aF[2]
]=aH end}end am.Visuals:Separator{Text='Shared Settings'}local aE local aF=am.
Visuals:Checkbox{Label='Limit Distance',Value=false,Callback=function(aF,aG)ad.
shared.limitDistance=aG if aE then aE:SetDisabled(not aG)end end}aE=am.Visuals:
SliderFloat{Label='Limit',Minimum=1,Maximum=500,Value=150,Format=
'Distance Limit = %.0f',Callback=function(aG,aH)ad.shared.maxDistance=aH end}aE:
SetDisabled(not aF.Value)am.Visuals:Separator{Text='ESP'}local aG,aH=am.Visuals:
TabSelector{Size=UDim2.new(1,0,0,400)},function(aG,aH)aH:Checkbox{Label=
'Enabled',Value=false,Callback=function(aI,aJ)aG.enabled=aJ end}aH:Separator{
Text='Boxes'}aH:Checkbox{Label='Enabled',Value=true,Callback=function(aI,aJ)aG.
box=aJ end}aH:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',Callback=
function(aI,aJ)aG.boxColor[1]=aJ end}aH:SliderFloat{Label='Transparency',Minimum
=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.
boxColor[2]=1-aJ aG.boxOutlineColor[2]=1-aJ end}aH:Separator{Text='3D Boxes'}aH:
Checkbox{Label='Enabled',Value=true,Callback=function(aI,aJ)aG.box3d=aJ end}aH:
DragColor3{Value=Color3.fromRGB(155,205,255),Label='Color',Callback=function(aI,
aJ)aG.box3dColor[1]=aJ end}aH:SliderFloat{Label='Transparency',Minimum=0,Maximum
=1,Value=0,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.box3dColor[2]
=1-aJ end}aH:Separator{Text='Box Fill'}aH:Checkbox{Label='Enabled',Value=true,
Callback=function(aI,aJ)aG.boxFill=aJ end}aH:DragColor3{Value=Color3.fromRGB(0,0
,0),Label='Color',Callback=function(aI,aJ)aG.boxFillColor[1]=aJ end}aH:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0.2,Format=
'Transparency = %.3f',Callback=function(aI,aJ)aG.boxFillColor[2]=aJ end}aH:
Separator{Text='Chams'}aH:Checkbox{Label='Enabled',Value=true,Callback=function(
aI,aJ)aG.chams=aJ end}aH:Checkbox{Label='Always On Top',Value=true,Callback=
function(aI,aJ)aG.chamsVisibleOnly=not aJ end}aH:DragColor3{Value=Color3.
fromRGB(100,120,250),Label='Color (Fill)',Callback=function(aI,aJ)aG.
chamsFillColor[1]=aJ end}aH:SliderFloat{Label='Transparency (Fill)',Minimum=0,
Maximum=1,Value=0.8,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.
chamsFillColor[2]=aJ end}aH:DragColor3{Value=Color3.fromRGB(25,85,255),Label=
'Color (Outline)',Callback=function(aI,aJ)aG.chamsOutlineColor[1]=aJ end}aH:
SliderFloat{Label='Transparency (Outline)',Minimum=0,Maximum=1,Value=0.5,Format=
'Transparency = %.3f',Callback=function(aI,aJ)aG.chamsOutlineColor[2]=aJ end}aH:
Separator{Text='Tracers'}aH:Checkbox{Label='Enabled',Value=true,Callback=
function(aI,aJ)aG.tracer=aJ end}aH:DragColor3{Value=Color3.fromRGB(77,92,143),
Label='Color',Callback=function(aI,aJ)aG.tracerColor[1]=aJ end}aH:SliderFloat{
Label='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(aI,aJ)aG.tracerColor[2]=1-aJ aG.tracerOutlineColor[2]=1-aJ end
}aH:Combo{Selected='Top',Label='Tracer Origin',Items={'Top','Middle','Bottom',
'Mouse'},Callback=function(aI,aJ)aG.tracerOrigin=aJ end}aH:Separator{Text=
'Health Bars'}aH:Checkbox{Label='Enabled',Value=true,Callback=function(aI,aJ)aG.
healthBar=aJ end}aH:DragColor3{Value=Color3.fromRGB(58,161,47),Label=
'Healthy Color',Callback=function(aI,aJ)aG.healthyColor=aJ end}aH:DragColor3{
Value=Color3.fromRGB(161,47,47),Label='Dying Color',Callback=function(aI,aJ)aG.
dyingColor=aJ end}aH:Separator{Text='Off Screen Arrows'}aH:Checkbox{Label=
'Enabled',Value=true,Callback=function(aI,aJ)aG.offScreenArrow=aJ end}aH:
DragColor3{Value=Color3.fromRGB(255,255,255),Label='Color',Callback=function(aI,
aJ)aG.offScreenArrowColor[1]=aJ end}aH:SliderFloat{Label='Transparency',Minimum=
0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.
offScreenArrowColor[2]=1-aJ aG.offScreenArrowOutlineColor[2]=1-aJ end}aH:
SliderInt{Label='Size',Value=15,Minimum=1,Maximum=50,Callback=function(aI,aJ)aG.
offScreenArrowSize=aJ end}aH:SliderInt{Label='Radius',Value=150,Minimum=1,
Maximum=800,Callback=function(aI,aJ)aG.offScreenArrowRadius=aJ end}aH:Separator{
Text='Names'}aH:Checkbox{Label='Enabled',Value=true,Callback=function(aI,aJ)aG.
name=aJ end}aH:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',
Callback=function(aI,aJ)aG.nameColor[1]=aJ end}aH:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback
=function(aI,aJ)aG.nameColor[2]=1-aJ end}aH:Separator{Text='Distance Text'}aH:
Checkbox{Label='Enabled',Value=true,Callback=function(aI,aJ)aG.distance=aJ end}
aH:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',Callback=function(
aI,aJ)aG.distanceColor[1]=aJ end}aH:SliderFloat{Label='Transparency',Minimum=0,
Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.
distanceColor[2]=1-aJ end}aH:Separator{Text='Weapon Text'}aH:Checkbox{Label=
'Weapon Text',Value=true,Callback=function(aI,aJ)aG.weapon=aJ end}aH:DragColor3{
Value=Color3.fromRGB(200,173,182),Label='Color',Callback=function(aI,aJ)aG.
weaponColor[1]=aJ end}aH:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(aI,aJ)aG.weaponColor[2]=1
-aJ end}aH:Separator{Text='Health Text'}aH:Checkbox{Label='Health Text',Value=
true,Callback=function(aI,aJ)aG.healthText=aJ end}aH:DragColor3{Value=Color3.
fromRGB(200,173,182),Label='Color',Callback=function(aI,aJ)aG.healthTextColor[1]
=aJ end}aH:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(aI,aJ)aG.healthTextColor[2]=1-aJ end}end
local aI=aG:CreateTab{Name='Enemy'}aH(af,aI)local aJ=aG:CreateTab{Name=
'Friendly'}aH(ag,aJ)am.Settings:Keybind{Label='Menu Keybind',Value=Enum.KeyCode.
Home,IgnoreGameProcessed=false,Callback=function(aK,aL)al:SetVisible(not al.
Visible)end}ad.Load()ae.Load()end end end local aa={linoriaBase={Name=
'linoriaBase',Load=a.load'e'},riotUiBase={Name='riotUiBase',Load=a.load'g'},
Universal={Name='Universal',Load=a.load'i'}}for ab,ac in pairs(aa)do if ac.
Places then for ad,ae in ipairs(ac.Places)do if ae==game.PlaceId then ac:Load()
return end end end end aa.riotUiBase:Load()