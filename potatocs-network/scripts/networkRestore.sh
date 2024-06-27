echo '원장 문제점 파악 후 복구'

# docker kill peer0.nsmarts.co.kr couchdb0
# docker rm peer0.nsmarts.co.kr couchdb0 -v 
# 오염된 피어와 관련 couchdb를 죽였다가 네트워크를 다시 키면 오염된 부분이 복구된다.
# 그럼에도 불구하고 한 다 지우는 이유는 귀찮아서... 다 지우고 복구하면 오염된거 찾아서 지울 필요없이
# 그냥 스크립트 입력 한번에 다 되니깐...
# 참고로 데이터가 많아지면 네트워크 복구하는데도 시간이 걸린다. sleep 시간이 더 길게 잡아야함.

docker kill peer0.nsmarts.co.kr couchdb0 peer1.nsmarts.co.kr couchdb1 peer0.vice.com couchdb2 peer1.vice.com couchdb3 peer0.vice-kr.co.kr couchdb4 peer1.vice-kr.co.kr couchdb5
docker rm peer0.nsmarts.co.kr couchdb0 peer1.nsmarts.co.kr couchdb1 peer0.vice.com couchdb2 peer1.vice.com couchdb3 peer0.vice-kr.co.kr couchdb4 peer1.vice-kr.co.kr couchdb5 -v

cd ../tls-ca/script
./3.networkUp.sh

echo "---- sleep 5 ----"

sleep 5
