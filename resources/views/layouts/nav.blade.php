<nav class="navbar navbar-expand-lg navbar-light bg-light">
     
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="navbar-toggler-icon"></span>
    </button> <a class="navbar-brand" href="{{ url('home')  }}">Documentos Digitales</a>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        @guest

        @else
        <ul class="navbar-nav">

            <li class="nav-item dropdown">
                 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Mantenimientos</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                     <a class="dropdown-item" href="{{ route('documentos.index') }}">Documentos</a>
                    <a class="dropdown-item" href="{{ route('usuario.index') }}">Usuarios</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider">
                    </div> <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </li>
        </ul>
        @endguest

        <ul class="navbar-nav ml-md-auto">

            @guest

                <li class="nav-item active">
                     <a class="nav-link" href="{{ route('login') }}">Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                     <a class="nav-link" href="{{ route('register') }}">Registro <span class="sr-only">(current)</span></a>
                </li>

            @else

                <li class="nav-item active">
                     <a class="nav-link" href="#">{{ Auth::user()->nombres  }} {{ Auth::user()->apellidos  }}<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                         <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                        <div class="dropdown-divider">
                        </div> 
                    
                        <a 
                        class="dropdown-item" 
                        href="{{ route('logout') }}" 
                        onclick="event.preventDefault();document.getElementById('logout-form').submit();"                  
                        >Salir</a>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                        </form>
                    
                    </div>
                </li>

            @endguest


        </ul>
    </div>
</nav>