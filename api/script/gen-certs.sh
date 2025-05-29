echo "Checking for SSL certificates..."
read -p "Enter the domain name used for SSL certificates: " domain_name
CERT_PATH="/etc/letsencrypt/live/$domain_name"
NORMAL_USER=${SUDO_USER:-$(logname)}
CODEPUSH_CERT_DIR="certs"
sudo mkdir -p ${CODEPUSH_CERT_DIR}
sudo cp ${CERT_PATH}/fullchain.pem ${CODEPUSH_CERT_DIR}/cert.crt
sudo cp ${CERT_PATH}/privkey.pem ${CODEPUSH_CERT_DIR}/cert.key
sudo chown -R $NORMAL_USER:$NORMAL_USER ${CODEPUSH_CERT_DIR}/

sudo ufw allow 8443

echo "SSL certificates generated successfully"