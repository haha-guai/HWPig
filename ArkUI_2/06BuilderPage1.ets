//@Builder装饰器的值传递
@Builder
function payButton(type:'微信' | '支付宝'){
  Button(type, {type:ButtonType.Normal})
    .borderRadius(15)
    .width(300)
    .height(60)
    .backgroundColor(type == '微信' ? Color.Green : Color.Blue)
    .fontSize(30)
}

@Entry
@Component
struct test{
  build(){
    Column({space:50}){
      payButton('微信')
      payButton('支付宝')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}