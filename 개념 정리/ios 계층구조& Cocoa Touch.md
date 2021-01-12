## ios의 계층구조
  - core OS 계층으로 갈수록, 하드웨어에 가까워짐
  - **상위 계층의 framework는 하위 계층의 framework를 이용해서 기능 구현**
  - **Core OS** : 최하위 계층, c기반, 데이터 접근, 파일 접근, 네트워크 등의 기능 구현
  - **Core Service**: core os에서 구현하지 못한 기능 구현, coreMotion(기기센서), Accounts(계정 관리), **Foundation(데이터 관리)** 기능 구현
  - **Media** : 멀티미디어 관련 기능 구현
  - **Cocoa Touch** : 화면의 그래픽, UI 터치 등의 기능 제공
     - 코코아 터치는 모든 계층에서 제공하는 스택을 포함한 집합체 
     - **따라서, 코코아 터치 계층은 어플리케이션 전체의 레이어라고도 함**
  
![ ](https://brody424.github.io/images/ios/ios_layer.png)

<br>

## Cocoa Touch

- **cocoa Touch**: ios를 위한 어플리케이션 개발 환경 , ios의 최상위 계층,  최상위 프레임워크
-  Foundation과 UIKit(AppKit)를 포함 (foundation은 core service 계층에서 구현한 것)

## Cocoa Touch의 주요 프레임워크
- **Foundation** 프레임워크: The Foundation framework provides a base layer of functionality for apps and frameworks(기능을 위한 가장 기초적인 것들 제공)
  - ex) essential data types, date, time, sorting, data storage ...
- **UIKit**: 그래픽, 이벤트 기반의 인터페이스 제공
  - UIKit를 import하면 Foundation 프레임워크도 같이 import됨 
  - ex) animation, document,drawing, printing, display... 
  - UIKit의 클래스는 메인 스레드에서만 사용해야함

- **CoreData**: Use Core Data to **save your application’s permanent data** for offline use, to **cache temporary data**, and to **add undo functionality** to your app on a single device.
  - **persistency**: 데이터베이스를 직접 구축하지 않고도 데이터 저장 가능 
  - **Undo and Redo of Individual or Batched Changes**: 앱내에서의 변화를 기억하고 있다가 undo, redo
  - **Background Data Tasks**: 백그라운드 작업
  - 이 외에도 view synchronization, versioning and migration이 있다


![ ](https://media.vlpt.us/post-images/wan088/f559c1e0-bfef-11e9-9a74-2157d61cdf8e/1110.png)




