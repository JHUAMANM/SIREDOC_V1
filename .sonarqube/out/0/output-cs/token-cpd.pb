Î
7D:\Proyectos Rider\SIREDOC\SIREDOC\Constantes\ESTADO.cs
	namespace 	
SIREDOC
 
. 

Constantes 
; 
public 
class 
ESTADO 
{ 
public 

const 
int 
POR_ATENDER  
=! "
$num# $
;$ %
public 

const 
int 

EN_PROCESO 
=  !
$num" #
;# $
public 

const 
int 
ATENDIDO 
= 
$num  !
;! "
} ó
@D:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\AuthController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
public

 
class

 
AuthController

 
:

 

Controller

 (
{ 
private 

DbEntities 
_dbEntities "
;" #
public 

AuthController 
( 

DbEntities $

dbEntities% /
)/ 0
{ 
_dbEntities 
= 

dbEntities  
;  !
} 
[ 
HttpGet 
] 
public 

IActionResult 
Login 
( 
)  
{ 
return 
View 
( 
) 
; 
} 
[ 
HttpPost 
] 
public 

IActionResult 
Login 
( 
string %
username& .
,. /
string0 6
password7 ?
)? @
{ 
if 

( 
_dbEntities 
. 
Usuarios  
.  !
Any! $
($ %
x% &
=>' )
x* +
.+ ,
Username, 4
==5 7
username8 @
&&A C
xD E
.E F
PasswordF N
==O Q
passwordR Z
)Z [
)[ \
{ 	
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
(( )
)) *
{ 
new 
Claim 
( 

ClaimTypes $
.$ %
Name% )
,) *
username+ 3
)3 4
,4 5
} 
; 
var   
claimsIdentity   
=    
new  ! $
ClaimsIdentity  % 3
(  3 4
claims  4 :
,  : ;(
CookieAuthenticationDefaults  < X
.  X Y 
AuthenticationScheme  Y m
)  m n
;  n o
var!! 
claimsPrincipal!! 
=!!  !
new!!" %
ClaimsPrincipal!!& 5
(!!5 6
claimsIdentity!!6 D
)!!D E
;!!E F
HttpContext## 
.## 
SignInAsync## #
(### $
claimsPrincipal##$ 3
)##3 4
;##4 5
return%% 
RedirectToAction%% #
(%%# $
$str%%$ +
,%%+ ,
$str%%- 8
)%%8 9
;%%9 :
}&& 	

ModelState'' 
.'' 
AddModelError''  
(''  !
$str''! ,
,'', -
$str''. N
)''N O
;''O P
return(( 
View(( 
((( 
)(( 
;(( 
})) 
[++ 
HttpGet++ 
]++ 
public,, 

IActionResult,, 
Logout,, 
(,,  
),,  !
{-- 
HttpContext.. 
... 
SignOutAsync..  
(..  !
)..! "
;.." #
return// 
RedirectToAction// 
(//  
$str//  '
)//' (
;//( )
}11 
}22 •_
ED:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\DocumentoController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
[ 
	Authorize 

]
 
public 
class 
DocumentoController  
:  !

Controller" ,
{ 
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
private 
readonly (
IEfectivoPolicialRepositorio 1(
_efectivoPolicialRepositorio2 N
;N O
private 
readonly !
IDocumentoRepositorio *!
_documentoRepositorio+ @
;@ A
private 
readonly 
IUsuarioRepositorio (
_usuarioRepositorio) <
;< =
private 

DbEntities 
_dbEntities "
;" #
public 

DocumentoController 
( (
IEfectivoPolicialRepositorio ;'
efectivoPolicialRepositorio< W
,W X!
IDocumentoRepositorioY n!
documentoRepositorio	o É
,
É Ñ!
IUsuarioRepositorio
Ö ò 
usuarioRepositorio
ô ´
,
´ ¨
IWebHostEnvironment 
environment '
,' (

DbEntities) 3

dbEntities4 >
)> ?
{ (
_efectivoPolicialRepositorio $
=% &'
efectivoPolicialRepositorio' B
;B C!
_documentoRepositorio 
=  
documentoRepositorio  4
;4 5
_usuarioRepositorio 
= 
usuarioRepositorio 0
;0 1
_environment 
= 
environment "
;" #
_dbEntities 
= 

dbEntities  
;  !
} 
[   
HttpGet   
]   
public!! 

IActionResult!! 
Index!! 
(!! 
string!! %
buscar!!& ,
)!!, -
{"" 
var$$ 
usuario$$ 
=$$ 
GetLoggedUser$$ #
($$# $
)$$$ %
;$$% &
var%% 

documentos%% 
=%% !
_documentoRepositorio%% .
.%%. /&
ObtenerDocumentosDeUsuario%%/ I
(%%I J
usuario%%J Q
.%%Q R
Id%%R T
,%%T U
buscar%%V \
)%%\ ]
;%%] ^
return'' 
View'' 
('' 

documentos'' 
)'' 
;''  
}(( 
[** 
HttpGet** 
]** 
public++ 

IActionResult++ 
Create++ 
(++  
)++  !
{,, 
ViewBag-- 
.-- 
Policia-- 
=-- (
_efectivoPolicialRepositorio-- 6
.--6 7
ObtenerTodos--7 C
(--C D
)--D E
;--E F
return.. 
View.. 
(.. 
new.. 
	Documento.. !
(..! "
).." #
)..# $
;..$ %
}// 
[11 
HttpPost11 
]11 
public22 

IActionResult22 
Create22 
(22  
	Documento22  )
	documento22* 3
)223 4
{33 
Upload44 
(44 
	documento44 
.44 
Archivo44  
)44  !
;44! "
	documento55 
.55 
	UsuarioId55 
=55 
GetLoggedUser55 +
(55+ ,
)55, -
.55- .
Id55. 0
;550 1
if77 

(77 
	documento77 
.77 

EfectivoId77  
>77! "
$num77# %
||77& (
	documento77) 2
.772 3

EfectivoId773 =
<77> ?
$num77@ A
)77A B
{88 	

ModelState99 
.99 
AddModelError99 $
(99$ %
$str99% 1
,991 2
$str993 S
)99S T
;99T U
}:: 	
if<< 

(<< 
!<< 

ModelState<< 
.<< 
IsValid<< 
)<<  
{== 	
ViewBag>> 
.>> 
Policia>> 
=>> (
_efectivoPolicialRepositorio>> :
.>>: ;
ObtenerTodos>>; G
(>>G H
)>>H I
;>>I J
return?? 
View?? 
(?? 
$str??  
,??  !
	documento??" +
)??+ ,
;??, -
}@@ 	
	documentoBB 
.BB 
EstadoBB 
=BB 
ESTADOBB !
.BB! "
POR_ATENDERBB" -
;BB- .!
_documentoRepositorioCC 
.CC 
GuardarDocumentoCC .
(CC. /
	documentoCC/ 8
)CC8 9
;CC9 :
TempDataEE 
[EE 
$strEE !
]EE! "
=EE# $
$strEE% G
;EEG H
returnFF 
RedirectToActionFF 
(FF  
$strFF  '
)FF' (
;FF( )
}HH 
[KK 
HttpGetKK 
]KK 
publicLL 

IActionResultLL 
EditLL 
(LL 
intLL !
idLL" $
)LL$ %
{MM 
varNN 
	documentoNN 
=NN !
_documentoRepositorioNN -
.NN- .#
GetEditarDocumentoPorIdNN. E
(NNE F
idNNF H
)NNH I
;NNI J
ViewBagOO 
.OO 
PoliciaOO 
=OO (
_efectivoPolicialRepositorioOO 6
.OO6 7
ObtenerTodosOO7 C
(OOC D
)OOD E
;OOE F
returnPP 
ViewPP 
(PP 
	documentoPP 
)PP 
;PP 
}QQ 
[SS 
HttpPostSS 
]SS 
publicTT 

IActionResultTT 
EditTT 
(TT 
intTT !
idTT" $
,TT$ %
	DocumentoTT& /
	documentoTT0 9
)TT9 :
{UU 
ifVV 

(VV 
!VV 

ModelStateVV 
.VV 
IsValidVV 
)VV  
{VV! "
ViewBagWW 
.WW 
PoliciaWW 
=WW 
_dbEntitiesWW )
.WW) *
EfectivoPolicialsWW* ;
.WW; <
ToListWW< B
(WWB C
)WWC D
;WWD E
returnXX 
ViewXX 
(XX 
$strXX 
,XX 
	documentoXX  )
)XX) *
;XX* +
}YY 	!
_documentoRepositorio\\ 
.\\ $
PostEditarDocumentoPorId\\ 6
(\\6 7
id\\7 9
,\\9 :
	documento\\: C
)\\C D
;\\D E
TempData]] 
[]] 
$str]] !
]]]! "
=]]# $
$str]]% F
;]]F G
return^^ 
RedirectToAction^^ 
(^^  
$str^^  '
)^^' (
;^^( )
}__ 
[aa 
HttpGetaa 
]aa 
publicbb 

