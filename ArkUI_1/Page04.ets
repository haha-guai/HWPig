@Entry
@Component
struct page4{
  build(){
    Column({space: 10}){
      Image($r("app.media.image4"))
        .width(100)
        .height(100)
        .borderRadius(10)
        .interpolation(ImageInterpolation.High)
      Image($r("app.media.image3"))
        .width(100)
        .height(100)
        .borderRadius(10)
        .interpolation(ImageInterpolation.High)
    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}