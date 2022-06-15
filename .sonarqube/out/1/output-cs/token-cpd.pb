ë
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
} —
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
}22 øZ
ED:\Proyectos Rider\SIREDOC\SIREDOC\Controllers\DocumentoController.cs
	namespace 	
SIREDOC
 
. 
Controllers 
; 
[ 
	Authorize 

]
 
public 
class 
DocumentoController  
:  !

Controller" ,
{ 
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
private 
readonly (
IEfectivoPolicialRepositorio 1(
_efectivoPolicialRepositorio2 N
;N O
private 
readonly !
IDocumentoRepositorio *!
_documentoRepositorio+ @
;@ A
private 
readonly 
IUsuarioRepositorio (
_usuarioRepositorio) <
;< =
private 

DbEntities 
_dbEntities "
;" #
public 

DocumentoController 
( (
IEfectivoPolicialRepositorio ;'
efectivoPolicialRepositorio< W
,W X!
IDocumentoRepositorioY n!
documentoRepositorio	o ƒ
,
ƒ „!
IUsuarioRepositorio
… ˜ 
usuarioRepositorio
™ «
,
« ¬
IWebHostEnvironment 
environment '
,' (

DbEntities) 3

dbEntities4 >
)> ?
{ (
_efectivoPolicialRepositorio $
=% &'
efectivoPolicialRepositorio' B
;B C!
_documentoRepositorio 
=  
documentoRepositorio  4
;4 5
_usuarioRepositorio 
= 
usuarioRepositorio 0
;0 1
_environment 
= 
environment "
;" #
_dbEntities 
= 

dbEntities  
;  !
} 
[!! 
HttpGet!! 
]!! 
public"" 

IActionResult"" 
Index"" 
("" 
)""  
{## 
var%% 
usuario%% 
=%% 
GetLoggedUser%% #
(%%# $
)%%$ %
;%%% &
var'' 

documentos'' 
='' !
_documentoRepositorio'' .
.''. /&
ObtenerDocumentosDeUsuario''/ I
(''I J
usuario''J Q
.''Q R
Id''R T
)''T U
;''U V
return++ 
View++ 
(++ 

documentos++ 
)++ 
;++  
},, 
[.. 
HttpGet.. 
].. 
public// 

IActionResult// 
Create// 
(//  
)//  !
{00 
ViewBag11 
.11 
Policia11 
=11 (
_efectivoPolicialRepositorio11 6
.116 7
ObtenerTodos117 C
(11C D
)11D E
;11E F
return22 
View22 
(22 
new22 
	Documento22 !
(22! "
)22" #
)22# $
;22$ %
}33 
[55 
HttpPost55 
]55 
public66 

IActionResult66 
Create66 
(66  
	Documento66  )
	documento66* 3
)663 4
{77 
Upload88 
(88 
	documento88 
.88 
Archivo88  
)88  !
;88! "
	documento99 
.99 
	UsuarioId99 
=99 
GetLoggedUser99 +
(99+ ,
)99, -
.99- .
Id99. 0
;990 1
if;; 

(;; 
	documento;; 
.;; 

EfectivoId;;  
>;;! "
$num;;# %
||;;& (
	documento;;) 2
.;;2 3

EfectivoId;;3 =
<;;> ?
$num;;@ A
);;A B
{<< 	

ModelState== 
.== 
AddModelError== $
(==$ %
$str==% 1
,==1 2
$str==3 S
)==S T
;==T U
}>> 	
if@@ 

(@@ 
!@@ 

ModelState@@ 
.@@ 
IsValid@@ 
)@@  
{AA 	
ViewBagDD 
.DD 
PoliciaDD 
=DD (
_efectivoPolicialRepositorioDD :
.DD: ;
ObtenerTodosDD; G
(DDG H
)DDH I
;DDI J
returnFF 
ViewFF 
(FF 
$strFF  
,FF  !
	documentoFF" +
)FF+ ,
;FF, -
}GG 	
	documentoKK 
.KK 
EstadoKK 
=KK 
ESTADOKK !
.KK! "
POR_ATENDERKK" -
;KK- .!
_documentoRepositorioOO 
.OO 
GuardarDocumentoOO .
(OO. /
	documentoOO/ 8
)OO8 9
;OO9 :
returnRR 
RedirectToActionRR 
(RR  
$strRR  '
)RR' (
;RR( )
}TT 
[WW 
HttpGetWW 
]WW 
publicXX 

IActionResultXX 
EditXX 
(XX 
intXX !
idXX" $
)XX$ %
{YY 
varZZ 
	documentoZZ 
=ZZ !
_documentoRepositorioZZ -
.ZZ- .#
GetEditarDocumentoPorIdZZ. E
(ZZE F
idZZF H
)ZZH I
;ZZI J
ViewBag[[ 
.[[ 
Policia[[ 
=[[ (
_efectivoPolicialRepositorio[[ 6
.[[6 7
ObtenerTodos[[7 C
([[C D
)[[D E
;[[E F
return\\ 
View\\ 
(\\ 
	documento\\ 
)\\ 
;\\ 
}]] 
[__ 
HttpPost__ 
]__ 
public`` 

IActionResult`` 
Edit`` 
(`` 
int`` !
id``" $
,``$ %
	Documento``& /
	documento``0 9
)``9 :
{aa 
ifbb 

(bb 
!bb 

ModelStatebb 
.bb 
IsValidbb 
)bb  
{bb! "
ViewBagcc 
.cc 
Policiacc 
=cc 
_dbEntitiescc )
.cc) *
EfectivoPolicialscc* ;
.cc; <
ToListcc< B
(ccB C
)ccC D
;ccD E
returndd 
Viewdd 
(dd 
$strdd 
,dd 
	documentodd  )
)dd) *
;dd* +
}ee 	!
_documentoRepositoriokk 
.kk $
PostEditarDocumentoPorIdkk 6
(kk6 7
idkk7 9
,kk9 :
	documentokk: C
)kkC D
;kkD E
returnmm 
RedirectToActionmm 
(mm  
$strmm  '
)mm' (
;mm( )
}nn 
[pp 
HttpGetpp 
]pp 
publicqq 

IActionResultqq 
Deleteqq 
(qq  
intqq  #
idqq$ &
)qq& '
{rr !
_documentoRepositorioww 
.ww 
DeleteDocPorIdww ,
(ww, -
idww- /
)ww/ 0
;ww0 1
returnyy 
RedirectToActionyy 
(yy  
$stryy  '
)yy' (
;yy( )
}zz 
[}} 
HttpGet}} 
]}} 
public~~ 

ActionResult~~ 
MarcarEnProceso~~ '
(~~' (
int~~( +
documentoId~~, 7
)~~7 8
{ 
Usuario
€€ 
user
€€ 
=
€€ 
GetLoggedUser
€€ $
(
€€$ %
)
€€% &
;
€€& '#
_documentoRepositorio
‚‚ 
.
‚‚ )
ActualizarEstadoDeDocumento
‚‚ 9
(
‚‚9 :
documentoId
‚‚: E
,
‚‚E F
user
‚‚G K
.
‚‚K L
Id
‚‚L N
)
‚‚N O
;
‚‚O P
return
†† 
RedirectToAction
†† 
(
††  
$str
††  '
)
††' (
;
††( )
}
‡‡ 
[
‰‰ 
HttpGet
‰‰ 
]
‰‰ 
public
ŠŠ 

ActionResult
ŠŠ  
MarcarComoAtendido
ŠŠ *
(
ŠŠ* +
int
ŠŠ+ .
documentoId
ŠŠ/ :
)
ŠŠ: ;
{
‹‹ 
Usuario
ŒŒ 
user
ŒŒ 
=
ŒŒ 
GetLoggedUser
ŒŒ $
(
ŒŒ$ %
)
ŒŒ% &
;
ŒŒ& '#
_documentoRepositorio
ŽŽ 
.
ŽŽ "
MarcarAtendidoEstado
ŽŽ 2
(
ŽŽ2 3
documentoId
ŽŽ3 >
,
ŽŽ> ?
user
ŽŽ@ D
.
ŽŽD E
Id
ŽŽE G
)
ŽŽG H
;
ŽŽH I
return
’’ 
RedirectToAction
’’ 
(
’’  
$str
’’  '
)
’’' (
;
’’( )
}
““ 
private
”” 

Usuario
”” 
GetLoggedUser
””  
(
””  !
)
””! "
{
•• 
var
—— 
claim
—— 
=
—— 
HttpContext
—— 
.
——  
User
——  $
.
——$ %
Claims
——% +
.
——+ ,
FirstOrDefault
——, :
(
——: ;
x
——; <
=>
——= ?
x
——@ A
.
——A B
Type
——B F
==
——G I

ClaimTypes
——J T
.
——T U
Name
——U Y
)
——Y Z
;
——Z [
var
˜˜ 
username
˜˜ 
=
˜˜ 
claim
˜˜ 
.
˜˜ 
Value
˜˜ "
;
˜˜" #
return
šš !
_usuarioRepositorio
šš !
.
šš! "
ObtenerLoggedUser
šš" 3
(
šš3 4
username
šš4 <
)
šš< =
;
šš= >
}
œœ 
public
žž 
async
žž	 
Task
žž 
<
žž 
IActionResult
žž !
>
žž! "
Upload
žž# )
(
žž) *
string
žž* 0
path
žž1 5
)
žž5 6
{
ŸŸ 
string
¡¡ 

sourceFile
¡¡ 
=
¡¡ 
System
¡¡ !
.
¡¡! "
IO
¡¡" $
.
¡¡$ %
Path
¡¡% )
.
¡¡) *
Combine
¡¡* 1
(
¡¡1 2
$str
¡¡2 h
,
¡¡h i
path
¡¡j n
)
¡¡n o
;
¡¡o p
string
¥¥ 
destinationFile
¥¥ 
=
¥¥ 
System
¥¥  &
.
¥¥& '
IO
¥¥' )
.
¥¥) *
Path
¥¥* .
.
¥¥. /
Combine
¥¥/ 6
(
¥¥6 7
_environment
¥¥7 C
.
¥¥C D
ContentRootPath
¥¥D S
,
¥¥S T
$str
¥¥U ^
,
¥¥^ _
path
¥¥` d
)
¥¥d e
;
¥¥e f
if
§§ 	
(
§§
 
!
§§ 
System
§§ 
.
§§ 
IO
§§ 
.
§§ 
	Directory
§§ 
.
§§  
Exists
§§  &
(
§§& '
$str
§§' 0
)
§§0 1
)
§§1 2
{
¨¨ 
System
©© 
.
©© 
IO
©© 
.
©© 
	Directory
©© 
.
©© 
CreateDirectory
©© .
(
©©. /
$str
©©/ 8
)
©©8 9
;
©©9 :
}
ªª 
System
«« 
.
«« 
IO
«« 
.
«« 
File
«« 
.
«« 
Copy
«« 
(
«« 

sourceFile
«« %
,
««% &
destinationFile
««' 6
)
««6 7
;
««7 8
Console
±± 
.
±± 
	WriteLine
±± 
(
±± 

sourceFile
±± $
)
±±$ %
;
±±% &
return
²² 
RedirectToAction
²² 
(
²² 
$str
²² &
)
²²& '
;
²²' (
}
³³ 
}µµ ã/
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
unidadPolicialRepositorio	{ ”
,
” •

DbEntities
–  

dbEntities
¡ «
)
« ¬
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
var 
unidades 
= (
_efectivoPolicialRepositorio 3
.3 4!
ObtenerEfectivosTodos4 I
(I J
)J K
;K L
return!! 
View!! 
(!! 
unidades!! 
)!! 
;!! 
}"" 
[$$ 
HttpGet$$ 
]$$ 
public%% 

IActionResult%% 
Create%% 
(%%  
)%%  !
{&& 
ViewBag'' 
.'' 
Unidad'' 
='' &
_unidadPolicialRepositorio'' 3
.''3 4
ObtenerTodos''4 @
(''@ A
)''A B
;''B C
return(( 
View(( 
((( 
new(( 
EfectivoPolicial(( (
(((( )
)(() *
)((* +
;((+ ,
})) 
[++ 
HttpPost++ 
]++ 
public,, 

IActionResult,, 
Create,, 
(,,  
EfectivoPolicial,,  0
	efectivos,,1 :
),,: ;
{-- 
if33 

(33 
	efectivos33 
.33 
UnidadId33 
>33  
$num33! "
||33# %
	efectivos33& /
.33/ 0
UnidadId330 8
<339 :
$num33; <
)33< =
{44 	

ModelState55 
.55 
AddModelError55 $
(55$ %
$str55% /
,55/ 0
$str551 O
)55O P
;55P Q
}66 	
if88 

(88 
!88 

ModelState88 
.88 
IsValid88 
)88  
{99 	
ViewBag;; 
.;; 
Unidad;; 
=;; &
_unidadPolicialRepositorio;; 7
.;;7 8
ObtenerTodos;;8 D
(;;D E
);;E F
;;;F G
return<< 
View<< 
(<< 
$str<<  
,<<  !
	efectivos<<" +
)<<+ ,
;<<, -
}== 	(
_efectivoPolicialRepositorio?? $
.??$ %
GuardarEfectivo??% 4
(??4 5
	efectivos??5 >
)??> ?
;??? @
returnAA 
RedirectToActionAA 
(AA  
$strAA  '
)AA' (
;AA( )
}BB 
[DD 
HttpGetDD 
]DD 
publicEE 

IActionResultEE 
EditEE 
(EE 
intEE !
idEE" $
)EE$ %
{FF 
varJJ 
efectivoJJ 
=JJ (
_efectivoPolicialRepositorioJJ 3
.JJ3 4 
ObtenerEfectivoPorIdJJ4 H
(JJH I
idJJI K
)JJK L
;JJL M
ViewBagKK 
.KK 
UnidadKK 
=KK &
_unidadPolicialRepositorioKK 3
.KK3 4
ObtenerTodosKK4 @
(KK@ A
)KKA B
;KKB C
returnLL 
ViewLL 
(LL 
efectivoLL 
)LL 
;LL 
}MM 
[OO 
HttpPostOO 
]OO 
publicPP 

IActionResultPP 
EditPP 
(PP 
intPP !
idPP" $
,PP$ %
EfectivoPolicialPP& 6
	efectivosPP7 @
)PP@ A
{QQ 
ifRR 

(RR 
!RR 

ModelStateRR 
.RR 
IsValidRR 
)RR  
{RR! "
ViewBagSS 
.SS 
PersonaSS 
=SS 
_dbEntitiesSS )
.SS) *
UnidadPolicialsSS* 9
.SS9 :
ToListSS: @
(SS@ A
)SSA B
;SSB C
returnTT 
ViewTT 
(TT 
$strTT 
,TT 
	efectivosTT  )
)TT) *
;TT* +
}UU 	(
_efectivoPolicialRepositorio\\ $
.\\$ %
EditarEfectivoPorId\\% 8
(\\8 9
id\\9 ;
,\\; <
	efectivos\\= F
)\\F G
;\\G H
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
{cc (
_efectivoPolicialRepositoriohh $
.hh$ %
DeleteEfectivohh% 3
(hh3 4
idhh4 6
)hh6 7
;hh7 8
returnjj 
RedirectToActionjj 
(jj  
$strjj  '
)jj' (
;jj( )
}kk 
}mm “
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
} 
[ 
ResponseCache 
( 
Duration 
= 
$num 
,  
Location! )
=* +!
ResponseCacheLocation, A
.A B
NoneB F
,F G
NoStoreH O
=P Q
trueR V
)V W
]W X
public 

IActionResult 
Error 
( 
)  
{ 
return 
View 
( 
new 
ErrorViewModel &
{' (
	RequestId( 1
=2 3
Activity4 <
.< =
Current= D
?D E
.E F
IdF H
??I K
HttpContextL W
.W X
TraceIdentifierX g
}g h
)h i
;i j
} 
} Ð(
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
ViewBag 
. 
Unidad 
= &
_unidadPolicialRepositorio 3
.3 4
ObtenerTodos4 @
(@ A
)A B
;B C
return   
View   
(   
new   
UnidadPolicial   &
(  & '
)  ' (
)  ( )
;  ) *
}!! 
[## 
HttpPost## 
]## 
public$$ 

IActionResult$$ 
Create$$ 
($$  
UnidadPolicial$$  .
unidades$$/ 7
)$$7 8
{%% 
if&& 

(&& 
!&& 

ModelState&& 
.&& 
IsValid&& 
)&&  
{'' 	
ViewBag(( 
.(( 
Unidad(( 
=(( &
_unidadPolicialRepositorio(( 7
.((7 8
ObtenerTodos((8 D
(((D E
)((E F
;((F G
return)) 
View)) 
()) 
$str))  
,))  !
unidades))" *
)))* +
;))+ ,
}** 	&
_unidadPolicialRepositorio11 "
.11" #
GuardarUnidad11# 0
(110 1
unidades111 9
)119 :
;11: ;
return33 
RedirectToAction33 
(33  
$str33  '
)33' (
;33( )
}44 
[66 
HttpGet66 
]66 
public77 

IActionResult77 
Edit77 
(77 
int77 !
id77" $
)77$ %
{88 
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
_unidadPolicialRepositorioOO "
.OO" #
EditarUnidadPorIdOO# 4
(OO4 5
idOO5 7
,OO7 8
unidadOO9 ?
)OO? @
;OO@ A
returnQQ 
RedirectToActionQQ 
(QQ  
$strQQ  '
)QQ' (
;QQ( )
}RR 
[TT 
HttpGetTT 
]TT 
publicUU 

IActionResultUU 
DeleteUU 
(UU  
intUU  #
idUU$ &
)UU& '
{VV &
_unidadPolicialRepositorio[[ "
.[[" #
DeleteUnidad[[# /
([[/ 0
id[[0 2
)[[2 3
;[[3 4
return]] 
RedirectToAction]] 
(]]  
$str]]  '
)]]' (
;]]( )
}^^ 
}__ ®
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
}&& Ó

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
} ë

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
} Í
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
} «
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
})) ç
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
}&& ‚
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
} Ê
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
} Ë
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
} ç
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
ôC
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
)9 :
;: ;
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
)&&@ A
{'' 
return(( 
_dbEntities(( 
.(( 

Documentos(( #
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
;**7 8
}++ 
public-- 

List-- 
<-- 
	Documento-- 
>-- 
ObtenerTodos-- '
(--' (
)--( )
{.. 
return// 
_dbEntities// 
.// 

Documentos// %
.//% &
ToList//& ,
(//, -
)//- .
;//. /
}11 
public44 

	Documento44 
GuardarDocumento44 %
(44% &
	Documento44& /
	documento440 9
)449 :
{55 
_dbEntities66 
.66 

Documentos66 
.66 
Add66 "
(66" #
	documento66# ,
)66, -
;66- .
_dbEntities77 
.77 
SaveChanges77 
(77  
)77  !
;77! "
return99 
	documento99 
;99 
}:: 
public<< 

	Documento<< #
GetEditarDocumentoPorId<< ,
(<<, -
int<<- 0
id<<1 3
)<<3 4
{== 
return>> 
_dbEntities>> 
.>> 

Documentos>> %
.>>% &
First>>& +
(>>+ ,
o>>, -
=>>>. 0
o>>1 2
.>>2 3
Id>>3 5
==>>6 8
id>>9 ;
)>>; <
;>>< =
}?? 
publicAA 

voidAA $
PostEditarDocumentoPorIdAA (
(AA( )
intAA) ,
idAA- /
,AA/ 0
	DocumentoAA1 :
	documentoAA; D
)AAD E
{BB 
varCC 
documentoDBCC 
=CC 
_dbEntitiesCC %
.CC% &

DocumentosCC& 0
.CC0 1
FirstCC1 6
(CC6 7
oCC7 8
=>CC9 ;
oCC< =
.CC= >
IdCC> @
==CCA C
idCCD F
)CCF G
;CCG H
documentoDBDD 
.DD 
TipoDD 
=DD 
	documentoDD $
.DD$ %
TipoDD% )
;DD) *
documentoDBEE 
.EE 
ObservacionesEE !
=EE" #
	documentoEE$ -
.EE- .
ObservacionesEE. ;
;EE; <
_dbEntitiesGG 
.GG 
SaveChangesGG 
(GG  
)GG  !
;GG! "
}HH 
publicJJ 

voidJJ 
DeleteDocPorIdJJ 
(JJ 
intJJ "
idJJ# %
)JJ% &
{KK 
varLL 
documentoDBLL 
=LL 
_dbEntitiesLL %
.LL% &

DocumentosLL& 0
.LL0 1
FirstLL1 6
(LL6 7
oLL7 8
=>LL9 ;
oLL< =
.LL= >
IdLL> @
==LLA C
idLLD F
)LLF G
;LLG H
_dbEntitiesMM 
.MM 

DocumentosMM 
.MM 
RemoveMM %
(MM% &
documentoDBMM& 1
)MM1 2
;MM2 3
_dbEntitiesOO 
.OO 
SaveChangesOO 
(OO  
)OO  !
;OO! "
}PP 
publicRR 

	DocumentoRR '
ActualizarEstadoDeDocumentoRR 0
(RR0 1
intRR1 4
DocumentoIdRR5 @
,RR@ A
intRRB E
	UsuarioIdRRF O
)RRO P
{SS 
varTT 
	documentoTT 
=TT 
_dbEntitiesTT #
.TT# $

DocumentosTT$ .
.UU 
WhereUU 
(UU 
oUU 
=>UU 
oUU 
.UU 
IdUU 
==UU 
DocumentoIdUU  +
&&UU, .
oUU/ 0
.UU0 1
	UsuarioIdUU1 :
==UU; =
	UsuarioIdUU> G
)UUG H
.VV 
FirstOrDefaultVV 
(VV 
)VV 
;VV 
	documentoXX 
.XX 
EstadoXX 
=XX 
ESTADOXX !
.XX! "

EN_PROCESOXX" ,
;XX, -
_dbEntitiesYY 
.YY 
SaveChangesYY 
(YY  
)YY  !
;YY! "
return\\ 
	documento\\ 
;\\ 
}]] 
public`` 

	Documento``  
MarcarAtendidoEstado`` )
(``) *
int``* -
DocumentoId``. 9
,``9 :
int``; >
id``? A
)``A B
{aa 
varbb 
	documentobb 
=bb 
_dbEntitiesbb #
.bb# $

Documentosbb$ .
.cc 
Wherecc 
(cc 
occ 
=>cc 
occ 
.cc 
Idcc 
==cc 
DocumentoIdcc  +
&&cc, .
occ/ 0
.cc0 1
	UsuarioIdcc1 :
==cc; =
idcc> @
)cc@ A
.dd 
FirstOrDefaultdd 
(dd 
)dd 
;dd 
	documentoff 
.ff 
Estadoff 
=ff 
ESTADOff !
.ff! "
ATENDIDOff" *
;ff* +
_dbEntitieshh 
.hh 
SaveChangeshh 
(hh  
)hh  !
;hh! "
returnjj 
	documentojj 
;jj 
}ll 
publicnn 

Listnn 
<nn 
	Documentonn 
>nn 
ObtenerPorTiponn )
(nn) *
stringnn* 0
nombrenn1 7
)nn7 8
{oo 
returnpp 
_dbEntitiespp 
.pp 

Documentospp %
.pp% &
Wherepp& +
(pp+ ,
opp, -
=>pp. 0
opp1 2
.pp2 3
Tipopp3 7
.pp7 8
Containspp8 @
(pp@ A
nombreppA G
)ppG H
)ppH I
.ppI J
ToListppJ P
(ppP Q
)ppQ R
;ppR S
}qq 
}rr –0
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
}NN —)
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
;8 9
} 
public 
class %
UnidadPolicialRepositorio &
:& '&
IUnidadPolicialRepositorio( B
{ 
private 

DbEntities 
_dbEntities "
;" #
public 
%
UnidadPolicialRepositorio $
($ %

DbEntities% /

dbEntities0 :
): ;
{ 
_dbEntities 
= 

dbEntities  
;  !
} 
public 

List 
< 
UnidadPolicial 
> 
ObtenerTodos  ,
(, -
)- .
{ 
return 
_dbEntities 
. 
UnidadPolicials *
.* +
ToList+ 1
(1 2
)2 3
;3 4
} 
public 

void 
GuardarUnidad 
( 
UnidadPolicial ,
unidad- 3
)3 4
{ 
_dbEntities   
.   
UnidadPolicials   #
.  # $
Add  $ '
(  ' (
unidad  ( .
)  . /
;  / 0
_dbEntities!! 
.!! 
SaveChanges!! 
(!!  
)!!  !
;!!! "
}"" 
public$$ 

UnidadPolicial$$ 
ObtenerUnidadPorId$$ ,
($$, -
int$$- 0
id$$1 3
)$$3 4
{%% 
return&& 
_dbEntities&& 
.&& 
UnidadPolicials&& *
.&&* +
First&&+ 0
(&&0 1
o&&1 2
=>&&3 5
o&&6 7
.&&7 8
IdUnidad&&8 @
==&&A C
id&&D F
)&&F G
;&&G H
}'' 
public)) 

void)) 
EditarUnidadPorId)) !
())! "
int))" %
id))& (
,))( )
UnidadPolicial))* 8
unidad))9 ?
)))? @
{** 
var++ 
unidadDB++ 
=++ 
_dbEntities++ "
.++" #
UnidadPolicials++# 2
.++2 3
First++3 8
(++8 9
o++9 :
=>++; =
o++> ?
.++? @
IdUnidad++@ H
==++I K
id++L N
)++N O
;++O P
unidadDB,, 
.,, 
Nombre,, 
=,, 
unidad,,  
.,,  !
Nombre,,! '
;,,' (
unidadDB-- 
.-- 
Correo-- 
=-- 
unidad--  
.--  !
Correo--! '
;--' (
_dbEntities.. 
... 
SaveChanges.. 
(..  
)..  !
;..! "
}00 
public22 

void22 
DeleteUnidad22 
(22 
int22  
id22! #
)22# $
{33 
var44 
unidadDB44 
=44 
_dbEntities44 "
.44" #
UnidadPolicials44# 2
.442 3
First443 8
(448 9
o449 :
=>44; =
o44> ?
.44? @
IdUnidad44@ H
==44I K
id44L N
)44N O
;44O P
_dbEntities55 
.55 
UnidadPolicials55 #
.55# $
Remove55$ *
(55* +
unidadDB55+ 3
)553 4
;554 5
_dbEntities66 
.66 
SaveChanges66 
(66  
)66  !
;66! "
}77 
public99 

List99 
<99 
UnidadPolicial99 
>99 
ObtenerPorNombre99  0
(990 1
string991 7
nombre998 >
)99> ?
{:: 
return;; 
_dbEntities;; 
.;; 
UnidadPolicials;; *
.;;* +
Where;;+ 0
(;;0 1
o;;1 2
=>;;3 5
o;;6 7
.;;7 8
Nombre;;8 >
.;;> ?
Contains;;? G
(;;G H
nombre;;H N
);;N O
);;O P
.;;P Q
ToList;;Q W
(;;W X
);;X Y
;;;Y Z
}<< 
}== ³

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