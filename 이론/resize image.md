### 이미지가 화면에 보이기까지의 과정
- jpeg, jpg 등 인코딩된 이미지 파일은 data buffer에 존재
- data buffer의 각 element는 픽셀에 대한 정보를 담고 있는것 x
- 디코딩 작업을 통해 픽셀에 대한 정보를 담게 됨
- data buffer에 있는 파일을 디코딩해서 image buffer에 저장함(image buffer를 위한 공간은 메모리 상에 매번 allocate 되어야 하는 것)
- 디코딩 과정에서의 단점
   - 디코딩 작업이 cpu를 많이 잡아먹음
   - 디코딩을 할 때마다, 새롭게 이미지 버퍼를 위한 공간을 할당해야 하기 때문에 메모리도 많이 잡아먹음 특히, 사이즈가 큰 이미지의 경우에는 더 많은 메모리를 잡아먹게 됨.
   - fragmentation이 발생
- image buffer의 파일을 렌더링해서 frame buffer에 보여주게 됨
- frame buffer에서는 실제 앱의 렌더링된 output을 담고 있음
- down sampling : 이미지를 디코딩하는 과정에서, 실제 이미지뷰의 크기만큼만 image buffer를 할당하도록 이미지를 축소하는 것.
