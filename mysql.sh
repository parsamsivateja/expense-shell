source common.sh
echo Disable Mysql 8 version
dnf module disable mysql -y

echo copy Mysql repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo install Mysql server
dnf install mysql-community-server -y

echo start mysql service
systemctl enable mysqld
systemctl start mysqld

echo setup root password
mysql_secure_installation --set-root-pass ExpenseApp@1
