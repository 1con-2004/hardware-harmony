// 导入自定义的按键组件
import {ButtonControls} from '../components/ButtonControls'

@Entry
@Component
struct MainAbility {
  build() {
    Column({ space: 10 }) {
      // 使用封装的按键组件
      ButtonControls()

      // 你还可以添加其他页面的逻辑和UI
      Text('This is the main page!')
        .fontSize(20)
        .width('100%')
        .height(40)
        .backgroundColor(Color.Gray)
    }
  }
}
