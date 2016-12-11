<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{ option('site_name') }}</title>
    <link rel="shortcut icon" href="{{ assets('images/favicon.ico') }}">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- App Styles -->
    {!! bs_header('index') !!}
</head>

<body class="hold-transition {{ option('color_scheme') }} layout-top-nav">

    <div class="wrapper" style="background-image: url('{{ option('home_pic_url') }}');">
        <!-- Navigation -->
        <header class="main-header transparent">
            <nav class="navbar navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <a href="{{ option('site_url') }}" class="navbar-brand">{{ option('site_name') }}</a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="{{ url('/') }}">{{ trans('general.index') }}</a></li>
                            <li><a href="{{ url('skinlib') }}">{{ trans('general.skinlib') }}</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            @include('vendor.language')

                            @if (!is_null($user))
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="{{ avatar($user, 25) }}" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs nickname">{{ bs_nickname($user) }}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="{{ avatar($user, 128) }}" alt="User Image">
                                        <p>{{ $user->email }}</p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="{{ url('user') }}" class="btn btn-default btn-flat">{{ trans('general.user-center') }}</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="javascript:logout();" class="btn btn-default btn-flat">{{ trans('general.logout') }}</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            @else {{-- Anonymous User --}}
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <a href="{{ url('auth/login') }}" class="btn btn-login">{{ trans('general.login') }}</a>
                            </li>
                            @endif
                        </ul>
                    </div><!-- /.navbar-custom-menu -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>

        <div class="container">
            <div class="splash">
                <h1 class="splash-head">{{ option('site_name') }}</h1>
                <p class="splash-subhead">
                    {{ option('site_description') }}
                </p>
                <p>
                    @if (is_null($user))
                        @if (option('user_can_register'))
                        <a href="{{ url('auth/register') }}" id="btn-register" class="button">{{ trans('general.register') }}</a>
                        @else
                        <a href="{{ url('auth/login') }}" id="btn-close-register" class="button">{{ trans('general.login') }}</a>
                        @endif
                    @else
                    <a href="{{ url('user') }}" class="button">{{ trans('general.user-center') }}</a>
                    @endif
                </p>
            </div>
        </div> <!--/ .container -->
    </div><!--/ #headerwrap -->

    <!-- INTRO WRAP -->
    <div id="intro">
        <div class="container">
            <div class="row text-center">
                <h1>Features</h1>
                <br>
                <br>
                <div class="col-lg-4">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <h3>多角色</h3>
                    <p>一个账户可绑定多个游戏角色</p>
                </div>
                <div class="col-lg-4">
                    <i class="fa fa-share-alt" aria-hidden="true"></i>
                    <h3>分享</h3>
                    <p>浏览皮肤库，添加喜爱的皮肤并与好友分享</p>
                </div>
                <div class="col-lg-4">
                    <i class="fa fa-cloud" aria-hidden="true"></i>
                    <h3>永久免费</h3>
                    <p>我们承诺永不收取任何费用</p>
                </div>
            </div>
            <br>
        </div> <!--/ .container -->
    </div><!--/ #introwrap -->

    <div id="footerwrap">
        <div class="container">
            <div class="col-lg-6">
                {{ option('site_name') }} 提供 Minecraft 角色皮肤的上传以及托管服务。配合 CustomSKinLoader 等换肤 MOD，您可以为您的游戏角色设置皮肤与披风，并让其他玩家在游戏中看到。
            </div>

            <div class="col-lg-6">
                <a href="{{ url('auth/register') }}" id="btn-register" class="button">开始使用</a>
            </div>
        </div>
    </div>

    <div id="copyright">
        <!-- Designed by Pratt -->
        <div class="container">
            <!-- YOU CAN NOT MODIFIY THE COPYRIGHT TEXT W/O PERMISSION -->
            <div class="pull-right hidden-xs">
                Powered by <a href="https://github.com/printempw/blessing-skin-server">Blessing Skin Server</a>.
            </div>
            <!-- Default to the left -->
            {!! bs_copyright() !!}
        </div>
    </div>

    <!-- App Scripts -->
    {!! bs_footer() !!}

    <script>
        var changeWrapperHeight = function() { $('.wrapper').height($(window).height()) };
        $(document).ready(changeWrapperHeight);
        $(window).resize(changeWrapperHeight).scroll(function(event) {
            // change color of the navigation bar when scrolling
            if (document.body.scrollTop >= ($(window).height() * 2 / 3)) {
                $('.main-header').removeClass('transparent');
            } else {
                $('.main-header').addClass('transparent');
            }
        });
    </script>
</body>
</html>
