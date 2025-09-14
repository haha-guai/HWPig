@Entry
@Component
struct page12{
  build(){
    Grid(){
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
      myItem()
    }
    .width('100%')
    .height('100%')
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(20)
    .rowsGap(20)
    .padding(10)
  }
}

@Component
struct myItem{
  build(){
    GridItem(){
      Text("内容")
        .width('100%')
        .height(200)
        .borderRadius(20)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .fontSize(40)
    }
  }
}