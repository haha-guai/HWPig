//条件渲染
@Entry
@Component
struct testPage{
  @State isOn: boolean = false;
  build(){
    Grid(){
      GridItem(){
        Row(){
          Text("显示图片")
          Checkbox()
            .select($$this.isOn)
        }
        .width('100%')
        .width('100%')
      }
      GridItem(){
        if (this.isOn){
          Image($r("app.media.pig"))
            .width(300)
        }else{
          Text("图片未显示")
            .fontSize(30)
            .backgroundColor(Color.Pink)
        }
      }
    }
    .width('100%')
    .height('100%')
    .rowsTemplate("1fr 1fr")
  }
}