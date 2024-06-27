# 노드 백업
# 블록체인 네트워크 각 노드 별 현재 상태를 압축 보관   

sudo mkdir ../backup

echo 네이버 peer0 복제

docker run --rm --volumes-from peer0.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.nsmarts.co.kr-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer.nsmarts.co.kr-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb0 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb0-backup.tar -C /opt/couchdb/data .

echo 네이버 peer1 복제

docker run --rm --volumes-from peer1.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.nsmarts.co.kr-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer2.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer2.nsmarts.co.kr-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb1 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb1-backup.tar -C /opt/couchdb/data .

echo 배달업체 peer0 복제

docker run --rm --volumes-from peer0.vice.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.vice.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer3.vice.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer3.vice.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb2 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb2-backup.tar -C /opt/couchdb/data .

echo 배달업체 peer1 복제

docker run --rm --volumes-from peer1.vice.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.vice.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer4.vice.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer4.vice.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb3 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb3-backup.tar -C /opt/couchdb/data .

echo 음식점 peer0 복제. 

docker run --rm --volumes-from peer0.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.vice-kr.co.kr-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer5.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer5.vice-kr.co.kr-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb4 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb4-backup.tar -C /opt/couchdb/data .


echo 음식점 peer1 복제 오더러는 5개라 이번엔 오더러 안함.

docker run --rm --volumes-from peer1.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.vice-kr.co.kr-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from couchdb5 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb5-backup.tar -C /opt/couchdb/data .

echo 채널에 필요한 블록 복제
cp ./vice-krchannel.block ../backup/vice-krchannel.block
cp ./contractchannel.block ../backup/contractchannel.block
