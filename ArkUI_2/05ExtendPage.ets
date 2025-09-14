//Extend修饰器
import {promptAction} from '@kit.ArkUI';

@Extend(Button)
function payButton(type: '微信' | '支付宝'){
  .type(ButtonType.Normal)
  .borderRadius(10)
  .fontColor(Color.White)
  .width(300)
  .height(50)
  .fontSize(30)
  .backgroundColor(type == '微信' ? Color.Green : Color.Blue)
  .onClick(()=>{
    if (type == '微信')
      promptAction.showToast({message:'微信支付成功'})
    else
      promptAction.showToast({message:'支付宝支付成功'})
  })
}

@Entry
@Component
struct test{
  build(){
    Column({space:50}){
      Button('微信支付').payButton('微信')
      Button('支付宝支付').payButton('支付宝')
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}