#!/bin/bash
#
# Copyright Tongji University. All Rights Reserved.
# 业务流程测试
# SPDX-License-Identifier: Apache-2.0


ORG1_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MDU1ODA2MjYsInVzZXJuYW1lIjoiSmltIiwib3JnTmFtZSI6Im9yZzEiLCJpYXQiOjE1MDU1NDQ2MjZ9.yUjXXUYidAUm9kFZ8V__5FiZ9hftQp0zOjromvTmTS4

ORG2_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MDU1ODA2MjcsInVzZXJuYW1lIjoiQmFycnkiLCJvcmdOYW1lIjoib3JnMiIsImlhdCI6MTUwNTU0NDYyN30.TYN0priSY-quajk6kgFM47D45WlrzWojJSwND_WE7ik

ORG3_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MDU1ODA2MjcsInVzZXJuYW1lIjoiSXJpc3h1Iiwib3JnTmFtZSI6Im9yZzMiLCJpYXQiOjE1MDU1NDQ2Mjd9.n9ZdHJyEusVOMUUeiHBqeMCKZgPuyNh0N2NuB7sdMJo

ORG4_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MDU1ODA2MjcsInVzZXJuYW1lIjoieGlhb3dhbmciLCJvcmdOYW1lIjoib3JnNCIsImlhdCI6MTUwNTU0NDYyN30.AGlX8m1fh_2OrZi9Bq5B5bs4wZ9E8DTTZ_avqfF6G_Q

#======================================================================
#安装并初始化相关的合约
#======================================================================
echo "POST Install chaincode BusinessPartnerInfo on Org1"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:7051","localhost:7056"],
	"chaincodeName":"BusinessPartnerInfo",
	"chaincodePath":"github.com/BusinessPartnerInfo",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST Install chaincode BusinessPartnerInfo on Org2"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:8051","localhost:8056"],
	"chaincodeName":"BusinessPartnerInfo",
	"chaincodePath":"github.com/BusinessPartnerInfo",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST Install chaincode BusinessPartnerInfo on Org3"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG3_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:9051","localhost:9056"],
	"chaincodeName":"BusinessPartnerInfo",
	"chaincodePath":"github.com/BusinessPartnerInfo",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST Install chaincode BusinessPartnerInfo on Org4"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10051","localhost:10056"],
	"chaincodeName":"BusinessPartnerInfo",
	"chaincodePath":"github.com/BusinessPartnerInfo",
	"chaincodeVersion":"v0"
}'
echo
echo "POST instantiate chaincode BusinessPartnerInfo on peer1 of Org1"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodes \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"chaincodeName":"BusinessPartnerInfo",
	"chaincodeVersion":"v0",
	"functionName":"init",
	"args":[]
}'
echo
echo