IActionResultbb 
Deletebb 
(bb  
intbb  #
idbb$ &
)bb& '
{cc !
_documentoRepositorioee 
.ee 
DeleteDocPorIdee ,
(ee, -
idee- /
)ee/ 0
;ee0 1
TempDataff 
[ff 
$strff !
]ff! "
=ff# $
$strff% H
;ffH I
returngg 
RedirectToActiongg 
(gg  
$strgg  '
)gg' (
;gg( )
}hh 
[kk 
HttpGetkk 
]kk 
publicll 

ActionResultll 
MarcarEnProcesoll '
(ll' (
intll( +
documentoIdll, 7
)ll7 8
{mm 
Usuarionn 
usernn 
=nn 
GetLoggedUsernn $
(nn$ %
)nn% &
;nn& '!
_documentoRepositoriopp 
.pp '
ActualizarEstadoDeDocumentopp 9
(pp9 :
documentoIdpp: E
,ppE F
userppG K
.ppK L
IdppL N
)ppN O
;ppO P
TempDatarr 
[rr 
$strrr !
]rr! "
=rr# $
$strrr% ;
;rr; <
returntt 
RedirectToActiontt 
(tt  
$strtt  '
)tt' (
;tt( )
}uu 
[ww 
HttpGetww 
]ww 
publicxx 

ActionResultxx 
MarcarComoAtendidoxx *
(xx* +
intxx+ .
documentoIdxx/ :
)xx: ;
{yy 
Usuariozz 
userzz 
=zz 
GetLoggedUserzz $
(zz$ %
)zz% &
;zz& '!
_documentoRepositorio|| 
.||  
MarcarAtendidoEstado|| 2
(||2 3
documentoId||3 >
,||> ?
user||@ D
.||D E
Id||E G
)||G H
;||H I
TempData~~ 
[~~ 
$str~~ !
]~~! "
=~~# $
$str~~% 9
;~~9 :
return
ÅÅ 
RedirectToAction
ÅÅ 
(
ÅÅ  
$str
ÅÅ  '
)
ÅÅ' (
;
ÅÅ( )
}
ÇÇ 
private
ÉÉ 

Usuario
ÉÉ 
GetLoggedUser
ÉÉ  
(
ÉÉ  !
)
ÉÉ! "
{
ÑÑ 
var
ÜÜ 
claim
ÜÜ 
=
ÜÜ 
HttpContext
ÜÜ 
.
ÜÜ  
User
ÜÜ  $
.
ÜÜ$ %
Claims
ÜÜ% +
.
ÜÜ+ ,
FirstOrDefault
ÜÜ, :
(
ÜÜ: ;
x
ÜÜ; <
=>
ÜÜ= ?
x
ÜÜ@ A
.
ÜÜA B
Type
ÜÜB F
==
ÜÜG I

ClaimTypes
ÜÜJ T
.
ÜÜT U
Name
ÜÜU Y
)
ÜÜY Z
;
ÜÜZ [
var
áá 
username
áá 
=
áá 
claim
áá 
.
áá 
Value
áá "
;
áá" #
return
ââ !
_usuarioRepositorio
ââ !
.
ââ! "
ObtenerLoggedUser
ââ" 3
(
ââ3 4
username
ââ4 <
)
ââ< =
;
ââ= >
}
ãã 
public
çç 
async
çç	 
Task
çç 
<
çç 
IActionResult
çç !
>
çç! "
Upload
çç# )
(
çç) *
string
çç* 0
path
çç1 5
)
çç5 6
{
éé 
string
êê 

sourceFile
êê 
=
êê 
System
êê !
.
êê! "
IO
êê" $
.
êê$ %
Path
êê% )
.
êê) *
Combine
êê* 1
(
êê1 2
$str
êê2 h
,
êêh i
path
êêj n
)
êên o
;
êêo p
string
îî 
destinationFile
îî 
=
îî 
System
îî  &
.
îî& '
IO
îî' )
.
îî) *
Path
îî* .
.
îî. /
Combine
îî/ 6
(
îî6 7
_environment
îî7 C
.
îîC D
ContentRootPath
îîD S
,
îîS T
$str
îîU ^
,
îî^ _
path
îî` d
)
îîd e
;
îîe f
if
ññ 	
(
ññ
 
!
ññ 
System
ññ 
.
ññ 
IO
ññ 
.
ññ 
	Directory
ññ 
.
ññ  
Exists
ññ  &
(
ññ& '
$str
ññ' 0
)
ññ0 1
)
ññ1 2
{
óó 
System
òò 
.
òò 
IO
òò 
.
òò 
	Directory
òò 
.
òò 
CreateDirectory
òò .
(
òò. /
$str
òò/ 8
)
òò8 9
;
òò9 :
}
ôô 
System
öö 
.
öö 
IO
öö 
.
öö 
File
öö 
.
öö 
Copy
öö 
(
öö 

sourceFile
öö %
,
öö% &
destinationFile
öö' 6
)
öö6 7
;
öö7 8
Console
úú 
.
úú 
	WriteLine
úú 
(
úú 

sourceFile
úú #
)
úú# $
;
úú$ %
return
ùù 
RedirectToAction
ùù 
(
ùù 
$str
ùù &
)
ùù& '
;
ùù' (
}
ûû 
}†† ≈2
LD:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\EfectivoPolicialController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
[

 
	Authorize

 

]


 
public 
class &
EfectivoPolicialController '
:( )

Controller* 4
{ 
private 
readonly (
IEfectivoPolicialRepositorio 1(
_efectivoPolicialRepositorio2 N
;N O
private 
readonly &
IUnidadPolicialRepositorio /&
_unidadPolicialRepositorio0 J
;J K
private 

DbEntities 
_dbEntities "
;" #
public 
&
EfectivoPolicialController %
(% &(
IEfectivoPolicialRepositorio& B'
efectivoPolicialRepositorioC ^
,^ _&
IUnidadPolicialRepositorio` z&
unidadPolicialRepositorio	{ î
,
î ï

DbEntities
ñ †

dbEntities
° ´
)
´ ¨
{ (
_efectivoPolicialRepositorio $
=% &'
efectivoPolicialRepositorio' B
;B C&
_unidadPolicialRepositorio "
=# $%
unidadPolicialRepositorio% >
;> ?
_dbEntities 
= 

dbEntities  
;  !
} 
[ 
HttpGet 
] 
public 

IActionResult 
Index 
( 
)  
{ 
var 
unidades 
= (
_efectivoPolicialRepositorio 3
.3 4!
ObtenerEfectivosTodos4 I
(I J
)J K
;K L
return 
View 
( 
unidades 
) 
; 
} 
[   
HttpGet   
]   
public!! 

IActionResult!! 
Create!! 
(!!  
)!!  !
{"" 
ViewBag## 
.## 
Unidad## 
=## &
_unidadPolicialRepositorio## 3
.##3 4
ObtenerTodos##4 @
(##@ A
)##A B
;##B C
return$$ 
View$$ 
($$ 
new$$ 
EfectivoPolicial$$ (
($$( )
)$$) *
)$$* +
;$$+ ,
}%% 
['' 
HttpPost'' 
]'' 
public(( 

IActionResult(( 
Create(( 
(((  
EfectivoPolicial((  0
	efectivos((1 :
)((: ;
{)) 
if++ 

(++ 
	efectivos++ 
.++ 
UnidadId++ 
>++  
$num++! "
||++# %
	efectivos++& /
.++/ 0
UnidadId++0 8
<++9 :
$num++; <
)++< =
{,, 	

ModelState-- 
.-- 
AddModelError-- $
(--$ %
$str--% /
,--/ 0
$str--1 O
)--O P
;--P Q
}.. 	
if00 

(00 
!00 

ModelState00 
.00 
IsValid00 
)00  
{11 	
ViewBag22 
.22 
Unidad22 
=22 &
_unidadPolicialRepositorio22 7
.227 8
ObtenerTodos228 D
(22D E
)22E F
;22F G
return33 
View33 
(33 
$str33  
,33  !
	efectivos33" +
)33+ ,
;33, -
}44 	(
_efectivoPolicialRepositorio66 $
.66$ %
GuardarEfectivo66% 4
(664 5
	efectivos665 >
)66> ?
;66? @
TempData77 
[77 
$str77 !
]77! "
=77# $
$str77% F
;77F G
return88 
RedirectToAction88 
(88  
$str88  '
)88' (
;88( )
}99 
[;; 
HttpGet;; 
];; 
public<< 

IActionResult<< 
Edit<< 
(<< 
int<< !
id<<" $
)<<$ %
{== 
var>> 

efectivo>> 
=>> (
_efectivoPolicialRepositorio>> 2
.>>2 3 
ObtenerEfectivoPorId>>3 G
(>>G H
id>>H J
)>>J K
;>>K L
ViewBag?? 
.?? 
Unidad?? 
=?? &
_unidadPolicialRepositorio?? 3
.??3 4
ObtenerTodos??4 @
(??@ A
)??A B
;??B C
return@@ 
View@@ 
(@@ 
efectivo@@ 
)@@ 
;@@ 
}AA 
[CC 
HttpPostCC 
]CC 
publicDD 

IActionResultDD 
EditDD 
(DD 
intDD !
idDD" $
,DD$ %
EfectivoPolicialDD& 6
	efectivosDD7 @
)DD@ A
{EE 
ifFF 

(FF 
!FF 

ModelStateFF 
.FF 
IsValidFF 
)FF  
{FF! "
ViewBagGG 
.GG 
PersonaGG 
=GG 
_dbEntitiesGG )
.GG) *
UnidadPolicialsGG* 9
.GG9 :
ToListGG: @
(GG@ A
)GGA B
;GGB C
returnHH 
ViewHH 
(HH 
$strHH 
,HH 
	efectivosHH  )
)HH) *
;HH* +
}II 	(
_efectivoPolicialRepositorioKK $
.KK$ %
EditarEfectivoPorIdKK% 8
(KK8 9
idKK9 ;
,KK; <
	efectivosKK= F
)KKF G
;KKG H
TempDataLL 
[LL 
$strLL !
]LL! "
=LL# $
$strLL% E
;LLE F
returnMM 
RedirectToActionMM 
(MM  
$strMM  '
)MM' (
;MM( )
}NN 
[PP 
HttpGetPP 
]PP 
publicQQ 

IActionResultQQ 
DeleteQQ 
(QQ  
intQQ  #
idQQ$ &
)QQ& '
{RR (
_efectivoPolicialRepositorioSS $
.SS$ %
DeleteEfectivoSS% 3
(SS3 4
idSS4 6
)SS6 7
;SS7 8
TempDataTT 
[TT 
$strTT !
]TT! "
=TT# $
$strTT% G
;TTG H
returnUU 
RedirectToActionUU 
(UU  
$strUU  '
)UU' (
;UU( )
}VV 
}XX –
@D:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\HomeController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
public 
class 
HomeController 
: 

Controller (
{ 
public 

IActionResult 
Index 
( 
)  
{ 
return 
View 
( 
) 
; 
} 
public 

IActionResult 
Privacy  
(  !
)! "
{ 
return 
View 
( 
) 
; 
} 
public 

IActionResult 
Contacto !
(! "
)" #
{ 
ViewBag 
. 
Message 
= 
$str %
;% &
return 
View 
( 
) 
; 
} 
[ 
ResponseCache 
( 
Duration 
= 
$num 
,  
Location! )
=* +!
ResponseCacheLocation, A
.A B
NoneB F
,F G
NoStoreH O
=P Q
trueR V
)V W
]W X
public   

IActionResult   
Error   
(   
)    
{!! 
return"" 
View"" 
("" 
new"" 
ErrorViewModel"" &
{""' (
	RequestId""( 1
=""2 3
Activity""4 <
.""< =
Current""= D
?""D E
.""E F
Id""F H
??""I K
HttpContext""L W
.""W X
TraceIdentifier""X g
}""g h
)""h i
;""i j
}## 
}$$ ß/
JD:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\UnidadPolicialController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
public 
class $
UnidadPolicialController %
:& '

Controller( 2
{		 
private

 
readonly

 &
IUnidadPolicialRepositorio

 /&
_unidadPolicialRepositorio

0 J
;

J K
private 

DbEntities 
_dbEntities "
;" #
public 
$
UnidadPolicialController #
(# $&
IUnidadPolicialRepositorio$ >%
unidadPolicialRepositorio? X
,X Y

DbEntitiesZ d

dbEntitiese o
)o p
{ &
_unidadPolicialRepositorio "
=# $%
unidadPolicialRepositorio% >
;> ?
_dbEntities 
= 

dbEntities  
;  !
} 
[ 
HttpGet 
] 
public 

IActionResult 
Index 
( 
)  
{ 
var 
items 
= &
_unidadPolicialRepositorio .
.. /
ObtenerTodos/ ;
(; <
)< =
;= >
return 
View 
( 
items 
) 
; 
} 
[ 
HttpGet 
] 
public 

IActionResult 
Create 
(  
)  !
{ 
ViewBag 
. 
Unidad 
= &
_unidadPolicialRepositorio 3
.3 4
ObtenerTodos4 @
(@ A
)A B
;B C
return 
View 
( 
new 
UnidadPolicial &
(& '
)' (
)( )
;) *
}   
["" 
HttpPost"" 
]"" 
public## 

IActionResult## 
Create## 
(##  
UnidadPolicial##  .
unidades##/ 7
)##7 8
{$$ 
var&& 
unidad&& 
=&& &
_unidadPolicialRepositorio&& /
.&&/ 0
ContarPorNombre&&0 ?
(&&? @
unidades&&@ H
)&&H I
;&&I J
if(( 

((( 
unidad(( 
>(( 
$num(( 
)(( 
{)) 	

ModelState** 
.** 
AddModelError** $
(**$ %
$str**% -
,**- .
$str**/ N
)**N O
;**O P
}++ 	
if.. 

(.. 
!.. 

ModelState.. 
... 
IsValid.. 
)..  
{// 	
ViewBag00 
.00 
TipoDeCuentas00  
=00! "&
_unidadPolicialRepositorio00# =
.00= >
ObtenerTodos00> J
(00J K
)00K L
;00L M
return11 
View11 
(11 
$str11  
,11  !
unidades11" *
)11* +
;11+ ,
}22 	&
_unidadPolicialRepositorio44 "
.44" #
GuardarUnidad44# 0
(440 1
unidades441 9
)449 :
;44: ;
TempData55 
[55 
$str55 !
]55! "
=55# $
$str55% D
;55D E
return66 
RedirectToAction66 
(66  
$str66  '
)66' (
;66( )
}77 
[99 
HttpGet99 
]99 
public:: 

IActionResult:: 
Edit:: 
(:: 
int:: !
id::" $
)::$ %
{;; 
var<< 
unidad<< 
=<< &
_unidadPolicialRepositorio<< /
.<</ 0
ObtenerUnidadPorId<<0 B
(<<B C
id<<C E
)<<E F
;<<F G
ViewBag== 
.== 
Unidad== 
=== &
_unidadPolicialRepositorio== 3
.==3 4
ObtenerTodos==4 @
(==@ A
)==A B
;==B C
return?? 
View?? 
(?? 
unidad?? 
)?? 
;?? 
}@@ 
[BB 
HttpPostBB 
]BB 
publicCC 

IActionResultCC 
EditCC 
(CC 
intCC !
idCC" $
,CC$ %
UnidadPolicialCC& 4
unidadCC5 ;
)CC; <
{DD 
ifEE 

(EE 
!EE 

ModelStateEE 
.EE 
IsValidEE 
)EE  
{EE! "
ViewBagFF 
.FF 
UnidadFF 
=FF 
_dbEntitiesFF (
.FF( )
UnidadPolicialsFF) 8
.FF8 9
ToListFF9 ?
(FF? @
)FF@ A
;FFA B
returnGG 
ViewGG 
(GG 
$strGG 
,GG 
unidadGG  &
)GG& '
;GG' (
}HH 	&
_unidadPolicialRepositorioJJ "
.JJ" #
EditarUnidadPorIdJJ# 4
(JJ4 5
idJJ5 7
,JJ7 8
unidadJJ9 ?
)JJ? @
;JJ@ A
TempDataKK 
[KK 
$strKK !
]KK! "
=KK# $
$strKK% C
;KKC D
returnLL 
RedirectToActionLL 
(LL  
$strLL  '
)LL' (
;LL( )
}MM 
[OO 
HttpGetOO 
]OO 
publicPP 

IActionResultPP 
DeletePP 
(PP  
intPP  #
idPP$ &
)PP& '
{QQ &
_unidadPolicialRepositorioSS "
.SS" #
DeleteUnidadSS# /
(SS/ 0
idSS0 2
)SS2 3
;SS3 4
TempDataTT 
[TT 
$strTT !
]TT! "
=TT# $
$strTT% E
;TTE F
returnUU 
RedirectToActionUU 
(UU  
$strUU  '
)UU' (
;UU( )
}VV 
}WW Æ
3D:\Proyectos Rider\SIREDOC\SIREDOC\DB\DbEntities.cs
	namespace 	
SIREDOC
 
. 
DB 
; 
public 
class 

DbEntities 
: 
	DbContext "
{ 
public		 

virtual		 
DbSet		 
<		 
	Documento		 "
>		" #

Documentos		$ .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
public

 

virtual

 
DbSet

 
<

 
EfectivoPolicial

 )
>

) *
EfectivoPolicials

+ <
{

= >
get

? B
;

B C
set

D G
;

G H
}

I J
public 

virtual 
DbSet 
< 
UnidadPolicial '
>' (
UnidadPolicials) 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 

virtual 
DbSet 
< 
Usuario  
>  !
Usuarios" *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 


DbEntities 
( 
) 
{ 
} 
public 


DbEntities 
( 
DbContextOptions &
<& '

DbEntities' 1
>1 2
options3 :
): ;
:< =
base> B
(B C
optionsC J
)J K
{K L
}M N
	protected 
override 
void 
OnModelCreating +
(+ ,
ModelBuilder, 8
modelBuilder9 E
)E F
{ 
base 
. 
OnModelCreating 
( 
modelBuilder )
)) *
;* +
modelBuilder 
. 
ApplyConfiguration '
(' (
new( +
DocumentoMapping, <
(< =
)= >
)> ?
;? @
modelBuilder 
. 
ApplyConfiguration '
(' (
new( +#
EfectivoPolicialMapping, C
(C D
)D E
)E F
;F G
modelBuilder 
. 
ApplyConfiguration '
(' (
new( +
UsuarioMapping, :
(: ;
); <
)< =
;= >
modelBuilder 
. 
ApplyConfiguration '
(' (
new( +!
UnidadPolicialMapping, A
(A B
)B C
)C D
;D E
} 
}&& ”

AD:\Proyectos Rider\SIREDOC\SIREDOC\DB\Mapping\DocumentoMapping.cs
	namespace 	
SIREDOC
 
. 
DB 
. 
Mapping 
; 
public 
class 
DocumentoMapping 
: $
IEntityTypeConfiguration 7
<7 8
	Documento8 A
>A B
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
	Documento		0 9
>		9 :
builder		; B
)		B C
{

 	
builder 
. 
ToTable 
( 
$str '
,' (
$str) .
). /
;/ 0
builder 
. 
HasKey 
( 
o 
=> 
o  !
.! "
Id" $
)$ %
;% &
builder 
. 
HasOne 
( 
o 
=> 
o  !
.! "
EfectivoPolicial" 2
)2 3
. 
WithMany 
( 
) 
. 
HasForeignKey 
( 
o  
=>! #
o$ %
.% &

EfectivoId& 0
)0 1
;1 2
} 	
} Î

HD:\Proyectos Rider\SIREDOC\SIREDOC\DB\Mapping\EfectivoPolicialMapping.cs
	namespace 	
SIREDOC
 
. 
DB 
. 
Mapping 
; 
public 
class #
EfectivoPolicialMapping $
:$ %$
IEntityTypeConfiguration& >
<> ?
EfectivoPolicial? O
>O P
{		 
public

 

void

 
	Configure

 
(

 
EntityTypeBuilder

 +
<

+ ,
EfectivoPolicial

, <
>

< =
builder

> E
)

E F
{ 
builder 
. 
ToTable 
( 
$str *
,* +
$str, 1
)1 2
;2 3
builder 
. 
HasKey 
( 
o 
=> 
o 
. 
Id  
)  !
;! "
builder 
. 
HasOne 
( 
o 
=> 
o 
. 
UnidadPolicial ,
), -
. 
WithMany 
( 
) 
. 
HasForeignKey 
( 
o 
=> 
o  !
.! "
UnidadId" *
)* +
;+ ,
} 
} Õ
FD:\Proyectos Rider\SIREDOC\SIREDOC\DB\Mapping\UnidadPolicialMapping.cs
	namespace 	
SIREDOC
 
. 
DB 
. 
Mapping 
; 
public 
class !
UnidadPolicialMapping "
:" #$
IEntityTypeConfiguration$ <
<< =
UnidadPolicial= K
>K L
{ 
public		 

void		 
	Configure		 
(		 
EntityTypeBuilder		 +
<		+ ,
UnidadPolicial		, :
>		: ;
builder		< C
)		C D
{

 
builder 
. 
ToTable 
( 
$str (
,( )
$str* /
)/ 0
;0 1
builder 
. 
HasKey 
( 
o 
=> 
o 
. 
IdUnidad &
)& '
;' (
} 
} ´
?D:\Proyectos Rider\SIREDOC\SIREDOC\DB\Mapping\UsuarioMapping.cs
	namespace 	
SIREDOC
 
. 
DB 
. 
Mapping 
; 
public 
class 
UsuarioMapping 
: $
IEntityTypeConfiguration 5
<5 6
Usuario6 =
>= >
{ 
public		 

void		 
	Configure		 
(		 
EntityTypeBuilder		 +
<		+ ,
Usuario		, 3
>		3 4
builder		5 <
)		< =
{

 
builder 
. 
ToTable 
( 
$str !
,! "
$str# (
)( )
;) *
builder 
. 
HasKey 
( 
o 
=> 
o 
. 
Id  
)  !
;! "
} 
} ±!
6D:\Proyectos Rider\SIREDOC\SIREDOC\Models\Documento.cs
	namespace 	
SIREDOC
 
. 
Models 
; 
public 
class 
	Documento 
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 9
)		9 :
]		: ;
public

 

string

 
Tipo

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
[ 
Required 
( 
ErrorMessage 
= 
$str D
)D E
]E F
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" F
)F G
]G H
public 

string 
Numero 
{ 
get 
; 
set  #
;# $
}% &
[ 
Required 
( 
ErrorMessage 
= 
$str E
)E F
]F G
[ 
DataType 
( 
DataType 
. 
Date 
) 
] 
public 

DateTime 
Fecha 
{ 
get 
;  
set! $
;$ %
}& '
[ 
Required 
( 
ErrorMessage 
= 
$str >
)> ?
]? @
[ 
RegularExpression 
( 
$str 4
,4 5
ErrorMessage6 B
=C D
$strE j
)j k
]k l
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage  
=! "
$str# H
)H I
]I J
public 

string 
Asunto 
{ 
get 
; 
set  #
;# $
}% &
[ 
Required 
( 
ErrorMessage 
= 
$str =
)= >
]> ?
public 

string 
Asignado 
{ 
get  
;  !
set" %
;% &
}' (
[ 
Required 
( 
ErrorMessage 
= 
$str 9
)9 :
]: ;
public 

string 
Archivo 
{ 
get 
;  
set! $
;$ %
}& '
[ 
Required 
( 
ErrorMessage 
= 
$str 8
)8 9
]9 :
[   
RegularExpression   
(   
$str   4
,  4 5
ErrorMessage  6 B
=  C D
$str  E j
)  j k
]  k l
[!! 
	MaxLength!! 
(!! 
$num!! 
,!! 
ErrorMessage!! 
=!!  !
$str!!" F
)!!F G
]!!G H
public"" 

string"" 
Observaciones"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
public## 

int## 
Estado## 
{## 
get## 
;## 
set##  
;##  !
}##" #
[%% 
Required%% 
(%% 
ErrorMessage%% 
=%% 
$str%% I
)%%I J
]%%J K
public&& 

int&& 

EfectivoId&& 
{&& 
get&& 
;&&  
set&&! $
;&&$ %
}&&& '
public'' 

int'' 
	UsuarioId'' 
{'' 
get'' 
;'' 
set''  #
;''# $
}''% &
public(( 

EfectivoPolicial(( 
?(( 
EfectivoPolicial(( -
{((. /
get((0 3
;((3 4
set((5 8
;((8 9
}((: ;
})) Á
=D:\Proyectos Rider\SIREDOC\SIREDOC\Models\EfectivoPolicial.cs
	namespace 	
SIREDOC
 
. 
Models 
; 
public 
class 
EfectivoPolicial 
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 =
)		= >
]		> ?
[

 
RegularExpression

 
(

 
$str

 1
,

1 2
ErrorMessage

3 ?
=

@ A
$str

B ]
)

] ^
]

^ _
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" H
)H I
]I J
public 

string 
Nombre 
{ 
get 
; 
set  #
;# $
}% &
[ 
Required 
( 
ErrorMessage 
= 
$str A
)A B
]B C
[ 
RegularExpression 
( 
$str 1
,1 2
ErrorMessage3 ?
=@ A
$strB ]
)] ^
]^ _
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" H
)H I
]I J
public 

string 
	Apellidos 
{ 
get !
;! "
set# &
;& '
}( )
public 

int 
UnidadId 
{ 
get 
; 
set "
;" #
}$ %
[ 
Required 
( 
ErrorMessage 
= 
$str :
): ;
]; <
[ 
RegularExpression 
( 
$str #
,# $
ErrorMessage% 1
=2 3
$str4 N
)N O
]O P
[ 
StringLength 
( 
$num 
, 
MinimumLength "
=# $
$num% &
,& '
ErrorMessage( 4
=5 6
$str7 `
)` a
]a b
public 

string 
Cip 
{ 
get 
; 
set  
;  !
}" #
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
RegularExpression 
( 
$str #
,# $
ErrorMessage% 1
=2 3
$str4 N
)N O
]O P
[ 
StringLength 
( 
$num 
, 
MinimumLength "
=# $
$num% &
,& '
ErrorMessage( 4
=5 6
$str7 e
)e f
]f g
public 

string 
Telefono 
{ 
get  
;  !
set" %
;% &
}' (
[ 
Required 
( 
ErrorMessage 
= 
$str =
)= >
]> ?
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! ;
); <
]< =
public   

string   
Correo   
{   
get   
;   
set    #
;  # $
}  % &
public"" 

UnidadPolicial"" 
?"" 
UnidadPolicial"" )
{""* +
get"", /
;""/ 0
set""1 4
;""4 5
}""6 7
}&& Ç
;D:\Proyectos Rider\SIREDOC\SIREDOC\Models\ErrorViewModel.cs
	namespace 	
SIREDOC
 
. 
Models 
; 
public 
class 
ErrorViewModel 
{ 
public 

string 
? 
	RequestId 
{ 
get "
;" #
set$ '
;' (
}) *
public 

bool 
ShowRequestId 
=>  
!! "
string" (
.( )
IsNullOrEmpty) 6
(6 7
	RequestId7 @
)@ A
;A B
}  
;D:\Proyectos Rider\SIREDOC\SIREDOC\Models\UnidadPolicial.cs
	namespace 	
SIREDOC
 
. 
Models 
; 
public 
class 
UnidadPolicial 
{ 
public 

int 
IdUnidad 
{ 
get 
; 
set "
;" #
}$ %
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 =
)		= >
]		> ?
[

 
RegularExpression

 
(

 
$str

 4
,

4 5
ErrorMessage

6 B
=

C D
$str

E j
)

j k
]

k l
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" H
)H I
]I J
public 

string 
Nombre 
{ 
get 
; 
set  #
;# $
}% &
[ 
Required 
( 
ErrorMessage 
= 
$str 8
)8 9
]9 :
[ 
RegularExpression 
( 
$str $
,$ %
ErrorMessage& 2
=3 4
$str5 P
)P Q
]Q R
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" H
)H I
]I J
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
[ 
Required 
( 
ErrorMessage 
= 
$str @
)@ A
]A B
[ 
RegularExpression 
( 
$str 4
,4 5
ErrorMessage6 B
=C D
$strE j
)j k
]k l
[ 
	MaxLength 
( 
$num 
, 
ErrorMessage 
=  !
$str" H
)H I
]I J
public 

string 
	Direccion 
{ 
get !
;! "
set# &
;& '
}( )
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
RegularExpression 
( 
$str #
,# $
ErrorMessage% 1
=2 3
$str4 N
)N O
]O P
[ 
StringLength 
( 
$num 
, 
MinimumLength "
=# $
$num% &
,& '
ErrorMessage( 4
=5 6
$str7 e
)e f
]f g
public 

string 
Telefono 
{ 
get  
;  !
set" %
;% &
}' (
[ 
Required 
( 
ErrorMessage 
= 
$str =
)= >
]> ?
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! ;
); <
]< =
public 

string 
Correo 
{ 
get 
; 
set  #
;# $
}% &
} À
4D:\Proyectos Rider\SIREDOC\SIREDOC\Models\Usuario.cs
	namespace 	
SIREDOC
 
. 
Models 
; 
public 
class 
Usuario 
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
[ 
Required 
( 
ErrorMessage 
= 
$str 1
)1 2
]2 3
public		 

string		 
Username		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
[

 
DataType

 
(

 
DataType

 
.

 
Password

 
)

  
]

  !
public 

string 
Password 
{ 
get  
;  !
set" %
;% &
}' (
} Á
-D:\Proyectos Rider\SIREDOC\SIREDOC\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. #
AddControllersWithViews (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddAuthentication "
(" #(
CookieAuthenticationDefaults# ?
.? @ 
AuthenticationScheme@ T
)T U
. 
	AddCookie 
( 
options 
=> 
{ 
options 
. 
	LoginPath 
= 
$str )
;) *
} 
) 
; 
builder 
. 
Services 
. 
AddDbContext 
< 

DbEntities (
>( )
() *
options 
=> 
options 
. 
UseSqlServer #
(# $
builder$ +
.+ ,
Configuration, 9
.9 :
GetConnectionString: M
(M N
$strN S
)S T
)T U
) 
; 
builder 
. 
Services 
. 
AddTransient 
< (
IEfectivoPolicialRepositorio :
,: ;%
EfectiPolicialRepositorio< U
>U V
(V W
)W X
;X Y
builder 
. 
Services 
. 
AddTransient 
< !
IDocumentoRepositorio 3
,3 4 
DocumentoRepositorio5 I
>I J
(J K
)K L
;L M
builder 
. 
Services 
. 
AddTransient 
< &
IUnidadPolicialRepositorio 8
,8 9%
UnidadPolicialRepositorio: S
>S T
(T U
)U V
;V W
builder 
. 
Services 
. 
AddTransient 
< 
IUsuarioRepositorio 1
,1 2
UsuarioRepositorio3 E
>E F
(F G
)G H
;H I
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if   
(   
!   
app   
.   	
Environment  	 
.   
IsDevelopment   "
(  " #
)  # $
)  $ %
{!! 
app"" 
."" 
UseExceptionHandler"" 
("" 
$str"" )
)"") *
;""* +
app$$ 
.$$ 
UseHsts$$ 
($$ 
)$$ 
;$$ 
}%% 
app'' 
.'' 
UseHttpsRedirection'' 
('' 
)'' 
;'' 
app(( 
.(( 
UseStaticFiles(( 
((( 
)(( 
;(( 
app** 
.** 

UseRouting** 
(** 
)** 
;** 
app,, 
.,, 
UseAuthentication,, 
(,, 
),, 
;,, 
app-- 
.-- 
UseAuthorization-- 
(-- 
)-- 
;-- 
app// 
.// 
MapControllerRoute// 
(// 
name00 
:00 	
$str00
 
,00 
pattern11 
:11 
$str11 5
)115 6
;116 7
app33 
.33 
Run33 
(33 
)33 	
;33	 
÷O
GD:\Proyectos Rider\SIREDOC\SIREDOC\Repositories\DocumentoRepositorio.cs
	namespace 	
SIREDOC
 
. 
Repositories 
; 
public 
	interface !
IDocumentoRepositorio &
{		 
List 
< 	
	Documento	 
> &
ObtenerDocumentosDeUsuario .
(. /
int/ 2
UserId3 9
,9 :
string; A
buscarB H
)H I
;I J
List 
< 	
	Documento	 
> 
ObtenerTodos  
(  !
)! "
;" #
	Documento #
GetEditarDocumentoPorId %
(% &
int& )
id* ,
), -
;- .
	Documento 
GuardarDocumento 
( 
	Documento (
	documento) 2
)2 3
;3 4
void $
PostEditarDocumentoPorId	 !
(! "
int" %
id& (
,( )
	Documento* 3
	documento4 =
)= >
;> ?
void 
DeleteDocPorId	 
( 
int 
id 
) 
;  
	Documento '
ActualizarEstadoDeDocumento )
() *
int* -
DocumentoId. 9
,9 :
int; >
	UsuarioId? H
)H I
;I J
	Documento  
MarcarAtendidoEstado "
(" #
int# &
DocumentoId' 2
,2 3
int4 7
id8 :
): ;
;; <
List 
< 	
	Documento	 
> 
ObtenerPorTipo "
(" #
string# )
nombre* 0
)0 1
;1 2
} 
public 
class  
DocumentoRepositorio !
:! "!
IDocumentoRepositorio# 8
{ 
private 

DbEntities 
_dbEntities "
;" #
public!! 
 
DocumentoRepositorio!! 
(!!  

DbEntities!!  *

dbEntities!!+ 5
)!!5 6
{"" 
_dbEntities## 
=## 

dbEntities##  
;##  !
}$$ 
public&& 

List&& 
<&& 
	Documento&& 
>&& &
ObtenerDocumentosDeUsuario&& 5
(&&5 6
int&&6 9
UserId&&: @
,&&@ A
string&&B H
buscar&&I O
)&&O P
{'' 
var(( 

documentos(( 
=(( 
_dbEntities(( $
.(($ %

Documentos((% /
.)) 
Include)) 
()) 
o)) 
=>)) 
o)) 
.)) 
EfectivoPolicial)) ,
))), -
.** 
Where** 
(** 
o** 
=>** 
o** 
.** 
	UsuarioId** #
==**$ &
UserId**' -
)**- .
.**. /
ToList**/ 5
(**5 6
)**6 7
;**7 8
if,, 
(,, 	
buscar,,	 
!=,, 
null,, 
&&,, 
buscar,, !
!=,," $
$str,,% '
),,' (
{-- 

documentos..
 
=.. 

documentos.. !
...! "
Where.." '
(..' (
o..( )
=>..* ,
o..- .
.... /
Tipo../ 3
...3 4
Contains..4 <
(..< =
buscar..= C
,..C D
StringComparison..E U
...U V
OrdinalIgnoreCase..V g
)..g h
||..i k
o//- .
.//. /
Numero/// 5
.//5 6
Contains//6 >
(//> ?
buscar//? E
,//E F
StringComparison//G W
.//W X
OrdinalIgnoreCase//X i
)//i j
||//k m
o00- .
.00. /
Asignado00/ 7
.007 8
Contains008 @
(00@ A
buscar00A G
,00G H
StringComparison00I Y
.00Y Z
OrdinalIgnoreCase00Z k
)00k l
)00l m
.11 
OrderBy11 
(11 
o11 
=>11 
o11 
.11 
Numero11 $
)11$ %
.22 
ToList22 
(22 
)22 
;22 
}33 
return44 

documentos44 
;44 
}66 
public88 

List88 
<88 
	Documento88 
>88 
ObtenerTodos88 '
(88' (
)88( )
{99 
return:: 
_dbEntities:: 
.:: 

Documentos:: %
.::% &
ToList::& ,
(::, -
)::- .
;::. /
}<< 
public?? 

	Documento?? 
GuardarDocumento?? %
(??% &
	Documento??& /
	documento??0 9
)??9 :
{@@ 
_dbEntitiesAA 
.AA 

DocumentosAA 
.AA 
AddAA "
(AA" #
	documentoAA# ,
)AA, -
;AA- .
_dbEntitiesBB 
.BB 
SaveChangesBB 
(BB  
)BB  !
;BB! "
returnDD 
	documentoDD 
;DD 
}EE 
publicGG 

	DocumentoGG #
GetEditarDocumentoPorIdGG ,
(GG, -
intGG- 0
idGG1 3
)GG3 4
{HH 
returnII 
_dbEntitiesII 
.II 

DocumentosII %
.II% &
FirstII& +
(II+ ,
oII, -
=>II. 0
oII1 2
.II2 3
IdII3 5
==II6 8
idII9 ;
)II; <
;II< =
}JJ 
publicLL 

voidLL $
PostEditarDocumentoPorIdLL (
(LL( )
intLL) ,
idLL- /
,LL/ 0
	DocumentoLL1 :
	documentoLL; D
)LLD E
{MM 
varNN 
documentoDBNN 
=NN 
_dbEntitiesNN %
.NN% &

DocumentosNN& 0
.NN0 1
FirstNN1 6
(NN6 7
oNN7 8
=>NN9 ;
oNN< =
.NN= >
IdNN> @
==NNA C
idNND F
)NNF G
;NNG H
documentoDBOO 
.OO 
TipoOO 
=OO 
	documentoOO $
.OO$ %
TipoOO% )
;OO) *
documentoDBPP 
.PP 
ObservacionesPP !
=PP" #
	documentoPP$ -
.PP- .
ObservacionesPP. ;
;PP; <
_dbEntitiesRR 
.RR 
SaveChangesRR 
(RR  
)RR  !
;RR! "
}SS 
publicUU 

voidUU 
DeleteDocPorIdUU 
(UU 
intUU "
idUU# %
)UU% &
{VV 
varWW 
documentoDBWW 
=WW 
_dbEntitiesWW %
.WW% &

DocumentosWW& 0
.WW0 1
FirstWW1 6
(WW6 7
oWW7 8
=>WW9 ;
oWW< =
.WW= >
IdWW> @
==WWA C
idWWD F
)WWF G
;WWG H
_dbEntitiesXX 
.XX 

DocumentosXX 
.XX 
RemoveXX %
(XX% &
documentoDBXX& 1
)XX1 2
;XX2 3
_dbEntitiesZZ 
.ZZ 
SaveChangesZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
public]] 

	Documento]] '
ActualizarEstadoDeDocumento]] 0
(]]0 1
int]]1 4
DocumentoId]]5 @
,]]@ A
int]]B E
	UsuarioId]]F O
)]]O P
{^^ 
var__ 
	documento__ 
=__ 
_dbEntities__ #
.__# $

Documentos__$ .
.`` 
Where`` 
(`` 
o`` 
=>`` 
o`` 
.`` 
Id`` 
==`` 
DocumentoId``  +
&&``, .
o``/ 0
.``0 1
	UsuarioId``1 :
==``; =
	UsuarioId``> G
)``G H
.aa 
FirstOrDefaultaa 
(aa 
)aa 
;aa 
	documentocc 
.cc 
Estadocc 
=cc 
ESTADOcc !
.cc! "

EN_PROCESOcc" ,
;cc, -
_dbEntitiesdd 
.dd 
SaveChangesdd 
(dd  
)dd  !
;dd! "
returngg 
	documentogg 
;gg 
}hh 
publickk 

	Documentokk  
