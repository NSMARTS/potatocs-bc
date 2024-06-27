#!/bin/bash

# TLS CA 시작 -------------------------------------------------------------------------------------------
# TLS CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/tls-ca/tls-cert.pem

# TLS CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/tls-ca/admin

# TLS CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/tls-ca/admin

# TLS CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:5054

# nsmarts 피어 등록 (peer0nsmarts와 peer1nsmarts 등록)
../../../bin/fabric-ca-client register -d --id.name peer0nsmarts --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1nsmarts --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# vice 피어 등록 (peer0vice와 peer1vice 등록)
../../../bin/fabric-ca-client register -d --id.name peer0vice --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1vice --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# vice-kr 피어 등록 (peer0vice-kr와 peer1vice-kr 등록)
../../../bin/fabric-ca-client register -d --id.name peer0vice-kr --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1vice-kr --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# orderer 등록 (각 조직의 orderer 등록)
../../../bin/fabric-ca-client register -d --id.name orderer1nsmarts --id.secret orderer1pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer2nsmarts --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer3vice --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer4vice --id.secret orderer4pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer5vice-kr --id.secret orderer5pw --id.type orderer -u https://0.0.0.0:5054

# 관리자 등록 (각 조직의 관리자 등록)
../../../bin/fabric-ca-client register -d --id.name nsmartsadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name viceadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name vice-kradmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054

# TLS CA 끝 -------------------------------------------------------------------------------------------

# org1 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기

echo "Working on ca-nsmarts"

# nsmarts 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/nsmarts/ca-cert.pem

# nsmarts 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin

# nsmarts 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin

# nsmarts 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:7054

# nsmarts 피어 및 orderer 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0nsmarts --id.secret peer0pw --id.type peer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name peer1nsmarts --id.secret peer1pw --id.type peer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name orderer1nsmarts --id.secret orderer1pw --id.type orderer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name orderer2nsmarts --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name nsmartsadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:7054

# org1 끝 -------------------------------------------------------------------------------------------

# org2 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "Working on ca-vice"

# vice 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/vice/ca-cert.pem

# vice 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/vice.com/ca/admin

# vice 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/ca/admin

# vice 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:9054

# vice 피어 및 orderer 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0vice --id.secret peer0pw --id.type peer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name peer1vice --id.secret peer1pw --id.type peer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name orderer3vice --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name orderer4vice --id.secret orderer4pw --id.type orderer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name viceadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:9054

# org2 끝 -------------------------------------------------------------------------------------------

# org3 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "Working on ca-vice-kr"

# vice-kr 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/vice-kr/ca-cert.pem

# vice-kr 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/vice-kr.co.kr/ca/admin

# vice-kr 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/ca/admin

# vice-kr 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:10054

# vice-kr 피어 및 orderer 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0vice-kr --id.secret peer0pw --id.type peer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name peer1vice-kr --id.secret peer1pw --id.type peer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name orderer5vice-kr --id.secret orderer5pw --id.type orderer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name vice-kradmin --id.secret adminpw --id.type admin -u https://0.0.0.0:10054

# org3 끝 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "All CA and registration done"

# nsmarts 피어 등록 -----------------------------------------------
echo "Enroll nsmarts"

# peer0-nsmarts 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-nsmarts"

# nsmarts 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# peer0-nsmarts 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-nsmarts 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0nsmarts:peer0pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0nsmarts:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.nsmarts.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/tls-msp/keystore/key.pem

# peer0-nsmarts 등록 끝 -----------------------------------------------

# peer1-nsmarts 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-nsmarts"

# nsmarts 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# peer1-nsmarts 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-nsmarts 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1nsmarts:peer1pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1nsmarts:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.nsmarts.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/tls-msp/keystore/key.pem

# peer1-nsmarts 등록 끝 -----------------------------------------------

# peer0-vice 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-vice"

# vice 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/vice.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/ca/vice-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/tls-ca/tls-ca-cert.pem

# peer0-vice 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/ca/vice-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-vice 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0vice:peer0pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0vice:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.vice.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/tls-msp/keystore/key.pem
# peer0-vice 등록 끝 -----------------------------------------------

# peer1-vice 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-vice"

# vice 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/vice.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/ca/vice-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/tls-ca/tls-ca-cert.pem

# peer1-vice 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/ca/vice-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-vice 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1vice:peer1pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1vice:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.vice.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/tls-msp/keystore/key.pem
# peer1-vice 등록 끝 -----------------------------------------------

# peer0-vice-kr 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-vice-kr"

# vice-kr 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# peer0-vice-kr 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-vice-kr 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0vice-kr:peer0pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0vice-kr:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.vice-kr.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/tls-msp/keystore/key.pem
# peer0-vice-kr 등록 끝 -----------------------------------------------

# peer1-vice-kr 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-vice-kr"

# vice-kr 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# peer1-vice-kr 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-vice-kr 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1vice-kr:peer1pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1vice-kr:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.vice-kr.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/tls-msp/keystore/key.pem
# peer1-vice-kr 등록 끝 -----------------------------------------------

# orderer1-nsmarts 등록 시작 -----------------------------------------------

