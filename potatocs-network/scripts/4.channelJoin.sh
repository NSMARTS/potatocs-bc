#----------------------------------------------------------------------------------------------
# 채널 생성에 필요한 파일을 생성하는 스크립트
# ViceKR 채널 생성 
echo 채널 블록 생성
../../bin/configtxgen -profile ThreeOrgNetworkRaft -configPath ${PWD}/../configtx -outputBlock vice-krchannel.block -channelID vice-krchannel
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 오더러 채널 참가
# 여기서  -o localhost:7053은 ORDERER_ADMIN_LISTENADDRESS 설정값임. 설정값은 compose-smarts-service.yaml에 있다.

echo 오더러1 채널 참가 

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vice-krchannel --config-block vice-krchannel.block -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러2 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
../../bin/osnadmin channel join --channelID vice-krchannel --config-block vice-krchannel.block -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------

echo 오더러3 채널 참가
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vice-krchannel --config-block vice-krchannel.block -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러4 채널 참가
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vice-krchannel --config-block vice-krchannel.block -o localhost:7059 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
echo 오더러5 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vice-krchannel --config-block vice-krchannel.block -o localhost:7061 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/keystore/key.pem
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051

../../bin/peer channel join -b vice-krchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:9051

../../bin/peer channel join -b vice-krchannel.block

sleep 3
#----------------------------------------------------------------------------------------------

# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051

../../bin/peer channel join -b vice-krchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051

../../bin/peer channel join -b vice-krchannel.block

sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------

# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:15051

../../bin/peer channel join -b vice-krchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceKRMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:17051

../../bin/peer channel join -b vice-krchannel.block

echo vicekr 채널 끝

sleep 3
#----------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------

echo vice 채널 시작

#----------------------------------------------------------------------------------------------
# 채널 생성에 필요한 파일을 생성하는 스크립트
# vicechannel 생성 
echo 채널 블록 생성
../../bin/configtxgen -profile TwoOrgNetworkRaft -configPath ${PWD}/../configtx -outputBlock vicechannel.block -channelID vicechannel
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 오더러 채널 참가
# 여기서  -o localhost:7053은 ORDERER_ADMIN_LISTENADDRESS 설정값임. 설정값은 compose-smarts-service.yaml에 있다.

echo 오더러1 채널 참가 

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vicechannel --config-block vicechannel.block -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러2 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
../../bin/osnadmin channel join --channelID vicechannel --config-block vicechannel.block -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------
echo 오더러3 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vicechannel --config-block vicechannel.block -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem
sleep 3
#----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------
echo 오더러4 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID vicechannel --config-block vicechannel.block -o localhost:7059 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem
sleep 3
#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
#vice 채널엔 vice-kr가 없다.

#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051

../../bin/peer channel join -b vicechannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:9051

../../bin/peer channel join -b vicechannel.block

sleep 3

#----------------------------------------------------------------------------------------------

# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051

../../bin/peer channel join -b vicechannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="ViceMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/vice.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051

../../bin/peer channel join -b vicechannel.block


echo vice채널 끝
sleep 3

# ------------------------------------------------------------------------------------

echo nsmarts 채널 시작

#----------------------------------------------------------------------------------------------
# 채널 생성에 필요한 파일을 생성하는 스크립트
# nsmarts 생성 
echo 채널 블록 생성
../../bin/configtxgen -profile OneOrgNetworkRaft -configPath ${PWD}/../configtx -outputBlock nsmartschannel.block -channelID nsmartschannel
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 오더러 채널 참가
# 여기서  -o localhost:7053은 ORDERER_ADMIN_LISTENADDRESS 설정값임. 설정값은 compose-smarts-service.yaml에 있다.

echo 오더러1 채널 참가 

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID nsmartschannel --config-block nsmartschannel.block -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러2 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
../../bin/osnadmin channel join --channelID nsmartschannel --config-block nsmartschannel.block -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
#nsmarts 채널엔 vice, vice-kr가 없다.

#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:7051

../../bin/peer channel join -b nsmartschannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NsmartsMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/msp
export CORE_PEER_ADDRESS=localhost:9051

../../bin/peer channel join -b nsmartschannel.block

sleep 3

#----------------------------------------------------------------------------------------------


echo 채널 상태 조회----------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7059 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7061 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/keystore/key.pem

echo nsmarts 끝