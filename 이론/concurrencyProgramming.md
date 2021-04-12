### sync & async & blocking & non-blocking
- sync: 앞선 함수의 실행 결과를 자신의 함수 실행에 이용하는 것. 함수 간의 실행 순서(작업 완료 순서)가 보장됨
- async: 앞선 함수의 실행 결과와 상관없이 그 다음 함수를 실행 하는 것. 함수간의 실행 순서(작업 완료 순서)가 보장되지 않음 
- blocking : 호출된 함수의 수행이 끝날 때까지 자신을 호출한 함수에게 제어권을 넘겨주지 않는다. 호출한 함수는 앞선 함수가 끝날때까지 기다리고 있어야 함 
- non-blocking : 함수가 호출되자마자 자신을 호출한 함수에게 제어권을 넘겨줌. 기다리는 시간이 없다. 
- sync와 block의 차이는?
  - sync와 block 모두 앞선 함수의 종료를 기다리지만 sync는 기다리는 동안 대기큐에 들어가는 것이 필수가 아니고, block은 대기큐에 들어가는 것이 필수이다.
	- sync는 앞선 함수의 수행 결과를 받아와 자신의 작업 수행에 이용해야 하는 것, block이 포함 될 수도, 안 될 수도
	- block은 앞선 함수의 수행 때문에 자신의 작업을 수행하고 있지 못하는 상태.
< 커피 주문 예시>
	- Synchronous & blocking : 커피를 주문하면, 대기열에서 커피가 나올 때까지 기다리고 있어야 함
	- Synchronous & unblocking: 커피를 주문하면 , 다른 일을 해도 되지만, 커피가 나왔나 안 나왔나 계속 확인해야 함
	-	Asynchronous & blocking: 커피가 언제 나오는지 자동으로 알려주지만, 그 앞에서 계속 기다리고 있어야 함 (X) -> Ios에서는 잘 없는 케이스
	-	Asynchronous & unblocking: 커피가 언제 나오는지 자동으로 알려주고, 그 동안 다른 일을 하고 있어도 된다. (O)
### ios에서는 Concurrency를 어떻게 지원하는가?
- 1.	thread -> 애플에서는 스레드를 직접 접근하는 것을 권장하지 않음
- 2.	Operation
- 3.	GCD(Dispatch Queue)
### Operation
- Operation: 하나의 태스크와 관련된 코드와 작업을 나타내는 추상화된 클래스, 직접적으로 사용하지는 않고 subclass를 만들어서 사용함
- operation은 단독으로도 사용할 수 있고, operation queue에 넣어서도 사용할 수 있다.
- operation만 사용하면, sync하게 작동함 -> operation을 async하게 사용하기 위해서는 , isFinished, isAsynchronous, isExecuting, Start에 대한 값을 변경해주어야 함 or operation queue 사용
- 큐 간의 dependency를 지정해 줄 수 있다 -> 큐 간의 실행 순서를 지정할 수 있음(GCD에서는 제공 x)

### GCD(Grand Central Dispatch)
- 멀티코어 환경에서 최적화된 프로그래밍을 지원하도록 애플이 개발한 기술
- operation과 다르게 따로 큐를 만들지 않아도 됨
- dispatch group : 그룹내에 있는 태스크들을 하나의 unit 단위로 처리하고 싶을 때 사용.
- wait이나 notify를 통해, dispatch group의 작업을 sync로 할지 async로 할지 지정할 수 있음
- 하지만, 디스패치 그룹 안에서도 어떤 task들이 먼저 수행되게 할지 그 순서는 보장할 수 없음
- dispatch work item : 태스크 취소가 가능함
