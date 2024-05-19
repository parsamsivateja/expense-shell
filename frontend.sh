echo installing nginx
dnf install nginx -y >>/tmp/expense.log

echo placing expense config file in Nginx
cp expense.conf /etc/nginx/default.d/expense.conf >>/tmp/expense.log

echo removing old nginx content
rm -rf /usr/share/nginx/html/* >>/tmp/expense.log


echo Downloading Frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/expense.log

cd /usr/share/nginx/html

echo Extracting Frontend code
unzip /tmp/frontend.zip >>/tmp/expense.log

echo starting Nginx service
systemctl enable nginx >>/tmp/expense.log
systemctl start nginx  >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log