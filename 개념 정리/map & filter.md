## collection 타입의 도구들 : map, filter

**map** : 어떤 배열이나 딕셔너리를 가지고 다른 배열을 만들어낼 때 쓰이는 메소드
- Array.map(transform: T -> U) : 맵의 기본형
-     let values = [1, 2, 3, 4, 5]
      let valueStr = values.map({ (v: Int) -> (String) in 
      return "\(v)"
      })

      let items = urls.map { url in return AVPlayerItem(url: url) }

- compactMap(_:) :
Returns an array containing the **non-nil** results of calling the given transformation with each element of this sequence.

**filter**: 배열에서 특정 아이템을 걸러낼 때 사용
-     let evenValues = values.filter({ (v: Int) -> (Bool) in
      if v % 2 == 0 { return true }
      return false
      })




### 싱글톤 패턴 : 객체를 하나만 생성하여 공용으로 사용하는 방법
-> 따라서, 하나의 프로젝트 내에서 해당 객체 내의 **프로퍼티 값이 모두 동일**함