echo "### Enroll orderer1-nsmarts"

# orderer1-nsmarts 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# orderer1-nsmarts 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer1-nsmarts 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer1nsmarts:orderer1pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer1nsmarts:orderer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer.nsmarts.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/tls-msp/keystore/key.pem

# orderer1-nsmarts 등록 끝 -----------------------------------------------

# orderer2-nsmarts 등록 시작 -----------------------------------------------

echo "### Enroll orderer2-nsmarts"

# orderer2-nsmarts 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# orderer2-nsmarts 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer2-nsmarts 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer2nsmarts:orderer2pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer2nsmarts:orderer2pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer2.nsmarts.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/tls-msp/keystore/key.pem

# orderer2-nsmarts 등록 끝 -----------------------------------------------

# orderer3-vice 등록 시작 -----------------------------------------------

echo "### Enroll orderer3-vice"

# orderer3-vice 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/vice.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/ca/vice-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/tls-ca/tls-ca-cert.pem

# orderer3-vice 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/ca/vice-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer3-vice 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer3vice:orderer3pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer3vice:orderer3pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer3.vice.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/tls-msp/keystore/key.pem

# orderer3-vice 등록 끝 -----------------------------------------------

# orderer4-vice 등록 시작 -----------------------------------------------

echo "### Enroll orderer4-vice"

# orderer4-vice 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/vice.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/ca/vice-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/tls-ca/tls-ca-cert.pem

# orderer4-vice 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/ca/vice-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer4-vice 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer4vice:orderer4pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer4vice:orderer4pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer4.vice.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/tls-msp/keystore/key.pem

# orderer4-vice 등록 끝 -----------------------------------------------

# orderer5-vice-kr 등록 시작 -----------------------------------------------

echo "### Enroll orderer5-vice-kr"

# orderer5-vice-kr 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# orderer5-vice-kr 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer5-vice-kr 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer5vice-kr:orderer5pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer5vice-kr:orderer5pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer5.vice-kr.co.kr --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/tls-msp/keystore/key.pem

# orderer5-vice-kr 등록 끝 -----------------------------------------------

# nsmarts 관리자 등록 시작 -----------------------------------------------
echo "### Enroll nsmarts Admin"

# nsmarts 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# nsmarts 관리자 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://nsmartsadmin:adminpw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://nsmartsadmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/msp/admincerts/nsmarts-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/admincerts/nsmarts-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer0.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/tlscacerts/

# peer1-nsmarts 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/msp/admincerts/nsmarts-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/ca/nsmarts-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/peers/peer1.nsmarts.co.kr/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/admincerts/admin-nsmarts-cert.pem

cp ./nsmarts-config.yaml ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/msp/config.yaml

# orderer1-nsmarts 조직 구성 설정
cp ./nsmarts-config.yaml ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer.nsmarts.co.kr/msp/config.yaml

# orderer2-nsmarts 조직 구성 설정
cp ./nsmarts-config.yaml ${PWD}/../../organizations/peerOrganizations/nsmarts.co.kr/orderers/orderer2.nsmarts.co.kr/msp/config.yaml

# nsmarts 관리자 등록 끝 -----------------------------------------------

# vice 관리자 등록 시작 -----------------------------------------------
echo "### Enroll vice Admin"

# vice 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/ca/vice-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# vice 관리자 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://viceadmin:adminpw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://viceadmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice.com/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/msp/admincerts/vice-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/admincerts/vice-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/ca/vice-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer0.vice.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/msp/tlscacerts/

# peer1-vice 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/msp/admincerts/vice-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/ca/vice-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice.com/peers/peer1.vice.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice.com/msp/admincerts/admin-vice-cert.pem

cp ./vice-config.yaml ${PWD}/../../organizations/peerOrganizations/vice.com/msp/config.yaml

# orderer3-vice 조직 구성 설정
cp ./vice-config.yaml ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer3.vice.com/msp/config.yaml

# orderer4-vice 조직 구성 설정
cp ./vice-config.yaml ${PWD}/../../organizations/peerOrganizations/vice.com/orderers/orderer4.vice.com/msp/config.yaml

# vice 관리자 등록 끝 -----------------------------------------------

# vice-kr 관리자 등록 시작 -----------------------------------------------
echo "### Enroll vice-kr Admin"

# vice-kr 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# vice-kr 관리자 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://vice-kradmin:adminpw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://vice-kradmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/msp/admincerts/vice-kr-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/admincerts/vice-kr-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer0.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/tlscacerts/

# peer1-vice-kr 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/msp/admincerts/vice-kr-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/ca/vice-kr-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/peers/peer1.vice-kr.co.kr/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/admincerts/admin-vice-kr-cert.pem

cp ./vice-kr-config.yaml ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/msp/config.yaml

# orderer5-vice-kr 조직 구성 설정
cp ./vice-kr-config.yaml ${PWD}/../../organizations/peerOrganizations/vice-kr.co.kr/orderers/orderer5.vice-kr.co.kr/msp/config.yaml

# vice-kr 관리자 등록 끝 -----------------------------------------------

