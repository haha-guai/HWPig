@Entry
@Component
struct page14{
  build(){
    Text("飞天猪儿哥")
      .width(200)
      .height(200)
      .borderRadius(30)
      .border({color:'green', width:4})
      .textAlign(TextAlign.Center)
      .fontSize(30)
      .fontColor(Color.White)
      .stateStyles({
        normal:{
          .backgroundColor(Color.Orange)
        },
        pressed:{
          .backgroundColor(Color.Pink)
        }
      })
  }
}