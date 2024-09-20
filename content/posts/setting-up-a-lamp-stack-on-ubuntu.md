---
title: "Setting Up a LAMP Stack on Ubuntu"
date: 2023-11-06T10:30:00-05:00
draft: false
---

# Setting Up a LAMP Stack on Ubuntu

A LAMP stack (Linux, Apache, MySQL/MariaDB, PHP) provides a powerful and popular foundation for web development. Here's a step-by-step guide to setting up a LAMP stack on Ubuntu:

**1. Update Your System:**

```bash
sudo apt update
sudo apt upgrade
```

**2. Install Apache Web Server:**

```bash
sudo apt install apache2
```

**3. Install MySQL/MariaDB Database Server:**

```bash
sudo apt install mariadb-server
```

* Follow the prompts to set a root password for MySQL/MariaDB.

**4. Install PHP and Related Modules:**

```bash
sudo apt install php libapache2-mod-php php-mysql 
```

**5. Test Your LAMP Stack:**

* Create a PHP info file: 

```bash
sudo nano /var/www/html/info.php 
```

* Paste the following code:

```php
<?php
phpinfo();
?>
```

* Save and exit (Ctrl+X, Y, Enter).
* Access the file in your web browser:  `http://your_server_ip/info.php` 

**6. Configure a Virtual Host (Optional):**

* Virtual hosts allow you to host multiple websites on a single server.
* Create a new virtual host configuration file:

```bash
sudo nano /etc/apache2/sites-available/yourdomain.com.conf
```

* Configure the virtual host settings (document root, server name).
* Enable the virtual host: 

```bash
sudo a2ensite yourdomain.com.conf
```

* Reload Apache:

```bash
sudo systemctl reload apache2
```

**Conclusion:**

You now have a working LAMP stack on your Ubuntu system, ready for web development!
# Similar Posts
