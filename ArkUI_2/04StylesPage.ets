//Styles修饰器
import promptAction from '@ohos.promptAction';

@Styles
function payStyle(){
  .width('50%')
  .height(40)
  .backgroundColor(Color.Green)
  .borderRadius(10)
  .onClick(()=>{
    promptAction.showToast({message:'微信支付成功'});//该方法已过时
  })
}

@Entry
@Component
struct test{
  build(){
    Column({space:30}){
      Button("微信支付", {type:ButtonType.Normal}).payStyle()
      Button("微信支付", {type:ButtonType.Normal}).payStyle()
      Button("微信支付", {type:ButtonType.Normal}).payStyle()
    }

  }
}