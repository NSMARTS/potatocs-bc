# 도커 네트워크 종료 -v(볼륨) --remove-orphans(yaml과 관련없는 볼륨 데이터 삭제)
docker-compose -f ./nsmarts/compose/compose-nsmarts.yaml down -v --remove-orphans

docker-compose -f ./vice/compose/compose-vice.yaml down -v --remove-orphans

docker-compose -f ./vice-kr/compose/compose-vice-kr.yaml down -v --remove-orphans

# 볼륨 전체 삭제
docker volume rm $(docker volume ls -q)

# 네트워크 삭제
docker network prune

# 체인코드 이미지 삭제  
docker rmi -f $(docker images -q --filter=reference='*dev-*') 

docker rm $(docker ps -a -q --filter "ancestor=hyperledger/fabric-nodeenv:2.5")

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
    sudo rm -rf ./organizations/fabric-ca/nsmarts/$file
    sudo rm -rf ./organizations/fabric-ca/vice/$file
    sudo rm -rf ./organizations/fabric-ca/vice-kr/$file
    sudo rm -rf ./organizations/fabric-ca/tls-ca/$file
done

for file in $RM_CRYPTO_FILES; do
    sudo rm -rf ./organizations/peerOrganizations/nsmarts.co.kr/$file
    sudo rm -rf ./organizations/peerOrganizations/vice.com/$file
    sudo rm -rf ./organizations/peerOrganizations/vice-kr.co.kr/$file
    sudo rm -rf ./organizations/tls-ca/$file
done
