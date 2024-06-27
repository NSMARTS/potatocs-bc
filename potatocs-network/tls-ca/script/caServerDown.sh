docker-compose -f ../compose/compose-ca.yaml down -v

# 환경변수 설정

# 삭제할 CA 파일 리스트
RM_CA_FILES="msp ca-cert.pem fabric-ca-server.db IssuerPublicKey IssuerRevocationPublicKey tls-cert.pem"

# 삭제할 CRYPTO 파일 리스트
RM_CRYPTO_FILES="
  admin/msp 
  admin/tls-msp 
  ca/admin/msp
  ca/admin/tls-msp  
  msp
  orderers/orderer.nsmarts.co.kr/assets
  orderers/orderer.nsmarts.co.kr/msp
  orderers/orderer.nsmarts.co.kr/tls-msp
  orderers/orderer2.nsmarts.co.kr/assets
  orderers/orderer2.nsmarts.co.kr/msp
  orderers/orderer2.nsmarts.co.kr/tls-msp
  orderers/orderer3.vice.com/assets
  orderers/orderer3.vice.com/msp
  orderers/orderer3.vice.com/tls-msp
  orderers/orderer4.vice.com/assets
  orderers/orderer4.vice.com/msp
  orderers/orderer4.vice.com/tls-msp
  orderers/orderer5.vice-kr.co.kr/assets
  orderers/orderer5.vice-kr.co.kr/msp
  orderers/orderer5.vice-kr.co.kr/tls-msp
  peers/peer0.nsmarts.co.kr/assets
  peers/peer0.nsmarts.co.kr/msp
  peers/peer0.nsmarts.co.kr/tls-msp
  peers/peer1.nsmarts.co.kr/assets
  peers/peer1.nsmarts.co.kr/msp
  peers/peer1.nsmarts.co.kr/tls-msp  
  peers/peer0.vice.com/assets
  peers/peer0.vice.com/msp
  peers/peer0.vice.com/tls-msp  
  peers/peer1.vice.com/assets
  peers/peer1.vice.com/msp
  peers/peer1.vice.com/tls-msp  
  peers/peer0.vice-kr.co.kr/assets
  peers/peer0.vice-kr.co.kr/msp
  peers/peer0.vice-kr.co.kr/tls-msp    
  peers/peer1.vice-kr.co.kr/assets
  peers/peer1.vice-kr.co.kr/msp
  peers/peer1.vice-kr.co.kr/tls-msp    
"

# 파일 및 디렉터리 삭제
for file in $RM_CA_FILES; do
    rm -rf ../../organizations/fabric-ca/nsmarts/$file
    rm -rf ../../organizations/fabric-ca/vice/$file
    rm -rf ../../organizations/fabric-ca/vice-kr/$file
    rm -rf ../../organizations/fabric-ca/tls-ca/$file
done

for file in $RM_CRYPTO_FILES; do
    rm -rf ../../organizations/peerOrganizations/nsmarts.co.kr/$file
    rm -rf ../../organizations/peerOrganizations/vice.com/$file
    rm -rf ../../organizations/peerOrganizations/vice-kr.co.kr/$file
    rm -rf ../../organizations/tls-ca/$file
done