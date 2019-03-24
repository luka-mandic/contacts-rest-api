## Contact rest api

1. Install:

    First clone project and then run
    ```$xslt
    composer install
    npm install
    ```
2. Setup .env

    copy .env.example into .env and replace the following values with your DB values
    ```$xslt
    DB_DATABASE=homestead
    DB_USERNAME=homestead
    DB_PASSWORD=secret
    ```
    then run
    
    ```$xslt
    php artisan key:generate
    ```
3. Setup DB
    
    a) Use the provided `typeqast.sql`
    ```$xslt
    mysql -u USER_NAME -pUSER_PASSWORD DB_NAME < typeqast.sql
    ```
    
    b) Use a new database
    
    run
    ```$xslt
    php artisan migrate
    php artisan passport:install
    ```
    
4. Run the app

    ```$xslt
    php artisan serve
    ```
    
    If you used the provided `typeqast.sql` you have 2 users to test with:
    
    ```
    email: test@test.com
    password: test1234
    ```
    ```
    email: test2@test.com
    password: test1234
    ```