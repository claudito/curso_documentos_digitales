<?php 
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;


Route::get('pruebas/index',function(){


	//Crear Rol
	//$role = Role::create(['name' => 'invitado']);

	//Permiso
	//$permission = Permission::create(['name' => 'Reportes']);

	//Role - Permiso

	//$role = Role::where('name','admin')->first();

	//$role->givePermissionTo(2);
	//$role->givePermissionTo(2);

	//Permiso -  Role
	//$permission = Permission::where('name','Reportes')->first();
	//$permission->assignRole(1);


	//Asignacion Multiple Roles - Permisos
	//$permisos = [1,2,3];
	//$role = Role::where('name','usuario')->first();
	//$role->syncPermissions( $permisos );


	//Asignacion Multiple Permisos - Roles
	//$roles = [1,3];
	//$permission = Permission::where('name','Reportes')->first();
	//$permission->syncRoles($roles);

	//Eliminar Permisos
	//$role = Role::where('name','usuario')->first();
	//$role->revokePermissionTo(1);


	//Usuarios y Permisos
	//$user = User::where('id',1)->first();

	//Asignar Permiso
	//$user->givePermissionTo(3);

	//Asignar Permisos Multiples
	//$permisos = [1,3,2];
	//$user->givePermissionTo($permisos);


	//Eliminar Permisos
	//$user->revokePermissionTo(3);


	//Roles
	//$user = User::where('id',3)->first();
		
	//Asignacion
	//$user->assignRole('usuario');

	//Asignacion Multiple
	//$roles = [1,21,31,6];
	//$user->assignRole($roles);

	//validar si tiene el rol
	//dd( $user->hasRole($roles) );



	//Consultas
	//$user = User::where('id',3)->first();

	//Array de Objetos
	//$user->getPermissionNames();

	//Array Simple
	// $user->permissions; 
	
	//model_has_permissions
	//$user->getDirectPermissions();

	//role_has_permissions
	//$user->getPermissionsViaRoles();

	//Todos los permisos
	//return $user->getAllPermissions();
	//$users = User::role(2)->get();
	//$users = User::permission('Reportes')->get();

	/*$users = User::select(DB::raw("

		*
	"))
	->join('model_has_roles',function($join){

		$join->on('users.id','=','model_has_roles.model_id');

	})
	->where('model_has_roles.role_id',2)
	->get();
	*/
	//return $users;




});


