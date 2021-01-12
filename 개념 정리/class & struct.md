## struct vs class 
<br>
둘다 프로퍼티와 함수를 가지고 데이터를 저장할 수 있다는 점에서 동일 
- struct
  - call by value
  - 상속 불가능
  - 손쉽게 JSON <-> Struct 변환 가능
- class
  - call by reference
  - 상속 가능



- 상속이 필요하지 않고, 모델의 크기가 작을 경우에는 struct 사용
- json 형식의 데이터를 이용한다면 struct 사용
- https://www.letmecompile.com/swift-struct-vs-class-%EC%B0%A8%EC%9D%B4%EC%A0%90-%EB%B9%84%EA%B5%90-%EB%B6%84%EC%84%9D/ 참고
