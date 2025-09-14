@Entry
@Component
struct page1{
  build(){
    Button("猪儿哥", { type: ButtonType.Normal })
      .borderRadius(8)
      .backgroundColor(0x333)
      .fontColor(Color.White)
      .width(90)
      .onClick(()=>{
        console.log("按钮被点击了");
      })
  }
}