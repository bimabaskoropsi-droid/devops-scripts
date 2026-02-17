

cat > deploy.sh << 'EOF'
#!/bin/bash

APP_NAME="LAB3-DEPLOY"
DEPLOY_DIR="/var/www/html/lab3"
BACKUP_DIR="/home/ec2-user/backups"


echo " STARTING DEPLOYMENT OF $APP_NAME..."

echo " CREATING BACKUP..."
mkdir -p $BACKUP_DIR

cp -r $DEPLOY_DIR $BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S) 2>/dev/null

echo "  BACKUP CREATED SUCCESSFULLY!"

echo " Pulling code from github..."

cd ~/devops-scripts && git pull origin main

echo " CODE PULLED!!"

echo " COPYING FILES TO DEPLOY DIR...."

cp ~/devops-scripts/*.sh $DEPLY_DIR/
echo "  FILES COPIED..."


echo "DEPLOYMENT COMPLET!!"

EOF
