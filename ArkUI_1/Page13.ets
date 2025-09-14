@Entry
@Component
struct page13{
  build(){
    Stack({alignContent:Alignment.Bottom}){
      Flex({wrap:FlexWrap.Wrap}){
        Text("App1")
          .backgroundColor(Color.White)
          .width(100)
          .height(100)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .borderRadius(20)
          .margin(10)
        
        Text("App2")
          .backgroundColor(Color.White)
          .width(100)
          .height(100)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .borderRadius(20)
          .margin(10)
        
        Text("App3")
          .backgroundColor(Color.White)
          .width(100)
          .height(100)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .borderRadius(20)
          .margin(10)
        
        Text("App4")
          .backgroundColor(Color.White)
          .width(100)
          .height(100)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .borderRadius(20)
          .margin(10)
        
        Text("App5")
          .backgroundColor(Color.White)
          .width(100)
          .height(100)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .borderRadius(20)
          .margin(10)
        
      }
      .width('100%')
      .height('100%')
      Flex({justifyContent:FlexAlign.SpaceEvenly, alignItems:ItemAlign.Center}){
        Text("联系人").fontSize(16)
        Text("设置").fontSize(16)
        Text("短信").fontSize(16)
      }
      .width('50%')
      .height(50)
      .backgroundColor('#16302e2e')
      .margin({bottom:15})
      .borderRadius(15)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}