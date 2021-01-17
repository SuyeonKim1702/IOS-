## view controller의 생명주기
loadView -> viewDidLoad -> viewWillAppear -> (viewWillLayoutSubview) -> (viewDidLayoutSubview) -> viewDidAppear ->
viewWillDisappear -> viewDidDidappear -> viewDidUnload 

### viewDidLoad
- 뷰 컨트롤러가 메모리위에 올라간 후 호출됨 
- 화면이 처음 생성된 후 한번만 실행됨 
- 해당 화면이 메모리에서 pop되지 않는 이상 다시 실행 안됨
  
### viewWillAppear 
- 화면이 새로 뜰 때마다 호출됨
- 화면이 새로 호출될 때마다 수행되는 작업

### viewWillLayoutSubview
- 서브 뷰들의 레이아웃이 결정되기 전에 호출됨
 
### viewDidLayoutSubview
- viewDidLayoutSubviews is called every time the view is updated, rotated or changed or it’s bounds change
- 뷰가 업데이트 될 때마다 호출됨 
- portrait <-> landscape 회전할 때마다 호출

![](https://www.appcoda.com/wp-content/uploads/2018/06/viewcontroller-lifecycle-2.jpg)



--------
### viewController의 종류 
- Content View Controller
  - 기본으로 생성되는 view controller
- Container View Controller 
  - NavigationViewController나  TabBarViewController 처럼 여러 개의 View Controller를 제어하는 뷰 
 
------
## 앱의 생명주기 
-> sceneDelegate에서 확인 가능
