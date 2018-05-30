<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Запрошення зареєструватись у системі</title>
    <style>
        .col {
            position: relative;
            font-family: Alegreya, sans-serif;
            font-size: 1.1rem;
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 0.9375rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            -webkit-transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
        }

        @media screen and (prefers-reduced-motion: reduce) {
            .btn {
                -webkit-transition: none;
                transition: none;
            }
        }

        .btn:hover, .btn:focus {
            text-decoration: none;
        }

        .btn:focus, .btn.focus {
            outline: 0;
            -webkit-box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
            box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
        }

        .btn.disabled, .btn:disabled {
            opacity: 0.65;
        }

        .btn:not(:disabled):not(.disabled) {
            cursor: pointer;
        }

        .btn:not(:disabled):not(.disabled):active, .btn:not(:disabled):not(.disabled).active {
            background-image: none;
        }

        a.btn.disabled,
        fieldset:disabled a.btn {
            pointer-events: none;
        }

        .btn-primary {
            color: #fff;
            background-color: #2C3E50;
            border-color: #2C3E50;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #1e2b37;
            border-color: #1a252f;
        }

        .btn-primary:focus, .btn-primary.focus {
            -webkit-box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.5);
            box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.5);
        }

        .btn-primary.disabled, .btn-primary:disabled {
            color: #fff;
            background-color: #2C3E50;
            border-color: #2C3E50;
        }

        .btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
        .show > .btn-primary.dropdown-toggle {
            color: #fff;
            background-color: #1a252f;
            border-color: #151e27;
        }

        .btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
        .show > .btn-primary.dropdown-toggle:focus {
            -webkit-box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.5);
            box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.5);
        }
    </style>
</head>
<body>
    <div class="col">
        <p>Доброго дня! Вас запрошують зареєструватись у системі сайту кафедри Спеціалізованих комп'ютерних систем УДХТУ.</p>
        <p>Для продовження Вам достатньо перейти на сторінку і заповнити форму, щоб Ви мали можливість користуватись сайтом!</p>
        <form action="${link}" method="post">
            <input type="hidden" value="${userEmail}" name="email"/>
            <input type="hidden" value="${userRole}" name="authority"/>
            <button type="submit" class="btn btn-primary">Перейти на сторінку для реєстрації</button>
        </form>
        <p class="pt-3">Дякуємо за увагу. Гарного дня!</p>
    </div>
</body>
</html>