MarcarAtendidoEstadokk )
(kk) *
intkk* -
DocumentoIdkk. 9
,kk9 :
intkk; >
idkk? A
)kkA B
{ll 
varmm 
	documentomm 
=mm 
_dbEntitiesmm #
.mm# $

Documentosmm$ .
.nn 
Wherenn 
(nn 
onn 
=>nn 
onn 
.nn 
Idnn 
==nn 
DocumentoIdnn  +
&&nn, .
onn/ 0
.nn0 1
	UsuarioIdnn1 :
==nn; =
idnn> @
)nn@ A
.oo 
FirstOrDefaultoo 
(oo 
)oo 
;oo 
	documentoqq 
.qq 
Estadoqq 
=qq 
ESTADOqq !
.qq! "
ATENDIDOqq" *
;qq* +
_dbEntitiesss 
.ss 
SaveChangesss 
(ss  
)ss  !
;ss! "
returnuu 
	documentouu 
;uu 
}ww 
publicyy 

Listyy 
<yy 
	Documentoyy 
>yy 
ObtenerPorTipoyy )
(yy) *
stringyy* 0
nombreyy1 7
)yy7 8
{zz 
return{{ 
_dbEntities{{ 
.{{ 

Documentos{{ %
.{{% &
Where{{& +
({{+ ,
o{{, -
=>{{. 0
o{{1 2
.{{2 3
Tipo{{3 7
.{{7 8
Contains{{8 @
({{@ A
nombre{{A G
){{G H
){{H I
.{{I J
ToList{{J P
({{P Q
){{Q R
;{{R S
}|| 
}}} ñ0
LD:\Proyectos Rider\SIREDOC\SIREDOC\Repositories\EfectiPolicialRepositorio.cs
	namespace 	
SIREDOC
 
. 
Repositories 
; 
public 
	interface (
IEfectivoPolicialRepositorio -
{ 
List		 
<		 	
EfectivoPolicial			 
>		 !
ObtenerEfectivosTodos		 0
(		0 1
)		1 2
;		2 3
List

 
<

 	
EfectivoPolicial

	 
>

 
ObtenerTodos

 '
(

' (
)

( )
;

) *
void 
GuardarEfectivo	 
( 
EfectivoPolicial )
	efectivos* 3
)3 4
;4 5
EfectivoPolicial  
ObtenerEfectivoPorId )
() *
int* -
id. 0
)0 1
;1 2
void 
EditarEfectivoPorId	 
( 
int  
id! #
,# $
EfectivoPolicial% 5
	efectivos6 ?
)? @
;@ A
void 
DeleteEfectivo	 
( 
int 
id 
) 
;  
List 
< 	
EfectivoPolicial	 
> 
ObtenerPorNombre +
(+ ,
string, 2
nombre3 9
)9 :
;: ;
} 
public 
class %
EfectiPolicialRepositorio &
:& '(
IEfectivoPolicialRepositorio( D
{ 
private 

DbEntities 
_dbEntities "
;" #
public 
%
EfectiPolicialRepositorio $
($ %

DbEntities% /

dbEntities0 :
): ;
{ 
_dbEntities 
= 

dbEntities  
;  !
} 
public 

List 
< 
EfectivoPolicial  
>  !!
ObtenerEfectivosTodos" 7
(7 8
)8 9
{ 
return 
_dbEntities 
. 
EfectivoPolicials ,
.   
Include   
(   
o   
=>   
o   
.   
UnidadPolicial   *
)  * +
.!! 
ToList!! 
(!! 
)!! 
;!! 
}$$ 
public&& 

List&& 
<&& 
EfectivoPolicial&&  
>&&  !
ObtenerTodos&&" .
(&&. /
)&&/ 0
{'' 
return(( 
_dbEntities(( 
.(( 
EfectivoPolicials(( ,
.((, -
ToList((- 3
(((3 4
)((4 5
;((5 6
}++ 
public-- 

void-- 
GuardarEfectivo-- 
(--  
EfectivoPolicial--  0
	efectivos--1 :
)--: ;
{.. 
_dbEntities// 
.// 
EfectivoPolicials// %
.//% &
Add//& )
(//) *
	efectivos//* 3
)//3 4
;//4 5
_dbEntities00 
.00 
SaveChanges00 
(00  
)00  !
;00! "
}22 
public44 

EfectivoPolicial44  
ObtenerEfectivoPorId44 0
(440 1
int441 4
id445 7
)447 8
{55 
return66 
_dbEntities66 
.66 
EfectivoPolicials66 ,
.66, -
First66- 2
(662 3
o663 4
=>665 7
o668 9
.669 :
Id66: <
==66= ?
id66@ B
)66B C
;66C D
}77 
public99 

void99 
EditarEfectivoPorId99 #
(99# $
int99$ '
id99( *
,99* +
EfectivoPolicial99, <
	efectivos99= F
)99F G
{:: 
var;; 

efectivoDB;; 
=;; 
_dbEntities;; $
.;;$ %
EfectivoPolicials;;% 6
.;;6 7
First;;7 <
(;;< =
o;;= >
=>;;? A
o;;B C
.;;C D
Id;;D F
==;;G I
id;;J L
);;L M
;;;M N

efectivoDB<< 
.<< 
Nombre<< 
=<< 
	efectivos<< %
.<<% &
Nombre<<& ,
;<<, -

efectivoDB== 
.== 
Telefono== 
=== 
	efectivos== '
.==' (
Telefono==( 0
;==0 1

efectivoDB>> 
.>> 
Correo>> 
=>> 
	efectivos>> %
.>>% &
Correo>>& ,
;>>, -
_dbEntities?? 
.?? 
SaveChanges?? 
(??  
)??  !
;??! "
}AA 
publicCC 

voidCC 
DeleteEfectivoCC 
(CC 
intCC "
idCC# %
)CC% &
{DD 
varEE 

efectivoDBEE 
=EE 
_dbEntitiesEE $
.EE$ %
EfectivoPolicialsEE% 6
.EE6 7
FirstEE7 <
(EE< =
oEE= >
=>EE? A
oEEB C
.EEC D
IdEED F
==EEG I
idEEJ L
)EEL M
;EEM N
_dbEntitiesFF 
.FF 
EfectivoPolicialsFF %
.FF% &
RemoveFF& ,
(FF, -

efectivoDBFF- 7
)FF7 8
;FF8 9
_dbEntitiesGG 
.GG 
SaveChangesGG 
(GG  
)GG  !
;GG! "
}HH 
publicJJ 

ListJJ 
<JJ 
EfectivoPolicialJJ  
>JJ  !
ObtenerPorNombreJJ" 2
(JJ2 3
stringJJ3 9
nombreJJ: @
)JJ@ A
{KK 
returnLL 
_dbEntitiesLL 
.LL 
EfectivoPolicialsLL ,
.LL, -
WhereLL- 2
(LL2 3
oLL3 4
=>LL5 7
oLL8 9
.LL9 :
NombreLL: @
.LL@ A
ContainsLLA I
(LLI J
nombreLLJ P
)LLP Q
)LLQ R
.LLR S
ToListLLS Y
(LLY Z
)LLZ [
;LL[ \
}MM 
}NN ÷.
LD:\Proyectos Rider\SIREDOC\SIREDOC\Repositories\UnidadPolicialRepositorio.cs
	namespace 	
SIREDOC
 
. 
Repositories 
; 
public 
	interface &
IUnidadPolicialRepositorio +
{ 
List 
< 	
UnidadPolicial	 
> 
ObtenerTodos %
(% &
)& '
;' (
void		 
GuardarUnidad			 
(		 
UnidadPolicial		 %
unidad		& ,
)		, -
;		- .
UnidadPolicial

 
ObtenerUnidadPorId

 %
(

% &
int

& )
id

* ,
)

, -
;

- .
void 
EditarUnidadPorId	 
( 
int 
id !
,! "
UnidadPolicial# 1
unidad2 8
)8 9
;9 :
void 
DeleteUnidad	 
( 
int 
id 
) 
; 
List 
< 	
UnidadPolicial	 
> 
ObtenerPorNombre )
() *
string* 0
nombre1 7
)7 8
;8 9
int 
ContarPorNombre 
( 
UnidadPolicial &
unidades' /
)/ 0
;0 1
} 
public 
class %
UnidadPolicialRepositorio &
:& '&
IUnidadPolicialRepositorio( B
{ 
private 

DbEntities 
_dbEntities "
;" #
public 
%
UnidadPolicialRepositorio $
($ %

DbEntities% /

dbEntities0 :
): ;
{ 
_dbEntities 
= 

dbEntities  
;  !
} 
public 

List 
< 
UnidadPolicial 
> 
ObtenerTodos  ,
(, -
)- .
{ 
return 
_dbEntities 
. 
UnidadPolicials *
.* +
ToList+ 1
(1 2
)2 3
;3 4
} 
public   

void   
GuardarUnidad   
(   
UnidadPolicial   ,
unidad  - 3
)  3 4
{!! 
_dbEntities"" 
."" 
UnidadPolicials"" #
.""# $
Add""$ '
(""' (
unidad""( .
)"". /
;""/ 0
_dbEntities## 
.## 
SaveChanges## 
(##  
)##  !
;##! "
}$$ 
public&& 

UnidadPolicial&& 
ObtenerUnidadPorId&& ,
(&&, -
int&&- 0
id&&1 3
)&&3 4
{'' 
return(( 
_dbEntities(( 
.(( 
UnidadPolicials(( *
.((* +
First((+ 0
(((0 1
o((1 2
=>((3 5
o((6 7
.((7 8
IdUnidad((8 @
==((A C
id((D F
)((F G
;((G H
})) 
public++ 

void++ 
EditarUnidadPorId++ !
(++! "
int++" %
id++& (
,++( )
UnidadPolicial++* 8
unidad++9 ?
)++? @
{,, 
var-- 
unidadDB-- 
=-- 
_dbEntities-- "
.--" #
UnidadPolicials--# 2
.--2 3
First--3 8
(--8 9
o--9 :
=>--; =
o--> ?
.--? @
IdUnidad--@ H
==--I K
id--L N
)--N O
;--O P
unidadDB.. 
... 
Nombre.. 
=.. 
unidad..  
...  !
Nombre..! '
;..' (
unidadDB// 
.// 
Correo// 
=// 
unidad//  
.//  !
Correo//! '
;//' (
_dbEntities00 
.00 
SaveChanges00 
(00  
)00  !
;00! "
}22 
public44 

void44 
DeleteUnidad44 
(44 
int44  
id44! #
)44# $
{55 
var66 
unidadDB66 
=66 
_dbEntities66 "
.66" #
UnidadPolicials66# 2
.662 3
First663 8
(668 9
o669 :
=>66; =
o66> ?
.66? @
IdUnidad66@ H
==66I K
id66L N
)66N O
;66O P
_dbEntities77 
.77 
UnidadPolicials77 #
.77# $
Remove77$ *
(77* +
unidadDB77+ 3
)773 4
;774 5
_dbEntities88 
.88 
SaveChanges88 
(88  
)88  !
;88! "
}99 
public;; 

List;; 
<;; 
UnidadPolicial;; 
>;; 
ObtenerPorNombre;;  0
(;;0 1
string;;1 7
nombre;;8 >
);;> ?
{<< 
return== 
_dbEntities== 
.== 
UnidadPolicials== *
.==* +
Where==+ 0
(==0 1
o==1 2
=>==3 5
o==6 7
.==7 8
Nombre==8 >
.==> ?
Contains==? G
(==G H
nombre==H N
)==N O
)==O P
.==P Q
ToList==Q W
(==W X
)==X Y
;==Y Z
}>> 
public?? 

int?? 
ContarPorNombre?? 
(?? 
UnidadPolicial?? -
unidades??. 6
)??6 7
{@@ 
returnAA 
_dbEntitiesAA 
.AA 
UnidadPolicialsAA *
.AA* +
WhereAA+ 0
(AA0 1
oAA1 2
=>AA3 5
oAA6 7
.AA7 8
NombreAA8 >
==AA? A
unidadesAAB J
.AAJ K
NombreAAK Q
)AAQ R
.AAR S
CountAAS X
(AAX Y
)AAY Z
;AAZ [
}DD 
}EE ≥

ED:\Proyectos Rider\SIREDOC\SIREDOC\Repositories\UsuarioRepositorio.cs
	namespace 	
SIREDOC
 
. 
Repositories 
; 
public 
	interface 
IUsuarioRepositorio $
{ 
Usuario		 
ObtenerLoggedUser		 
(		 
string		 $
username		% -
)		- .
;		. /
}

 
public 
class 
UsuarioRepositorio 
:  
IUsuarioRepositorio! 4
{ 
private 

DbEntities 
_dbEntities "
;" #
public 

UsuarioRepositorio 
( 

DbEntities (

dbEntities) 3
)3 4
{ 
_dbEntities 
= 

dbEntities  
;  !
} 
public 

Usuario 
ObtenerLoggedUser $
($ %
string% +
username, 4
)4 5
{ 
return 
_dbEntities 
. 
Usuarios #
.# $
First$ )
() *
o* +
=>, .
o/ 0
.0 1
Username1 9
==: <
username= E
)E F
;F G
} 
} 