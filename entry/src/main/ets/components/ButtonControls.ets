// ButtonControls.ets
@Component
export struct ButtonControls {
  @State upKeyPressed: boolean = false;
  @State downKeyPressed: boolean = false;
  @State leftKeyPressed: boolean = false;
  @State rightKeyPressed: boolean = false;

  // 组件的构建方法
  build() {
    Column({ space: 10 }) {
      // 上按钮
      Button('Press UP')
        .onClick(() => {
          this.handleKeyPress('up');
        })
        .width('100%')
        .height(40)

      // 下按钮
      Button('Press DOWN')
        .onClick(() => {
          this.handleKeyPress('down');
        })
        .width('100%')
        .height(40)

      // 左按钮
      Button('Press LEFT')
        .onClick(() => {
          this.handleKeyPress('left');
        })
        .width('100%')
        .height(40)

      // 右按钮
      Button('Press RIGHT')
        .onClick(() => {
          this.handleKeyPress('right');
        })
        .width('100%')
        .height(40)
    }
  }

  // 处理按键事件
  handleKeyPress(direction: string) {
    switch (direction) {
      case 'up':
        this.upKeyPressed = !this.upKeyPressed;
        console.log('UP key pressed.');
        break;
      case 'down':
        this.downKeyPressed = !this.downKeyPressed;
        console.log('DOWN key pressed.');
        break;
      case 'left':
        this.leftKeyPressed = !this.leftKeyPressed;
        console.log('LEFT key pressed.');
        break;
      case 'right':
        this.rightKeyPressed = !this.rightKeyPressed;
        console.log('RIGHT key pressed.');
        break;
    }
  }
}
