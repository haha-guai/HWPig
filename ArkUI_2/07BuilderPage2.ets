//@Builder装饰器的引用传递

interface payType{
  type:string,
}

@Builder
function payButton($$:payType){
  Button($$.type, {type:ButtonType.Normal})
    .borderRadius(15)
    .width(300)
    .height(60)
    .backgroundColor($$.type == '微信' ? Color.Green : ($$.type == '支付宝' ? Color.Blue : Color.Gray))
    .fontSize(30)
}

@Entry
@Component
struct test{
  @State payType:string = '微信'
  build(){
    Column({space:50}){
      payButton({type:this.payType})
      Button('付款方式')
        .backgroundColor(Color.Gray)
        .fontSize(30)
        .onClick(()=>{
          if (this.payType == '微信')
            this.payType = '支付宝'
          else
            this.payType = '微信'
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}