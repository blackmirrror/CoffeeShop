<#macro template user>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">

        <title>Coffee Shop</title>
    </head>
    <body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <a href="/">
                <span class="navbar-brand mb-0 h1">Coffee Shop</span>
            </a>
            <div class="dropdown text-end">
                <a href="/">
                    <span class="navbar-brand mb-0 h3">Меню</span>
                </a>
                <#if user.email??>
                    <a href="/orders">
                        <span class="navbar-brand mb-0 h3">Заказы</span>
                    </a>
                </#if>
                <#if user.isAdmin()>
                    <a href="/admin">
                        <span class="navbar-brand mb-0 h1">Панель администратора</span>
                    </a>
                    <a href="/my/products">
                        <span class="navbar-brand mb-0 h1">Продукты</span>
                    </a>
                </#if>
                <#if user.isUser()>
                    <a href="/cart">
                        <span class="navbar-brand mb-0 h1">Корзина</span>
                    </a>
                </#if>
                <#if user.email??>
                    <a href="/profile">
                        <img src="/static/images/avatar.png" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
                <#else>
                    <button class="btn btn-light my-2 my-sm-0" type="button"
                            onclick="window.location.href = '/login'">
                        Войти
                    </button>
                </#if>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1eea5a88db.js" crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>