Feature: HU003-Login de Usuario
Como cliente de la tienda nopCommerce
quiero poder loguearme en su pagina web
para comprar los productos que ofrecen en linea


Scenario: Verificar existencia de la opcion Log in en el home de la pagina
	When ingreso al home de la pagina web de nopCommerce
   	Then existe una opcion cliqueable que dice "Log in"

Scenario: Visualizar los elementos correspondientes a la pagina de Log in
	Given que estoy en el home de la pagina web de nopCommerce
    When hago clic en la opcion de Log in
    Then existe una opcion de registro para nuevo usuario que dice "Register"
    And existe el campo para ingresar email
    And existe el campo para ingresar contraseña
    And existe un checkbox para olvido de contraseña
    And existe un checbox de recordarme
    And existe un boton para ingresar que dice "Log in"

Scenario: Autenticacion de usuario con credenciales correctas
	Given que estoy en la pagina de Log in	
    When ingreso un correo y una contraseña valida y correcta
    And hago clic en el boton de Log in
    Then el sistema me redirije a la zona de compras
    And me aparece un mensaje que dice "Welcome to our store"
    
Scenario: Autenticacion de usuario con credenciales incorrectas
	Given que estoy en la pagina de Log in	
    When ingreso tanto un correo como una contraseña incorrecta
    And hago clic en el boton de Log in
    Then me aparece un mensaje de error de logueo sin exito

Scenario: Autenticacion de usuario con formato de correo no valido
	Given que estoy en la pagina de Log in
    When ingreso un correo con formato no valido y una contraseña
    And hago clic en el boton de Log in
    Then me aparece un mensaje debajo del campo contraseña indicando correo invalido
    
Scenario: Cerrar sesion de usuario en la pagina web
	Given que he iniciado sesion correctamente en la pagina
    When quiero cerrar sesion de manera segura
    Then puedo hacer clic en la opcion de Log out