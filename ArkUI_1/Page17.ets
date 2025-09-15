@Entry
@Component
struct page{
  @State imageSize:number = 120;
  build(){
    Grid(){
      GridItem(){
        Image($r("app.media.image01"))
          .width(this.imageSize)
          .height(this.imageSize)
      }
      GridItem(){
        Column(){
          Row(){
            Button('缩小')
              .onClick(() => {
                if (this.imageSize >= 110)
                  this.imageSize -= 10;
              })
            Button('放大')
              .onClick(() => {
                if (this.imageSize <= 290)
                  this.imageSize += 10;
              })
          }
            .justifyContent(FlexAlign.SpaceAround)
          Slider({max:300, min:100, value:$$this.imageSize})
        }

      }
    }
    .rowsTemplate('1fr 1fr')
    .width('100%')
    .height('100%')

  }
}
