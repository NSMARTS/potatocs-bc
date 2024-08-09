echo vicekr 채널 order 컨트렉트 승인 시작 ------------------------

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID




export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID





sleep 3



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem


../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vice-krchannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required

sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem   --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3


../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vice-krchannel -n $CC_NAME --isInit -c '{"function":"GetAllOrders","Args":[]}'

echo vicekr 채널 order 컨트렉트 승인 끝 ------------------------


echo vice 채널 order 컨트렉트 승인 시작 ------------------------

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID




export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3

# vice 채널에는 vice kr 조직이 없다.

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem


../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vicechannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required

sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem   --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --channelID vicechannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3


../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vicechannel -n $CC_NAME --isInit -c '{"function":"GetAllOrders","Args":[]}'

echo vice 채널 order 컨트렉트 승인 끝 ------------------------


echo nsmarts 채널 order 컨트렉트 승인 시작 ------------------------

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:ba619df0970bfef834bdbbbe7797e6ad58516c7ee1bb28159f01c990018b87d8

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3

# nsmarts 채널에는 vice, vice kr 조직이 없다.

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem


../../bin/peer lifecycle chaincode checkcommitreadiness --channelID nsmartschannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required

sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3


../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C nsmartschannel -n $CC_NAME --isInit -c '{"function":"GetAllOrders","Args":[]}'

echo nsmarts 채널 order 컨트렉트 승인 끝 ------------------------

echo vice-kr 채널 contract 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vice-krchannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required


sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vice-krchannel -n $CC_NAME --isInit -c '{"function":"GetAllContractInfos","Args":[]}'


echo vice kr 채널 contract 체인코드 끝 -----------------------------------------


echo vice 채널 contract 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3

# vice 채널은 vice kr 이 없다.


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vicechannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required


sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID vicechannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vicechannel -n $CC_NAME --isInit -c '{"function":"GetAllContractInfos","Args":[]}'


echo vice 채널 contract 체인코드 끝 -----------------------------------------

echo nsmarts 채널 contract 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:455563840b74343381789983e09d5bffd7bad684253a7fb558e9bfc55f0f7ee1

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3
# nsmarts 채널은 vice vice kr 이 없다.


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID nsmartschannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required



../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C nsmartschannel -n $CC_NAME --isInit -c '{"function":"GetAllContractInfos","Args":[]}'


echo nsmarts 채널 contract 체인코드 끝 -----------------------------------------

echo vice-kr 채널 leave 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vice-krchannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required


sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID vice-krchannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vice-krchannel -n $CC_NAME --isInit -c '{"function":"GetAllLeaveRequests","Args":[]}'


echo vice kr 채널 leave 체인코드 끝 -----------------------------------------


echo vice 채널 leave 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID vicechannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


sleep 3

# vice 채널은 vice kr 이 없다.


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID vicechannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required


sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID vicechannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C vicechannel -n $CC_NAME --isInit -c '{"function":"GetAllLeaveRequests","Args":[]}'


echo vice 채널 leave 체인코드 끝 -----------------------------------------

echo nsmarts 채널 leave 체인코드 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=leave
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=leave_v1:596c9f413579d3e79bff04fa8e70f245f7df1cbb06becc7910aed9239759e102

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID

sleep 3
# nsmarts 채널은 vice vice kr 이 없다.


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID nsmartschannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required



../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID nsmartschannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C nsmartschannel -n $CC_NAME --isInit -c '{"function":"GetAllLeaveRequests","Args":[]}'


echo nsmarts 채널 leave 체인코드 끝 -----------------------------------------