# 체인코드 빌드
# 경로에서 알아서 하자.

# 패키징

echo ---------------------- Order chaincode regist start -------------------------------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export CC_SRC_PATH=${PWD}/../../chaincodes/orders-chaincode/
export CC_NAME=order
export CC_VERSION=v1
mkdir ../packagedChaincode
sudo chmod -R 755 ../packagedChaincode

../../bin/peer lifecycle chaincode package ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz --path ${CC_SRC_PATH} --lang node --label ${CC_NAME}_${CC_VERSION} >&log.txt

# 체인코드 nsmarts peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz

sleep 3

# 체인코드 nsmarts peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3


# 체인코드 vice peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3



# 체인코드 vice peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 vice-kr peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 Restaurant peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:17051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

echo -----------------------------------------------------------
echo 설치된 패키지 id 확인!!
echo ----------------------------------------------------------
../../bin/peer lifecycle chaincode queryinstalled

# Chaincode code package identifier:  
# order_v1:ec2ff80e4d85033de67b4a1b81b03657237abfa2b579fe2ec23b26c5e73df8a9


echo ---------------------- order chaincode regist end -------------------------------------




# 체인코드 빌드
# 경로에서 알아서 하자.

# 패키징

echo ---------------------- contract chaincode regist start -------------------------------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export CC_SRC_PATH=${PWD}/../../chaincodes/contracts-chaincode/
export CC_NAME=contract
export CC_VERSION=v1
mkdir ../packagedChaincode
chmod -R 755 ../packagedChaincode

../../bin/peer lifecycle chaincode package ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz --path ${CC_SRC_PATH} --lang node --label ${CC_NAME}_${CC_VERSION} >&log.txt

# 체인코드 nsmarts peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz

sleep 3

# 체인코드 nsmarts peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3


# 체인코드 nsmarts peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz

sleep 3

# 체인코드 nsmarts peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3


# 체인코드 vice-kr peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 Restaurant peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:17051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

echo -----------------------------------------------------------
echo 설치된 패키지 id 확인!!
echo ----------------------------------------------------------
../../bin/peer lifecycle chaincode queryinstalled

# Chaincode code package identifier:  
# order_v1:ec2ff80e4d85033de67b4a1b81b03657237abfa2b579fe2ec23b26c5e73df8a9


echo ---------------------- contract chaincode regist end -------------------------------------

