@Entry
@Component
struct page16{
  build(){
    Column(){
      Row(){
        Text("X").margin({left:20})
        Text("帮助").margin({right:20})
      }
      .margin({top:15})
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      Image($r('app.media.image5'))
        .width(100)
        .margin({top:50, bottom:60})

      Stack({alignContent:Alignment.End}){
        TextInput({text:'国家地区'})
          .border({color:'black', width:1})
          .margin({left:15, right:15})
          .backgroundColor(Color.White)

        Text("中国(+86) >").margin({right:20})
      }
      .height(40)
      .margin({bottom:15})

      TextInput({placeholder:'请输入手机号'})
        .border({color:'black', width:1})
        .margin({left:15, right:15, bottom:10})
        .backgroundColor(Color.White)


      Row(){
        Checkbox()
          .width(15)
          .margin({left:5})

        Text("我已经阅读并同意《xx隐私政策》、《xx用户服务协议》，" +
          "未注册的手机号将自动注册xx账号")
          .fontSize(14)
          .margin({right:10})
          .layoutWeight(1)

      }
      .width('100%')
      .alignItems(VerticalAlign.Top)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({left:10, right:10, bottom:15})


      Button("登录")
        .width(320)
        .margin({bottom:15})


      Row({space:20}) {
        Text("新用户注册")
        Text("账户密码登录")
        Text("无法登录")
      }

      Blank()
      Text("其他登录方式")
        .fontSize(13)
        .margin({bottom:10})
      Row({space:20}){
        Image($r("app.media.image5")).width(30)
        Image($r("app.media.image5")).width(30)
        Image($r("app.media.image5")).width(30)
      }
      .margin({bottom:20})

    }
      .backgroundImage($r('app.media.background1'))
      .backgroundImageSize({width:'100%', height:'100%'})
      .width('100%')
      .height('100%')
  }
}
