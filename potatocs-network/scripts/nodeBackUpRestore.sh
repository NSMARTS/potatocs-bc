echo 채널 블록 복구

cp ../backup/vice-krchannel.block ./vice-krchannel.block
cp ../backup/contractchannel.block ./contractchannel.block


echo 네이버 peer0 복구

docker run --rm --volumes-from peer0.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.nsmarts.co.kr-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer.nsmarts.co.kr-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb0 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb0-backup.tar -C /opt/couchdb/data

echo 네이버 peer1 복구

docker run --rm --volumes-from peer1.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.nsmarts.co.kr-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer2.nsmarts.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer2.nsmarts.co.kr-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb1 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb1-backup.tar -C /opt/couchdb/data

echo 배달 peer0 복구

docker run --rm --volumes-from peer0.vice.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.vice.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer3.vice.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer3.vice.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb2 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb2-backup.tar -C /opt/couchdb/data

echo 배달 peer1 복구

docker run --rm --volumes-from peer1.vice.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.vice.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer4.vice.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer4.vice.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb3 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb3-backup.tar -C /opt/couchdb/data

echo 음식점 peer0 복구

docker run --rm --volumes-from peer0.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.vice-kr.co.kr-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer5.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer5.vice-kr.co.kr-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb4 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb4-backup.tar -C /opt/couchdb/data

echo 음식점 peer1 복구

docker run --rm --volumes-from peer1.vice-kr.co.kr -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.vice-kr.co.kr-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from couchdb5 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb5-backup.tar -C /opt/couchdb/data


echo 파일을 복구 후 다시 재시작.
docker-compose -f ../nsmarts/compose/compose-nsmarts.yaml restart 
docker-compose -f ../vice/compose/compose-vice.yaml restart 
docker-compose -f ../vice-kr/compose/compose-vice-kr.yaml restart
