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
'Head',MaxDistance=250,TeamCheck=true,AliveCheck=true,WallCheck=1,Sensitivity=0,
Sensitivity2=1,OffsetToMoveDirection=false,OffsetIncrement=15},FOVSettings={
Enabled=false,Visible=true,Radius=90,NumSides=60,Thickness=2,Transparency=1,
Filled=false,Color=b(255,255,255),OutlineColor=b(0,0,0),LockedColor=b(255,150,
150)},Blacklisted={},FOVCircleOutline=c'Circle',FOVCircle=c'Circle'}local J,K,L=
F,function(J)local K for L,M in next,A(r)do local N=l(M,'Name')if i(h(N),1,#J)==
h(J)then K=N end end return K end,function(J)return ac(J.X,J.Y)end local M=
function()J.Locked=nil local M=J.FOVCircle M.Color=J.FOVSettings.Color m(p,
'MouseDeltaSensitivity',H)if G then G:Cancel()end end function J.Aimbot.SetState
(N)C=N if not N then M()end end local N,O=function()local N=J.Aimbot local O=N.
LockPart if not J.Locked then B=J.FOVSettings.Enabled and J.FOVSettings.Radius
or 2000 for P,Q in next,A(r)do local R=l(Q,'Character')local S=R and v(R,
'Humanoid')if Q~=s and not f(J.Blacklisted,l(Q,'Name'))and R and u(R,O)and S
then local T,U=l(R[O],'Position'),J.DeveloperSettings.TeamCheckOption if N.
MaxDistance and(t.CFrame.Position-T).Magnitude>N.MaxDistance then continue end
if N.TeamCheck and l(Q,U)and l(Q,U)==l(s,U)then continue end if N.AliveCheck and
l(S,'Health')<=0 then continue end if N.WallCheck==2 or N.WallCheck==3 then
local V=w(l(s,'Character'))for W,X in next,w(R)do V[#V+1]=X end if#y(t,{T},V)>0
then continue end end local V,W,X=x(t,T)V=L(V)X=(z(p)-V).Magnitude if X<B and W
then B,J.Locked=X,Q end end end else local P=l(J.Locked,'Character')if P then
local Q=u(P,O)if not Q then M()return end local R=l(P[O],'Position')if N.
MaxDistance and(t.CFrame.Position-R).Magnitude>N.MaxDistance then M()return end
local S,T=x(t,R)S=L(S)local U=(z(p)-S).Magnitude if N.WallCheck==3 then local V=
w(l(s,'Character'))for W,X in next,w(P)do V[#V+1]=X end if#y(t,{R},V)>0 then M()
return end end if(U>B or not T)then M()end else M()end end end,function()local N
=J.Triggerbot if not N.Enabled then N.TargetChanged()return end local O=l(s,
'GetMouse')and s:GetMouse()if not O then N.TargetChanged()return end local P=ab.
CurrentCamera local Q,R,S=Ray.new(P.CFrame.Position,(O.Hit.Position-P.CFrame.
Position).Unit*1000),{s.Character,P},RaycastParams.new()S.
FilterDescendantsInstances=R S.FilterType=Enum.RaycastFilterType.Blacklist local
T=ab:Raycast(Q.Origin,Q.Direction,S)if not T then N.TargetChanged()return end
local U=T.Instance local V=U:FindFirstAncestorOfClass'Model'if not V then N.
TargetChanged()return end local W,X={},false for Y,Z in pairs(V:GetChildren())do
if Z.Name=='Head'or Z.Name:find'Torso'or Z.Name:find'Leg'or Z.Name:find'Arm'then
table.insert(W,Z)end end X=table.find(W,U)or U:IsDescendantOf(table.find(W,U))if
not X then N.TargetChanged()return end local Y=r:GetPlayerFromCharacter(V)if not
Y or Y==s then N.TargetChanged()return end local Z=J.DeveloperSettings.
TeamCheckOption if N.TeamCheck and l(Y,Z)and l(Y,Z)==l(s,Z)then N.TargetChanged(
)return end if N.AliveCheck then local _=v(V,'Humanoid')if l(_,'Health')<=0 then
N.TargetChanged()return end end N.TargetChanged(Y)task.wait(N.Delay)mouse1press(
)task.wait()mouse1release()end local P=function()H=l(p,'MouseDeltaSensitivity')
local P,Q,R,S,T,U=J.Aimbot,J.Triggerbot,J.FOVCircle,J.FOVCircleOutline,(J.
FOVSettings)D.RenderSteppedConnection=E(l(o,J.DeveloperSettings.UpdateMode),
function()local V,W=P.OffsetToMoveDirection,P.LockPart if T.Enabled and P.
Enabled then R.Color=(J.Locked and T.LockedColor)or T.Color S.Color=T.
OutlineColor R.Thickness=T.Thickness S.Thickness=T.Thickness+1 R.Position=z(p)S.
Position=z(p)R.NumSides=T.NumSides S.NumSides=T.NumSides R.Radius=T.Radius S.
Radius=T.Radius R.Transparency=1-T.Transparency S.Transparency=1-T.Transparency
R.Visible=T.Visible S.Visible=T.Visible else R.Visible=false S.Visible=false end
if Q.Enabled then O()end if C and P.Enabled then N()U=V and l(v(l(J.Locked,
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
tostring(d[1]or ad)end return d(c(ae(ad)))end}}function CreateButton(ae,b,c)
local d={Settings=b}assert(d.Settings.Name and type(d.Settings.Name)=='string',
'Missing button name or wrong type')local e=Instance.new'Frame'e.AutomaticSize=
Enum.AutomaticSize.Y e.BackgroundColor3=d.Settings.Color or Color3.fromRGB(30,30
,30)e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0 e.Size=UDim2.new(1,0
,0,40)e.Visible=d.Settings.Visible==nil and true or d.Settings.Visible e.Parent=
ae local f=Instance.new'UICorner'f.CornerRadius=UDim.new(0,5)f.Parent=e local g=
Instance.new'TextButton'g.AutoButtonColor=false g.AutomaticSize=Enum.
AutomaticSize.Y g.BackgroundColor3=Color3.fromRGB(255,255,255)g.
BackgroundTransparency=1 g.BorderColor3=Color3.fromRGB(0,0,0)g.BorderSizePixel=0
g.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)g.RichText=true g.Size=UDim2.new(1,0,0,40)g.Text=d.Settings.
Name g.TextColor3=Color3.fromRGB(156,156,156)g.TextSize=15 g.TextWrapped=true g.
TextXAlignment=Enum.TextXAlignment.Center local h=Instance.new'UIPadding'h.
PaddingBottom=UDim.new(0,12)h.PaddingLeft=UDim.new(0,15)h.PaddingRight=UDim.new(
0,15)h.PaddingTop=UDim.new(0,12)h.Parent=g g.Parent=e function d:UpdateSettings(
i)if i.Name then d.Settings.Name=i.Name g.Text=i.Name end if i.Color then d.
Settings.Color=i.Color e.BackgroundColor3=i.Color end if i.Callback then d.
Settings.Callback=i.Callback end if i.Visible~=nil then d.Settings.Visible=i.
Visible e.Visible=i.Visible end return d end local i=Instance.new'Frame'i.
BackgroundColor3=Color3.fromRGB(30,30,30)i.BorderColor3=Color3.fromRGB(0,0,0)i.
BorderSizePixel=0 i.Size=UDim2.new(1,0,0,1)i.Parent=ae function d:Continue()i.
Visible=false return d end function d:End()i.Visible=true return d end local j=
function()if d.Settings.Callback then ad.callback(d.Settings.Callback)end end g.
MouseButton1Click:Connect(j)if c then aa.Components[c]=d end return d:End()end
function CreateToggle(ae,b,c)local d={Settings=b,Type='Toggle'}assert(d.Settings
.Name and type(d.Settings.Name)=='string','Missing name or wrong type')local e=
Instance.new'Frame'e.AutomaticSize=Enum.AutomaticSize.Y e.BackgroundColor3=
Color3.fromRGB(255,255,255)e.BackgroundTransparency=1 e.BorderColor3=Color3.
fromRGB(0,0,0)e.BorderSizePixel=0 e.Size=UDim2.fromScale(1,0)e.Parent=ae e.
Visible=d.Settings.Visible==nil and true or d.Settings.Visible local f=Instance.
new'Frame'f.AutomaticSize=Enum.AutomaticSize.Y f.BackgroundColor3=Color3.
fromRGB(255,255,255)f.BackgroundTransparency=1 f.BorderColor3=Color3.fromRGB(0,0
,0)f.BorderSizePixel=0 f.Size=UDim2.new(1,-50,0,33)local g=Instance.new
'TextLabel'g.AutomaticSize=Enum.AutomaticSize.XY g.BackgroundColor3=Color3.
fromRGB(255,255,255)g.BackgroundTransparency=1 g.BorderColor3=Color3.fromRGB(0,0
,0)g.BorderSizePixel=0 g.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)g.RichText=true g.TextColor3=Color3.
fromRGB(225,225,225)g.TextSize=16 g.TextWrapped=true g.TextXAlignment=Enum.
TextXAlignment.Left g.Parent=f g.Text=d.Settings.Name local h=Instance.new
'UIListLayout'h.Name='UIListLayout'h.Padding=UDim.new(0,5)h.SortOrder=Enum.
SortOrder.LayoutOrder h.VerticalAlignment=Enum.VerticalAlignment.Center h.Parent
=f local i=Instance.new'TextLabel'i.AutomaticSize=Enum.AutomaticSize.XY i.
BackgroundColor3=Color3.fromRGB(255,255,255)i.BackgroundTransparency=1 i.
BorderColor3=Color3.fromRGB(0,0,0)i.BorderSizePixel=0 i.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)i.
LayoutOrder=1 i.RichText=true i.Text=d.Settings.Description or''i.TextColor3=
Color3.fromRGB(80,80,80)i.TextSize=12 i.TextWrapped=true i.TextXAlignment=Enum.
TextXAlignment.Left i.Parent=f i.Visible=d.Settings.Description and true or
false f.Parent=e local j=Instance.new'ImageLabel'j.AnchorPoint=Vector2.new(1,0.5
)j.BackgroundColor3=Color3.fromRGB(37,37,46)j.BackgroundTransparency=1 j.
BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0 j.Image=
'rbxassetid://86699956318312'j.ImageColor3=Color3.fromRGB(33,36,45)j.Position=
UDim2.fromScale(1,0.5)j.Size=UDim2.fromOffset(35,10)local k=Instance.new
'UIPadding'k.Name='ToggleUIPadding'k.PaddingBottom=UDim.new(0,1)k.PaddingLeft=
UDim.new(0,-8)k.PaddingTop=UDim.new(0,1)k.Parent=j local l=Instance.new
'ImageLabel'l.AnchorPoint=Vector2.new(1,0.5)l.BackgroundColor3=Color3.fromRGB(30
,34,47)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.
BorderSizePixel=0 l.Image='rbxassetid://83379579183005'l.ImageColor3=Color3.
fromRGB(156,156,156)l.Position=UDim2.fromScale(0.5,0.5)l.Size=UDim2.fromOffset(
14,14)l.Parent=j j.Parent=e local m=Instance.new'UIPadding'm.PaddingBottom=UDim.
new(0,8)m.PaddingTop=UDim.new(0,8)m.Parent=e local n=Instance.new'TextButton'n.
AutoButtonColor=false n.BackgroundTransparency=1 n.Size=UDim2.fromScale(1,1)n.
Text=''n.Parent=e d.Settings.State=d.Settings.State or false local o=function()
ad.tween(l,TweenInfo.new(0.2,Enum.EasingStyle.Exponential),{Position=UDim2.
fromScale(d.Settings.State and 1 or 0.5,0.5),ImageColor3=d.Settings.State and
Color3.fromRGB(138,193,227)or Color3.fromRGB(156,156,156)}):Play()if d.Settings.
Callback then ad.callback(d.Settings.Callback,d,d.Settings.State)end end n.
MouseButton1Click:Connect(function()d.Settings.State=not d.Settings.State o()end
)function d:UpdateSettings(p)if p.Name then d.Settings.Name=p.Name g.Text=p.Name
end if p.Description~=nil then d.Settings.Description=p.Description i.Text=p.
Description or''i.Visible=p.Description and true or false end if p.State~=nil
then d.Settings.State=p.State o()end if p.Callback then d.Settings.Callback=p.
Callback end if p.Visible~=nil then d.Settings.Visible=p.Visible e.Visible=p.
Visible end end local p=Instance.new'Frame'p.BackgroundColor3=Color3.fromRGB(30,
30,30)p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.Size=UDim2.new(1
,0,0,1)p.Parent=ae function d:Continue()p.Visible=false return d end function d:
End()p.Visible=true return d end o()if c then aa.Components[c]=d end return d:
End()end function CreateSlider(ae,b,c)local d={Settings=b,Type='Slider'}assert(d
.Settings.Name and type(d.Settings.Name)=='string','Missing name or wrong type')
assert(d.Settings.Value and type(d.Settings.Value)=='number',
'Missing value or wrong type')assert(d.Settings.Minimum and type(d.Settings.
Minimum)=='number','Missing minimum or wrong type')assert(d.Settings.Maximum and
type(d.Settings.Maximum)=='number','Missing maximum or wrong type')assert(d.
Settings.Minimum<=d.Settings.Maximum,'Minimum should be less than Maximum')
assert(d.Settings.Maximum>=d.Settings.Minimum,
'Maximum should be greater than Minimum')local e=Instance.new'Frame'e.
AutomaticSize=Enum.AutomaticSize.Y e.BackgroundColor3=Color3.fromRGB(255,255,255
)e.BackgroundTransparency=1 e.BorderColor3=Color3.fromRGB(0,0,0)e.
BorderSizePixel=0 e.Size=UDim2.fromScale(1,0)e.Visible=d.Settings.Visible==nil
and true or d.Settings.Visible e.Parent=ae local f=Instance.new'UIPadding'f.
PaddingBottom=UDim.new(0,8)f.PaddingTop=UDim.new(0,8)f.Parent=e local g=Instance
.new'Frame'g.AutomaticSize=Enum.AutomaticSize.Y g.BackgroundColor3=Color3.
fromRGB(255,255,255)g.BackgroundTransparency=1 g.BorderColor3=Color3.fromRGB(0,0
,0)g.BorderSizePixel=0 g.Size=UDim2.fromScale(1,0)local h=Instance.new'Frame'h.
AnchorPoint=Vector2.new(1,0.5)h.AutomaticSize=Enum.AutomaticSize.XY h.
BackgroundColor3=Color3.fromRGB(255,255,255)h.BackgroundTransparency=1 h.
BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0 h.LayoutOrder=1 h.Position
=UDim2.fromScale(1,0.5)local i=Instance.new'ImageLabel'i.AnchorPoint=Vector2.
new(1,0.5)i.BackgroundColor3=Color3.fromRGB(30,34,47)i.BackgroundTransparency=1
i.BorderColor3=Color3.fromRGB(0,0,0)i.BorderSizePixel=0 i.Image=
'rbxassetid://82545477110166'i.ImageColor3=Color3.fromRGB(150,150,150)i.Position
=UDim2.fromScale(1,0.5)i.Size=UDim2.fromOffset(20,20)i.Parent=h local j=Instance
.new'UIListLayout'j.FillDirection=Enum.FillDirection.Horizontal j.
HorizontalAlignment=Enum.HorizontalAlignment.Right j.Padding=UDim.new(0,6)j.
SortOrder=Enum.SortOrder.LayoutOrder j.VerticalAlignment=Enum.VerticalAlignment.
Center j.Parent=h local k=Instance.new'TextLabel'k.AnchorPoint=Vector2.new(0,0.5
)k.AutomaticSize=Enum.AutomaticSize.XY k.BackgroundColor3=Color3.fromRGB(255,255
,255)k.BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0,0)k.
BorderSizePixel=0 k.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)k.LayoutOrder=1 k.Position=UDim2.fromScale(0,0.5
)k.RichText=true k.Text='0'k.TextColor3=Color3.fromRGB(150,150,150)k.TextSize=16
k.TextWrapped=true k.TextXAlignment=Enum.TextXAlignment.Left k.Parent=h h.Parent
=g local l=Instance.new'Frame'l.AutomaticSize=Enum.AutomaticSize.Y l.
BackgroundColor3=Color3.fromRGB(255,255,255)l.BackgroundTransparency=1 l.
BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0 l.Size=UDim2.new(1,-80,0,0
)local m=Instance.new'TextLabel'm.AutomaticSize=Enum.AutomaticSize.XY m.
BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)m.
RichText=true m.Text=d.Settings.Name m.TextColor3=Color3.fromRGB(225,225,225)m.
TextSize=16 m.TextWrapped=true m.TextXAlignment=Enum.TextXAlignment.Left m.
Parent=l local n=Instance.new'UIListLayout'n.Name='UIListLayout'n.Padding=UDim.
new(0,5)n.SortOrder=Enum.SortOrder.LayoutOrder n.VerticalAlignment=Enum.
VerticalAlignment.Center n.Parent=l local o=Instance.new'TextLabel'o.
AutomaticSize=Enum.AutomaticSize.XY o.BackgroundColor3=Color3.fromRGB(255,255,
255)o.BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.
BorderSizePixel=0 o.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)o.LayoutOrder=1 o.RichText=true o.Text=d.
Settings.Description or''o.TextColor3=Color3.fromRGB(80,80,80)o.TextSize=12 o.
TextWrapped=true o.TextXAlignment=Enum.TextXAlignment.Left o.Parent=l o.Visible=
d.Settings.Description and true or false l.Parent=g local p=Instance.new
'UIListLayout'p.Name='UIListLayout'p.FillDirection=Enum.FillDirection.Horizontal
p.HorizontalAlignment=Enum.HorizontalAlignment.Center p.HorizontalFlex=Enum.
UIFlexAlignment.Fill p.Padding=UDim.new(0,5)p.SortOrder=Enum.SortOrder.
LayoutOrder p.VerticalAlignment=Enum.VerticalAlignment.Center p.Parent=g g.
Parent=e local q=Instance.new'UIListLayout'q.Name='UIListLayout'q.Padding=UDim.
new(0,15)q.SortOrder=Enum.SortOrder.LayoutOrder q.Parent=e local r=Instance.new
'TextButton'r.BackgroundColor3=Color3.fromRGB(37,37,46)r.BorderColor3=Color3.
fromRGB(0,0,0)r.BorderSizePixel=0 r.Size=UDim2.new(1,0,0,10)r.Text=''r.
AutoButtonColor=false local s=Instance.new'UICorner's.Name='UICorner's.
CornerRadius=UDim.new(0,15)s.Parent=r local t=Instance.new'Frame't.
BackgroundColor3=Color3.fromRGB(138,193,227)t.BorderColor3=Color3.fromRGB(0,0,0)
t.BorderSizePixel=0 t.Size=UDim2.new(0,0,0,10)local u=Instance.new'UICorner'u.
Name='UICorner'u.CornerRadius=UDim.new(0,15)u.Parent=t local v=Instance.new
'ImageLabel'v.AnchorPoint=Vector2.new(0.5,0.5)v.BackgroundColor3=Color3.fromRGB(
255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0,0)v.
BorderSizePixel=0 v.Image='rbxassetid://127947626656649'v.ImageColor3=Color3.
fromRGB(20,20,20)v.Position=UDim2.fromScale(1,0.5)v.Size=UDim2.fromOffset(26,20)
v.ZIndex=2 local w=Instance.new'ImageLabel'w.AnchorPoint=Vector2.new(0.5,0.5)w.
BackgroundColor3=Color3.fromRGB(255,255,255)w.BackgroundTransparency=1 w.
BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=0 w.Image=
'rbxassetid://98639906538385'w.ImageColor3=Color3.fromRGB(225,225,225)w.Position
=UDim2.fromScale(0.5,0.5)w.Size=UDim2.fromOffset(18,18)w.Parent=v v.Parent=r t.
Parent=r r.Parent=e local x=function()local x,y,z=10,10,r.AbsoluteSize.X local A
,B,C=z-(x+y),(d.Settings.Value-d.Settings.Minimum)/(d.Settings.Maximum-d.
Settings.Minimum),v.AbsoluteSize.X/2 t.Size=UDim2.new(0,A*B+C,0,10)v.Position=
UDim2.new(0,x+(A*B),0.5,0)local D=tonumber(string.format('%.'..(d.Settings.
Precision or 0)..'f',d.Settings.Value))local E=d.Settings.Filter and d.Settings.
Filter(D,d.Settings.Minimum,d.Settings.Maximum)k.Text=E or D end local y,z=
function(y)local z,A,B,C=10,10,y.Position.X,w.AbsoluteSize.X/2 local D,E,F=B-(C*
0.5),r.AbsolutePosition.X+z,r.AbsoluteSize.X-(z+A)D=math.clamp(D-E,0,F)local G=D
/F G=d.Settings.Minimum+G*(d.Settings.Maximum-d.Settings.Minimum)local H=d.
Settings.Step or 0 if H>0 then d.Settings.Value=math.round(G/H)*H else d.
Settings.Value=G end x()if d.Settings.Callback then ad.callback(d.Settings.
Callback,d,d.Settings.Value)end end,false local A=function(A)if A.UserInputType
==Enum.UserInputType.MouseButton1 then z=true y(A)if d.Settings.inputChanged
then ad.callback(d.Settings.inputChanged,d,d.Settings.Value,z)end end end r.
InputBegan:Connect(A)r.InputEnded:Connect(function(B)if B.UserInputType==Enum.
UserInputType.MouseButton1 then z=false if d.Settings.inputChanged then ad.
callback(d.Settings.inputChanged,d,d.Settings.Value,z)end end end)ac.
_userInputService.InputChanged:Connect(function(B)if z and B.UserInputType==Enum
.UserInputType.MouseMovement then y(B)end end)function d:UpdateSettings(B)if B.
Visible~=nil then d.Settings.Visible=B.Visible e.Visible=B.Visible end if B.Name
then d.Settings.Name=B.Name m.Text=B.Name end if B.Description~=nil then d.
Settings.Description=B.Description o.Text=B.Description or''o.Visible=B.
Description and true or false end if B.Minimum then d.Settings.Minimum=B.Minimum
end if B.Maximum then d.Settings.Maximum=B.Maximum end if B.Step~=nil then d.
Settings.Step=B.Step end if B.Precision~=nil then d.Settings.Precision=B.
Precision end if B.Filter then d.Settings.Filter=B.Filter end if B.Callback then
d.Settings.Callback=B.Callback end if B.inputChanged then d.Settings.
inputChanged=B.inputChanged end if B.Value then local C,D=d.Settings.Minimum,d.
Settings.Maximum local E,F=math.clamp(B.Value,C,D),d.Settings.Step or 0 if F>0
then E=math.round(E/F)*F end d.Settings.Value=E task.defer(function()if r.
AbsoluteSize.X==0 then r:GetPropertyChangedSignal'AbsoluteSize':Wait()end x()if
d.Settings.Callback then ad.callback(d.Settings.Callback,d,d.Settings.Value)end
end)end end local B=Instance.new'Frame'B.BackgroundColor3=Color3.fromRGB(30,30,
30)B.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.Size=UDim2.new(1,0,
0,1)B.Parent=ae function d:Continue()B.Visible=false return d end function d:End
()B.Visible=true return d end d:UpdateSettings(d.Settings)if c then aa.
Components[c]=d end return d:End()end function CreateInput(ae,b,c)local d,e={
Settings=b,Type='Input'},Instance.new'Frame'e.BackgroundColor3=Color3.fromRGB(30
,30,30)e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0 e.Size=UDim2.new(
1,0,0,40)e.Visible=d.Settings.Visible==nil and true or d.Settings.Visible e.
Parent=ae local f=Instance.new'UICorner'f.CornerRadius=UDim.new(0,5)f.Parent=e
local g=Instance.new'UIListLayout'g.FillDirection=Enum.FillDirection.Horizontal
g.Padding=UDim.new(0,15)g.SortOrder=Enum.SortOrder.LayoutOrder g.
VerticalAlignment=Enum.VerticalAlignment.Center g.Parent=e local h=Instance.new
'UIPadding'h.PaddingLeft=UDim.new(0,15)h.Parent=e local i=Instance.new'TextBox'i
.AnchorPoint=Vector2.new(0,0.5)i.BackgroundColor3=Color3.fromRGB(255,255,255)i.
BackgroundTransparency=1 i.BorderColor3=Color3.fromRGB(0,0,0)i.BorderSizePixel=0
i.ClearTextOnFocus=false i.ClipsDescendants=true i.CursorPosition=-1 i.FontFace=
Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
Normal)i.LayoutOrder=1 i.PlaceholderColor3=Color3.fromRGB(120,120,120)i.
PlaceholderText=d.Settings.Placeholder or'...'i.Size=UDim2.new(1,-50,1,0)i.Text=
d.Settings.Text or''i.TextColor3=Color3.fromRGB(156,156,156)i.TextSize=15 i.
TextXAlignment=Enum.TextXAlignment.Left i.Parent=e local j=Instance.new
'ImageLabel'j.BackgroundColor3=Color3.fromRGB(255,255,255)j.
BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
j.Image='rbxassetid://98129527229953'j.ImageColor3=Color3.fromRGB(156,156,156)j.
Size=UDim2.fromOffset(20,20)j.Parent=e i.FocusLost:Connect(function()if d.
Settings.CharacterSub=='Mathematic'then i.Text=ad.subParser[d.Settings.
CharacterSub](i.Text)end if d.Settings.Callback then ad.callback(d.Settings.
Callback,d,i.Text)end end)i:GetPropertyChangedSignal'Text':Connect(function()if
d.Settings.CharacterSub and d.Settings.CharacterSub~='Mathematic'and ad.
subParser[d.Settings.CharacterSub]then i.Text=ad.subParser[d.Settings.
CharacterSub](i.Text)elseif type(d.Settings.CharacterSub)=='function'then i.Text
=d.Settings.CharacterSub(i.Text)end if d.Settings.CharacterLimit then if string.
len(i.Text)>d.Settings.CharacterLimit then i.Text=string.sub(i.Text,1,d.Settings
.CharacterLimit)end end d.Settings.Text=i.Text if d.Settings.onTextChanged then
ad.callback(d.Settings.onTextChanged,d,i.Text)end end)function d:UpdateSettings(
k)if k.Text then d.Settings.Text=k.Text i.Text=k.Text if d.Settings.Callback
then ad.callback(d.Settings.Callback,d,i.Text)end end if k.Placeholder then d.
Settings.Placeholder=k.Placeholder i.PlaceholderText=k.Placeholder end if k.
Callback then d.Settings.Callback=k.Callback end if k.onTextChanged then d.
Settings.onTextChanged=k.onTextChanged end if k.Visible~=nil then d.Settings.
Visible=k.Visible e.Visible=k.Visible end end local k=Instance.new'Frame'k.
BackgroundColor3=Color3.fromRGB(30,30,30)k.BorderColor3=Color3.fromRGB(0,0,0)k.
BorderSizePixel=0 k.Size=UDim2.new(1,0,0,1)k.Parent=ae function d:Continue()k.
Visible=false return d end function d:End()k.Visible=true return d end d:
UpdateSettings(d.Settings)if c then aa.Components[c]=d end return d:End()end
function CreateMultiInput(ae,b,c)local d,e={Settings=b,Type='MultiInput'},
Instance.new'Frame'e.BackgroundColor3=Color3.fromRGB(30,30,30)e.
BackgroundTransparency=1 e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0
e.Size=UDim2.new(1,0,0,40)e.Parent=ae local f=Instance.new'UIListLayout'f.
FillDirection=Enum.FillDirection.Horizontal f.HorizontalFlex=Enum.
UIFlexAlignment.Fill f.Padding=UDim.new(0,5)f.SortOrder=Enum.SortOrder.
LayoutOrder f.VerticalAlignment=Enum.VerticalAlignment.Center f.Parent=e local g
={}for h,i in ipairs(d.Settings.Inputs)do local j=Instance.new'TextBox'j.
BackgroundColor3=Color3.fromRGB(30,30,30)j.BorderColor3=Color3.fromRGB(0,0,0)j.
BorderSizePixel=0 j.ClearTextOnFocus=false j.ClipsDescendants=true j.FontFace=
Font.new('rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.
Normal)j.LayoutOrder=1 j.PlaceholderColor3=Color3.fromRGB(120,120,120)j.
PlaceholderText=i.Placeholder or'...'j.Size=UDim2.fromScale(1,1)j.Text=i.Text or
''j.TextColor3=Color3.fromRGB(156,156,156)j.TextSize=15 j.TextXAlignment=Enum.
TextXAlignment.Left j.Parent=e g[h]={inputBox=j}local k=Instance.new'UIPadding'k
.PaddingLeft=UDim.new(0,10)k.PaddingRight=UDim.new(0,10)k.Parent=j local l=
Instance.new'UICorner'l.CornerRadius=UDim.new(0,5)l.Parent=j local m=i.
CharacterSub or'None'j.FocusLost:Connect(function()if d.Settings.Callback then
ad.callback(d.Settings.Callback,d,h,j.Text)end end)j:GetPropertyChangedSignal
'Text':Connect(function()if m and type(m)=='string'and ad.subParser[m]then j.
Text=ad.subParser[m](j.Text)elseif m and type(m)=='function'then j.Text=i.
CharacterSub(j.Text)end if i.CharacterLimit then if string.len(j.Text)>i.
CharacterLimit then j.Text=string.sub(j.Text,1,i.CharacterLimit)end end i.Text=j
.Text if d.Settings.onTextChanged then ad.callback(d.Settings.onTextChanged,d,h,
j.Text)end end)end function d:UpdateSettings(h,i)local j,k=d.Settings.Inputs[h],
g[h]if j and k then if i.Text~=nil then j.Text=i.Text k.inputBox.Text=i.Text if
d.Settings.Callback then ad.callback(d.Settings.Callback,d,h,i.Text)end end if i
.Placeholder~=nil then j.Placeholder=i.Placeholder k.inputBox.PlaceholderText=i.
Placeholder end end if i.Callback~=nil then d.Settings.Callback=i.Callback end
if i.onTextChanged~=nil then d.Settings.onTextChanged=i.onTextChanged end if i.
Visible~=nil then d.Settings.Visible=i.Visible e.Visible=i.Visible end end local
h=Instance.new'Frame'h.BackgroundColor3=Color3.fromRGB(30,30,30)h.BorderColor3=
Color3.fromRGB(0,0,0)h.BorderSizePixel=0 h.Size=UDim2.new(1,0,0,1)h.Parent=ae
function d:Continue()h.Visible=false return d end function d:End()h.Visible=true
return d end for i,j in pairs(d.Settings.Inputs)do d:UpdateSettings(i,j)end if c
then aa.Components[c]=d end return d:End()end function CreateDropdown(ae,b,c)
local d={Settings=b,Type='Dropdown'}assert(d.Settings.Name and type(d.Settings.
Name)=='string','Missing name or wrong type')local e=Instance.new'Frame'e.
AutomaticSize=Enum.AutomaticSize.Y e.BackgroundColor3=Color3.fromRGB(255,255,255
)e.BackgroundTransparency=1 e.BorderColor3=Color3.fromRGB(0,0,0)e.
BorderSizePixel=0 e.Size=UDim2.fromScale(1,0)e.Parent=ae local f=Instance.new
'UIPadding'f.PaddingBottom=UDim.new(0,8)f.PaddingTop=UDim.new(0,8)f.Parent=e
local g=Instance.new'UIListLayout'g.Padding=UDim.new(0,15)g.SortOrder=Enum.
SortOrder.LayoutOrder g.Parent=e local h=Instance.new'TextButton'h.
AutoButtonColor=false h.AutomaticSize=Enum.AutomaticSize.Y h.BackgroundColor3=
Color3.fromRGB(30,30,30)h.BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0
h.ClipsDescendants=true h.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.Bold,Enum.FontStyle.Normal)h.LayoutOrder=1 h.Position=UDim2.
fromScale(0,0.16)h.Size=UDim2.new(1,0,0,40)h.Text=''h.TextColor3=Color3.fromRGB(
156,156,156)h.TextSize=15 h.TextXAlignment=Enum.TextXAlignment.Left h.
TextYAlignment=Enum.TextYAlignment.Top local i=Instance.new'UIPadding'i.
PaddingBottom=UDim.new(0,10)i.PaddingLeft=UDim.new(0,15)i.PaddingRight=UDim.new(
0,15)i.PaddingTop=UDim.new(0,10)i.Parent=h local j=Instance.new'UICorner'j.
CornerRadius=UDim.new(0,5)j.Parent=h local k=Instance.new'Frame'k.AutomaticSize=
Enum.AutomaticSize.Y k.BackgroundColor3=Color3.fromRGB(255,255,255)k.
BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0,0)k.BorderSizePixel=0
k.Size=UDim2.fromScale(1,0)local l=Instance.new'ImageLabel'l.AnchorPoint=Vector2
.new(1,0.5)l.BackgroundColor3=Color3.fromRGB(30,34,47)l.BackgroundTransparency=1
l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0 l.Image=
'rbxassetid://77136690433593'l.ImageColor3=Color3.fromRGB(150,150,150)l.
LayoutOrder=1 l.Position=UDim2.fromScale(1,0.5)l.Size=UDim2.fromOffset(18,18)l.
Parent=k local m=Instance.new'TextLabel'm.AutomaticSize=Enum.AutomaticSize.Y m.
BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)m.
RichText=true m.Size=UDim2.new(1,-35,0,20)m.Text='...'m.TextColor3=Color3.
fromRGB(156,156,156)m.TextSize=15 m.TextWrapped=true m.TextXAlignment=Enum.
TextXAlignment.Left m.Parent=k k.Parent=h h.Parent=e local n=Instance.new'Frame'
n.AutomaticSize=Enum.AutomaticSize.Y n.BackgroundColor3=Color3.fromRGB(255,255,
255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.
BorderSizePixel=0 n.Size=UDim2.new(1,0,0,33)local o=Instance.new'TextLabel'o.
AutomaticSize=Enum.AutomaticSize.XY o.BackgroundColor3=Color3.fromRGB(255,255,
255)o.BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.
BorderSizePixel=0 o.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)o.RichText=true o.Text='Name'o.TextColor3=Color3
.fromRGB(225,225,225)o.TextSize=16 o.TextWrapped=true o.TextXAlignment=Enum.
TextXAlignment.Left o.Parent=n local p=Instance.new'UIListLayout'p.Padding=UDim.
new(0,5)p.SortOrder=Enum.SortOrder.LayoutOrder p.VerticalAlignment=Enum.
VerticalAlignment.Center p.Parent=n local q=Instance.new'TextLabel'q.
AutomaticSize=Enum.AutomaticSize.XY q.BackgroundColor3=Color3.fromRGB(255,255,
255)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.
BorderSizePixel=0 q.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)q.LayoutOrder=1 q.RichText=true q.Text=
'description'q.TextColor3=Color3.fromRGB(80,80,80)q.TextSize=12 q.TextWrapped=
true q.TextXAlignment=Enum.TextXAlignment.Left q.Parent=n q.Visible=d.Settings.
Description and true or false n.Parent=e local r=Instance.new'Frame'r.Name=
'dropdownFrame'r.BackgroundColor3=Color3.fromRGB(30,30,30)r.BorderColor3=Color3.
fromRGB(0,0,0)r.BorderSizePixel=0 r.Size=UDim2.fromOffset(350,150)local s=
Instance.new'ScrollingFrame's.Name='dropdownContent's.Active=true s.
AutomaticCanvasSize=Enum.AutomaticSize.Y s.BackgroundColor3=Color3.fromRGB(30,30
,30)s.BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.
BorderSizePixel=0 s.CanvasSize=UDim2.new()s.ScrollBarImageTransparency=0.7 s.
ScrollBarThickness=3 s.Size=UDim2.fromScale(1,1)local t=Instance.new
'UIListLayout't.Name='UIListLayout't.SortOrder=Enum.SortOrder.LayoutOrder t.
Parent=s local u=Instance.new'UIPadding'u.Name='UIPadding'u.PaddingRight=UDim.
new(0,15)u.Parent=s s.Parent=r local v=Instance.new'UIPadding'v.Name='UIPadding'
v.PaddingBottom=UDim.new(0,10)v.PaddingLeft=UDim.new(0,15)v.PaddingTop=UDim.new(
0,3)v.Parent=r local w=Instance.new'UICorner'w.Name='UICorner'w.CornerRadius=
UDim.new(0,5)w.Parent=r local x,y,z,A,B,C=false,false,false,{},{},{Selected=
Color3.fromRGB(225,225,225),Unselected=Color3.fromRGB(156,156,156)}table.insert(
ab.dropdownFrames,r)local D=function(D)local E,F='...',{}for G,H in ipairs(A)do
local I=B[H].Text table.insert(F,I)end if#F==1 then E=F[1]elseif#F>1 then E=
table.concat(F,', ')end m.Text=E d.Settings.Value=F if D and d.Settings.Callback
then ad.callback(d.Settings.Callback,d,F)end end local E=function(E)local F,G=d.
Settings.Limit,d.Settings.Minimum or 0 if table.find(A,E)then if#A-1<G then
return end table.remove(A,table.find(A,E))ad.tween(B[E],TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{TextColor3=C.Unselected}):Play()else if F and#A>=F then local
H=table.remove(A,1)ad.tween(B[H],TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
TextColor3=C.Unselected}):Play()end table.insert(A,E)ad.tween(B[E],TweenInfo.
new(0.1,Enum.EasingStyle.Sine),{TextColor3=C.Selected}):Play()end D(true)end
local F,G=function(F)for G,H in ipairs(F)do local I=Instance.new'TextButton'I.
Name='Button'I.AutoButtonColor=false I.AutomaticSize=Enum.AutomaticSize.Y I.
BackgroundTransparency=1 I.BorderSizePixel=0 I.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)I.
RichText=true I.Size=UDim2.fromScale(1,0)I.Text=H I.TextColor3=Color3.fromRGB(
156,156,156)I.TextSize=15 I.TextWrapped=true I.TextXAlignment=Enum.
TextXAlignment.Left I.Parent=s I.LayoutOrder=G local J=Instance.new'UIPadding'J.
Name='UIPadding'J.PaddingBottom=UDim.new(0,15)J.PaddingTop=UDim.new(0,15)J.
Parent=I I.MouseButton1Click:Connect(function()E(H)end)B[H]=I end end,function()
r.Position=UDim2.new(0,h.AbsolutePosition.X,0,h.AbsolutePosition.Y+(h.
AbsoluteSize.Y*2)+25)end local H=function()if z then return end z=true if y then
ad.tween(l,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=0}):Play()local H=
ad.tween(r,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(h.
AbsoluteSize.X,0)})H:Play()H.Completed:Wait()r.Parent=nil y=false else ad.tween(
l,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=180}):Play()for H,I in
pairs(ab.dropdownFrames)do if I==r then I.Size=UDim2.fromOffset(h.AbsoluteSize.X
,0)I.Parent=ab.gui ad.tween(I,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=
UDim2.fromOffset(h.AbsoluteSize.X,150)}):Play()G()else local J=ad.tween(I,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.fromOffset(h.AbsoluteSize.X
,0)})J.Completed:Connect(function()I.Parent=nil end)J:Play()end end y=true end z
=false end h.MouseButton1Click:Connect(H)h:GetPropertyChangedSignal
'AbsolutePosition':Connect(G)h:GetPropertyChangedSignal'AbsoluteSize':Connect(G)
r.MouseEnter:Connect(function()x=true end)r.MouseLeave:Connect(function()x=false
end)ac._userInputService.InputBegan:Connect(function(I)if I.UserInputType==Enum.
UserInputType.MouseButton1 and not x and r.Parent then H()end end)function d:
Insert(I)F(I)end function d:Remove(I)for J,K in ipairs(I)do for L=#d.Settings.
Options,1,-1 do if d.Settings.Options[L]==K then table.remove(d.Settings.Options
,L)end end if B[K]then B[K]:Destroy()B[K]=nil end for L=#A,1,-1 do if A[L]==K
then table.remove(A,L)end end D()end end function d:UpdateSettings(I)if I.
Visible~=nil then e=I.Visible end if I.Name then d.Settings.Name=I.Name o.Text=I
.Name end if I.Description~=nil then d.Settings.Description=I.Description q.Text
=I.Description or''q.Visible=I.Description and true or false end if I.Limit~=nil
then d.Settings.Limit=I.Limit end if I.Minimum then d.Settings.Minimum=I.Minimum
end if I.Callback then d.Settings.Callback=I.Callback end if I.Options then d.
Settings.Options=I.Options for J,K in pairs(B)do K:Destroy()end B={}F(I.Options)
end if I.Value~=nil then if type(I.Value)=='string'then E(I.Value)elseif type(I.
Value)=='table'then for J,K in pairs(I.Value)do E(K)end end end end local I=
Instance.new'Frame'I.BackgroundColor3=Color3.fromRGB(30,30,30)I.BorderColor3=
Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.Size=UDim2.new(1,0,0,1)I.Parent=ae
function d:Continue()I.Visible=false return d end function d:End()I.Visible=true
return d end d:UpdateSettings(d.Settings)if c then aa.Components[c]=d end return
d:End()end function CreateColorpicker(ae,b,c)local d={Settings=b,Type=
'Colorpicker'}function d:UpdateSettings(e)end local e=Instance.new'Frame'e.
BackgroundColor3=Color3.fromRGB(30,30,30)e.BorderColor3=Color3.fromRGB(0,0,0)e.
BorderSizePixel=0 e.Size=UDim2.new(1,0,0,1)e.Parent=ae function d:Continue()e.
Visible=false return d end function d:End()e.Visible=true return d end if c then
aa.Components[c]=d end return d:End()end function CreateKeybind(ae,b,c)local d,e
={Settings=b,Type='Keybind'},Instance.new'Frame'e.AutomaticSize=Enum.
AutomaticSize.Y e.BackgroundColor3=Color3.fromRGB(0,0,0)e.BackgroundTransparency
=1 e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0 e.Size=UDim2.
fromScale(1,0)e.Visible=d.Settings.Visible==nil and true or d.Settings.Visible e
.Parent=ae local h=Instance.new'TextButton'h.AutoButtonColor=false h.
AutomaticSize=Enum.AutomaticSize.Y h.BackgroundColor3=Color3.fromRGB(30,30,30)h.
BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0 h.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'h.Size=UDim2.new(1,0,0,40)h.Text=
''h.TextColor3=Color3.fromRGB(0,0,0)h.TextSize=14 local k=Instance.new
'TextLabel'k.AnchorPoint=Vector2.new(0,0.5)k.AutomaticSize=Enum.AutomaticSize.XY
k.BackgroundColor3=Color3.fromRGB(255,255,255)k.BackgroundTransparency=1 k.
BorderColor3=Color3.fromRGB(0,0,0)k.BorderSizePixel=0 k.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)k.
LayoutOrder=1 k.Position=UDim2.fromScale(0,0.5)k.TextColor3=Color3.fromRGB(156,
156,156)k.TextSize=15 k.TextWrapped=true k.TextXAlignment=Enum.TextXAlignment.
Left k.Text='Unbinded'local l=Instance.new'UIPadding'l.PaddingBottom=UDim.new(0,
10)l.PaddingRight=UDim.new(0,50)l.PaddingTop=UDim.new(0,10)l.Parent=k k.Parent=h
local m=Instance.new'UIPadding'm.PaddingLeft=UDim.new(0,15)m.Parent=h local n=
Instance.new'UIListLayout'n.FillDirection=Enum.FillDirection.Horizontal n.
Padding=UDim.new(0,15)n.SortOrder=Enum.SortOrder.LayoutOrder n.VerticalAlignment
=Enum.VerticalAlignment.Center n.Parent=h local o=Instance.new'ImageLabel'o.
BackgroundColor3=Color3.fromRGB(255,255,255)o.BackgroundTransparency=1 o.
BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.Image=
'rbxassetid://94052787260057'o.ImageColor3=Color3.fromRGB(156,156,156)o.Size=
UDim2.fromOffset(20,20)o.Parent=h local p=Instance.new'UICorner'p.CornerRadius=
UDim.new(0,5)p.Parent=h h.Parent=e local q,r,s={Selected=Color3.fromRGB(225,225,
225),Unselected=Color3.fromRGB(156,156,156)},false,function(q)if q then o.
Visible=false k.Text='Press a key'k.Size=UDim2.fromScale(1,0)k.TextXAlignment=
Enum.TextXAlignment.Center l.PaddingRight=UDim.new(0,15)h.Active=false h.
Interactable=false elseif q==false then o.Visible=true k.Size=UDim2.fromScale(0,
0)k.TextXAlignment=Enum.TextXAlignment.Left l.PaddingRight=UDim.new(0,50)h.
Active=true h.Interactable=true else o.Visible=true k.Text='Unbinded'k.Size=
UDim2.fromScale(0,0)k.TextXAlignment=Enum.TextXAlignment.Left l.PaddingRight=
UDim.new(0,50)h.Active=true h.Interactable=true end end if d.Settings.Bind then
s(false)if d.Settings.Bind.EnumType==Enum.KeyCode then k.Text=ad.parseKeyCode(d.
Settings.Bind)elseif d.Settings.Bind==Enum.UserInputType.MouseButton1 or d.
Settings.Bind==Enum.UserInputType.MouseButton2 then k.Text=ad.parseKeyCode(d.
Settings.Bind)end else s(nil)end e.MouseEnter:Connect(function()ad.tween(o,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageColor3=q.Selected}):Play()ad.
tween(k,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=q.Selected}):Play()
end)e.MouseLeave:Connect(function()ad.tween(o,TweenInfo.new(0.1,Enum.EasingStyle
.Sine),{ImageColor3=q.Unselected}):Play()ad.tween(k,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{TextColor3=q.Unselected}):Play()end)h.InputEnded:Connect(
function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.
UserInputType==Enum.UserInputType.Touch then r=true s(true)end end)ac.
_userInputService.InputBegan:Connect(function(t,u)if r and not u and not(d.
Settings.Blacklist and(table.find(d.Settings.Blacklist,t.KeyCode)or table.find(d
.Settings.Blacklist,t.UserInputType)))then if t.UserInputType==Enum.
UserInputType.Keyboard then d.Settings.Bind=t.KeyCode k.Text=ad.parseKeyCode(t.
KeyCode)s(false)if d.Settings.onChanged then ad.callback(d.Settings.onChanged,d,
d.Settings.Bind)end r=false elseif t.UserInputType==Enum.UserInputType.
MouseButton1 or t.UserInputType==Enum.UserInputType.MouseButton2 then d.Settings
.Bind=t.UserInputType k.Text=ad.parseKeyCode(t.UserInputType)s(false)if d.
Settings.onChanged then ad.callback(d.Settings.onChanged,d,d.Settings.Bind)end r
=false end end end)ac._userInputService.InputBegan:Connect(function(t,u)if not r
then if t.KeyCode==d.Settings.Bind or t.UserInputType==d.Settings.Bind then if d
.Settings.Callback then ad.callback(d.Settings.Callback,d,u)end if d.Settings.
onHeld then ad.callback(d.Settings.onHeld,d,true,u)end end end end)ac.
_userInputService.InputEnded:Connect(function(t,u)if not r and(t.KeyCode==d.
Settings.Bind or t.UserInputType==d.Settings.Bind)then if d.Settings.onHeld then
ad.callback(d.Settings.onHeld,d,false,u)end end end)function d:UpdateSettings(t)
if t.Visible~=nil then d.Settings.Visible=t.Visible e.Visible=t.Visible end if t
.Bind then d.Settings.Bind=t.Bind s(false)if d.Settings.Bind.EnumType==Enum.
KeyCode then k.Text=ad.parseKeyCode(d.Settings.Bind)elseif d.Settings.Bind==Enum
.UserInputType.MouseButton1 or d.Settings.Bind==Enum.UserInputType.MouseButton2
then k.Text=ad.parseKeyCode(d.Settings.Bind)end if t.Callback then ad.callback(d
.Settings.Callback,d,false)end end if t.Callback then d.Settings.Callback=t.
Callback end if t.onHeld then d.Settings.onHeld=t.onHeld end if t.onChanged then
d.Settings.onChanged=t.onChanged end end local t=Instance.new'Frame't.
BackgroundColor3=Color3.fromRGB(30,30,30)t.BorderColor3=Color3.fromRGB(0,0,0)t.
BorderSizePixel=0 t.Size=UDim2.new(1,0,0,1)t.Parent=ae function d:Continue()t.
Visible=false return d end function d:End()t.Visible=true return d end d:
UpdateSettings(d.Settings)if c then aa.Components[c]=d end return d:End()end
function CreateDivider(ae,b,c)local d,e={Settings=b},Instance.new'Frame'e.
BackgroundColor3=Color3.fromRGB(30,30,30)e.BorderColor3=Color3.fromRGB(0,0,0)e.
BorderSizePixel=0 e.Size=UDim2.new(1,0,0,1)e.Parent=ae e.Visible=d.Settings and(
d.Settings.Visible==nil and true or d.Settings.Visible)or true function d:
UpdateSettings(h)if h.Visible~=nil then d.Settings.Visible=h.Visible e.Visible=h
.Visible end end if c then aa.Components[c]=d end return d end local ae={Button=
CreateButton,Toggle=CreateToggle,Keybind=CreateKeybind,Dropdown=CreateDropdown,
Colorpicker=CreateColorpicker,MultiInput=CreateMultiInput,Input=CreateInput,
Slider=CreateSlider,Divider=CreateDivider}local b=function(b)for c,d in pairs(ae
)do b[c]=function(e,...)return d(e.Content,...)end end end function aa:Window(c)
local d={Settings=c}assert(d.Settings.Title and type(d.Settings.Title)=='string'
,'Missing window title or wrong type')d.Settings.Keybind=d.Settings.Keybind or
Enum.KeyCode.RightControl local e=Instance.new'ImageLabel'e.BackgroundColor3=
Color3.fromRGB(17,17,17)e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0
e.ClipsDescendants=true e.Image='rbxassetid://17365187482'e.ImageTransparency=
0.96 e.ScaleType=Enum.ScaleType.Tile e.Size=UDim2.fromOffset(400,672)e.TileSize=
UDim2.fromOffset(500,325)local h=Instance.new'Frame'h.AutomaticSize=Enum.
AutomaticSize.XY h.BackgroundColor3=Color3.fromRGB(255,255,255)h.
BackgroundTransparency=1 h.BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0
local k=Instance.new'TextLabel'k.AutomaticSize=Enum.AutomaticSize.XY k.
BackgroundColor3=Color3.fromRGB(255,255,255)k.BackgroundTransparency=1 k.
BorderColor3=Color3.fromRGB(0,0,0)k.BorderSizePixel=0 k.FontFace=Font.new(
'rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.FontStyle.Normal)k.
RichText=true k.Text=d.Settings.Title k.TextColor3=Color3.fromRGB(255,255,255)k.
TextSize=35 k.TextWrapped=true k.TextXAlignment=Enum.TextXAlignment.Left k.
Parent=h local l=Instance.new'UIPadding'l.PaddingLeft=UDim.new(0,25)l.
PaddingRight=UDim.new(0,25)l.Parent=h local m=Instance.new'Frame'm.AnchorPoint=
Vector2.new(0,1)m.BackgroundColor3=Color3.fromRGB(255,255,255)m.
BackgroundTransparency=0.9 m.BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel
=0 m.Position=UDim2.new(0,0,1,10)m.Size=UDim2.new(0.95,0,0,1)local n=Instance.
new'Frame'n.BackgroundColor3=Color3.fromRGB(185,228,255)n.BorderColor3=Color3.
fromRGB(0,0,0)n.BorderSizePixel=0 n.Size=UDim2.new(0.5,0,0,1)n.Parent=m m.Parent
=h local o=Instance.new'UIListLayout'o.Padding=UDim.new(0,10)o.SortOrder=Enum.
SortOrder.LayoutOrder o.VerticalAlignment=Enum.VerticalAlignment.Center o.Parent
=h h.Parent=e local p=Instance.new'UICorner'p.CornerRadius=UDim.new(0,15)p.
Parent=e local q=Instance.new'UIPadding'q.PaddingBottom=UDim.new(0,25)q.
PaddingTop=UDim.new(0,25)q.Parent=e local r=Instance.new'Frame'r.AnchorPoint=
Vector2.new(0,1)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0
r.ClipsDescendants=true r.LayoutOrder=1 r.Position=UDim2.fromScale(0,1)r.Size=
UDim2.new(1,0,1,-55)local s=Instance.new'ScrollingFrame's.Active=true s.
AutomaticCanvasSize=Enum.AutomaticSize.X s.AutomaticSize=Enum.AutomaticSize.Y s.
BackgroundColor3=Color3.fromRGB(255,255,255)s.BackgroundTransparency=1 s.
BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.CanvasSize=UDim2.new()s.
ScrollBarImageTransparency=1 s.ScrollBarThickness=1 s.ScrollingDirection=Enum.
ScrollingDirection.X s.Size=UDim2.fromScale(1,0)local t=Instance.new
'UIListLayout't.FillDirection=Enum.FillDirection.Horizontal t.Padding=UDim.new(0
,10)t.SortOrder=Enum.SortOrder.LayoutOrder t.Parent=s local u=Instance.new
'UIPadding'u.PaddingBottom=UDim.new(0,10)u.PaddingLeft=UDim.new(0,26)u.
PaddingRight=UDim.new(0,26)u.PaddingTop=UDim.new(0,1)u.Parent=s s.Parent=r local
v=Instance.new'UIListLayout'v.Padding=UDim.new(0,25)v.SortOrder=Enum.SortOrder.
LayoutOrder v.Parent=r local w=Instance.new'Frame'w.BackgroundColor3=Color3.
fromRGB(255,255,255)w.BackgroundTransparency=1 w.BorderColor3=Color3.fromRGB(0,0
,0)w.BorderSizePixel=0 w.Size=UDim2.new(1,0,1,-104)w.Parent=r r.Parent=e local x
=Instance.new'UIListLayout'x.Padding=UDim.new(0,30)x.SortOrder=Enum.SortOrder.
LayoutOrder x.Parent=e e.Parent=ab.overlay local y=Instance.new'UIPadding'y.
PaddingBottom=UDim.new(0,15)y.PaddingLeft=UDim.new(0,15)y.PaddingRight=UDim.new(
0,15)y.PaddingTop=UDim.new(0,15)y.Parent=ab.overlay local z=Instance.new
'ImageLabel'z.BackgroundColor3=Color3.fromRGB(17,17,17)z.BorderColor3=Color3.
fromRGB(0,0,0)z.BorderSizePixel=0 z.ClipsDescendants=true z.Image=
'rbxassetid://17365187482'z.ImageTransparency=0.96 z.ScaleType=Enum.ScaleType.
Tile z.Size=UDim2.fromOffset(400,570)z.TileSize=UDim2.fromOffset(500,325)z.
Visible=false z.ZIndex=0 z.Position=UDim2.fromOffset(e.AbsoluteSize.X+15,0)local
A=Instance.new'UICorner'A.CornerRadius=UDim.new(0,15)A.Parent=z local B=Instance
.new'UIPadding'B.PaddingBottom=UDim.new(0,25)B.PaddingLeft=UDim.new(0,25)B.
PaddingRight=UDim.new(0,15)B.PaddingTop=UDim.new(0,20)B.Parent=z local C=
Instance.new'Frame'C.AutomaticSize=Enum.AutomaticSize.XY C.BackgroundColor3=
Color3.fromRGB(255,255,255)C.BackgroundTransparency=1 C.BorderColor3=Color3.
fromRGB(0,0,0)C.BorderSizePixel=0 local D=Instance.new'TextLabel'D.AutomaticSize
=Enum.AutomaticSize.XY D.BackgroundColor3=Color3.fromRGB(255,255,255)D.
BackgroundTransparency=1 D.BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0
D.FontFace=Font.new('rbxassetid://16658237174',Enum.FontWeight.ExtraBold,Enum.
FontStyle.Normal)D.Text='Visual Preview'D.TextColor3=Color3.fromRGB(255,255,255)
D.TextSize=30 D.TextWrapped=true D.TextXAlignment=Enum.TextXAlignment.Left D.
Parent=C local E=Instance.new'Frame'E.AnchorPoint=Vector2.new(0,1)E.
BackgroundColor3=Color3.fromRGB(255,255,255)E.BackgroundTransparency=0.9 E.
BorderColor3=Color3.fromRGB(0,0,0)E.BorderSizePixel=0 E.Position=UDim2.new(0,0,1
,10)E.Size=UDim2.new(0.95,0,0,1)local F=Instance.new'Frame'F.BackgroundColor3=
Color3.fromRGB(185,228,255)F.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel
=0 F.Size=UDim2.new(0.5,0,0,1)F.Parent=E E.Parent=C C.Parent=z local G=Instance.
new'UIListLayout'G.Padding=UDim.new(0,40)G.SortOrder=Enum.SortOrder.LayoutOrder
G.Parent=z local H=Instance.new'Frame'H.AnchorPoint=Vector2.new(0,1)H.
BackgroundColor3=Color3.fromRGB(255,255,255)H.BackgroundTransparency=1 H.
BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0 H.LayoutOrder=1 H.Position
=UDim2.fromScale(0,1)H.Size=UDim2.new(1,0,1,-70)local I=Instance.new'Frame'I.
BackgroundColor3=Color3.fromRGB(255,255,255)I.BackgroundTransparency=1 I.
BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.LayoutOrder=1 I.Size=
UDim2.new(1,0,1,-18)local J=Instance.new'Frame'J.AnchorPoint=Vector2.new(1,0)J.
BackgroundColor3=Color3.fromRGB(58,161,47)J.BorderColor3=Color3.fromRGB(0,0,0)J.
BorderSizePixel=0 J.Position=UDim2.fromOffset(-10,0)J.Size=UDim2.new(0,12,1,0)J.
Visible=false J.Parent=I local K=Instance.new'Frame'K.AnchorPoint=Vector2.new(
0.5,1)K.BackgroundColor3=Color3.fromRGB(15,15,15)K.BorderColor3=Color3.fromRGB(0
,0,0)K.BorderSizePixel=0 K.LayoutOrder=1 K.Position=UDim2.fromScale(0.5,1)K.Size
=UDim2.fromScale(1,1)local L=Instance.new'Frame'L.BackgroundColor3=Color3.
fromRGB(255,255,255)L.BackgroundTransparency=1 L.BorderColor3=Color3.fromRGB(0,0
,0)L.BorderSizePixel=0 L.Size=UDim2.fromScale(1,1)L.Visible=false L.ZIndex=2
local M=Instance.new'Frame'M.BackgroundColor3=Color3.fromRGB(255,255,255)M.
BorderColor3=Color3.fromRGB(0,0,0)M.BorderSizePixel=0 M.Size=UDim2.fromOffset(2,
30)M.Parent=L local N=Instance.new'Frame'N.BackgroundColor3=Color3.fromRGB(255,
255,255)N.BorderColor3=Color3.fromRGB(0,0,0)N.BorderSizePixel=0 N.Size=UDim2.
fromOffset(30,2)N.Parent=L local O=Instance.new'Frame'O.AnchorPoint=Vector2.new(
0,1)O.BackgroundColor3=Color3.fromRGB(255,255,255)O.BorderColor3=Color3.fromRGB(
0,0,0)O.BorderSizePixel=0 O.Position=UDim2.fromScale(0,1)O.Size=UDim2.
fromOffset(30,2)O.Parent=L local P=Instance.new'Frame'P.AnchorPoint=Vector2.new(
0,1)P.BackgroundColor3=Color3.fromRGB(255,255,255)P.BorderColor3=Color3.fromRGB(
0,0,0)P.BorderSizePixel=0 P.Position=UDim2.fromScale(0,1)P.Size=UDim2.
fromOffset(2,30)P.Parent=L local Q=Instance.new'Frame'Q.AnchorPoint=Vector2.new(
1,1)Q.BackgroundColor3=Color3.fromRGB(255,255,255)Q.BorderColor3=Color3.fromRGB(
0,0,0)Q.BorderSizePixel=0 Q.Position=UDim2.fromScale(1,1)Q.Size=UDim2.
fromOffset(2,30)Q.Parent=L local R=Instance.new'Frame'R.AnchorPoint=Vector2.new(
1,1)R.BackgroundColor3=Color3.fromRGB(255,255,255)R.BorderColor3=Color3.fromRGB(
0,0,0)R.BorderSizePixel=0 R.Position=UDim2.fromScale(1,1)R.Size=UDim2.
fromOffset(30,2)R.Parent=L local S=Instance.new'Frame'S.AnchorPoint=Vector2.new(
1,0)S.BackgroundColor3=Color3.fromRGB(255,255,255)S.BorderColor3=Color3.fromRGB(
0,0,0)S.BorderSizePixel=0 S.Position=UDim2.fromScale(1,0)S.Size=UDim2.
fromOffset(2,30)S.Parent=L local T=Instance.new'Frame'T.AnchorPoint=Vector2.new(
1,0)T.BackgroundColor3=Color3.fromRGB(255,255,255)T.BorderColor3=Color3.fromRGB(
0,0,0)T.BorderSizePixel=0 T.Position=UDim2.fromScale(1,0)T.Size=UDim2.
fromOffset(30,2)T.Parent=L L.Parent=K local U=Instance.new'ImageLabel'U.
AnchorPoint=Vector2.new(0.5,0.5)U.BackgroundColor3=Color3.fromRGB(255,255,255)U.
BackgroundTransparency=1 U.BorderColor3=Color3.fromRGB(0,0,0)U.BorderSizePixel=0
U.Image='rbxassetid://109289851861610'U.Position=UDim2.fromScale(0.5,0.5)U.
ScaleType=Enum.ScaleType.Fit U.Size=UDim2.new(1,-20,1,-20)local V=Instance.new
'UIGradient'V.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(101,143,175)),ColorSequenceKeypoint.new(1,Color3.fromRGB(197,173,128))}V
.Offset=Vector2.new(0,0.15)V.Rotation=90 V.Parent=U U.Parent=K local W=Instance.
new'TextLabel'W.AnchorPoint=Vector2.new(0,1)W.AutomaticSize=Enum.AutomaticSize.
XY W.BackgroundColor3=Color3.fromRGB(255,255,255)W.BackgroundTransparency=1 W.
BorderColor3=Color3.fromRGB(0,0,0)W.BorderSizePixel=0 W.FontFace=Font.new(
'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)W.
Position=UDim2.fromOffset(0,-5)W.Size=UDim2.fromScale(1,0)W.Text=
'RIOTPLAYER987123'W.TextColor3=Color3.fromRGB(255,255,255)W.TextSize=13 W.
TextWrapped=true W.TextYAlignment=Enum.TextYAlignment.Top W.Visible=false local
X=Instance.new'UIPadding'X.PaddingLeft=UDim.new(0,20)X.Parent=W W.Parent=K local
Y=Instance.new'Frame'Y.AnchorPoint=Vector2.new(0.5,0.5)Y.BackgroundColor3=Color3
.fromRGB(255,255,255)Y.BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,
0,0)Y.BorderSizePixel=0 Y.Position=UDim2.fromScale(0.5,0.5)Y.Size=UDim2.new(1,-2
,1,-2)Y.Visible=false local Z=Instance.new'UIStroke'Z.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border Z.Color=Color3.fromRGB(255,255,255)Z.Parent=Y Y.Parent=K
local _=Instance.new'Frame'_.BackgroundColor3=Color3.fromRGB(0,0,0)_.
BackgroundTransparency=1 _.BorderColor3=Color3.fromRGB(0,0,0)_.BorderSizePixel=0
_.Size=UDim2.fromScale(1,1)_.Visible=false _.Parent=K K.Parent=I local af=
Instance.new'Frame'af.AutomaticSize=Enum.AutomaticSize.XY af.BackgroundColor3=
Color3.fromRGB(255,255,255)af.BackgroundTransparency=1 af.BorderColor3=Color3.
fromRGB(0,0,0)af.BorderSizePixel=0 af.LayoutOrder=2 af.Position=UDim2.new(1,5,0,
10)af.Size=UDim2.fromOffset(50,0)af.Visible=true local ag=Instance.new
'TextLabel'ag.AnchorPoint=Vector2.new(0,1)ag.AutomaticSize=Enum.AutomaticSize.XY
ag.BackgroundColor3=Color3.fromRGB(255,255,255)ag.BackgroundTransparency=1 ag.
BorderColor3=Color3.fromRGB(0,0,0)ag.BorderSizePixel=0 ag.FontFace=Font.new(
'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ag.
Position=UDim2.fromOffset(0,-5)ag.RichText=true ag.Text='100M'ag.TextColor3=
Color3.fromRGB(255,255,255)ag.TextSize=13 ag.TextWrapped=true ag.TextXAlignment=
Enum.TextXAlignment.Left ag.TextYAlignment=Enum.TextYAlignment.Top ag.Parent=af
ag.Visible=false local ah=Instance.new'TextLabel'ah.AnchorPoint=Vector2.new(0,1)
ah.AutomaticSize=Enum.AutomaticSize.XY ah.BackgroundColor3=Color3.fromRGB(255,
255,255)ah.BackgroundTransparency=1 ah.BorderColor3=Color3.fromRGB(0,0,0)ah.
BorderSizePixel=0 ah.FontFace=Font.new('rbxassetid://12187362578',Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)ah.LayoutOrder=1 ah.Position=UDim2.
fromOffset(0,-5)ah.RichText=true ah.Text='BF 30'ah.TextColor3=Color3.fromRGB(255
,255,255)ah.TextSize=13 ah.TextWrapped=true ah.TextXAlignment=Enum.
TextXAlignment.Left ah.TextYAlignment=Enum.TextYAlignment.Top ah.Parent=af ah.
Visible=false local ai=Instance.new'TextLabel'ai.AnchorPoint=Vector2.new(0,1)ai.
AutomaticSize=Enum.AutomaticSize.XY ai.BackgroundColor3=Color3.fromRGB(255,255,
255)ai.BackgroundTransparency=1 ai.BorderColor3=Color3.fromRGB(0,0,0)ai.
BorderSizePixel=0 ai.ClipsDescendants=true ai.FontFace=Font.new(
'rbxassetid://12187362578',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ai.
LayoutOrder=2 ai.Position=UDim2.fromOffset(0,-5)ai.RichText=true ai.Text='140HP'
ai.TextColor3=Color3.fromRGB(255,255,255)ai.TextSize=13 ai.TextWrapped=true ai.
TextXAlignment=Enum.TextXAlignment.Left ai.TextYAlignment=Enum.TextYAlignment.
Top ai.Parent=af ai.Visible=false local aj=Instance.new'UIListLayout'aj.
SortOrder=Enum.SortOrder.LayoutOrder aj.Parent=af af.Parent=I local ak=Instance.
new'UIListLayout'ak.FillDirection=Enum.FillDirection.Horizontal ak.
HorizontalFlex=Enum.UIFlexAlignment.Fill ak.Padding=UDim.new(0,10)ak.SortOrder=
Enum.SortOrder.LayoutOrder ak.Parent=I I.Parent=H H.Parent=z z.Parent=ab.overlay
ad.makeDraggable(z)ad.makeDraggable(e)ac._userInputService.InputEnded:Connect(
function(al,am)if am then return end if al.KeyCode==d.Settings.Keybind then ab.
overlay.Visible=not ab.overlay.Visible end end)local al=function()local al=h.
AbsoluteSize.Y+9 r.Size=UDim2.new(1,0,1,-al)r.Position=UDim2.new(0,0,0,al)end h:
GetPropertyChangedSignal'AbsoluteSize':Connect(al)al()function d:UpdateSettings(
am)if am.Title then d.Settings.Title=am.Title k.Text=am.Title end if am.Keybind
then d.Settings.Keybind=am.Keybind end end function d:Tab(am)local an={Settings=
am}assert(an.Settings.Name and type(an.Settings.Name)=='string',
'Missing string or wrong type')if not an.Settings.Image or an.Settings.Image==''
then an.Settings.Image=aa.Assets.DefaultImage end ab.tabSystem.tabIndex+=1 local
ao=Instance.new'Frame'ao.AutomaticSize=Enum.AutomaticSize.Y ao.BackgroundColor3=
Color3.fromRGB(30,34,47)ao.BackgroundTransparency=1 ao.BorderColor3=Color3.
fromRGB(0,0,0)ao.BorderSizePixel=0 ao.Size=UDim2.fromOffset(50,50)ao.Parent=s ao
.LayoutOrder=ab.tabSystem.tabIndex local ap=Instance.new'TextLabel'ap.
AutomaticSize=Enum.AutomaticSize.Y ap.BackgroundColor3=Color3.fromRGB(255,255,
255)ap.BackgroundTransparency=1 ap.BorderColor3=Color3.fromRGB(0,0,0)ap.
BorderSizePixel=0 ap.FontFace=Font.new('rbxassetid://12187365364',Enum.
FontWeight.Bold,Enum.FontStyle.Normal)ap.LayoutOrder=1 ap.Position=UDim2.new(0,0
,1,10)ap.RichText=true ap.Size=UDim2.fromScale(1,0)ap.Text=an.Settings.Name:
upper()ap.TextColor3=Color3.fromRGB(150,150,150)ap.TextSize=11 ap.TextWrapped=
true ap.Parent=ao local aq=Instance.new'TextButton'aq.AutoButtonColor=false aq.
BackgroundColor3=Color3.fromRGB(30,34,47)aq.BorderColor3=Color3.fromRGB(0,0,0)aq
.BorderSizePixel=0 aq.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'aq.Size=UDim2.fromOffset(50,50)aq.
Text=''aq.TextColor3=Color3.fromRGB(0,0,0)aq.TextSize=14 local ar=Instance.new
'UICorner'ar.CornerRadius=UDim.new(0,13)ar.Parent=aq local as=Instance.new
'UIStroke'as.ApplyStrokeMode=Enum.ApplyStrokeMode.Border as.Color=Color3.
fromRGB(185,228,255)as.Transparency=1 as.Parent=aq local at=Instance.new
'ImageLabel'at.AnchorPoint=Vector2.new(0.5,0.5)at.BackgroundColor3=Color3.
fromRGB(255,255,255)at.BackgroundTransparency=1 at.BorderColor3=Color3.fromRGB(0
,0,0)at.BorderSizePixel=0 at.Image=an.Settings.Image at.ImageColor3=Color3.
fromRGB(150,150,150)at.Position=UDim2.fromScale(0.5,0.5)at.ScaleType=Enum.
ScaleType.Crop at.Size=UDim2.fromOffset(28,28)at.Parent=aq aq.Parent=ao local au
=Instance.new'UIListLayout'au.Padding=UDim.new(0,10)au.SortOrder=Enum.SortOrder.
LayoutOrder au.Parent=ao local av=Instance.new'ScrollingFrame'av.Name=
'TabContent'av.AutomaticCanvasSize=Enum.AutomaticSize.Y av.BackgroundColor3=
Color3.fromRGB(255,255,255)av.BackgroundTransparency=1 av.BorderColor3=Color3.
fromRGB(0,0,0)av.BorderSizePixel=0 av.CanvasSize=UDim2.new()av.
ScrollBarImageTransparency=1 av.ScrollBarThickness=1 av.Size=UDim2.fromScale(1,1
)local aw=Instance.new'UIListLayout'aw.Name='UIListLayout'aw.Padding=UDim.new(0,
10)aw.SortOrder=Enum.SortOrder.LayoutOrder aw.Parent=av local ax=Instance.new
'UIPadding'ax.Name='UIPadding'ax.PaddingBottom=UDim.new(0,20)ax.PaddingLeft=UDim
.new(0,25)ax.PaddingRight=UDim.new(0,25)ax.Parent=av ab.tabSystem.tabInstances[
ao]={Name=ap,Stroke=as,Icon=at,TabContent=av}function an:Select()if ab.tabSystem
.tabInstances[ab.tabSystem.currentTab]then local ay=ab.tabSystem.tabInstances[ab
.tabSystem.currentTab]ad.tween(ay.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),
{TextColor3=Color3.fromRGB(150,150,150)}):Play()ad.tween(ay.Icon,TweenInfo.new(
0.1,Enum.EasingStyle.Sine),{ImageColor3=Color3.fromRGB(150,150,150)}):Play()ad.
tween(ay.Stroke,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=1}):Play(
)if ab.tabSystem.currentContent then ab.tabSystem.currentContent.Parent=nil end
end if ab.tabSystem.tabInstances[ao]then local ay=ab.tabSystem.tabInstances[ao]
ad.tween(ay.Name,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{TextColor3=Color3.
fromRGB(168,193,225)}):Play()ad.tween(ay.Icon,TweenInfo.new(0.1,Enum.EasingStyle
.Sine),{ImageColor3=Color3.fromRGB(133,192,228)}):Play()ad.tween(ay.Stroke,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Transparency=0}):Play()ab.tabSystem.
currentTab=ao av.Parent=w ab.tabSystem.currentContent=av end end aq.
MouseButton1Click:Connect(function()an:Select()end)function an:Section(ay,az)
local aA,aB={Settings=ay},Instance.new'Frame'aB.Name='Section'aB.AutomaticSize=
Enum.AutomaticSize.Y aB.BackgroundColor3=Color3.fromRGB(255,255,255)aB.
BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.BorderSizePixel
=0 aB.Size=UDim2.fromScale(1,0)local aC=Instance.new'TextButton'aC.Name=
'Leading'aC.AutoButtonColor=false aC.AutomaticSize=Enum.AutomaticSize.Y aC.
BackgroundColor3=Color3.fromRGB(255,255,255)aC.BackgroundTransparency=1 aC.
BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel=0 aC.LayoutOrder=-1 aC.
Selectable=false aC.Size=UDim2.fromScale(1,0)aC.Text=''local aD=Instance.new
'TextLabel'aD.Name='Name'aD.AutomaticSize=Enum.AutomaticSize.XY aD.
BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1 aD.
BorderColor3=Color3.fromRGB(0,0,0)aD.BorderSizePixel=0 aD.FontFace=Font.new(
'rbxassetid://16658237174',Enum.FontWeight.Bold,Enum.FontStyle.Normal)aD.
LayoutOrder=1 aD.Position=UDim2.fromOffset(28,0)aD.RichText=true aD.Text=
'Aimbot'aD.TextColor3=Color3.fromRGB(225,225,225)aD.TextSize=20 aD.TextWrapped=
true aD.TextXAlignment=Enum.TextXAlignment.Left aD.Parent=aC local aE=Instance.
new'ImageButton'aE.Name='Chevron'aE.AnchorPoint=Vector2.new(0,0.5)aE.
AutoButtonColor=false aE.BackgroundColor3=Color3.fromRGB(30,34,47)aE.
BackgroundTransparency=1 aE.BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel
=0 aE.Image='rbxassetid://77136690433593'aE.LayoutOrder=1 aE.Position=UDim2.
fromScale(0,0.5)aE.Rotation=180 aE.Selectable=false aE.Size=UDim2.fromOffset(18,
18)aE.Parent=aC aC.Parent=aB local aF=Instance.new'Frame'aF.Name='Trailing'aF.
BackgroundColor3=Color3.fromRGB(255,255,255)aF.BackgroundTransparency=1 aF.
BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.ClipsDescendants=true
aF.Size=UDim2.fromScale(1,0)local aG=Instance.new'UIListLayout'aG.Name=
'UIListLayout'aG.Padding=UDim.new(0,10)aG.SortOrder=Enum.SortOrder.LayoutOrder
aG.Parent=aF local aH=Instance.new'UIPadding'aH.Name='UIPadding'aH.PaddingLeft=
UDim.new(0,12)aH.Parent=aF local aI=Instance.new'Folder'aI.Name='Folder'local aJ
=Instance.new'Frame'aJ.Name='Frame'aJ.AnchorPoint=Vector2.new(0,1)aJ.
BackgroundColor3=Color3.fromRGB(30,30,30)aJ.BorderColor3=Color3.fromRGB(0,0,0)aJ
.BorderSizePixel=0 aJ.Position=UDim2.new(0,-12,1,0)aJ.Size=UDim2.new(0,1,1,0)aJ.
Parent=aI aI.Parent=aF aF.Parent=aB local aK=Instance.new'UIListLayout'aK.Name=
'UIListLayout'aK.Padding=UDim.new(0,10)aK.SortOrder=Enum.SortOrder.LayoutOrder
aK.Parent=aB local aL=Instance.new'UIPadding'aL.Name='UIPadding'aL.PaddingBottom
=UDim.new(0,8)aL.PaddingTop=UDim.new(0,8)aL.Parent=aB aB.Parent=av local aM=
function(aM)if aM then local aN,aO={},0 for aP,aQ in pairs(aF:GetChildren())do
if aQ:IsA'GuiObject'then table.insert(aN,aQ)aO+=aQ.AbsoluteSize.Y end end if#aN>
1 then aO+=(#aN-1)*aG.Padding.Offset end ad.tween(aF,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Size=UDim2.new(1,0,0,aO)}):Play()ad.tween(aE,TweenInfo.new(
0.1,Enum.EasingStyle.Sine),{Rotation=-180}):Play()else ad.tween(aF,TweenInfo.
new(0.1,Enum.EasingStyle.Sine),{Size=UDim2.new(1,0,0,0)}):Play()ad.tween(aE,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Rotation=0}):Play()end end aC.
MouseButton1Click:Connect(function()aA.Settings.Opened=not aA.Settings.Opened
aM(aA.Settings.Opened)end)function aA:UpdateSettings(aN)if aN.Visible~=nil then
aA.Settings.Visible=aN.Visible aB.Visible=aN.Visible end if aN.Opened~=nil then
aA.Settings.Opened=aN.Opened aM(aN.Opened)end if aN.Name then aA.Settings.Name=
aN.Name aD.Text=aN.Name end end if aA.Settings.Closed==nil then aA.Settings.
Closed=true end aA:UpdateSettings(aA.Settings)if az then aa.Components[az]=aA
end aA.Content=aF b(aA)return aA end an.Content=av b(an)return an end function d
:VisualPreview(am)local an={O,P,R,Q,T,S,N,M}if am.Enabled~=nil then local ao=am.
Enabled J.Visible=ao ag.Visible=ao ai.Visible=ao ah.Visible=ao W.Visible=ao _.
Visible=ao Y.Visible=ao L.Visible=ao for ap,aq in ipairs(an)do aq.Visible=ao end
if not ao then return end end if am.Visible~=nil then z.Visible=am.Visible end
if am.HealthBar and am.HealthBar.Visible~=nil then J.Visible=am.HealthBar.
Visible end if am.Distance then if am.Distance.Visible~=nil then ag.Visible=am.
Distance.Visible end if am.Distance.Color then ag.TextColor3=am.Distance.Color
end end if am.Health then if am.Health.Visible~=nil then ai.Visible=am.Health.
Visible end if am.Health.Color then ai.TextColor3=am.Health.Color end end if am.
Weapon then if am.Weapon.Visible~=nil then ah.Visible=am.Weapon.Visible end if
am.Weapon.Color then ah.TextColor3=am.Weapon.Color end end if am.Name then if am
.Name.Visible~=nil then W.Visible=am.Name.Visible end if am.Name.Color then W.
TextColor3=am.Name.Color end end if am.FillBox then if am.FillBox.Visible~=nil
then _.Visible=am.FillBox.Visible end if am.FillBox.Color then _.
BackgroundColor3=am.FillBox.Color[1]or _.BackgroundColor3 _.
BackgroundTransparency=am.FillBox.Color[2]or _.BackgroundTransparency end end if
am.BoundingBox then if am.BoundingBox.Visible~=nil then Y.Visible=am.BoundingBox
.Visible end if am.BoundingBox.Color then Z.Color=am.BoundingBox.Color[1]or Z.
Color Z.Transparency=am.BoundingBox.Color[2]or Z.Transparency end end if am.
CornerBox then if am.CornerBox.Visible~=nil then L.Visible=am.CornerBox.Visible
end if am.CornerBox.Color then for ao,ap in ipairs(an)do ap.BackgroundColor3=am.
CornerBox.Color[1]or ap.BackgroundColor3 ap.BackgroundTransparency=am.CornerBox.
Color[2]or ap.BackgroundTransparency end end end end return d end function aa:
Notification(af)local ag={Settings=af}assert(ag.Settings.Title and type(ag.
Settings.Title)=='string','Missing notification title or wrong type')local ah=
Instance.new'ImageButton'ah.AnchorPoint=Vector2.new(1,1)ah.AutoButtonColor=false
ah.AutomaticSize=Enum.AutomaticSize.Y ah.BackgroundColor3=Color3.fromRGB(17,17,
17)ah.BorderColor3=Color3.fromRGB(0,0,0)ah.BorderSizePixel=0 ah.Image=
'rbxassetid://17365187482'ah.ImageTransparency=0.96 ah.Position=UDim2.fromScale(
1,1)ah.ScaleType=Enum.ScaleType.Tile ah.Size=UDim2.fromOffset(280,0)ah.TileSize=
UDim2.fromOffset(500,325)ah.Position=UDim2.new(1,(ah.AbsoluteSize.X+(ab.
notifSystem.uIpadding and ab.notifSystem.uIpadding.PaddingRight.Offset or 0)),1,
0)local ai=Instance.new'Frame'ai.AutomaticSize=Enum.AutomaticSize.Y ai.
BackgroundColor3=Color3.fromRGB(255,255,255)ai.BackgroundTransparency=1 ai.
BorderColor3=Color3.fromRGB(0,0,0)ai.BorderSizePixel=0 ai.Size=UDim2.fromScale(1
,0)local aj=Instance.new'UIPadding'aj.PaddingBottom=UDim.new(0,13)aj.PaddingLeft
=UDim.new(0,13)aj.PaddingRight=UDim.new(0,ag.Settings.Image and 42 or 13)aj.
PaddingTop=UDim.new(0,13)aj.Parent=ai local ak=Instance.new'UIListLayout'ak.
Padding=UDim.new(0,5)ak.SortOrder=Enum.SortOrder.LayoutOrder ak.
VerticalAlignment=Enum.VerticalAlignment.Center ak.Parent=ai local al=Instance.
new'Frame'al.AutomaticSize=Enum.AutomaticSize.Y al.BackgroundColor3=Color3.
fromRGB(255,255,255)al.BackgroundTransparency=1 al.BorderColor3=Color3.fromRGB(0
,0,0)al.BorderSizePixel=0 al.Size=UDim2.fromScale(1,0)local am=Instance.new
'UIListLayout'am.FillDirection=Enum.FillDirection.Horizontal am.Padding=UDim.
new(0,13)am.SortOrder=Enum.SortOrder.LayoutOrder am.Parent=al local an=Instance.
new'ImageLabel'an.BackgroundColor3=Color3.fromRGB(255,255,255)an.
BackgroundTransparency=1 an.BorderColor3=Color3.fromRGB(0,0,0)an.BorderSizePixel
=0 an.ImageColor3=Color3.fromRGB(225,225,225)an.ScaleType=Enum.ScaleType.Fit an.
Size=UDim2.fromOffset(16,16)an.Parent=al an.Visible=ag.Settings.Image and ag.
Settings.Image~=''an.Image=ag.Settings.Image or''local ao=Instance.new'Frame'ao.
AutomaticSize=Enum.AutomaticSize.Y ao.BackgroundColor3=Color3.fromRGB(255,255,
255)ao.BackgroundTransparency=1 ao.BorderColor3=Color3.fromRGB(0,0,0)ao.
BorderSizePixel=0 ao.LayoutOrder=1 ao.Size=UDim2.fromScale(1,0)local ap=Instance
.new'UIListLayout'ap.Padding=UDim.new(0,5)ap.SortOrder=Enum.SortOrder.
LayoutOrder ap.VerticalAlignment=Enum.VerticalAlignment.Center ap.Parent=ao
local aq=Instance.new'TextLabel'aq.AutomaticSize=Enum.AutomaticSize.Y aq.
BackgroundColor3=Color3.fromRGB(255,255,255)aq.BackgroundTransparency=1 aq.
BorderColor3=Color3.fromRGB(0,0,0)aq.BorderSizePixel=0 aq.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)aq.
LayoutOrder=1 aq.RichText=true aq.Size=UDim2.fromScale(1,0)aq.TextColor3=Color3.
fromRGB(225,225,225)aq.TextSize=16 aq.TextWrapped=true aq.TextXAlignment=Enum.
TextXAlignment.Left aq.TextYAlignment=Enum.TextYAlignment.Top aq.Parent=ao aq.
Text=ag.Settings.Title local ar=Instance.new'TextLabel'ar.AutomaticSize=Enum.
AutomaticSize.Y ar.BackgroundColor3=Color3.fromRGB(255,255,255)ar.
BackgroundTransparency=1 ar.BorderColor3=Color3.fromRGB(0,0,0)ar.BorderSizePixel
=0 ar.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.
FontStyle.Normal)ar.LayoutOrder=1 ar.RichText=true ar.Size=UDim2.fromScale(1,0)
ar.TextColor3=Color3.fromRGB(100,100,100)ar.TextSize=14 ar.TextWrapped=true ar.
TextXAlignment=Enum.TextXAlignment.Left ar.TextYAlignment=Enum.TextYAlignment.
Top ar.Parent=ao ar.Visible=ag.Settings.Description and true or false ar.Text=ag
.Settings.Description or''local as=Instance.new'UIPadding'as.PaddingTop=UDim.
new(0,-1)as.Parent=ao ao.Parent=al local at=Instance.new'UIPadding'at.PaddingTop
=UDim.new(0,1)at.Parent=al al.Parent=ai ai.Parent=ah table.insert(ab.notifSystem
.notifInstances,ah)ah.Parent=ab.notifSystem.notifications local au=Instance.new
'UICorner'au.CornerRadius=UDim.new(0,15)au.Parent=ah ad.tween(ah,TweenInfo.new(
0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,0,1,0)}):Play()if ag.
Settings.Lifetime and ag.Settings.Lifetime>0 then task.delay(ag.Settings.
Lifetime,function()ag:Cancel()end)end function ag:Cancel()local av=table.find(ab
.notifSystem.notifInstances,ah)if not av then return end table.remove(ab.
notifSystem.notifInstances,av)task.spawn(function()ad.tween(ah,TweenInfo.new(
0.25,Enum.EasingStyle.Exponential),{Position=UDim2.new(1,ah.AbsoluteSize.X+(ab.
notifSystem.uIpadding and ab.notifSystem.uIpadding.PaddingRight.Offset or 0),1,
ah.Position.Y.Offset)}):Play()end)task.delay(0.25,function()ah:Destroy()end)for
aw=av-1,1,-1 do task.spawn(function()local ax=ab.notifSystem.notifInstances[aw]
ad.tween(ax,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=ax.
Position+UDim2.new(0,0,0,ah.AbsoluteSize.Y+(ab.notifSystem.uIpadding and ab.
notifSystem.uIpadding.PaddingBottom.Offset or 0))}):Play()end)end end return ag
end function aa:Unload()ab.gui:Destroy()end ab.localPlayer=ac._players.
LocalPlayer local af=function()ab.camera=ac._workspace.CurrentCamera end af()ac.
_workspace:GetPropertyChangedSignal'CurrentCamera':Connect(af)ab.gui=ad.
secureGui{OnTopOfCoreBlur=true,ScreenInsets=Enum.ScreenInsets.None,ResetOnSpawn=
false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=2147483647}ab.
overlay=Instance.new('Frame',ab.gui)ab.overlay.BackgroundColor3=Color3.fromRGB(
255,255,255)ab.overlay.BackgroundTransparency=1 ab.overlay.BorderColor3=Color3.
fromRGB(0,0,0)ab.overlay.BorderSizePixel=0 ab.overlay.Size=UDim2.fromScale(1,1)
ab.overlay.Parent=ab.gui ab.notifSystem.notifications=Instance.new('Frame',ab.
gui)ab.notifSystem.notifications.BackgroundColor3=Color3.fromRGB(255,255,255)ab.
notifSystem.notifications.BackgroundTransparency=1 ab.notifSystem.notifications.
BorderColor3=Color3.fromRGB(0,0,0)ab.notifSystem.notifications.BorderSizePixel=0
ab.notifSystem.notifications.Size=UDim2.fromScale(1,1)ab.notifSystem.
notifications.ZIndex=2 ab.notifSystem.uIpadding=Instance.new('UIPadding',ab.
notifSystem.notifications)ab.notifSystem.uIpadding.PaddingBottom=UDim.new(0,15)
ab.notifSystem.uIpadding.PaddingLeft=UDim.new(0,15)ab.notifSystem.uIpadding.
PaddingRight=UDim.new(0,15)ab.notifSystem.uIpadding.PaddingTop=UDim.new(0,15)
local ag=function(ag)local ah=table.find(ab.notifSystem.notifInstances,ag)if ah
then for ai,aj in pairs(ab.notifSystem.notifInstances)do if ai~=ah then ad.
tween(aj,TweenInfo.new(0.25,Enum.EasingStyle.Exponential),{Position=aj.Position-
UDim2.new(0,0,0,ab.notifSystem.notifInstances[ah].AbsoluteSize.Y+10)}):Play()end
end end end ab.notifSystem.notifications.ChildAdded:Connect(ag)return aa end
function a.g()return function(aa)local ab,ac,ad,ae=a.load'a',a.load'f',a.load'c'
,a.load'd'local af,ag,ah,ai,aj=ac.Components,ac.Assets,ac.Colors,ad.shared,ad.
team local ak,al,am,an,ao,ap,aq=aj.enemy,aj.friendly,ae.Aimbot,ae.Triggerbot,ae.
FOVSettings,ab.SecureService,ac:Window{Title=aa.Name,Keybind=Enum.KeyCode.
RightControl}local ar={Legit=aq:Tab{Name='Legit',Image=ag.ShieldCheck},Rage=aq:
Tab{Name='Rage',Image=ag.Shield},Visuals=aq:Tab{Name='Visuals',Image=ag.Bolt},
Misc=aq:Tab{Name='Misc',Image=ag.Folder},Cfg=aq:Tab{Name='Cfg',Image=ag.Archive}
}do local as=ar.Legit local at=as:Section{Name='Aimbot'}at:Toggle({Name=
'Enabled',Description='enables aimbot',State=false,Callback=function(au,av)am.
Enabled=av end},'Aimbot'):Continue()at:Keybind({Bind=Enum.UserInputType.
MouseButton2,Blacklist={Enum.UserInputType.MouseButton1},onHeld=function(au,av,
aw)if aw then return end am.SetState(av)end},'AimbotKeybind')at:Slider({Name=
'Smoothing',Description='aimbot smoothness',Value=1,Minimum=1,Maximum=20,Step=
0.1,Precision=1,Callback=function(au,av)am.Sensitivity=(av-1)/(au.Settings.
Maximum-1)*0.15 am.Sensitivity2=av end},'AimbotSmoothing')at:Dropdown({Name=
'Bone',Description='selects the bone to aim at',Options={'Head','Torso'},Value={
'Head'},Limit=1,Minimum=1,Callback=function(au,av)am.LockPart=av[1]end},'Bone')
at:Slider({Name='Max Distance',Description=
'the distance aimbot stops locking onto players',Value=100,Minimum=1,Maximum=500
,Step=1,Precision=0,Callback=function(au,av)am.MaxDistance=av*4 end},
'MaxDistance')at:Dropdown({Name='Lock Method',Description=
'the input used to lock onto a player',Options={'Camera','Mouse'},Value={
'Camera'},Limit=1,Minimum=1,Callback=function(au,av)am.LockMode=({Camera=1,Mouse
=2})[av[1] ]end},'AimbotLockMethod')at:Dropdown({Name='Wall Check',Description=
'the method used by wall check',Options={'Off','Sticky','Always On'},Value={
'Always On'},Limit=1,Minimum=1,Callback=function(au,av)am.WallCheck=({Off=1,
Sticky=2,['Always On']=3})[av[1] ]end},'AimbotWallCheckMode')at:Toggle{Name=
'Team Check',Description='whether to ignore friendlys',State=true,Callback=
function(au,av)am.TeamCheck=av end}at:Toggle{Name='Alive Check',Description=
'whether to ignore corpses',State=true,Callback=function(au,av)am.AliveChecl=av
end}:Continue()local au=as:Section{Name='Triggerbot'}au:Toggle({Name='Enabled',
Description='enables triggerbot',State=false,Callback=function(av,aw)an.Enabled=
aw end},'TriggerbotEnabled')au:Slider({Name='Trigger Delay',Description=
'in miliseconds, the reaction time of triggerbot',Value=0,Minimum=1,Maximum=500,
Step=1,Precision=0,Callback=function(av,aw)an.Delay=aw/1000 end},
'TriggerbotDelay')for av,aw in ipairs{{'Team Check',
'whether to ignore friendlys','TeamCheck',true},{'Alive Check',
'whether to ignore corpses','AliveCheck',true}}do au:Toggle{Name=aw[1],
Description=aw[2],State=aw[4],Callback=function(ax,ay)an[aw[3] ]=ay end}end end
ad.Load()ae.Load()ar.Legit:Select()end end function a.h()local aa={Version=
'1.3.2',Author='Depso',License='MIT',Repository=
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
for av,aw in next,ar do local ax={[av]=aw}local ay,az=pcall(function()return aj:
Create(ao,aq,ax)end)if not ay then aa:SetProperties(ao,ax)continue end if not au
then au=az end az:Play()end if at then if au then au.Completed:Connect(at)else
at()end end return au end function al:Animate(am)local an,ao,ap,aq,ar=am.
NoAnimation,am.Objects,am.Tweeninfo,(am.Completed)for as,at in next,ao do local
au=self:Tween{NoAnimation=an,Object=as,Tweeninfo=ap,EndProperties=at}if not ar
then ar=au end end if aq then ar.Completed:Connect(aq)end return ar end function
al:HeaderCollapseToggle(am)aa:CheckConfig(am,{Rotations={Open=90,Closed=0}})
local an,ao,ap,aq,ar=am.Toggle,am.NoAnimation,am.Rotations,am.Collapsed,am.
Tweeninfo local as=aq and ap.Closed or ap.Open self:Tween{Tweeninfo=ar,
NoAnimation=ao,Object=an,EndProperties={Rotation=as}}end function al:
HeaderCollapse(am)local an,ao,ap,aq,ar,as,at,au,av,aw,ax=am.Tweeninfo,am.
Collapsed,am.ClosedSize,am.OpenSize,am.Toggle,am.Resize,am.Hide,am.NoAnimation,
am.NoAutomaticSize,am.IconRotations,am.Completed if not av then as.AutomaticSize
=Enum.AutomaticSize.None end if not ao then at.Visible=true end self:
HeaderCollapseToggle{Tweeninfo=an,Collapsed=ao,NoAnimation=au,Toggle=ar,
Rotations=aw}local ay=self:Tween{Tweeninfo=an,NoAnimation=au,Object=as,
StartProperties={Size=ao and aq or ap},EndProperties={Size=ao and ap or aq},
Completed=function()at.Visible=not ao if ax then ax()end if ao then return end
if av then return end as.Size=UDim2.fromScale(1,0)as.AutomaticSize=Enum.
AutomaticSize.Y end}return ay end function GetAndRemove(am,an)local ao=an[am]if
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
RemoveAnimationSignals(ao)local ar,as,at,au,av,aw,ax,ay,az=aq.Init,aq.
Connections,aq.Tweeninfo,aq.NoAnimation,true,{},{}function ax:Reset(aA)if ay
then ay(aA)end end function ax:FireSignal(aA)av=aA end function ax:Refresh(aA)if
not az then return end aw[az](aA)end function ax:SetEnabled(aA)av=aA end for aA,
aB in next,as do local aC,aD=function(aC)az=aA local aD=self.NoAnimations if aD
then return end if not av then return end aC=aC==true al:Tween{NoAnimation=aC or
au,Object=am,Tweeninfo=at,EndProperties=aB}end,ao[aA]local aE=aD:Connect(aC)self
:AddAnimationSignal(ao,aE)aw[aA]=aC if aA==ar then ay=aC end end ax:Reset(true)
return ax end function aa:GetChildOfClass(am,an)local ao=am:
FindFirstChildOfClass(an)if not ao then ao=self:CreateInstance(an,am)end return
ao end function aa:ConnectDrag(am,an)self:CheckConfig(an,{DragStart=ac,DragEnd=
ac,DragMovement=ac,OnDragStateChange=ac})local ao,ap,aq,ar,as,at=an.DragStart,an
.DragEnd,an.DragMovement,an.OnDragStateChange,{StartAndEnd={Enum.UserInputType.
MouseButton1,Enum.UserInputType.Touch},Movement={Enum.UserInputType.
MouseMovement,Enum.UserInputType.Touch}},false local au,av,aw=function(au,av)
local aw=au.UserInputType return table.find(as[av],aw)end,function(au)local av=
au.Position return Vector2.new(av.X,av.Y)end,function(au)self._DraggingDisabled=
au at=au ar(au)end local ax=function(ax)local ay,az,aA,aB,aC,aD=ax.
CheckDraggingDisabled,ax.DraggingRequired,ax.UpdateState,ax.IsDragging,ax.
InputType,ax.Callback return function(aE)if at~=az then return end if ay and
self._DraggingDisabled then return end if not au(aE,aC)then return end if aA
then aw(aB)end local aF=av(aE)aD(aF)end end am.InputBegan:Connect(ax{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=ao})ai.InputEnded:Connect(ax{
DraggingRequired=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',
Callback=ap})ai.InputChanged:Connect(ax{DraggingRequired=true,InputType=
'Movement',Callback=aq})end function aa:MakeDraggable(am)self:CheckConfig(am,{
Enabled=true})local an,ao,ap,aq,ar,as,at=am.Move,am.Grab,am.Enabled,am.
OnDragStateChange,{}function ar:SetEnabled(au)local av=am.StateChanged self.
Enabled=au if av then av(self)end end function ar:CanDrag(au)if not self.Enabled
then return end return true end local au,av,aw,ax=function(au)if not ar:CanDrag(
)then return end local av=am.DragBegin at=au av(at)end,function(au)if not ar:
CanDrag()then return end local av,aw=au-at,am.OnUpdate aw(av)end,function(au)as=
an.Position end,function(au)local av=UDim2.new(as.X.Scale,as.X.Offset+au.X,as.Y.
Scale,as.Y.Offset+au.Y)al:Tween{Object=an,EndProperties={Position=av}}end self:
CheckConfig(am,{OnUpdate=ax,DragBegin=aw})self:ConnectDrag(ao,{DragStart=au,
DragMovement=av,OnDragStateChange=aq})ar:SetEnabled(ap)return ar end function aa
:MakeResizable(am)aa:CheckConfig(am,{MinimumSize=Vector2.new(160,90),MaximumSize
=Vector2.new(math.huge,math.huge)})local an,ao,ap,aq,ar=am.MaximumSize,am.
MinimumSize,am.Resize,(am.OnUpdate)local as=aa:InsertPrefab('ResizeGrab',{Parent
=ap})local at,au,av=function(at)as.Visible=at.Enabled end,function(at)local au=
ar+at local av=UDim2.fromOffset(math.clamp(au.X,ao.X,an.X),math.clamp(au.Y,ao.Y,
an.Y))if aq then aq(av)return end al:Tween{Object=ap,EndProperties={Size=av}}end
,function(at)ar=ap.AbsoluteSize end local aw=self:MakeDraggable{Grab=as,OnUpdate
=au,DragBegin=av,StateChanged=at}aw.Grab=as return aw end function aa:
IsMouseEvent(am)local an=am.UserInputType.Name return an:find'Touch'or an:find
'Mouse'end function aa:DetectHover(am,an)an=an or{}local ao,ap,aq,ar,as=an.
OnInput,an.Anykey,an.MouseMove,an.MouseEnter,an.MouseOnly an.Hovering=false
local at=function(at,au,av)if at and as then if not aa:IsMouseEvent(at)then
return end end if au~=nil then an.Hovering=au end if not ar and av then return
end if ao then local aw=an.Hovering return ao(aw,at)end end local au={am.
MouseEnter:Connect(function()at(nil,true,true)end),am.MouseLeave:Connect(
function()at(nil,false,true)end)}if ap or as then table.insert(au,ai.InputBegan:
Connect(function(av)at(av)end))end if aq then local av=am.MouseMoved:Connect(at)
table.insert(au,av)end function an:Disconnect()for av,aw in next,au do aw:
Disconnect()end end return an end function aa:StackWindows()local am,an=self.
Windows,20 for ao,ap in next,am do local aq,ar=ap.WindowFrame,UDim2.fromOffset(
an*ao,an*ao)ap:Center()aq.Position+=ar end end function aa:UpdateColors(am)local
an,ao,ap,aq,ar,as,at,au,av=self.ElementColors,self.ThemeConfigs,self.Debug,self.
_FlagCache,am.Object,am.Tag,am.NoAnimation,am.TagsList,am.Theme local aw,ax=an[
as],aq[ar]if typeof(as)=='table'then aw=as elseif au then au[ar]=as end if not
aw then return end local ay={}for az,aA in next,aw do local aB=self:GetThemeKey(
av,aA)if ax and ax[az]then continue end if not aB then if ap then self:Warn(`Color: '{
aA}' does not exist!`)end continue end ay[az]=aB end al:Tween{Object=ar,
NoAnimation=at,EndProperties=ay}end function aa:MultiUpdateColors(am)local an=am
.Objects for ao,ap in next,an do self:UpdateColors{TagsList=am.TagsList,Theme=am
.Theme,NoAnimation=not am.Animate,Object=ao,Tag=ap}end end function aa:
ApplyStyle(am,an)local ao=self.Styles local ap=ao[an]if not ap then return end
self:ApplyFlags{Object=am,Class=ap}end function aa:MergeMetatables(am,an)local
ao,ap=self.Debug,{}ap.__index=function(aq,ar)local as=am[ar]if as~=nil then
return as end local at,au=pcall(function()return an[ar]end)if at then if typeof(
au)=='function'then return function(av,...)return au(an,...)end end return au
end return nil end ap.__newindex=function(aq,ar,at)local au=am[ar]~=nil or
typeof(at)=='function'if au then am[ar]=at return end xpcall(function()an[ar]=at
end,function(av)if ao then self:Warn(`Newindex Error: {an}.{ar} = {at}\n{av}`)
end am[ar]=at end)end return setmetatable({},ap)end function aa:Concat(am,an)
local ao=''for ap,aq in next,am do ao..=tostring(aq)..(ap~=#am and an or'')end
return ao end function aa:GetValueFromAliases(am,an)for ao,ap in am do local aq=
an[ap]if aq~=nil then return aq end end return nil end function aa:RecursiveCall
(am,an)for ao,ap in next,am:GetDescendants()do an(ap)end end function aa:
ApplyFlags(am)local an,ao,ap,aq=self.ElementFlags,am.Object,am.Class,am.
WindowClass self:SetProperties(ao,ap)for ar,at in next,an do local au,av,aw,ax=
at.Properties,at.Callback,at.Recursive,at.WindowProperties local ay=self:
GetValueFromAliases(au,ap)if aq and ax and ay==nil then ay=self:
GetValueFromAliases(ax,aq)end if ay==nil then continue end av(am,ao,ay)if aw
then self:RecursiveCall(ao,function(az)av(am,az,ay)end)end end end function aa:
SetProperties(am,an)for ao,ap in next,an do pcall(function()am[ao]=ap end)end
end function aa:InsertPrefab(am,an)local ao=self.Prefabs local ap=ao.Prefabs
local aq=ap:WaitForChild(am)local ar=aq:Clone()if an then local at=an.
UsePropertiesList if not at then self:SetProperties(ar,an)else self:ApplyFlags{
Object=ar,Class=an}end end return ar end function aa:GetContentSize(am,an)local
ao,ap,aq,ar=am:FindFirstChildOfClass'UIListLayout',am:FindFirstChildOfClass
'UIPadding',(am:FindFirstChildOfClass'UIStroke')if ao and not an then ar=ao.
AbsoluteContentSize else ar=am.AbsoluteSize end if ap then local at,au,av,aw=ap.
PaddingTop.Offset,ap.PaddingBottom.Offset,ap.PaddingLeft.Offset,ap.PaddingRight.
Offset ar+=Vector2.new(av+aw,at+au)end if aq then local at=aq.Thickness ar+=
Vector2.new(at/2,at/2)end return ar end function aa:MakeCanvas(am)local an,ao,ap
,aq,ar=self.Elements,self.Debug,am.Element,am.WindowClass,am.Class if not aq and
ao then self:Warn(`No WindowClass for {ap}`)print(am)end local at=NewClass(an)at
.ParentCanvas=ap at.WindowClass=aq or false local au={__index=function(au,av)
local aw=at[av]if aw~=nil then return aw end local ax=ar[av]if ax~=nil then
return ax end return ap[av]end,__newindex=function(au,av,aw)local ax=ar[av]~=nil
if ax then ar[av]=aw else ap[av]=aw end end}return setmetatable({},au)end
function aa:WrapGeneration(am,an)local ao,ap=an.Base,self._FlagCache return
function(aq,ar,...)ar=ar or{}self:CheckConfig(ar,ao)local at=ar.CloneTable if at
then ar=table.clone(ar)end local au,av=aq.WindowClass,aq.ParentCanvas self:
CheckConfig(ar,{Parent=av,Name=ar.ColorTag})if aq==self then aq=self.Elements
end local aw,ax=am(aq,ar,...)local ay,az,aA=ar.NoAutoTag,ar.NoAutoFlags,ar.
ColorTag if Success==false then if aq.Error then aq:Error{Parent=av,Text=aw}end
self:Warn('Class:',aw)error(debug.traceback())end if ax==nil then ax=aw end if
ax then ap[ax]=ar end if ax then if not ay and au then au:TagElements{[ax]=aA}
end if not az then self:ApplyFlags{Object=ax,Class=ar,WindowClass=au}end end
return aw,ax end end function aa:DefineElement(am,an)local ao,ap,aq=self.
Elements,self.ThemeConfigs,self.ElementColors local ar,at,au,av,aw,ax=ap.
DarkTheme,an.Base,an.Create,an.Export,an.ThemeTags,an.ColorData self:
CheckConfig(at,{ColorTag=am,ElementStyle=am,Visible=true})if aw then Merge(ar,aw
)end if ax then Merge(aq,ax)end local ay=self:WrapGeneration(au,{Base=at})if av
then self[am]=ay end ao[am]=ay return ay end function aa:DefineGlobalFlag(am)
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
local av=aq.ContentCanvas av.Interactable=not at end aa:DefineElement('Dropdown'
,{Base={Disabled=false,MaxSizeY=220,MinSizeX=100,OnClosed=ac,OnSelected=ac},
Create=function(an,ao)ao.Parent=aa.Container.Overlays local aq,ar,at,au,av,aw,ax
=ao.Selected,ao.ParentObject,ao.Items,ao.MaxSizeY,ao.MinSizeX,ao.OnClosed,ao.
OnSelected if not ar then return end local ay,az=an:OverlayScroll(ao)local aA=az
.UIStroke local aB,aC,aD,aE=aA.Thickness,ar.AbsolutePosition,aa:GetContentSize(
ar,true),aa:DetectHover(az,{MouseOnly=true,OnInput=function(aB,aC)if aB then
return end ao:Close()end})function ao:Close()if self.Disabled then return end
self.Disabled=true aE:Disconnect()az:Remove()aw()end local aF,aG=function(aF)ao:
Close()ax(aF)end,az.Parent.AbsolutePosition az.Position=UDim2.fromOffset(aC.X-aG
.X+aB,aC.Y-aG.Y+aD.Y)for aH,aI in at do local aJ,aK=typeof(aH)~='number'and aH
or aI,aH==aq or aI==aq ay:Selectable{Text=tostring(aJ),Selected=aK,ZIndex=6,
Callback=function()return aF(aJ)end}end local aH=ay:GetCanvasSize()local aI,aJ=
math.clamp(aH.Y,aD.Y,au),math.clamp(aD.X-aB,av,math.huge)az.Size=UDim2.
fromOffset(aJ,aI)return ao,az end})aa:DefineElement('Tooltip',{Base={Offset=15},
Create=function(an,ao)local aq,ar=ao.Offset,an:Overlay(ao)local at=aa:
MergeMetatables(ao,ar)function ao:Update(au)ar.Visible=au if not au then return
end aa:SetTooltip(ar)local av,aw=aa:GetMouseLocation()local ax=ar.Parent.
AbsolutePosition ar.Position=UDim2.fromOffset(av-ax.X+aq,aw-ax.Y+aq)end return
at,ar end})aa:DefineElement('OverlayScroll',{Base={},Create=function(an,ao)local
aq,ar=an.WindowClass,aa:InsertPrefab('OverlayScroll',ao)local at=ar.ContentFrame
local au=aa:MakeCanvas{Element=at,WindowClass=aq,Class=an}function ao:
GetCanvasSize()return at.AbsoluteCanvasSize end local av=aa:MergeMetatables(ao,
au)return av,ar end})aa:DefineElement('Overlay',{Base={},Create=function(an,ao)
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
at)at.Activated:Connect(function(...)local av=ao.Callback return av(at,...)end)
function ao:SetSelected(av)local aw=self.AnimationTags local ax=av and aw.
Selected or aw.Unselected self.Selected=av aa:SetAnimation(at,ax)end function ao
:SetDisabled(av)self.Disabled=av at.Interactable=not av end ao:SetSelected(aq)ao
:SetDisabled(ar)return au,at end})aa:DefineElement('ImageButton',{Base={
ElementStyle='Button',Callback=ac},Create=am.Image})aa:DefineElement(
'SmallButton',{Base={Text='Button',PaddingTop=UDim.new(),PaddingBottom=UDim.new(
),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),ColorTag='Button',
ElementStyle='Button',Callback=ac},Create=am.Button})aa:DefineElement('Keybind',
{Base={Label='Keybind',ColorTag='Frame',Value=nil,DeleteKey=Enum.KeyCode.
Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=false,Callback=ac,
OnKeybindSet=ac,OnBlacklistedKeybindSet=ac,KeyBlacklist={},UiPadding=UDim.new(),
AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.4,0,0,19)},Create=
function(an,ao)local aq,ar,at,au,av=ao.Value,ao.Label,ao.Disabled,ao.
KeyBlacklist,aa:InsertPrefab('Button',ao)local aw,ax=aa:MergeMetatables(ao,av),
Instance.new'Folder'local ay=an:Label{Parent=ax,Text=ar,Position=UDim2.new(1,5,
0.5),AnchorPoint=Vector2.new(0,0.5)}ax.Parent=av local az,aA=function(az,...)
return az(av,...)end,function(az)local aA=table.find(au,az)return aA end
function ao:SetDisabled(aB)self.Disabled=aB av.Interactable=not aB an:
SetColorTags({[ay]=aB and'LabelDisabled'or'Label'},true)end function ao:SetValue
(aB)local aC,aD=self.OnKeybindSet,self.DeleteKey if aB==aD then aB=nil end self.
Value=aB av.Text=aB and aB.Name or'Not set'az(aC,aB)end function ao:
WaitForNewKey()self._WaitingForNewKey=true av.Text='...'av.Interactable=false
end local aB=function(aB)local aC,aD=ao.OnBlacklistedKeybindSet,ao.Value if not
ai.WindowFocused then return end if aA(aB)then az(aC,aB)return end av.
Interactable=true ao._WaitingForNewKey=false if aB.Name=='Unknown'then return ao
:SetValue(aD)end ao:SetValue(aB)end local aC=function(aC,aD)local aE,aF,aG,aH,aI
,aJ=ao.IgnoreGameProcessed,ao.DeleteKey,ao.Enabled,ao.Value,ao.Callback,aC.
KeyCode if ao._WaitingForNewKey then aB(aJ)return end if not aG and av.
Interactable then return end if not aE and aD then return end if aJ==aF then
return end if aJ~=aH then return end az(aI,aJ)end ao:SetValue(aq)ao:SetDisabled(
at)ao.Connection=ai.InputBegan:Connect(aC)av.Activated:Connect(function()ao:
WaitForNewKey()end)aa:SetAnimation(av,'Inputs')return aw,av end})aa:
DefineElement('ArrowButton',{Base={Icon=aa.Icons.Arrow,Direction='Left',Size=
UDim2.fromOffset(21,21),ColorTag='Button',Rotations={Left=180,Right=0}},Create=
function(an,ao)local aq,ar=ao.Direction,ao.Rotations local at=ar[aq]ao.
IconRotation=at local au=aa:InsertPrefab('ArrowButton',ao)au.Activated:Connect(
function(...)local av=ao.Callback return av(au,...)end)return au end})aa:
DefineElement('Label',{Base={Font='Inconsolata'},Create=function(an,ao)local aq,
ar,at,au,av,aw,ax,ay=ao.Bold,ao.Italic,ao.Font,ao.FontFace,Enum.FontWeight.
Medium,Enum.FontWeight.Bold,Enum.FontStyle.Normal,Enum.FontStyle.Italic local az
,aA,aB=aq and aw or av,ar and ay or ax,aq or ar if not au and aB then ao.
FontFace=Font.fromName(at,az,aA)end return aa:InsertPrefab('Label',ao)end})aa:
DefineElement('Error',{Base={RichText=true,TextWrapped=true},ColorData={Error={
TextColor3='ErrorText',FontFace='TextFont'}},Create=function(an,ao)local aq=ao.
Text ao.Text=`<b>\u{26d4} Error:</b> {aq}`return an:Label(ao)end})local an={
ColorTags={BGSelected={[true]='SelectedTab',[false]='DeselectedTab'},
LabelSelected={[true]='SelectedTabLabel',[false]='DeselectedTabLabel'}}}function
an:UpdateButton(ao,aq)local ar,at=ao.IsSelected,ao.Tab local au=at.Button if ar
==aq then return end ao.IsSelected=aq local av,aw,ax=self.NoAnimation,self.
WindowClass,self.ColorTags local ay,az,aA,aB=aw.Theme,aw.TagsList,ax.BGSelected,
ax.LabelSelected aa:MultiUpdateColors{Animate=not av,Theme=ay,TagsList=az,
Objects={[au]=aA[aq],[au.Label]=aB[aq]}}end function an:SetActiveTab(ao)local aq
,ar,at,au,av=self.Tabs,self.NoAnimation,typeof(ao)=='string',false for aw,ax in
next,aq do local ay,az,aA,aB=ax.Content,ax.Canvas,ax.Name,false if at then aB=aA
==ao else aB=az==ao end if aB then au=ay.Visible av=ay end ay.Visible=aB self:
UpdateButton(ax,aB)end if ar then return self end if au then return self end if
not av then return self end al:Tween{Object=av,NoAnimation=ar,StartProperties={
Position=UDim2.fromOffset(0,5)},EndProperties={Position=UDim2.fromOffset(0,0)}}
return self end function an:RemoveTab(ao)local aq,ar=self.Tabs,typeof(ao)==
'string'for at,au in aq do local av,aw,ax,ay,az=au.Canvas,au.Name,au.Content,au.
Tab,false if ar then az=aw==ao else az=av==ao end if not az then continue end
table.remove(aq,at)ax:Destroy()ay:Destroy()end return self end function an:
CreateTab(ao)aa:CheckConfig(ao,{Name='Tab',AutoSize='Y',Closeable=false})local
aq,ar,at,au,av,aw,ax,ay,az,aA=self.AutoSelectNewTabs,self.ParentCanvas,self.
WindowClass,self.Templates,self.TabsBar,self.Body,self.Tabs,ao.Name,ao.Icon,ao.
AutoSize local aB,aC,aD=#ax<=0 and aq,au.Page,au.TabButton local aE=aD:Clone()
local aF=aE.Button local aG,aH=aF.Label,aa:GetChildOfClass(aF,'UIPadding')aG.
Text=tostring(ay)aE.Parent=av aE.Visible=true local aI=aC:Clone()local aJ=aa:
GetChildOfClass(aI,'UIPadding')aa:SetProperties(aI,{Parent=aw,Name=ay,Visible=aB
})local aK=aa:MakeCanvas{Element=aI,WindowClass=at,Class=self}local aL,aM,aN=
function()self:SetActiveTab(aK)end,{Name=ay,Tab=aE,Canvas=aK,Content=aI},{
Closeable=function()local aL=ar:RadioButton{Parent=aF,Visible=not self.NoClose,
Icon=aa.Icons.Close,IconSize=UDim2.fromOffset(11,11),LayoutOrder=3,ZIndex=2,
UsePropertiesList=true,Callback=function()self:RemoveTab(aK)end}local aM=aL.Icon
aa:SetAnimation(aM,{Connections={MouseEnter={ImageTransparency=0},MouseLeave={
ImageTransparency=1}},Init='MouseLeave'},aE)end}aF.Activated:Connect(aL)aa:
CheckFlags(aN,ao)table.insert(ax,aM)at:TagElements{[aF]='Tab',[aG]='TabLabel',[
aH]='TabSelectorTabPadding',[aJ]='TabSelectorPagePadding'}aa:SetProperties(aI,{
AutomaticSize=Enum.AutomaticSize[aA],Size=UDim2.fromScale(aA=='Y'and 1 or 0,aA==
'X'and 1 or 0)})aa:SetAnimation(aF,'Buttons')aa:ApplyFlags{Object=aF,Class={Icon
=az}}self:UpdateButton(aM,aB)return aK end aa:DefineElement('TabSelector',{Base=
{NoTabsBar=false,AutoSelectNewTabs=true},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabSelectorLine={Color=
'TabBgActive'},TabSelectorTabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabSelectorPagePadding={PaddingBottom=
'TabPadding',PaddingLeft='TabPadding',PaddingRight='TabPadding',PaddingTop=
'TabPadding'}},Create=function(ao,aq)local ar,at,au,av=ao.WindowClass,aq.
NoTabsBar,aa:InsertPrefab('TabSelector',aq),NewClass(an)local aw,ax=au.TabsBar,
au.Body local ay,az,aA=aw.TemplateButton,ax.PageTemplate,aw:
FindFirstChildOfClass'UIStroke'ay.Visible=false az.Visible=false aw.Visible=not
at Merge(av,aq)Merge(av,{Templates={TabButton=ay,Page=az},ParentCanvas=ao,
WindowClass=ar,Body=ax,TabsBar=aw,Tabs={}})ao:TagElements{[aw]=
'TabSelectorTabsBar',[aA]='TabSelectorLine'}return av,au end})aa:DefineElement(
'RadioButton',{Base={Callback=ac},Create=function(ao,aq)local ar=aa:
InsertPrefab('RadioButton',aq)ar.Activated:Connect(function(...)local at=aq.
Callback return at(ar,...)end)return ar end})aa:DefineElement('Checkbox',{Base={
Label='Checkbox',IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.
fromScale(1,1),UntickedImageSize=UDim2.fromScale(0,0),Callback=ac,Disabled=false
},Create=function(ao,aq)local ar,at,au,av,aw,ax,ay=aq.IsRadio,aq.Value,aq.Label,
aq.TickedImageSize,aq.UntickedImageSize,aq.Disabled,aa:InsertPrefab('CheckBox',
aq)local az,aA=aa:MergeMetatables(aq,ay),ay.Tickbox local aB=aA.Tick aB.Image=aa
.Icons.Checkmark local aC,aD,aE,aF=aA:FindFirstChildOfClass'UIPadding',aa:
GetChildOfClass(aA,'UICorner'),ao:Label{Text=au,Parent=ay,LayoutOrder=2},UDim.
new(0,3)if ar then aB.ImageTransparency=1 aB.BackgroundTransparency=0 aD.
CornerRadius=UDim.new(1,0)else aF=UDim.new(0,2)end aa:SetProperties(aC,{
PaddingBottom=aF,PaddingLeft=aF,PaddingRight=aF,PaddingTop=aF})local aG,aH=
function(...)local aG=aq.Callback return aG(az,...)end,function(aG,aH)local aI,
aJ=ao:GetThemeKey'AnimationTweenInfo',aG and av or aw al:Tween{Object=aB,
Tweeninfo=aI,NoAnimation=aH,EndProperties={Size=aJ}}end function aq:SetDisabled(
aI)self.Disabled=aI ay.Interactable=not aI ao:SetColorTags({[aE]=aI and
'LabelDisabled'or'Label'},true)end function aq:SetTicked(aI,aJ)self.Value=aI aH(
aI,aJ)aG(aI)return self end function aq:Toggle()local aI=not self.Value self.
Value=aI self:SetTicked(aI)return self end local aI=function()aq:Toggle()end ay.
Activated:Connect(aI)aA.Activated:Connect(aI)aq:SetTicked(at,true)aq:
SetDisabled(ax)aa:SetAnimation(aA,'Buttons',ay)ao:TagElements{[aB]='CheckMark',[
aA]='Checkbox'}return az,ay end})aa:DefineElement('Radiobox',{Base={IsRadio=true
,CornerRadius=UDim.new(1,0)},Create=function(ao,aq)return ao:Checkbox(aq)end})aa
:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label='Histogram'},Create
=function(ao,aq)local ar,at,au=aq.Label,aq.Points,aa:InsertPrefab('Histogram',aq
)local av,aw=aa:MergeMetatables(aq,au),au.Canvas local ax=aw.PointTemplate ax.
Visible=false local ay=(ao:Label{Text=ar,Parent=au,Position=UDim2.new(1,5)})aa:
SetItemTooltip(au,function(az)ValueLabel=az:Label()end)Merge(aq,{_Plots={},
_Cache={}})function aq:GetBaseValues()local az,aA=self.Minimum,self.Maximum if
az and aA then return az,aA end local aB=self._Plots for aC,aD in aB do local aE
=aD.Value if not az or aE<az then az=aE end if not aA or aE>aA then aA=aE end
end return az,aA end function aq:UpdateGraph()local az,aA,aB=self._Plots,self:
GetBaseValues()if not aA or not aB then return end local aC=aB-aA for aD,aE in
az do local aF,aG=aE.Point,aE.Value local aH=(aG-aA)/aC aH=math.clamp(aH,0.05,1)
aF.Size=UDim2.fromScale(1,aH)end return self end function aq:Plot(az)local aA,aB
,aC=self._Plots,{},ax:Clone()local aD=aC.Bar aa:SetProperties(aC,{Parent=aw,
Visible=true})local aE,aF=aa:DetectHover(aC,{MouseEnter=true,OnInput=function()
aB:UpdateTooltip()end}),{Object=aC,Point=aD,Value=az}function aB:UpdateTooltip()
local aG=aB:GetPointIndex()ValueLabel.Text=`{aG}:\t{aF.Value}`end function aB:
SetValue(aG)aF.Value=aG aq:UpdateGraph()if aE.Hovering then self:UpdateTooltip()
end end function aB:GetPointIndex()return table.find(aA,aF)end function aB:
Remove(aG)table.remove(aA,self:GetPointIndex())aC:Remove()aq:UpdateGraph()end
table.insert(aA,aF)self:UpdateGraph()aa:SetAnimation(aD,'Plots',aC)ao:
TagElements{[aD]='Plot'}return aB end function aq:PlotGraph(az)local aA=self.
_Cache local aB=#aA-#az if aB>=1 then for aC=1,aB do local aD=table.remove(aA,aC
)if aD then aD:Remove()end end end for aC,aD in az do local aE=aA[aC]if aE then
aE:SetValue(aD)continue end aA[aC]=self:Plot(aD)end return self end if at then
aq:PlotGraph(at)end return av,au end})aa:DefineElement('Viewport',{Base={IsRadio
=true},Create=function(ao,aq)local ar=aa:InsertPrefab('Viewport',aq)local at,au=
aa:MergeMetatables(aq,ar),ar.Viewport local av,aw,ax=au.WorldModel,aq.Model,aq.
Camera if not ax then ax=aa:CreateInstance('Camera',au)ax.CFrame=CFrame.new(0,0,
0)end Merge(aq,{Camera=ax,WorldModel=av,Viewport=au})function aq:SetCamera(ay)au
.CurrentCamera=ay self.Camera=ay return self end function aq:SetModel(ay,az)
local aA=self.Clone av:ClearAllChildren()if aA then ay=ay:Clone()end if az then
ay:PivotTo(az)end ay.Parent=av self.Model=ay return ay end if aw then aq:
SetModel(aw)end aq:SetCamera(ax)return at end})aa:DefineElement('InputText',{
Base={Value='',Placeholder='',Label='Input text',Callback=ac,MultiLine=false,
NoAutoTag=true,Disabled=false},Create=function(ao,aq)local ar,at,au,av,aw=aq.
MultiLine,aq.Placeholder,aq.Label,aq.Disabled,aa:InsertPrefab('InputBox',aq)
local ax=aw.Frame local ay,az=ax.Input,aa:MergeMetatables(aq,aw)ao:Label{Parent=
aw,Text=au,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,5),LayoutOrder=2}aa:SetProperties(ay,{PlaceholderText=at,
MultiLine=ar})local aA=function(...)local aA=aq.Callback aA(az,...)end function
aq:SetValue(aB)ay.Text=tostring(aB)self.Value=aB return self end function aq:
SetDisabled(aB)self.Disabled=aB aw.Interactable=not aB ao:SetColorTags({[au]=aB
and'LabelDisabled'or'Label'},true)end function aq:Clear()ay.Text=''return self
end local aB=function()local aB=ay.Text aq.Value=aB aA(aB)end ay:
GetPropertyChangedSignal'Text':Connect(aB)aq:SetDisabled(av)ao:TagElements{[ay]=
'Frame'}return az,aw end})aa:DefineElement('InputInt',{Base={Value=0,Increment=1
,Placeholder='',Label='Input Int',Callback=ac},Create=function(ao,aq)local ar,at
,au,av,aw,ax=aq.Value,aq.Placeholder,aq.Label,aq.Disabled,aq.NoButtons,aa:
InsertPrefab('InputBox',aq)local ay,az=aa:MergeMetatables(aq,ax),ax.Frame local
aA=az.Input aA.PlaceholderText=at local aB,aC,aD,aE=ao:Button{Text='-',Parent=az
,LayoutOrder=2,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.
UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not aw,Callback=function()aq:
Decrease()end},ao:Button{Text='+',Parent=az,LayoutOrder=3,Ratio=1,AutomaticSize=
Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),
Visible=not aw,Callback=function()aq:Increase()end},ao:Label{Parent=ax,Text=au,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.
new(1,5),LayoutOrder=4},function(...)local aB=aq.Callback aB(ay,...)end function
aq:Increase()local aF,aG=self.Value,self.Increment aq:SetValue(aF+aG)end
function aq:Decrease()local aF,aG=self.Value,self.Increment aq:SetValue(aF-aG)
end function aq:SetDisabled(aF)self.Disabled=aF ax.Interactable=not aF ao:
SetColorTags({[aD]=aF and'LabelDisabled'or'Label'},true)end function aq:SetValue
(aF)local aG,aH,aI=self.Value,self.Minimum,self.Maximum aF=tonumber(aF)if not aF
then aF=aG end if aH and aI then aF=math.clamp(aF,aH,aI)end aA.Text=aF aq.Value=
aF aE(aF)return self end local aF=function()local aF=aA.Text aq:SetValue(aF)end
aq:SetValue(ar)aq:SetDisabled(av)aA.FocusLost:Connect(aF)ao:TagElements{[aC]=
'Button',[aB]='Button',[aA]='Frame'}return ay,ax end})aa:DefineElement(
'InputTextMultiline',{Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,
ColorTag='Frame'},Create=function(ao,aq)return ao:Console(aq)end})aa:
DefineElement('Console',{Base={Enabled=true,ReadOnly=false,Value='',TextWrapped=
false,RichText=false,LineNumbers=false,LinesFormat='%s',Callback=ac},Create=
function(ao,aq)local ar,at,au,av,aw,ax=aq.ReadOnly,aq.LineNumbers,aq.Fill,aq.
Value,aq.Placeholder,aa:InsertPrefab('Console',aq)local ay,az,aA=aa:
MergeMetatables(aq,ax),ax.Source,ax.Lines aa:SetProperties(az,aq)aa:
SetProperties(az,{TextEditable=not ar,Parent=ax,PlaceholderText=aw})aA.Visible=
at function aq:UpdateLineNumbers()local aB,aC=self.LineNumbers,self.LinesFormat
if not aB then return end local aD=#az.Text:split'\n'aA.Text=''for aE=1,aD do
local aF,aG=aC:format(aE),aE~=aD and'\n'or''aA.Text..=`{aF}{aG}`end local aE=aA.
AbsoluteSize.X az.Size=UDim2.new(1,-aE,0,0)return self end function aq:
CheckLineCount()local aB=aq.MaxLines if not aB then return end local aC=az.Text
local aD=aC:split'\n'if#aD>aB then local aE=`{aD[1]}\\n`local aF=aC:sub(#aE)self
:SetValue(aF)end return self end function aq:UpdateScroll()local aB=ax.
AbsoluteCanvasSize ax.CanvasPosition=Vector2.new(0,aB.Y)return self end function
aq:SetValue(aB)if not self.Enabled then return end az.Text=tostring(aB)self:
Update()return self end function aq:GetValue()return az.Text end function aq:
Clear()az.Text=''self:Update()return self end function aq:AppendText(...)local
aB,aC='\n'..aa:Concat({...},' '),self:GetValue()self:SetValue(aC..aB)self:
CheckLineCount()return self end function aq:Update()local aB=aq.AutoScroll aq:
UpdateLineNumbers()if aB then aq:UpdateScroll()end end local aB=function()local
aB=aq:GetValue()aq:Update()aq.Callback(aB)end aq:SetValue(av)ao:TagElements{[az]
='ConsoleText'}az:GetPropertyChangedSignal'Text':Connect(aB)return ay,ax end})aa
:DefineElement('Table',{Base={VerticalAlignment=Enum.VerticalAlignment.Top,
RowBackground=false,RowBgTransparency=0.87,Border=false},Create=function(ao,aq)
local ar,at,au,av,aw,ax,ay=ao.WindowClass,aq.RowBgTransparency,aq.RowBackground,
aq.Border,aq.VerticalAlignment,aq.MaxColumns,aa:InsertPrefab('Table',aq)local az
,aA,aB,aC=aa:MergeMetatables(aq,ay),ay.RowTemp,0,{}function aq:Row(aD)aD=aD or{}
local aE,aF,aG,aH=aD.IsHeader,0,{},aA:Clone()aa:SetProperties(aH,{Name='Row',
Visible=true,Parent=ay})local aI=aH:FindFirstChildOfClass'UIListLayout'aI.
VerticalAlignment=aw if aE then ao:TagElements{[aH]='Header'}else aB+=1 end if
au and not aE then local aJ=aB%2~=1 and at or 1 aH.BackgroundTransparency=aJ end
local aJ={}function aJ:Column(aK)local aL=aH.ColumnTemp:Clone()aa:SetProperties(
aL,{Visible=true,Parent=aH,Name='Column'})local aM=aL:FindFirstChildOfClass
'UIStroke'aM.Enabled=av return aa:MakeCanvas{Element=aL,WindowClass=ar,Class=az}
end function aJ:NextColumn()aF+=1 local aK=aF%ax+1 local aL=aG[aK]if not aL then
aL=self:Column()aG[aK]=aL end return aL end table.insert(aC,aJ)local aK=aa:
MergeMetatables(aJ,aH)return aK end function aq:NextRow()return self:Row()end
function aq:HeaderRow()return self:Row{IsHeader=true}end function aq:ClearRows()
aB=0 for aD,aE in next,ay:GetChildren()do if not aE:IsA'Frame'then continue end
if aE==aA then continue end aE:Destroy()end return aq end return az,ay end})aa:
DefineElement('List',{Base={Spacing=5,HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top},Create=
function(ao,aq)local ar,at,au,av,aw,ax,ay=ao.WindowClass,aq.Spacing,aq.
HorizontalFlex,aq.VerticalFlex,aq.HorizontalAlignment,aq.VerticalAlignment,aa:
InsertPrefab('List',aq)local az,aA=aa:MergeMetatables(aq,ay),ay.UIListLayout aa:
SetProperties(aA,{Padding=UDim.new(0,at),HorizontalFlex=au,VerticalFlex=av,
HorizontalAlignment=aw,VerticalAlignment=ax})local aB=aa:MakeCanvas{Element=ay,
WindowClass=ar,Class=az}return aB,ay end})aa:DefineElement('CollapsingHeader',{
Base={Title='Collapsing Header',Icon=aa.Icons.Arrow,Collapsed=true,Offset=0,
NoAutoTag=true,NoAutoFlags=true},Create=function(ao,aq)local ar,at,au,av,aw,ax,
ay,az,aA=aq.Title,aq.Icon,aq.Collapsed,aq.ElementStyle,aq.Offset,aq.
TitleBarProperties,aq.OpenOnDoubleClick,aq.OpenOnArrow,aa:InsertPrefab(
'CollapsingHeader',aq)local aB=aA.TitleBar local aC=aB.Toggle.Icon aC.Image=at
local aD,aE,aF=ao:Label{ColorTag='CollapsingHeader',Text=ar,Parent=aB,
LayoutOrder=2},ao:Indent{Parent=aA,Offset=aw,LayoutOrder=2,Size=UDim2.fromScale(
1,0),AutomaticSize=Enum.AutomaticSize.None,PaddingTop=UDim.new(0,4),
UsePropertiesList=true}function aq:SetCollapsed(aG)self.Collapsed=aG local aH,aI
,aJ=aa:GetContentSize(aF),aE:GetThemeKey'AnimationTweenInfo',UDim2.fromScale(1,0
)local aK=aJ+UDim2.fromOffset(0,aH.Y)al:HeaderCollapse{Tweeninfo=aI,Collapsed=aG
,Toggle=aC,Resize=aF,Hide=aF,ClosedSize=aJ,OpenSize=aK}return self end local aG=
function()aq:SetCollapsed(not aq.Collapsed)end if ax then aa:ApplyFlags{Object=
aB,Class=ax}end if not az then aa:ConnectMouseEvent(aB,{DoubleClick=ay,Callback=
aG})end aC.Activated:Connect(aG)aq:SetCollapsed(au)aa:ApplyStyle(aB,av)aE:
TagElements{[aB]='CollapsingHeader'}return aE,aA end})aa:DefineElement(
'TreeNode',{Base={Offset=21,TitleBarProperties={Size=UDim2.new(1,0,0,14)}},
Create=function(ao,aq)return ao:CollapsingHeader(aq)end})aa:DefineElement(
'Separator',{Base={NoAutoTag=true,NoAutoTheme=true},Create=function(ao,aq)local
ar,at=aq.Text,aa:InsertPrefab('SeparatorText',aq)ao:Label{Text=tostring(ar),
Visible=ar~=nil,Parent=at,LayoutOrder=2,Size=UDim2.new(),PaddingLeft=UDim.new(0,
4),PaddingRight=UDim.new(0,4)}ao:TagElements{[at.Left]='Separator',[at.Right]=
'Separator'}return at end})aa:DefineElement('Canvas',{Base={Scroll=false},Create
=function(ao,aq)local ar,at=ao.WindowClass,aq.Scroll local au=at and
'ScrollingCanvas'or'Canvas'local av=aa:InsertPrefab(au,aq)local aw=aa:MakeCanvas
{Element=av,WindowClass=ar,Class=aq}return aw,av end})aa:DefineElement('Region',
{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(ao,aq)
local ar,at=ao.WindowClass,aq.Scroll local au=at and'ScrollingCanvas'or'Canvas'
local av=aa:InsertPrefab(au,aq)local aw=aa:MakeCanvas{Element=av,WindowClass=ar,
Class=aq}return aw,av end})aa:DefineElement('Group',{Base={Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y},Create=function(ao,aq)local ar,at=ao.
WindowClass,aa:InsertPrefab('Group',aq)local au=aa:MakeCanvas{Element=at,
WindowClass=ar,Class=aq}return au,at end})aa:DefineElement('Indent',{Base={
Offset=15,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),PaddingRight=UDim.new()
},Create=function(ao,aq)local ar=aq.Offset aq.PaddingLeft=UDim.new(0,ar)return
ao:Canvas(aq)end})aa:DefineElement('BulletText',{Base={},Create=function(ao,aq)
local ar=aq.Rows for at,au in next,ar do local av=ao:Bullet(aq)av:Label{Text=
tostring(au),LayoutOrder=2,Size=UDim2.fromOffset(0,14)}end end})aa:
DefineElement('Bullet',{Base={Padding=3,Icon=aa.Icons.Dot,IconSize=UDim2.
fromOffset(5,5)},Create=function(ao,aq)local ar,at,au=ao.WindowClass,aq.Padding,
aa:InsertPrefab('Bullet',aq)local av,aw=aa:MakeCanvas{Element=au,WindowClass=ar,
Class=ao},au.UIListLayout aw.Padding=UDim.new(0,at)return av,au end})aa:
DefineElement('Row',{Base={Spacing=4,Expanded=false},Create=function(ao,aq)local
ar,at,au,av=ao.WindowClass,aq.Spacing,aq.Expanded,aa:InsertPrefab('Row',aq)local
aw,ax=aa:MergeMetatables(aq,av),av:FindFirstChildOfClass'UIListLayout'ax.Padding
=UDim.new(0,at)function aq:Expand()ax.HorizontalFlex=Enum.UIFlexAlignment.Fill
return self end local ay=aa:MakeCanvas{Element=av,WindowClass=ar,Class=aw}if au
then aq:Expand()end return ay,av end})aa:DefineElement('SliderBase',{Base={
Format='%.f',Label='',Type='Slider',Callback=ac,NoGrab=false,NoClick=false,
Minimum=0,Maximum=100,ColorTag='Frame',Disabled=false},Create=function(ao,aq)
local ar,at,au,av,aw,ax,ay,az,aA=aq.Value or aq.Minimum,aq.Format,aq.Label,aq.
NoAnimation,aq.NoGrab,aq.NoClick,aq.Type,aq.Disabled,aa:InsertPrefab'Slider'
local aB=aA.Track local aC,aD,aE,aF=aB.Grab,aB.ValueText,aB:
FindFirstChildOfClass'UIPadding',aa:MergeMetatables(aq,aA)local aG,aH,aI=aC.
AbsoluteSize,aa:SetAnimation(aA,'Inputs'),ao:Label{Parent=aA,Text=au,Position=
UDim2.new(1,5),Size=UDim2.fromScale(0,1)}Merge(aq,{Grab=aC,Name=au})if ay==
'Slider'then aB.Position=UDim2.fromOffset(aG.X/2,0)aB.Size=UDim2.new(1,-aG.X,1,0
)end local aJ,aK={Slider=function(aJ)return{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(aJ,0.5)}end,Progress=function(aJ)return{Size=UDim2.
fromScale(aJ,1)}end,Snap=function(aJ,aK,aL,aM)local aN=(math.round(aK)-aL)/aM
return{Size=UDim2.fromScale(1/aM,1),Position=UDim2.fromScale(aN,0.5)}end},
function(...)local aJ=aq.Callback return aJ(aF,...)end function aq:SetDisabled(
aL)self.Disabled=aL aA.Interactable=not aL ao:SetColorTags({[aI]=aL and
'LabelDisabled'or'Label'},true)end function aq:SetValueText(aL)aD.Text=tostring(
aL)end function aq:SetValue(aL,aM)local aN,aO,aP,aQ=ao:GetThemeKey
'AnimationTweenInfo',aq.Minimum,aq.Maximum,aL local b=aP-aO if not aM then aQ=(
aL-aO)/b else aL=aO+(b*aQ)end aQ=math.clamp(aQ,0,1)local c=aJ[ay](aQ,aL,aO,aP)al
:Tween{Object=aC,Tweeninfo=aN,NoAnimation=av,EndProperties=c}self.Value=aL self:
SetValueText(at:format(aL,aP))aK(aL)return self end local aL,aM=function(aL)ao:
SetColorTags({[aA]=aL and'FrameActive'or'Frame'},true)ao:SetElementFocused(aA,{
Focused=aL,Animation=aH})end,function()if aq.Disabled then return end if aq.
ReadOnly then return end return true end local aN=function(aN)if not aM()then
return end local aO,aP,aQ=aB.AbsolutePosition.X,aB.AbsoluteSize.X,aN.X local b=
aQ-aO local c=math.clamp(b/aP,0,1)aq:SetValue(c,true)end local aO,aP=function(
...)if not aM()then return end aL(true)if not ax then aN(...)end end,function()
aL(false)end aC.Visible=not aw aq:SetValue(ar)aq:SetDisabled(az)ao:TagElements{[
aD]='Label',[aC]='SliderGrab'}aa:ConnectDrag(aB,{DragStart=aO,DragMovement=aN,
DragEnd=aP})return aF,aA end})aa:DefineElement('SliderEnum',{Base={Items={},
Label='Slider Enum',Type='Snap',Minimum=1,Maximum=10,Value=1,Callback=ac,
ColorTag='Frame'},Create=function(ao,aq)local ar,at=aq.Callback,aq.Value local
au=function(au,av)av=math.round(av)local aw=au.Items au.Maximum=#aw return aw[av
]end aq.Callback=function(av,aw,ax)local ay=au(av,aw)av:SetValueText(ay)aq.Value
=ay return ar(av,ay)end au(aq,at)return ao:SliderBase(aq)end})aa:DefineElement(
'SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create=am.SliderBase})aa
:DefineElement('SliderFloat',{Base={Label='Slider Float',Format='%.3f',ColorTag=
'Frame'},Create=am.SliderBase})aa:DefineElement('DragInt',{Base={Format='%.f',
Label='Drag Int',Callback=ac,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=
false},Create=function(ao,aq)local ar,at,au,av,aw=aq.Value or aq.Minimum,aq.
Format,aq.Label,aq.Disabled,aa:InsertPrefab'Slider'local ax,ay=aa:
MergeMetatables(aq,aw),aw.Track local az,aA=ay.ValueText,ay.Grab aA.Visible=
false local aB,aC,aD,aE,aF,aG=aa:GetChildOfClass(ay,'UIDragDetector'),ao:Label{
Parent=aw,Text=au,Position=UDim2.new(1,7),Size=UDim2.fromScale(0,1)},0,0,aa:
SetAnimation(aw,'Inputs'),function(...)local aB=aq.Callback return aB(ax,...)end
function aq:SetValue(aH,aI)local aJ,aK=self.Minimum,self.Maximum local aL=aK-aJ
if not aI then aD=((aH-aJ)/aL)*100 else aH=aJ+(aL*(aD/100))end aH=math.clamp(aH,
aJ,aK)self.Value=aH az.Text=at:format(aH,aK)aG(aH)return self end function aq:
SetDisabled(aH)self.Disabled=aH ao:SetColorTags({[aC]=aH and'LabelDisabled'or
'Label'},true)end local aH,aI=function(aH)ao:SetColorTags({[aw]=aH and
'FrameActive'or'Frame'},true)ao:SetElementFocused(aw,{Focused=aH,Animation=aF})
end,function()if aq.Disabled then return end if aq.ReadOnly then return end
return true end local aJ,aK,aL=function(aJ)if not aI()then return end aH(true)
InputBeganPosition=aJ aE=aD end,function(aJ)if not aI()then return end local aK=
aJ.X-InputBeganPosition.X local aL=aE+(aK/2)aD=math.clamp(aL,0,100)aq:SetValue(
aD,true)end,function()aH(false)end aq:SetValue(ar)aq:SetDisabled(av)aa:
ConnectDrag(ay,{DragStart=aJ,DragEnd=aL,DragMovement=aK})return ax,aw end})aa:
DefineElement('DragFloat',{Base={Format='%.3f',Label='Drag Float',ColorTag=
'Frame'},Create=am.DragInt})aa:DefineElement('MultiElement',{Base={Callback=ac,
Label='',Disabled=false,BaseInputConfig={},InputConfigs={},Value={},Minimum={},
Maximum={},MultiCallback=ac},Create=function(ao,aq)local ar,at,au,av,aw,ax,ay,az
=aq.Label,aq.BaseInputConfig,aq.InputConfigs,aq.InputType,aq.Disabled,aq.Value,
aq.Minimum,aq.Maximum assert(av,'No input type provided for MultiElement')local
aA=ao:Row{Spacing=5}local aB,aC,aD,aE=aA:Row{Size=UDim2.fromScale(0.65,0),
Expanded=true},aA:Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=ar},aa:
MergeMetatables(aq,aA),{}local aF=function()local aF={}for aG,aH in aE do aF[aG]
=aH:GetValue()end aq.Value=aF return aF end local aG=function()local aG=aq.
MultiCallback if#aE~=#au then return end local aH=aF()aG(aD,aH)end function aq:
SetDisabled(aH)self.Disabled=aH ao:SetColorTags({[aC]=aH and'LabelDisabled'or
'Label'},true)for aI,aJ in aE do aJ:SetDisabled(aH)end end function aq:SetValue(
aH)for aI,aJ in aH do local aK=aE[aI]assert(aK,`No input object for index: {aI}`
)aK:SetValue(aJ)end end at=Copy(at,{Size=UDim2.new(1,0,0,19),Label='',Callback=
aG})for aH,aI in au do local aJ=Copy(at,aI)aa:CheckConfig(aJ,{Minimum=ay[aH],
Maximum=az[aH]})local aK=aB[av](aB,aJ)table.insert(aE,aK)end aG()Merge(aq,{Row=
aB,Inputs=aE})aq:SetDisabled(aw)aq:SetValue(ax)return aD,aA end})local ao,aq,ar,
at=function(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,
InputType=aq,InputConfigs=table.create(ar,{}),BaseInputConfig={}},Create=
function(au,av)local aw=(av.BaseInputConfig)if at then Merge(aw,at)end aa:
CheckConfig(aw,{ReadOnly=av.ReadOnly,Format=av.Format})av.MultiCallback=function
(...)local ax=av.Callback ax(...)end return au:MultiElement(av)end})end,function
(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,Value=aa.Accent.
Light,Disabled=false,Minimum={0,0,0},Maximum={255,255,255},BaseInputConfig={},
InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]={Format='B: %.f'}}
},Create=function(au,av)local aw,ax,ay,az=av.BaseInputConfig,av.Value,av.
Disabled,Copy(av,{Value={1,1,1},Callback=function(aw,...)if av.ValueChanged then
av:ValueChanged(...)end end})local aA=au[aq](au,az)local aB,aC=aa:
MergeMetatables(av,aA),aA.Row local aD,aE=aC:Button{BackgroundTransparency=0,
Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=1,ColorTag='',
ElementStyle=''},function(...)local aD=av.Callback return aD(aB,...)end local aF
=function(aF)aD.BackgroundColor3=aF aE(aF)end function av:ValueChanged(aG)local
aH,aI,aJ=aG[1],aG[2],aG[3]local aK=Color3.fromRGB(aH,aI,aJ)self.Value=aK aF(aK)
end function av:SetValue(aG)self.Value=aG aF(aG)aA:SetValue{math.round(aG.R*255)
,math.round(aG.G*255),math.round(aG.B*255)}end av:SetValue(ax)return aB,aC end})
end,function(ao,aq,ar,at)aa:DefineElement(ao,{Base={Label=ao,Callback=ac,Value={
Color=aa.Accent.Light,Transparency=0},Disabled=false,Minimum={0,0,0,0},Maximum={
255,255,255,255},BaseInputConfig={},InputConfigs={[1]={Format='R: %.f'},[2]={
Format='G: %.f'},[3]={Format='B: %.f'},[4]={Format='A: %.f'}}},Create=function(
au,av)local aw,ax,ay,az=av.BaseInputConfig,av.Value,av.Disabled,Copy(av,{Value={
Color=Color3.new(1,1,1),Transparency=0},Callback=function(aw,...)if av.
ValueChanged then av:ValueChanged(...)end end})local aA=au[aq](au,az)local aB,aC
=aa:MergeMetatables(av,aA),aA.Row local aD,aE=aC:Button{BackgroundTransparency=
av.Value.Transparency,Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=1,
ColorTag='',ElementStyle=''},function(...)local aD=av.Callback return aD(aB,...)
end local aF=function(aF,aG)aD.BackgroundColor3=aF aD.BackgroundTransparency=aG
aE{Color=aF,Transparency=aG}end function av:ValueChanged(aG)local aH,aI,aJ,aK=aG
[1],aG[2],aG[3],aG[4]local aL,aM=Color3.fromRGB(aH,aI,aJ),1-(aK/255)self.Value={
Color=aL,Transparency=aM}aF(aL,aM)end function av:SetValue(aG)self.Value=aG aF(
aG.Color,aG.Transparency)aA:SetValue{math.round(aG.Color.R*255),math.round(aG.
Color.G*255),math.round(aG.Color.B*255),math.round((1-aG.Transparency)*255)}end
av:SetValue(ax)return aB,aC end})end,function(ao,aq,ar,at)aa:DefineElement(ao,{
Base={Label=ao,Callback=ac,Disabled=false,Value=CFrame.new(10,10,10),Minimum=
CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),BaseInputConfig={},
InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]={Format='Z: %.f'}}
},Create=function(au,av)local aw,ax,ay,az,aA=av.BaseInputConfig,av.Value,av.
Disabled,av.Maximum,av.Minimum local aB=Copy(av,{Maximum={az.X,az.Y,az.Z},
Minimum={aA.X,aA.Y,aA.Z},Value={ax.X,ax.Y,ax.Z},Callback=function(aB,...)if av.
ValueChanged then av:ValueChanged(...)end end})local aC=au[aq](au,aB)local aD,aE
=aa:MergeMetatables(av,aC),aC.Row local aF=function(...)local aF=av.Callback
return aF(aD,...)end function av:ValueChanged(aG)local aH,aI,aJ=aG[1],aG[2],aG[3
]local aK=CFrame.new(aH,aI,aJ)self.Value=aK aF(aK)end function av:SetValue(aG)
self.Value=aG aC:SetValue{math.round(aG.X),math.round(aG.Y),math.round(aG.Z)}end
av:SetValue(ax)return aD,aE end})end ao('InputInt2','InputInt',2,{NoButtons=true
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
},Create=function(au,av)function av:SetPercentage(aw)av:SetValue(aw)end local aw
,ax=au:SliderBase(av)local ay=aw.Grab au:TagElements{[ay]={BackgroundColor3=
'ProgressBar'}}return aw,ax end})aa:DefineElement('Combo',{Base={Value='',
Placeholder='',Callback=ac,Items={},Disabled=false,WidthFitPreview=false,Label=
'Combo'},Create=function(au,av)local aw,ax,ay,az,aA,aB,aC=av.Placeholder,av.
NoAnimation,av.Selected,av.Label,av.Disabled,av.WidthFitPreview,aa:InsertPrefab(
'Combo',av)local aD,aE,aF=aa:MergeMetatables(av,aC),aC.Combo,(aa:DetectHover(aC)
)local aG,aH,aI=au:Label{Text=tostring(aw),Parent=aE,Name='ValueText'},au:
ArrowButton{Parent=aE,Ratio=1,Interactable=false,Size=UDim2.fromScale(0,0),
LayoutOrder=2},au:Label{Text=az,Parent=aC,LayoutOrder=2}if aB then aa:
SetProperties(aC,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,20)})
aa:SetProperties(aE,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromScale(0,1
)})end local aJ,aK=function(aJ,...)local aK=av.Callback av:SetOpen(false)return
aK(aD,aJ,...)end,function(aJ,aK)local aL=au:GetThemeKey'AnimationTweenInfo'aC.
Interactable=not aJ al:HeaderCollapseToggle{Tweeninfo=aL,NoAnimation=aK,
Collapsed=not aJ,Toggle=aH.Icon}end local function aL()local aM,aN=av.GetItems,
av.Items if aM then return aM()end return aN end function av:SetValueText(aM)aG.
Text=tostring(aM)end function av:SetDisabled(aM)self.Disabled=aM aC.Interactable
=not aM au:SetColorTags({[aI]=aM and'LabelDisabled'or'Label'},true)end function
av:SetValue(aM)local aN=aL()local aO=aN[aM]local aP=aO or aM self._Selected=aM
self.Value=aP if typeof(aM)=='number'then self:SetValueText(aP)else self:
SetValueText(aM)end return aJ(aM,aP)end function av:SetOpen(aM)local aN=self.
_Selected self.Open=aM aK(aM,ax)if not aM then if Dropdown then Dropdown:Close()
end return end Dropdown=au:Dropdown{ParentObject=aE,Items=aL(),Selected=aN,
OnSelected=function(...)av:SetValue(...)end,OnClosed=function()self:SetOpen(
false)end}return self end local aM=function()local aM=av.Open av:SetOpen(not aM)
end aE.Activated:Connect(aM)aK(false,true)av:SetDisabled(aA)if ay then av:
SetValue(ay)end aa:SetAnimation(aE,'Inputs')au:TagElements{[aE]='Frame'}return
aD,aC end})local au={TileBarConfig={Close={Image=aa.Icons.Close,IconSize=UDim2.
fromOffset(11,11)},Collapse={Image=aa.Icons.Arrow,IconSize=UDim2.fromScale(1,1)}
},CloseCallback=ac,Collapsible=true,Open=true,Focused=false}function au:Tween(av
)aa:CheckConfig(av,{Tweeninfo=self:GetThemeKey'AnimationTweenInfo'})return al:
Tween(av)end function au:TagElements(av)local aw=aa.Debug if not au then if aw
then aa:Warn('No WindowClass for objects registor:',av)end return end local ax,
ay=self.TagsList,self.Theme aa:MultiUpdateColors{Theme=ay,TagsList=ax,Objects=av
}end function au:MakeTitleBarCanvas()local av=self.TitleBar local aw=aa:
MakeCanvas{WindowClass=self,Element=av}self.TitleBarCanvas=aw return aw end
function au:AddDefaultTitleButtons()local av,aw=self.TileBarConfig,self.TitleBar
local ax,ay,az=av.Collapse,av.Close,self.TitleBarCanvas if not az then az=self:
MakeTitleBarCanvas()end aa:CheckConfig(self,{Toggle=az:RadioButton{Icon=ax.Image
,IconSize=ax.IconSize,LayoutOrder=1,Ratio=1,Size=UDim2.new(0,0),Callback=
function()self:ToggleCollapsed()end},CloseButton=az:RadioButton{Icon=ay.Image,
IconSize=ay.IconSize,LayoutOrder=3,Ratio=1,Size=UDim2.new(0,0),Callback=function
()self:Close()end},TitleLabel=az:Label{ColorTag='Title',LayoutOrder=2,Size=UDim2
.new(1,0),Active=false,Fill=true,AutomaticSize=Enum.AutomaticSize.XY}})self:
TagElements{[self.TitleLabel]='WindowTitle'}end function au:Close()local av=self
.CloseCallback if av then local aw=av(self)if aw==false then return end end self
:Remove()end function au:GetWindowSize()local av=self.WindowFrame return av.
AbsoluteSize end function au:GetTitleBarSizeY()local av=self.TitleBar if not av.
Visible then return 0 end return aa:GetContentSize(av,true).Y end function au:
SetVisible(av)local aw,ax=self.WindowFrame,self.NoFocusOnAppearing self.Visible=
av aw.Visible=av if av and not ax then aa:SetFocusedWindow(self)end return self
end function au:SetTitle(av)local aw=self.TitleLabel aw.Text=tostring(av)return
self end function au:Remove()local av=self.WindowFrame av:Destroy()end function
au:SetPosition(av)local aw=self.WindowFrame aw.Position=av return self end
function au:SetSize(av,aw)local ax=self.WindowFrame if typeof(av)=='Vector2'then
av=UDim2.fromOffset(av.X,av.Y)end self:Tween{Object=ax,NoAnimation=aw,
EndProperties={Size=av}}self.Size=av return self end function au:Center()local
av=self:GetWindowSize()/2 local aw=UDim2.new(0.5,-av.X,0.5,-av.Y)self:
SetPosition(aw)return self end function au:SetTheme(av)local aw,ax,ay=aa.
ThemeConfigs,self.TagsList,self.Focused if not av then av=self.Theme end assert(
aw[av],`{av} is not a valid theme!`)self.Theme=av aa:MultiUpdateColors{Animate=
false,Theme=av,Objects=ax}self:SetFocused(ay)return self end function au:
SetFocused(av)av=av==nil and true or av self.Focused=av if av then aa:
SetFocusedWindow(self)end local aw,ax,ay,az,aA,aB=self.ContentFrame,self.
TitleBar,self.Theme,self.TitleLabel,self.Collapsed,self.WindowFrame:
FindFirstChildOfClass'UIStroke'local aC={Focused={[aB]='BorderActive',[ax]=
'TitleBarBgActive',[az]={TextColor3='TitleActive'}},UnFocused={[aB]='Border',[ax
]='TitleBarBg',[az]={TextColor3='Title'}},Collapsed={[aB]='Border',[ax]=
'TitleBarBgCollapsed',[az]={TextColor3='Title'}}}local aD=av and aC.Focused or
aC.UnFocused if aA then aD=aC.Collapsed end aa:MultiUpdateColors{Animate=true,
Objects=aD,Theme=ay}end function au:GetThemeKey(av)return aa:GetThemeKey(self.
Theme,av)end function au:ResetColors()local av,aw,ax=aa.Theme,self.Theme,self.
TagsList table.clear(aw)aa:MultiUpdateColors{Animate=false,Theme=av,Objects=ax}
return au end function au:SetCollapsible(av)self.Collapsible=av return self end
function au:ToggleCollapsed(av)local aw,ax=self.Collapsed,self.Collapsible if
not av and not ax then return self end self:SetCollapsed(not aw)return self end
function au:SetCollapsed(av,aw)local ax,ay,az,aA,aB,aC,aD,aE,aF=self.WindowFrame
,self.Body,self.Toggle,self.ResizeGrab,self.Size,self.AutoSize,self:GetThemeKey
'AnimationTweenInfo',self:GetWindowSize(),self:GetTitleBarSizeY()local aG,aH=az.
Icon,UDim2.fromOffset(aE.X,aF)self.Collapsed=av self:SetCollapsible(false)self:
SetFocused(not av)al:HeaderCollapse{Tweeninfo=aD,NoAnimation=aw,Collapsed=av,
Toggle=aG,Resize=ax,NoAutomaticSize=not aC,Hide=ay,ClosedSize=aH,OpenSize=aB,
Completed=function()self:SetCollapsible(true)end}self:Tween{Object=aA,
NoAnimation=aw,EndProperties={TextTransparency=av and 1 or 0.6,Interactable=not
av}}return self end function au:UpdateConfig(av)local aw={NoTitleBar=function(aw
)local ax=self.TitleBar ax.Visible=not aw end,NoClose=function(aw)local ax=self.
CloseButton ax.Visible=not aw end,NoCollapse=function(aw)local ax=self.Toggle ax
.Visible=not aw end,NoTabsBar=function(aw)local ax=self.WindowTabSelector if not
ax then return end local ay=ax.TabsBar ay.Visible=not aw end,NoScrollBar=
function(aw)local ax,ay,az,aA=aw and 0 or 9,self.NoScroll,self.WindowTabSelector
,self.ContentCanvas if az then az.Body.ScrollBarThickness=ax end if not ay then
aA.ScrollBarThickness=ax end end,NoScrolling=function(aw)local ax,ay,az=self.
NoScroll,self.WindowTabSelector,self.ContentCanvas if ay then ay.Body.
ScrollingEnabled=not aw end if not ax then az.ScrollingEnabled=not aw end end,
NoMove=function(aw)local ax=self.DragConnection ax:SetEnabled(not aw)end,
NoResize=function(aw)local ax=self.ResizeConnection ax:SetEnabled(not aw)end,
NoBackground=function(aw)local ax,ay=self:GetThemeKey'WindowBgTransparency',self
.CanvasFrame ay.BackgroundTransparency=aw and 1 or ax end}Merge(self,av)for ax,
ay in av do local az=aw[ax]if az then az(ay)end end return self end aa:
DefineElement('Window',{Export=true,Base={Theme='DarkTheme',NoSelect=false,
NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize=false,MinSize=
Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,NoWindowRegistor=
false,IsDragging=false},Create=function(av,aw)aa:CheckConfig(aw,{Parent=aa.
Container.Windows,Title=aa.DefaultTitle})local ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,
aI,aJ=aa.Windows,aw.NoDefaultTitleBarButtons,aw.Collapsed,aw.MinSize,aw.Title,aw
.NoTabs,aw.NoScroll,aw.Theme,aw.AutomaticSize,aw.NoWindowRegistor,aw.
AutoSelectNewTabs,aw.OpenOnDoubleClick,aw.NoCollapse local aK={Scroll=not aD,
Fill=not aF and true or nil,UiPadding=UDim.new(0,aC and 8 or 0),
AutoSelectNewTabs=aH}if aF then Merge(aK,{AutomaticSize=aF,Size=UDim2.new(1,0)})
end local aL=aa:InsertPrefab('Window',aw)local aM=aL.Content local aN,aO=aM.
TitleBar,NewClass(au)local aP,aQ,b,c,d=aa:MakeResizable{MinimumSize=aA,Resize=aL
,OnUpdate=function(aP)aO:SetSize(aP,true)end},(aa:MakeCanvas{Element=aM,
WindowClass=aO,Class=aO})local e,h=aQ:Canvas(Copy(aK,{Parent=aM}))Merge(aO,aw)
Merge(aO,{WindowFrame=aL,ContentFrame=aM,CanvasFrame=h,ResizeGrab=aP.Grab,
TitleBar=aN,Elements=am,TagsList={},ResizeConnection=aP,HoverConnection=aa:
DetectHover(aM),DragConnection=aa:MakeDraggable{Move=aL,Grab=aM,
OnDragStateChange=function(k)aO.IsDragging=k h.Interactable=not k if k then aa:
SetFocusedWindow(d)end aa:SetWindowFocusesEnabled(not k)end}})if aC then b,c=e,h
else b,c=e:TabSelector(aK)aO.WindowTabSelector=b end Merge(aO,{Body=c,
ContentCanvas=b})aa:ConnectMouseEvent(aM,{DoubleClick=true,OnlyMouseHovering=aN,
Callback=function(...)if not aO.OpenOnDoubleClick then return end if aO.
NoCollapse then return end aO:ToggleCollapsed()end})if not ay then aO:
AddDefaultTitleButtons()end aO:SetTitle(aB)aO:SetCollapsed(az,true)aO:SetTheme(
aE)aO:UpdateConfig(aw)aO:SetFocused()d=aa:MergeMetatables(aO,b)if not aG then
table.insert(ax,d)end local k=aP.Grab aa:SetAnimation(k,'TextButtons')d:
TagElements{[k]='ResizeGrab',[aN]='TitleBar',[h]='Window'}return d,aL end})aa:
DefineElement('TabsWindow',{Export=true,Base={NoTabs=false,AutoSelectNewTabs=
true},Create=function(av,aw)return av:Window(aw)end})aa:DefineElement(
'PopupCanvas',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=
function(av,aw)local ax,ay=av.WindowClass,aw.Scroll local az=ay and
'ScrollingCanvas'or'Canvas'local aA=aa:InsertPrefab(az,aw)function aw:ClosePopup
()aA:Destroy()end function aw:ShowPopup()aA.Visible=true end local aB,aC=aa:
DetectHover(aA,{MouseOnly=true,OnInput=function(aB,aC)if aB then return end aw:
ClosePopup()end}),aa:MakeCanvas{Element=aA,WindowClass=ax,Class=aw}return aC,aA
end})aa:DefineElement('PopupModal',{Export=true,Base={NoAnimation=false,
NoCollapse=true,NoClose=true,NoResize=true,NoSelect=true,NoAutoFlags=true,
NoWindowRegistor=true,NoScroll=true},Create=function(av,aw)local ax,ay,az=av.
WindowClass,(aw.NoAnimation)aw.Parent=aa.Container.Overlays if ax then az=ax:
GetThemeKey'ModalWindowDimTweenInfo'aw.Theme=ax.Theme end local aA=aa:
InsertPrefab('ModalEffect',aw)local aB=av:Window(Copy(aw,{Parent=aA,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(372
,38),NoAutoFlags=false,AutomaticSize=Enum.AutomaticSize.Y}))function aw:
ClosePopup()al:Tween{Object=aA,Tweeninfo=az,NoAnimation=ay,EndProperties={
BackgroundTransparency=1},Completed=function()aA:Destroy()end}aB:Close()end al:
Tween{Object=aA,Tweeninfo=az,NoAnimation=ay,StartProperties={
BackgroundTransparency=1},EndProperties={BackgroundTransparency=0.8}}av:
TagElements{[aA]='ModalWindowDim'}local aC=aa:MergeMetatables(aw,aB)return aC,aA
end})local av=`rbxassetid://`..aa.PrefabsId aa:Init{Prefabs=game:GetService
'InsertService':LoadLocalAsset(av)}return aa end function a.i()return function(
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
(av)au.Text=av and string.format(
'Target: <font color="rgb(40, 240, 10)">%q</font>',av.Name)or
'Target: <font color="rgb(240, 40, 10)">None</font>'end local av,aw ao:Combo{
Selected='Camera',Label='Lock Mode',Items={'Camera','Mouse'},Callback=function(
ax,ay)ah.LockMode=({Camera=1,Mouse=2})[ay]if av and aw then av:SetDisabled(ay~=
'Camera')aw:SetDisabled(ay~='Mouse')end end}ao:Keybind{Label='Trigger Keybind',
Value=Enum.KeyCode.E,OnKeybindSet=function(ax,ay)ah.TriggerKey=ay end}for ax,ay
in ipairs{{'Toggle Activation','ToggleTrigger',nil},{'Team Check','TeamCheck',
true},{'Alive Check','AliveCheck',true}}do ao:Checkbox{Label=ay[1],Value=ay[3],
Callback=function(az,aA)ah[ay[2] ]=aA end}end ao:Combo{Label='Wall Check',
Selected='Always On',Items={'Off','Sticky','Always On'},Callback=function(ax,ay)
local az=table.find(ax.Items,ay)if az then ah.WallCheck=az end end}ao:Combo{
Selected='Head',Label='Aiming Bone',Items={'Head','Torso'},Callback=function(ax,
ay)ah.LockPart=ay end}av=ao:SliderFloat{Label='Smoothing (Camera)',Minimum=0,
Maximum=1,Value=0,Format='Smoothing = %.3f',Callback=function(ax,ay)ah.
Sensitivity=ay end}aw=ao:SliderFloat{Label='Smoothing (Mouse)',Minimum=1,Maximum
=20,Value=1,Format='Smoothing = %.1f',Callback=function(ax,ay)ah.Sensitivity2=ay
end}aw:SetDisabled(true)local ax=an:CreateTab{Name='Triggerbot'}ax:Checkbox{
Label='Enabled',Value=false,Callback=function(ay,az)ai.Enabled=az end}local ay=
ax:Label{RichText=true,Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'}ai.TargetChanged=
function(az)if not az then ay.Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'else ay.Text=`Trigger Target: <font color="rgb(40, 240, 10)">{
az.Name}</font>`end end for az,aA in ipairs{{'Team Check','TeamCheck',true},{
'Alive Check','AliveCheck',true}}do ax:Checkbox{Label=aA[1],Value=aA[3],Callback
=function(aB,aC)ai[aA[2] ]=aC end}end ax:InputInt{Label='Trigger Delay (ms)',
Value=0,Minimum=0,Increment=25,Callback=function(az,aA)ai.Delay=aA/1000 end}am.
Combat:Separator{Text='FOV Settings'}for az,aA in ipairs{{'Enabled','Enabled',
true},{'Visible','Visible',true}}do am.Combat:Checkbox{Label=aA[1],Value=aA[3],
Callback=function(aB,aC)aj[aA[2] ]=aC end}end for az,aA in ipairs{{'Radius',
'Radius',0,500,120,'%.0f'},{'Circle Sides','NumSides',3,80,25,'%.0f'},{
'Transparency','Transparency',0,1,0,'%.3f'}}do am.Combat:SliderFloat{Label=aA[1]
,Minimum=aA[3],Maximum=aA[4],Value=aA[5],Format=aA[1]..' = '..aA[6],Callback=
function(aB,aC)aj[aA[2] ]=aC end}end for az,aA in ipairs{{'Color','Color',Color3
.fromRGB(240,40,10)},{'Color (Locked)','LockedColor',Color3.fromRGB(40,240,10)}}
do am.Combat:DragColor3{Label=aA[1],Value=aA[3],Callback=function(aB,aC)aj[aA[2]
]=aC end}end am.Visuals:Separator{Text='Shared Settings'}local az local aA=am.
Visuals:Checkbox{Label='Limit Distance',Value=false,Callback=function(aA,aB)ad.
shared.limitDistance=aB if az then az:SetDisabled(not aB)end end}az=am.Visuals:
SliderFloat{Label='Limit',Minimum=1,Maximum=500,Value=150,Format=
'Distance Limit = %.0f',Callback=function(aB,aC)ad.shared.maxDistance=aC end}az:
SetDisabled(not aA.Value)am.Visuals:Separator{Text='ESP'}local aB,aC=am.Visuals:
TabSelector{Size=UDim2.new(1,0,0,400)},function(aB,aC)aC:Checkbox{Label=
'Enabled',Value=false,Callback=function(aD,aE)aB.enabled=aE end}aC:Separator{
Text='Boxes'}aC:Checkbox{Label='Enabled',Value=true,Callback=function(aD,aE)aB.
box=aE end}aC:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',Callback=
function(aD,aE)aB.boxColor[1]=aE end}aC:SliderFloat{Label='Transparency',Minimum
=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aD,aE)aB.
boxColor[2]=1-aE aB.boxOutlineColor[2]=1-aE end}aC:Separator{Text='3D Boxes'}aC:
Checkbox{Label='Enabled',Value=true,Callback=function(aD,aE)aB.box3d=aE end}aC:
DragColor3{Value=Color3.fromRGB(155,205,255),Label='Color',Callback=function(aD,
aE)aB.box3dColor[1]=aE end}aC:SliderFloat{Label='Transparency',Minimum=0,Maximum
=1,Value=0,Format='Transparency = %.3f',Callback=function(aD,aE)aB.box3dColor[2]
=1-aE end}aC:Separator{Text='Box Fill'}aC:Checkbox{Label='Enabled',Value=true,
Callback=function(aD,aE)aB.boxFill=aE end}aC:DragColor3{Value=Color3.fromRGB(0,0
,0),Label='Color',Callback=function(aD,aE)aB.boxFillColor[1]=aE end}aC:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0.2,Format=
'Transparency = %.3f',Callback=function(aD,aE)aB.boxFillColor[2]=aE end}aC:
Separator{Text='Chams'}aC:Checkbox{Label='Enabled',Value=true,Callback=function(
aD,aE)aB.chams=aE end}aC:Checkbox{Label='Always On Top',Value=true,Callback=
function(aD,aE)aB.chamsVisibleOnly=not aE end}aC:DragColor3{Value=Color3.
fromRGB(100,120,250),Label='Color (Fill)',Callback=function(aD,aE)aB.
chamsFillColor[1]=aE end}aC:SliderFloat{Label='Transparency (Fill)',Minimum=0,
Maximum=1,Value=0.8,Format='Transparency = %.3f',Callback=function(aD,aE)aB.
chamsFillColor[2]=aE end}aC:DragColor3{Value=Color3.fromRGB(25,85,255),Label=
'Color (Outline)',Callback=function(aD,aE)aB.chamsOutlineColor[1]=aE end}aC:
SliderFloat{Label='Transparency (Outline)',Minimum=0,Maximum=1,Value=0.5,Format=
'Transparency = %.3f',Callback=function(aD,aE)aB.chamsOutlineColor[2]=aE end}aC:
Separator{Text='Tracers'}aC:Checkbox{Label='Enabled',Value=true,Callback=
function(aD,aE)aB.tracer=aE end}aC:DragColor3{Value=Color3.fromRGB(77,92,143),
Label='Color',Callback=function(aD,aE)aB.tracerColor[1]=aE end}aC:SliderFloat{
Label='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(aD,aE)aB.tracerColor[2]=1-aE aB.tracerOutlineColor[2]=1-aE end
}aC:Combo{Selected='Top',Label='Tracer Origin',Items={'Top','Middle','Bottom',
'Mouse'},Callback=function(aD,aE)aB.tracerOrigin=aE end}aC:Separator{Text=
'Health Bars'}aC:Checkbox{Label='Enabled',Value=true,Callback=function(aD,aE)aB.
healthBar=aE end}aC:DragColor3{Value=Color3.fromRGB(58,161,47),Label=
'Healthy Color',Callback=function(aD,aE)aB.healthyColor=aE end}aC:DragColor3{
Value=Color3.fromRGB(161,47,47),Label='Dying Color',Callback=function(aD,aE)aB.
dyingColor=aE end}aC:Separator{Text='Off Screen Arrows'}aC:Checkbox{Label=
'Enabled',Value=true,Callback=function(aD,aE)aB.offScreenArrow=aE end}aC:
DragColor3{Value=Color3.fromRGB(255,255,255),Label='Color',Callback=function(aD,
aE)aB.offScreenArrowColor[1]=aE end}aC:SliderFloat{Label='Transparency',Minimum=
0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aD,aE)aB.
offScreenArrowColor[2]=1-aE aB.offScreenArrowOutlineColor[2]=1-aE end}aC:
SliderInt{Label='Size',Value=15,Minimum=1,Maximum=50,Callback=function(aD,aE)aB.
offScreenArrowSize=aE end}aC:SliderInt{Label='Radius',Value=150,Minimum=1,
Maximum=800,Callback=function(aD,aE)aB.offScreenArrowRadius=aE end}aC:Separator{
Text='Names'}aC:Checkbox{Label='Enabled',Value=true,Callback=function(aD,aE)aB.
name=aE end}aC:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',
Callback=function(aD,aE)aB.nameColor[1]=aE end}aC:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback
=function(aD,aE)aB.nameColor[2]=1-aE end}aC:Separator{Text='Distance Text'}aC:
Checkbox{Label='Enabled',Value=true,Callback=function(aD,aE)aB.distance=aE end}
aC:DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',Callback=function(
aD,aE)aB.distanceColor[1]=aE end}aC:SliderFloat{Label='Transparency',Minimum=0,
Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(aD,aE)aB.
distanceColor[2]=1-aE end}aC:Separator{Text='Weapon Text'}aC:Checkbox{Label=
'Weapon Text',Value=true,Callback=function(aD,aE)aB.weapon=aE end}aC:DragColor3{
Value=Color3.fromRGB(200,173,182),Label='Color',Callback=function(aD,aE)aB.
weaponColor[1]=aE end}aC:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(aD,aE)aB.weaponColor[2]=1
-aE end}aC:Separator{Text='Health Text'}aC:Checkbox{Label='Health Text',Value=
true,Callback=function(aD,aE)aB.healthText=aE end}aC:DragColor3{Value=Color3.
fromRGB(200,173,182),Label='Color',Callback=function(aD,aE)aB.healthTextColor[1]
=aE end}aC:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(aD,aE)aB.healthTextColor[2]=1-aE end}end
local aD=aB:CreateTab{Name='Enemy'}aC(af,aD)local aE=aB:CreateTab{Name=
'Friendly'}aC(ag,aE)am.Settings:Keybind{Label='Menu Keybind',Value=Enum.KeyCode.
Home,IgnoreGameProcessed=false,Callback=function(aF,aG)al:SetVisible(not al.
Visible)end}ad.Load()ae.Load()end end end local aa={linoriaBase={Name=
'linoriaBase',Load=a.load'e'},riotUiBase={Name='riotUiBase',Load=a.load'g'},
Universal={Name='Universal',Load=a.load'i'}}for ab,ac in pairs(aa)do if ac.
Places then for ad,ae in ipairs(ac.Places)do if ae==game.PlaceId then ac:Load()
return end end end end aa.riotUiBase:Load()