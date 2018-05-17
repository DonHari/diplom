<!doctype html>
<html>
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
<ul class="errors">
    customError.gsp
    <li>${errorMessage}</li>
</ul>
</body>
</html>