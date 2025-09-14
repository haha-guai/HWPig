@Entry
@Component
struct page9{
  @State middleHeight:number = 0;
  build(){
    Column(){
      Row(){
        Text("顶部")
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .width("100%")
      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.Red)

      Scroll(){
        Column(){
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
          myElement()
        }
      }
        .width("100%")
        .height(this.middleHeight)
        .backgroundColor(Color.Gray)

      Row(){
        Text("底部")
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .width("100%")
      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.Red)

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width("100%")
    .height("100%")
    .onAreaChange((oldArea:Area, newArea:Area)=>{
      this.middleHeight = (newArea.height as number) - 100;
    })
  }
}

@Component
struct myElement{
  build(){
    Row(){
      Text("广告位")
    }
    .width("100%")
    .height(80)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
    .margin({top:20, bottom:10})
    .justifyContent(FlexAlign.Center)
  }
}