### Initializer(생성자)
- 새로운 객체를 사용하기 위해 준비하는 과정 
- property에 기본 값 할당, 메모리 할당 등등 
- 이니셜라이저 구현하는 대신에 기본값을 세팅해줄 수도 있음
- 옵셔널의 경우에는 이니셜라이저가 필요 없을 수도 있음
- 이니셜라이저에 어떤 파라미터를 넣느냐에 따라 종류를 다양하게 할 수 있다
- extension을 통해서 새로운 initializer를 추가할 수 있다 

### Memberwise Initializer
- struct의 경우에는, 생성자를 만들지 않으면 자동으로 각 프로퍼티를 매개변수로 하는 생성자가 생성된다.
(정의하지 않은 생성자에 대해서, 매개변수 값을 넘길 수 있는 것) 

### Class 타입의 initializer
- 지정 이니셜라이저(designated initializer) : 클래스의 모든 프로퍼티를 초기화하는 이니셜라이저, 모든 클래스는 적어도 한 개 이상의 지정 이니셜라이저를 가져야함. 
- 편의 이니셜라이저(convenience initializer): supporting 이니셜라이저, 프로퍼티의 일부에 대해서 초기화를 진행, 편의 이니셜라이저의 구현은 필수가 아님. 

### Class 타입에서의 initializer delegate rule
- initializer delegate: 어느 initializer에서 다른 initializer를 호출하는 것 
- 지정 이니셜라이저: **수직**방향으로 delegation
- 편의 이니셜라이저: **수평**방향으로 delegation 

1. 지정 이니셜라이저는 무조건, super클래스의  **지정 이니셜라이저**를 호출해야함(super 클래스의 편의 이니셜라이저는 호출 불가능) 
2. 편의 이니셜라이저는 무조건, 같은 클래스의 designated initializer를 호출해야 함 
3. 편의 이니셜라이저는 최종적으로는 지정 이니셜라이저를 호출하는 형태가 되어야함 

### Initializer safety-check : 초기화가 안전하게 진행되기 위해서 체크해야 할 요소들 
1. 편의 생성자는 직접 프로퍼티에 값을 할당하기 전에, 무조건 다른 생성자를 호출해야 한다. 
2. 상속받은 프로퍼티의 값을 변경하기 전에 지정 생성자에서 super class의 생성자를 호출해야 한다 -> super class의 생성자에서 상속받은 프로퍼티를 변경할 가능성이 높기 때문 
3. super class의 생성자를 호출하기 전에, 서브 클래스의 모든 프로퍼티가 초기화된 상태여야 한다.

### 2 phase initialization
- phase 1
   - 편의 생성자와 지정 생성자를 호출한다
   - subclass의 지정 생성자에서, 모든 저장 프로퍼티에 값이 할당되었는지 체크. property에 대한 메모리 초기화. 
   - super클래스에 대해서도 같은 작업 진행
   - 최상위 super class에서 모든 프로퍼티에  값이 할당되었는지 체크하고 초기화 종료 
   - 아래(subclass) -> 위(superclass)

- Phase 2
   - 최상단 root 클래스로부터 subclass로 프로퍼티 값 변경의 기회가 주어짐
   - 다시 서브 클래스의 생성자로 돌아오면 초기화 종료

### Automatic Initializer Inheritance
 - 특정 조건을 만족하는 경우, override의 키워드 없이도 super 클래스의 생성자를 상속받을 수 있다
 - 조건 1: subclass가 지정 이니셜라이저를 가지고 있지 않을 경우 -> 자동으로 superclass의 지정 이니셜라이저를 상속 받음
 - 조건 2: subclass가 superclass의 지정 이니셜라이저를 override하거나 상속받는 경우, superclass의 편의 이니셜라이저도 자동으로 상속받게 된다 

### Failable Initializer
- 초기화에 실패할 수 있는 경우에 사용
- 정말 필요한 경우가 아니면 안 쓰는게 좋다 -> optional값으로 리턴해주기 때문에 binding을 해서 사용해야할 필요가 있기 때문 
- 실패했을 경우에는 nil을 return 
- Ex) type conversion 함수 !! Int(exactly: 1.1) 
- Enum 같은 경우에는, raw value를 할당해주면 자동으로,  init?(rawValue:) 생성하게 된다 
- Failable initializer는 propagate 될 수 있다 

### Required initializer 
- Superclass의 생성자 중, subclass에서 무조건 구현해야 하는 생성자는 앞에 required 키워드를 붙여주어야 함. -> subclass에서도 required 붙여줘야 함. 

